-- Scenarijus 3: Filmų populiarumo ir efektyvumo analizė
-- Tikslas: Nustatyti, kurie filmai yra efektyviausi pagal nuomos dažnumą ir pajamas.

-- 3.1. Analizuoti filmų populiarumą pagal jų trukmę
-- SQL užklausos pagalba pateikiami filmai, įtraukiant jų trukmę, nuomos skaičių ir vidutines pajamas iš nuomos.
 
SELECT 
    f.film_id,
    f.title,
    f.length,
    COUNT(r.rental_id) AS rental_count,
    AVG(p.amount) AS avg_revenue_per_rental
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN payment p ON r.rental_id = p.rental_id
GROUP BY f.length, f.film_id, f.title
ORDER BY rental_count DESC
LIMIT 10;

-- 3.2 Analizuoti filmų vidutines pajamas pagal kategoriją
-- SQL užklausos pagalba pateikiami filmai, įtraukiant jų kategoriją ir vidutines pajamas iš nuomos.

WITH FilmCategoryRevenue AS (
    SELECT c.category_id, c.name AS category_name, AVG(p.amount) AS avg_revenue_per_rental
    FROM film f
    JOIN inventory i ON f.film_id = i.film_id
    JOIN rental r ON i.inventory_id = r.inventory_id
    JOIN payment p ON r.rental_id = p.rental_id
    JOIN film_category fc ON f.film_id = fc.film_id
    JOIN category c ON fc.category_id = c.category_id
    GROUP BY c.category_id, c.name
)
SELECT category_id, category_name, avg_revenue_per_rental
FROM FilmCategoryRevenue
ORDER BY avg_revenue_per_rental DESC
LIMIT 10;

-- 3.3 Įvertinti filmų pelningumą pagal turimus išteklius
-- SQL užklausos pagalba pateikiami filmai, įtraukiant jų turimų kopijų kiekį, bendras pajamas ir pajamas vienai kopijai.

SELECT 
    f.film_id,
    f.title,
    COUNT(i.inventory_id) AS copy_count, 
    SUM(p.amount) AS total_revenue,
    SUM(p.amount) / COUNT(i.inventory_id) AS revenue_per_copy
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN payment p ON r.rental_id = p.rental_id
GROUP BY f.film_id, f.title
ORDER BY revenue_per_copy DESC
LIMIT 10;
