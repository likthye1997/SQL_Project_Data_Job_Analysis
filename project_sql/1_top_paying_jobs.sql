/*
Question: What are the top-paying data analyst jobs?
- Identify the top 10 highest-paying Data Analyst roles that are available remotely
- Focuses on job postings with specified salaries (remove nulls)
- BONUS: Include company names of top 10 roles
- Why? Highlight the top-paying opportunities for Data Analysts, offering insights into employment options and location flexibility.
*/

SELECT
    job_title,
    salary_year_avg
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10

/*

[
  {
    "job_title": "Data Analyst",
    "salary_year_avg": "650000.0"
  },
  {
    "job_title": "Director of Analytics",
    "salary_year_avg": "336500.0"
  },
  {
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5"
  },
  {
    "job_title": "Data Analyst, Marketing",
    "salary_year_avg": "232423.0"
  },
  {
    "job_title": "Data Analyst (Hybrid/Remote)",
    "salary_year_avg": "217000.0"
  },
  {
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0"
  },
  {
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0"
  },
  {
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.0"
  },
  {
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0"
  },
  {
    "job_title": "ERM Data Analyst",
    "salary_year_avg": "184000.0"
  }
]
*/