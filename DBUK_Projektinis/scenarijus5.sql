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