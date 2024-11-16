-- Scenarijus 2: Pardavimų rezultatų analizė
-- Tikslas: Analizuoti pardavimų rezultatus siekiant nustatyti pelningiausius filmus ir pardavimo tendencijas.

-- 2.1 Nustatyti filmus su ilgiausia vidutine nuomos trukme.
-- SQL užklausos pagalba pateikiami filmai su ilgiausia vidutine nuomos trukme, įtraukiant bendrą nuomos trukmę ir nuomos skaičių.

SELECT 
    f.film_id,
    f.title,
    AVG(DATEDIFF(r.return_date, r.rental_date)) AS avg_rental_duration,
    SUM(DATEDIFF(r.return_date, r.rental_date)) AS total_rental_duration,
    COUNT(r.rental_id) AS rental_count
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
WHERE r.return_date IS NOT NULL
GROUP BY f.film_id, f.title
ORDER BY avg_rental_duration DESC
LIMIT 10;

-- 2.2 Analizuoti pardavimų tendencijas pagal mėnesį ir metus, įtraukiant darbuotoją.
-- SQL užklausos pagalba pateikiamos pardavimų tendencijos pagal mėnesį ir metus, įtraukiant bendrą pardavimų sumą ir darbuotoją.

SELECT 
    YEAR(p.payment_date) AS period_year,
    MONTH(p.payment_date) AS period_month,
    st.staff_id,
    CONCAT(st.first_name, ' ', st.last_name) AS staff_name,
    SUM(p.amount) AS total_sales
FROM payment p
JOIN rental r ON p.rental_id = r.rental_id
JOIN staff st ON p.staff_id = st.staff_id
GROUP BY YEAR(p.payment_date), MONTH(p.payment_date), st.staff_id
ORDER BY total_sales DESC;

-- 2.3 Analizuoti filmų pardavimų rezultatus pagal kategoriją ir nustatyti geriausiai parduodamus filmus kiekvienoje kategorijoje.
-- SQL užklausos pagalba pateikiami filmų pardavimų rezultatai pagal kategoriją ir nustatomi 3 geriausiai parduodami filmai kiekvienoje kategorijoje.

WITH CategorySales AS (
	SELECT c.category_id, c.name AS category_name, f.film_id, f.title, SUM(p.amount) AS total_sales
	FROM payment p
	JOIN rental r ON p.rental_id = r.rental_id
	JOIN inventory i ON r.inventory_id = i.inventory_id
	JOIN film f ON i.film_id = f.film_id
	JOIN film_category fc ON f.film_id = fc.film_id
	JOIN category c ON fc.category_id = c.category_id
	GROUP BY c.category_id, c.name, f.film_id, f.title
),
TopCategoryFilms AS (
	SELECT category_id, category_name, film_id, title, total_sales,
	RANK() OVER (PARTITION BY category_id ORDER BY total_sales DESC) AS sales_rank
	FROM CategorySales
)
SELECT category_id, category_name, film_id, title, total_sales
FROM TopCategoryFilms
WHERE sales_rank <= 3
ORDER BY category_id, sales_rank;