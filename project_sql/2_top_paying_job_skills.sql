/*
Question: What skills are required for the top-paying data analyst jobs in Malaysia?
- Use the top 10 highest-paying Data Analyst jobs from first query
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills, 
    helping job seekers understand which skills to develop that align with top salaries
*/

WITH top_paying_jobs AS (
    SELECT	
        job_id,
        job_title,
        salary_year_avg,
        name AS company_name
    FROM
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data Analyst' AND 
        job_country = 'Malaysia' AND 
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)

SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC

/*
Here's the breakdown of the most demanded skills for data analysts in Malaysia for Year 2023, based on job postings:
SQL, Python & Tableau have same bold count of 5.
Excel follows closely with a bold count of 4, followed by Looker with 3 occurrences.
R & Flow are also highly sought after, with a bold count of 2.
Other skills like SPSS, Spark, Power BI, PHP, Perl, BigQuery, Oracle and Azure show varying degrees of demand.

[
  {
    "job_id": 314864,
    "job_title": "Senior / Executive Business Analyst (Data Analyst)",
    "salary_year_avg": "111175.0",
    "company_name": "Bosch Group",
    "skills": "spark"
  },
  {
    "job_id": 314864,
    "job_title": "Senior / Executive Business Analyst (Data Analyst)",
    "salary_year_avg": "111175.0",
    "company_name": "Bosch Group",
    "skills": "excel"
  },
  {
    "job_id": 402386,
    "job_title": "Cloud Data Analyst Engineer (FinOps)",
    "salary_year_avg": "111175.0",
    "company_name": "Unit4",
    "skills": "azure"
  },
  {
    "job_id": 402386,
    "job_title": "Cloud Data Analyst Engineer (FinOps)",
    "salary_year_avg": "111175.0",
    "company_name": "Unit4",
    "skills": "excel"
  },
  {
    "job_id": 1276341,
    "job_title": "Data Analyst",
    "salary_year_avg": "111175.0",
    "company_name": "Mindvalley",
    "skills": "sql"
  },
  {
    "job_id": 1276341,
    "job_title": "Data Analyst",
    "salary_year_avg": "111175.0",
    "company_name": "Mindvalley",
    "skills": "python"
  },
  {
    "job_id": 1276341,
    "job_title": "Data Analyst",
    "salary_year_avg": "111175.0",
    "company_name": "Mindvalley",
    "skills": "bigquery"
  },
  {
    "job_id": 1276341,
    "job_title": "Data Analyst",
    "salary_year_avg": "111175.0",
    "company_name": "Mindvalley",
    "skills": "tableau"
  },
  {
    "job_id": 1276341,
    "job_title": "Data Analyst",
    "salary_year_avg": "111175.0",
    "company_name": "Mindvalley",
    "skills": "looker"
  },
  {
    "job_id": 1260972,
    "job_title": "Data Analyst (Customer Service Industry, Mandarin Support)",
    "salary_year_avg": "111175.0",
    "company_name": "OKX",
    "skills": "excel"
  },
  {
    "job_id": 1260972,
    "job_title": "Data Analyst (Customer Service Industry, Mandarin Support)",
    "salary_year_avg": "111175.0",
    "company_name": "OKX",
    "skills": "tableau"
  },
  {
    "job_id": 1260972,
    "job_title": "Data Analyst (Customer Service Industry, Mandarin Support)",
    "salary_year_avg": "111175.0",
    "company_name": "OKX",
    "skills": "flow"
  },
  {
    "job_id": 216086,
    "job_title": "Digital Data Analyst / Web Analyst - Digital Marketing",
    "salary_year_avg": "100500.0",
    "company_name": "ZFX",
    "skills": "sql"
  },
  {
    "job_id": 1154132,
    "job_title": "Risk Data Analyst",
    "salary_year_avg": "79200.0",
    "company_name": "Lalamove",
    "skills": "sql"
  },
  {
    "job_id": 1154132,
    "job_title": "Risk Data Analyst",
    "salary_year_avg": "79200.0",
    "company_name": "Lalamove",
    "skills": "python"
  },
  {
    "job_id": 1154132,
    "job_title": "Risk Data Analyst",
    "salary_year_avg": "79200.0",
    "company_name": "Lalamove",
    "skills": "php"
  },
  {
    "job_id": 1154132,
    "job_title": "Risk Data Analyst",
    "salary_year_avg": "79200.0",
    "company_name": "Lalamove",
    "skills": "perl"
  },
  {
    "job_id": 1154132,
    "job_title": "Risk Data Analyst",
    "salary_year_avg": "79200.0",
    "company_name": "Lalamove",
    "skills": "tableau"
  },
  {
    "job_id": 1154132,
    "job_title": "Risk Data Analyst",
    "salary_year_avg": "79200.0",
    "company_name": "Lalamove",
    "skills": "looker"
  },
  {
    "job_id": 907173,
    "job_title": "Data Management Assistant",
    "salary_year_avg": "64800.0",
    "company_name": "WorldFish",
    "skills": "python"
  },
  {
    "job_id": 907173,
    "job_title": "Data Management Assistant",
    "salary_year_avg": "64800.0",
    "company_name": "WorldFish",
    "skills": "r"
  },
  {
    "job_id": 907173,
    "job_title": "Data Management Assistant",
    "salary_year_avg": "64800.0",
    "company_name": "WorldFish",
    "skills": "excel"
  },
  {
    "job_id": 907173,
    "job_title": "Data Management Assistant",
    "salary_year_avg": "64800.0",
    "company_name": "WorldFish",
    "skills": "power bi"
  },
  {
    "job_id": 907173,
    "job_title": "Data Management Assistant",
    "salary_year_avg": "64800.0",
    "company_name": "WorldFish",
    "skills": "spss"
  },
  {
    "job_id": 907173,
    "job_title": "Data Management Assistant",
    "salary_year_avg": "64800.0",
    "company_name": "WorldFish",
    "skills": "flow"
  },
  {
    "job_id": 346729,
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "53014.0",
    "company_name": "Carousell Group",
    "skills": "sql"
  },
  {
    "job_id": 346729,
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "53014.0",
    "company_name": "Carousell Group",
    "skills": "python"
  },
  {
    "job_id": 346729,
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "53014.0",
    "company_name": "Carousell Group",
    "skills": "tableau"
  },
  {
    "job_id": 346729,
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "53014.0",
    "company_name": "Carousell Group",
    "skills": "looker"
  },
  {
    "job_id": 117257,
    "job_title": "Investments Data Analyst",
    "salary_year_avg": "51014.0",
    "company_name": "500 Global",
    "skills": "sql"
  },
  {
    "job_id": 117257,
    "job_title": "Investments Data Analyst",
    "salary_year_avg": "51014.0",
    "company_name": "500 Global",
    "skills": "python"
  },
  {
    "job_id": 117257,
    "job_title": "Investments Data Analyst",
    "salary_year_avg": "51014.0",
    "company_name": "500 Global",
    "skills": "r"
  },
  {
    "job_id": 117257,
    "job_title": "Investments Data Analyst",
    "salary_year_avg": "51014.0",
    "company_name": "500 Global",
    "skills": "tableau"
  },
  {
    "job_id": 373473,
    "job_title": "Data Management Analyst",
    "salary_year_avg": "50400.0",
    "company_name": "Bosch Group",
    "skills": "excel"
  },
  {
    "job_id": 373473,
    "job_title": "Data Management Analyst",
    "salary_year_avg": "50400.0",
    "company_name": "Bosch Group",
    "skills": "sap"
  }
]
*/