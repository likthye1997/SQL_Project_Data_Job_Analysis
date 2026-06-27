/* 
Label new column as follows based on job_location:
- 'Anywhere' jobs as 'Remote'
- 'Kuala Lumpur' jobs as 'Local'
- Otherwise 'Onsite'
*/

SELECT 
	COUNT(job_id) AS number_of_jobs,
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location LIKE 'Kuala Lumpur%' THEN 'Local'
        ELSE 'Onsite'
    END AS location_category
FROM 
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    location_category
ORDER BY    
    number_of_jobs DESC

/*
[
  {
    "number_of_jobs": "181835",
    "location_category": "Onsite"
  },
  {
    "number_of_jobs": "13331",
    "location_category": "Remote"
  },
  {
    "number_of_jobs": "1427",
    "location_category": "Local"
  }
]
*/