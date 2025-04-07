-- 1. How long are patients staying in the hospital on average each year

with t as (
    select 
        Id,
        cast(`stop` as time) as stop_t,
        cast(`start` as time) as start_t,
        timestamp_diff(stop, start, minute) as time_elapsed,
        extract(year from start) as year
    from `big-query-451012.Hospital_project.meetup_encounter`
)
select
  year,
  round(avg(t.time_elapsed), 2) as avg_time_minutes
from t
group by year
order by year

    

-- 2. Top 10 most common procedures
    
SELECT 
  b.description AS procedure_name, 
  COUNT(*) AS procedure_count
FROM `big-query-451012.Hospital_project.meetup_encounter` a
JOIN `big-query-451012.Hospital_project.Procedures` b
ON a.patient = b.patient
GROUP BY b.description
ORDER BY procedure_count DESC
LIMIT 10;



-- 3. Which age group visits the hospital most frequently

SELECT 
  CASE 
    WHEN DATE_DIFF(COALESCE(deathdate, CURRENT_DATE()), birthdate, YEAR) BETWEEN 0 AND 18 THEN '0-18'
    WHEN DATE_DIFF(COALESCE(deathdate, CURRENT_DATE()), birthdate, YEAR) BETWEEN 19 AND 35 THEN '19-35'
    WHEN DATE_DIFF(COALESCE(deathdate, CURRENT_DATE()), birthdate, YEAR) BETWEEN 36 AND 50 THEN '36-50'
    WHEN DATE_DIFF(COALESCE(deathdate, CURRENT_DATE()), birthdate, YEAR) BETWEEN 51 AND 65 THEN '51-65'
    ELSE '66+' 
  END AS age_group,
  gender,
  COUNT(*) AS num_of_visits
FROM `big-query-451012.Hospital_project.Patients_details` b
JOIN `big-query-451012.Hospital_project.meetup_encounter` a
ON b.id = a.patient
GROUP BY 1, 2
ORDER BY age_group;



-- 4. What is the 30 days admission rate for patients

WITH readmission_cte AS (
 SELECT 
     patient,
     --encounterclass, 
     EXTRACT(YEAR FROM start) AS year,
     start,
     LEAD(start) OVER (PARTITION BY patient ORDER BY start) AS next_visit
 FROM `big-query-451012.Hospital_project.meetup_encounter`
)
SELECT 
   year,
   --encounterclass,
   COUNT(DISTINCT patient) AS total_readmitted,
   round((COUNT(DISTINCT patient) / COUNT(*) * 100), 2) AS readmission_rate
FROM readmission_cte
WHERE TIMESTAMP_DIFF(next_visit, start, DAY) <= 30
GROUP BY year
ORDER BY year;



--5. Race and ethnic distribution

select race, ethnicity, count(*) as num_of_patients
from big-query-451012.Hospital_project.Patients_details
group by 1, 2
order by 3 desc, 1, 2


    
--6. Gender distribution of patients

select `gender`, count(*) as num_of_patients
from big-query-451012.Hospital_project.Patients_details
group by 1


    
--7. Volume of each encounterclass

select 
    extract(year from start) as year,
    count(*) as num_of_visit,
    encounterclass
from big-query-451012.Hospital_project.meetup_encounter
group by 1, 3
order by 1



--8. How many patients are uninsured

select
  b.name,
  count(distinct a.patient) as num_of_patients
from big-query-451012.Hospital_project.meetup_encounter a
left join big-query-451012.Hospital_project.payers_info b
on a.payer = b.Id
group by 1
order by 2 desc


    
--9. Number of procedures covered by insurance

SELECT 
  COUNT(DISTINCT b.code) AS num_procedures_covered
FROM `big-query-451012.Hospital_project.meetup_encounter` a
JOIN `big-query-451012.Hospital_project.Procedures` b
ON a.patient = b.patient
WHERE a.payer_coverage IS NOT NULL
AND LOWER(b.description) LIKE '%procedure%'

