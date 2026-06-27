/*
Find job postings from the first quarter that have a salary greater than RM50K in Malaysia
- Combine job posting tables from the first quarter of 2023 (Jan-Mar)
- Gets job postings with an average yearly salary > RM50,000 
- Filter for Data Analyst Jobs and order by salary
*/

SELECT
	job_title_short,
	job_location,
	job_via,
	job_posted_date::DATE,
    salary_year_avg
FROM (
    SELECT *
    FROM january_jobs
    UNION ALL
    SELECT *
    FROM february_jobs
    UNION ALL
    SELECT *
    FROM march_jobs
) AS quarter1_job_postings
WHERE
    salary_year_avg > 50000 AND
    job_title_short = 'Data Analyst' AND
    job_country = 'Malaysia'
ORDER BY
    salary_year_avg DESC

/*
[
  {
    "job_title_short": "Data Analyst",
    "job_location": "Bayan Lepas, Penang, Malaysia",
    "job_via": "via Ai-Jobs.net",
    "job_posted_date": "2023-03-23",
    "salary_year_avg": "111175.0"
  },
  {
    "job_title_short": "Data Analyst",
    "job_location": "Kuala Lumpur, Federal Territory of Kuala Lumpur, Malaysia",
    "job_via": "via Ai-Jobs.net",
    "job_posted_date": "2023-01-18",
    "salary_year_avg": "111175.0"
  },
  {
    "job_title_short": "Data Analyst",
    "job_location": "Kuala Lumpur, Federal Territory of Kuala Lumpur, Malaysia",
    "job_via": "via Ai-Jobs.net",
    "job_posted_date": "2023-01-02",
    "salary_year_avg": "100500.0"
  },
  {
    "job_title_short": "Data Analyst",
    "job_location": "Bayan Lepas, Penang, Malaysia",
    "job_via": "via Ai-Jobs.net",
    "job_posted_date": "2023-02-13",
    "salary_year_avg": "64800.0"
  },
  {
    "job_title_short": "Data Analyst",
    "job_location": "Kuala Lumpur, Federal Territory of Kuala Lumpur, Malaysia",
    "job_via": "via Ai-Jobs.net",
    "job_posted_date": "2023-03-08",
    "salary_year_avg": "53014.0"
  },
  {
    "job_title_short": "Data Analyst",
    "job_location": "Kuala Lumpur, Federal Territory of Kuala Lumpur, Malaysia",
    "job_via": "via Ai-Jobs.net",
    "job_posted_date": "2023-02-07",
    "salary_year_avg": "51014.0"
  },
  {
    "job_title_short": "Data Analyst",
    "job_location": "Bayan Lepas, Penang, Malaysia",
    "job_via": "via Ai-Jobs.net",
    "job_posted_date": "2023-03-31",
    "salary_year_avg": "50400.0"
  },
  {
    "job_title_short": "Data Analyst",
    "job_location": "Cyberjaya, Selangor, Malaysia",
    "job_via": "via Ai-Jobs.net",
    "job_posted_date": "2023-02-24",
    "salary_year_avg": "50400.0"
  }
]
*/