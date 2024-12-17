-- 7 Scenarijus: Klientų grąžinimo elgsenos analizė
-- Tikslas: Nustatyti klientų grąžinimo elgseną, siekiant pagerinti filmų grąžinimo procesą, sumažinant pavėluotų grąžinimų skaičių ir optimizuoti darbuotojų darbo grafikus.

-- 7.1 Nustatyti savaitės dienas ir valandas, per kurias įvyksta daugiausia grąžinimų
WITH return_counts AS (
SELECT 
	DAYOFWEEK(r.return_date) AS week_day,
	HOUR(r.return_date) AS return_hour,
	COUNT(*) AS return_count
FROM rental r
GROUP BY week_day, return_hour
),
average_return_counts AS (
SELECT week_day, ROUND(AVG(return_count), 0) AS avg_return_count
FROM return_counts
GROUP BY week_day
),
max_return_hours AS (
SELECT rc.week_day, rc.return_hour, rc.return_count
FROM return_counts rc
JOIN average_return_counts arc ON rc.week_day = arc.week_day
WHERE rc.return_count = (
	SELECT MAX(return_count)
	FROM return_counts 
	WHERE week_day = rc.week_day
    )
)
SELECT 
    arc.week_day,
    mh.return_hour,
    arc.avg_return_count AS average_return_count
FROM average_return_counts arc
JOIN max_return_hours mh ON arc.week_day = mh.week_day
ORDER BY average_return_count DESC;

-- 7.2 Analizuoti grąžinimų vėlavimus pagal filmų kategorijas.
WITH delayed_returns AS (
SELECT 
	r.rental_id,
	fc.category_id,
	DATEDIFF(r.return_date, r.rental_date) - f.rental_duration AS days_late
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
JOIN film_category fc ON f.film_id = fc.film_id
WHERE DATEDIFF(r.return_date, r.rental_date) > f.rental_duration
)
SELECT c.name AS category_name, AVG(dr.days_late) AS avg_days_late
FROM delayed_returns dr
JOIN category c ON dr.category_id = c.category_id
GROUP BY c.name
ORDER BY avg_days_late DESC;

-- 7.3 Analizuoti klientų grąžinimo vėlavimus pagal nuomos trukmę.
WITH delayed_returns AS (
SELECT 
	r.rental_id,
	f.rental_duration,
	DATEDIFF(r.return_date, r.rental_date) - f.rental_duration AS days_late
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
WHERE DATEDIFF(r.return_date, r.rental_date) > f.rental_duration
)
SELECT rental_duration, AVG(days_late) AS avg_days_late
FROM delayed_returns
GROUP BY rental_duration
ORDER BY avg_days_late DESC;

