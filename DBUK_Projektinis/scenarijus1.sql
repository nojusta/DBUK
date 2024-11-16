-- Scenarijus 1: Klientų nuomos analizė
-- Tikslas: Suprasti klientų nuomos elgseną, kad pagerinti tikslines reklamas ir nuomos pasiūlymus.

-- 1.1. Nustatyti dažniausiai nuomojančius klientus per paskutinius metus.
-- SQL užklausos pagalba pateikiami dažniausiai nuomojantys klientai per paskutinius metus, įtraukiant jų bendrą nuomos skaičių.

SELECT c.customer_id, c.first_name, c.last_name, COUNT(r.rental_id) AS rental_count
FROM rental r
JOIN customer c ON r.customer_id = c.customer_id
WHERE YEAR(r.rental_date) = (SELECT MAX(YEAR(rental_date)) FROM rental)
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY rental_count DESC;

-- 1.2. Nustatyti kiekvieno kliento paskutinės nuomos datą.
-- SQL užklausos pagalba pateikiama informacija apie klientą ir paskutinės nuomos data.

SELECT c.customer_id, c.first_name, c.last_name, MAX(r.rental_date) AS last_rental_date
FROM rental r
JOIN customer c ON r.customer_id = c.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY last_rental_date DESC;

-- 1.3 Įvertinti klientų nuomos periodiškumą.
-- SQL užklausos pagalba nustatomas vidutinis laikas tarp kiekvieno kliento nuomos.

WITH RentalDiffs AS (
SELECT r.customer_id,c.first_name, c.last_name,
	DATEDIFF(r.rental_date, LAG(r.rental_date) OVER (PARTITION BY r.customer_id ORDER BY r.rental_date)) AS days_between_rentals
FROM rental r
JOIN customer c ON r.customer_id = c.customer_id
)
SELECT customer_id, first_name, last_name, AVG(days_between_rentals) AS avg_days_between_rentals
FROM RentalDiffs
WHERE days_between_rentals IS NOT NULL
GROUP BY customer_id, first_name, last_name
ORDER BY avg_days_between_rentals;