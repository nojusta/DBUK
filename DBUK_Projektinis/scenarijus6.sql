-- 6 Scenarijus: Parduotuvių veiklos analizė
-- Tikslas: Analizuoti dviejų parduotuvių veiklos rodiklius siekiant nustatyti efektyvumo skirtumus ir tobulinimo galimybes.

-- 6.1 Palyginti parduotuvių pajamas pagal laikotarpius.
SELECT 
    store.store_id AS Store_ID,
    DATE_FORMAT(payment.payment_date, '%Y-%m') AS Month,
    SUM(payment.amount) AS Total_Revenue
FROM payment
JOIN rental ON payment.rental_id = rental.rental_id
JOIN inventory ON rental.inventory_id = inventory.inventory_id
JOIN store ON inventory.store_id = store.store_id
GROUP BY store.store_id, DATE_FORMAT(payment.payment_date, '%Y-%m')
ORDER BY Month, Total_Revenue DESC;


-- 6.2 Analizuoti klientų aktyvumą kiekvienoje parduotuvėje
SELECT 
    store.store_id AS Store_ID,
    COUNT(DISTINCT rental.customer_id) AS Unique_Customers,
    COUNT(rental.rental_id) AS Total_Rentals
FROM rental
JOIN inventory ON rental.inventory_id = inventory.inventory_id
JOIN store ON inventory.store_id = store.store_id
GROUP BY store.store_id
ORDER BY Store_ID;
    
-- 6.3 Nustatyti dažniausiai nuomojamus filmus kiekvienoje parduotuvėje
WITH StoreTopFilms AS (
SELECT 
	store.store_id AS Store_ID,
	film.title AS Film_Title,
	COUNT(rental.rental_id) AS Rental_Count,
	RANK() OVER (PARTITION BY store.store_id ORDER BY COUNT(rental.rental_id) DESC) AS `Rank`
FROM rental
JOIN inventory ON rental.inventory_id = inventory.inventory_id
JOIN film ON inventory.film_id = film.film_id
JOIN store ON inventory.store_id = store.store_id
GROUP BY store.store_id, film.title
)
SELECT Store_ID, Film_Title,Rental_Count
FROM StoreTopFilms
WHERE `Rank` <= 10
ORDER BY Store_ID, `Rank`;
