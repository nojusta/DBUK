-- 9. Scenarijus: Inventoriaus valdymas
-- Tikslas: Optimizuoti inventoriaus valdymą, identifikuojant atsargų trūkumus, analizuojant nuomos dažnumo ir inventoriaus lygio koreliaciją bei nustatant kategorijas, kurioms trūksta atsargų.

-- 9.1.	Identifikuoti filmus, kurių atsargos sumažėjo žemiau 10 vienetų.
SELECT 
    i.film_id AS Film_ID,
    f.title AS Title,
    COUNT(i.inventory_id) AS Inventory_Count
FROM inventory AS i
JOIN film AS f ON i.film_id = f.film_id
LEFT JOIN rental AS r ON i.inventory_id = r.inventory_id
WHERE r.inventory_id IS NULL
GROUP BY i.film_id, f.title
HAVING COUNT(i.inventory_id) < 10
ORDER BY Inventory_Count ASC;

-- 9.2.	Nustatyti kokios filmų kategorijos dominuoja inventoriuje.
SELECT 
    c.category_id,
    c.name AS category_name,
    COUNT(fc.film_id) AS film_count
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
JOIN film f ON fc.film_id = f.film_id
GROUP BY c.category_id, c.name
ORDER BY film_count DESC;

-- 9.3. Nustatyti filmus kurie buvo nuomoti mažiausiai kartų.
SELECT f.title AS film_title, COUNT(r.rental_id) AS rental_count
FROM film f
JOIN  inventory i ON f.film_id = i.film_id
LEFT JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.film_id, f.title
ORDER BY  rental_count ASC
LIMIT 10;
