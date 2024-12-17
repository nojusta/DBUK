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
