-- 10 Scenarijus: Finansinė analizė
-- Tikslas: Analizuoti finansinius duomenis siekiant pagerinti pelningumą ir finansinį stabilumą.

-- 10.1. Apskaičiuoti bendrą pajamų augimą kas mėnesį.
WITH MonthlyRevenue AS (
SELECT
	YEAR(payment_date) AS year,
	MONTH(payment_date) AS month,
	SUM(amount) AS total_revenue
FROM payment
WHERE payment_date BETWEEN '2005-01-01' AND '2006-01-01'
GROUP BY YEAR(payment_date), MONTH(payment_date)
),
MonthOverMonthGrowth AS (
SELECT
	current.year,
	current.month,
	current.total_revenue AS current_revenue,
	previous.total_revenue AS previous_revenue,
	CASE
		WHEN previous.total_revenue IS NOT NULL THEN
			((current.total_revenue - previous.total_revenue) / previous.total_revenue) * 100
		ELSE NULL
	END AS growth_percentage
FROM MonthlyRevenue AS current
LEFT JOIN MonthlyRevenue AS previous
	ON current.year = previous.year
	AND current.month = previous.month + 1 
)
SELECT
    year,
    month,
    current_revenue,
    previous_revenue,
    growth_percentage
FROM MonthOverMonthGrowth
ORDER BY year, month;

-- 10.2. Išanalizuoti filmų pelningumą pagal jų kategorijas ir ilgį
WITH FilmRevenue AS (
    SELECT 
        f.film_id,
        f.title,
        fc.category_id,
        c.name AS category_name,
        f.length,
        SUM(p.amount) AS total_revenue,
        COUNT(r.rental_id) AS total_rentals,
        f.rental_rate * COUNT(r.rental_id) AS total_cost
    FROM film AS f
    INNER JOIN film_category AS fc ON f.film_id = fc.film_id
    INNER JOIN category AS c ON fc.category_id = c.category_id
    INNER JOIN inventory AS i ON f.film_id = i.film_id
    INNER JOIN rental AS r ON i.inventory_id = r.inventory_id
    INNER JOIN payment AS p ON r.rental_id = p.rental_id
    GROUP BY f.film_id, f.title, fc.category_id, c.name, f.length
),
ProfitabilityByCategory AS (
    SELECT category_name,
        CASE 
            WHEN length <= 60 THEN 'Short'
            WHEN length > 60 AND length <= 120 THEN 'Medium'
            ELSE 'Long'
        END AS film_length_category,
        COUNT(film_id) AS total_films,
        SUM(total_revenue) AS total_revenue,
        SUM(total_cost) AS total_cost,
        SUM(total_revenue - total_cost) AS total_profit,
        AVG(total_revenue - total_cost) AS avg_profit_per_film
    FROM FilmRevenue
    GROUP BY category_name, film_length_category
)
SELECT 
    category_name,
    film_length_category,
    total_films,
    total_revenue,
    total_cost,
    total_profit,
    avg_profit_per_film
FROM ProfitabilityByCategory
ORDER BY avg_profit_per_film DESC;

-- 10.3. Nustatyti nuostolingiausius filmus, atsižvelgiant į sąnaudas ir nuomos pajamas
SELECT 
    f.title AS Film_Title,
    f.rental_rate AS Rental_Rate,
    f.replacement_cost AS Replacement_Cost,
    COALESCE(SUM(p.amount), 0) AS Total_Rental_Income,
    (COALESCE(SUM(p.amount), 0) - f.replacement_cost) AS Loss
FROM film f
LEFT JOIN inventory i ON f.film_id = i.film_id
LEFT JOIN rental r ON i.inventory_id = r.inventory_id
LEFT JOIN payment p ON r.rental_id = p.rental_id
GROUP BY f.film_id
HAVING Loss < 0
ORDER BY Loss ASC;
