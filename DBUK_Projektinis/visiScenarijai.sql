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

-- 3.3 Įvertinti filmų naudingumą pagal turimus išteklius
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

-- 5 scenarijus: Nuomos pagal tam tikrus laikotarpius analizė
-- Tikslas: Išsiaiškinti, kurie laikotarpiai (pvz., savaitės dienos ar valandos) yra aktyviausi kino nuomos atžvilgiu,
-- siekiant optimizuoti darbuotojų darbo grafikus ir pasiūlyti laiko atžvilgiu pritaikytas akcijas

-- 5.1 Nustatyti, kurios savaitės dienos yra populiariausios nuomai.
SELECT  DAYOFWEEK(r.rental_date) AS week_day, COUNT(*) AS rental_count
FROM rental r
GROUP BY week_day
ORDER BY rental_count DESC;

-- 5.2 Analizuoti nuomos aktyvumą pagal paros laiką (pvz., rytas, popietė, vakaras).
SELECT HOUR(r.rental_date) AS rental_hour, COUNT(*) AS rental_count
FROM rental r
GROUP BY rental_hour
ORDER BY rental_count DESC;

-- 5.3 Nustatyti piko laikotarpius.
WITH rental_counts AS (
SELECT 
	DAYOFWEEK(r.rental_date) AS week_day,
	HOUR(r.rental_date) AS rental_hour,
	COUNT(*) AS rental_count
FROM rental r
GROUP BY week_day, rental_hour
),
average_rental_counts AS (
SELECT week_day, rental_hour, ROUND(AVG(rental_count), 0) AS avg_rental_count
FROM rental_counts
GROUP BY week_day, rental_hour
),
max_avg_rental_counts AS (
SELECT week_day, MAX(avg_rental_count) AS max_avg_rental_count
FROM average_rental_counts
GROUP BY week_day
)
SELECT arc.week_day, arc.rental_hour, arc.avg_rental_count AS average_rental_count
FROM average_rental_counts arc
JOIN max_avg_rental_counts marc ON arc.week_day = marc.week_day AND arc.avg_rental_count = marc.max_avg_rental_count
ORDER BY arc.week_day;

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

-- 8 scenarijus: Darbuotojų veiklos analizė
-- Tikslas: Analizuoti darbuotojų veiklą siekiant pagerinti darbo efektyvumą ir motyvaciją.

-- 8.1.	Apskaičiuoti vidutinį nuomos skaičių vienam darbuotojui per mėnesį.
SELECT 
    s.staff_id AS Staff_ID,
    CONCAT(s.first_name, ' ', s.last_name) AS Staff_Name,
    COUNT(r.rental_id) / TIMESTAMPDIFF(MONTH, MIN(r.rental_date), MAX(r.rental_date)) AS Avg_Rentals_Per_Month
FROM staff AS s
LEFT JOIN rental AS r ON s.staff_id = r.staff_id
GROUP BY s.staff_id, s.first_name, s.last_name
ORDER BY Avg_Rentals_Per_Month DESC;

-- 8.2.	Nustatyti darbuotojus, kurie atliko mažiausiai nuomų per paskutinius 6 mėnesius.
SELECT 
    s.staff_id AS Staff_ID,
    CONCAT(s.first_name, ' ', s.last_name) AS Staff_Name,
    COUNT(r.rental_id) AS Rentals_Last_6_Months
FROM staff AS s
LEFT JOIN rental AS r ON s.staff_id = r.staff_id
WHERE r.rental_date >= DATE_SUB((SELECT MAX(last_update) FROM rental), INTERVAL 6 MONTH)
GROUP BY s.staff_id, s.first_name, s.last_name
ORDER BY Rentals_Last_6_Months ASC;

-- 8.3. Išanalizuoti darbuotojų darbo laiką ir nustatyti galimas produktyvumo problemas.
SELECT 
    s.staff_id AS Staff_ID,
    CONCAT(s.first_name, ' ', s.last_name) AS Staff_Name,
    MIN(r.rental_date) AS First_Rental,
    MAX(r.rental_date) AS Last_Rental,
    ROUND(AVG(TIMESTAMPDIFF(HOUR, r.rental_date, r.return_date))) AS Avg_Rental_Duration_Hours,
    CASE WHEN ROUND(AVG(TIMESTAMPDIFF(HOUR, r.rental_date, r.return_date))) < 2 THEN 'Reikia tobulinti efektyvumą'
        ELSE 'Geras produktyvumo lygis'
    END AS Evaluation
FROM staff AS s
LEFT JOIN rental AS r ON s.staff_id = r.staff_id
GROUP BY s.staff_id, s.first_name, s.last_name
ORDER BY Evaluation DESC;

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
