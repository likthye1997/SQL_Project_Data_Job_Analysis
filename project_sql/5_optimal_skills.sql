/*
Answer: What are the most optimal skills to learn in Malaysia (aka it’s in high demand and a high-paying skill)?
- Identify skills in high demand and associated with high average salaries for Data Analyst roles
- With specified salaries
- Why? Targets skills that offer job security (high demand) and financial benefits (high salaries), 
    offering strategic insights for career development in data analysis
*/

-- Identifies skills in high demand for Data Analyst roles
-- Use Query #3
WITH skills_demand AS (
    SELECT
        skills_dim.skill_id,
        skills,
        COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_country = 'Malaysia'
GROUP BY skills_dim.skill_id
),
-- Skills with high average salaries for Data Analyst roles
-- Use Query #4
average_salary AS (
    SELECT
        skills_dim.skill_id,
        skills,
        ROUND(AVG(salary_year_avg), 0) AS avg_salary
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
        AND job_country = 'Malaysia'
GROUP BY skills_dim.skill_id
)
-- Return high demand and high salaries for 10 skills
SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    avg_salary
FROM skills_demand
INNER JOIN average_salary ON skills_demand.skill_id = average_salary.skill_id
ORDER BY
    avg_salary DESC,
    demand_count DESC

-- rewriting this same query more concisely
SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_country = 'Malaysia'
GROUP BY
    skills_dim.skill_id
ORDER BY
    avg_salary DESC,
    demand_count DESC

/*
Here's a breakdown of the most optimal skills for Data Analysts in Malaysia for Year 2023:
High-Demand Programming Languages: SQL and Python stand out for their high frequency, each having a demand count of 5, followed by R with a demand count of 2. Their average salaries are RM78,981 for SQL, RM71,841 for Python, and RM57,907 for R. This indicates that while proficiency in these foundational languages is heavily sought after as a baseline requirement, their widespread availability places them in the mid-to-lower range of the salary spectrum.
Cloud Tools and Technologies: Advanced cloud and big data platforms like Azure, Spark, and BigQuery command the absolute highest average salaries in the dataset at RM111,175 each, despite having a lower demand count of 1. This points toward the significant premium organizations are willing to pay for specialized expertise in cloud architecture and large-scale data engineering.
Business Intelligence and Visualization Tools: Excel and Tableau show strong market presence with a high demand count of 5 each, averaging salaries of RM89,745 and RM81,116$ respectively. These are supported by tools like Looker (demand count of 3, average salary of RM81,130), Flow (demand count of 2, average salary of RM87,988, and Power BI (demand count of 1, average salary of RM64,800. This emphasizes the critical, enduring role of data reporting, workflow automation, and dashboarding in making insights business-accessible.
Database and Enterprise Technologies: Supplementary development languages like Perl and PHP maintain moderate average salaries of RM79,200, while statistical tools like SPSS sit at RM64,800. In contrast, legacy database and enterprise systems like Oracle and SAP present both a low demand count of 1 and the lowest average salaries at RM50,400, reflecting a clear market shift away from traditional architectures toward modern, cloud-native data stacks.

[
  {
    "skill_id": 74,
    "skills": "azure",
    "demand_count": "1",
    "avg_salary": "111175"
  },
  {
    "skill_id": 92,
    "skills": "spark",
    "demand_count": "1",
    "avg_salary": "111175"
  },
  {
    "skill_id": 77,
    "skills": "bigquery",
    "demand_count": "1",
    "avg_salary": "111175"
  },
  {
    "skill_id": 181,
    "skills": "excel",
    "demand_count": "5",
    "avg_salary": "89745"
  },
  {
    "skill_id": 215,
    "skills": "flow",
    "demand_count": "2",
    "avg_salary": "87988"
  },
  {
    "skill_id": 185,
    "skills": "looker",
    "demand_count": "3",
    "avg_salary": "81130"
  },
  {
    "skill_id": 182,
    "skills": "tableau",
    "demand_count": "5",
    "avg_salary": "81116"
  },
  {
    "skill_id": 31,
    "skills": "perl",
    "demand_count": "1",
    "avg_salary": "79200"
  },
  {
    "skill_id": 25,
    "skills": "php",
    "demand_count": "1",
    "avg_salary": "79200"
  },
  {
    "skill_id": 0,
    "skills": "sql",
    "demand_count": "5",
    "avg_salary": "78981"
  },
  {
    "skill_id": 1,
    "skills": "python",
    "demand_count": "5",
    "avg_salary": "71841"
  },
  {
    "skill_id": 199,
    "skills": "spss",
    "demand_count": "1",
    "avg_salary": "64800"
  },
  {
    "skill_id": 183,
    "skills": "power bi",
    "demand_count": "1",
    "avg_salary": "64800"
  },
  {
    "skill_id": 5,
    "skills": "r",
    "demand_count": "2",
    "avg_salary": "57907"
  },
  {
    "skill_id": 79,
    "skills": "oracle",
    "demand_count": "1",
    "avg_salary": "50400"
  },
  {
    "skill_id": 189,
    "skills": "sap",
    "demand_count": "1",
    "avg_salary": "50400"
  }
]
*/