-- 4. Scenarijus: Nuomos proceso optimizavimas
-- Tikslas: Analizuoti nuomos procesą siekiant sumažinti grąžinimo laiką.

-- 4.1 Nustatyti vidutinį filmų gražinimo laiko vidurkį (dienomis).
SELECT ROUND(SUM(DATEDIFF(return_date, rental_date)) / COUNT(DISTINCT rental_id), 2) AS avg_return_time_days
FROM rental
WHERE return_date IS NOT NULL;

-- 4.2 Nustatyti daugiausiai kartų pavėlavusius grąžint filmus klientus.
SELECT c.customer_id, c.first_name, c.last_name, COUNT(*) AS late_returns
FROM rental r
JOIN customer c ON r.customer_id = c.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
WHERE r.return_date > DATE_ADD(r.rental_date, INTERVAL f.rental_duration DAY)
GROUP BY c.customer_id
ORDER BY late_returns DESC
LIMIT 10;

-- 4.3 Nustatyti mėnesius, per kuriuos dažniausiai įvyksta vėlavimai.
SELECT 
    YEAR(r.rental_date) AS rental_year,
    MONTH(r.rental_date) AS rental_month,
    COUNT(*) AS late_returns
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
WHERE DATEDIFF(r.return_date, r.rental_date) > f.rental_duration
GROUP BY rental_year, rental_month
ORDER BY late_returns DESC;
