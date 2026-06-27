/*
Look at companies that don’t require a degree in Malaysia 
- Degree requirements are in the job_posting_fact table
- Use subquery to filter this in the company_dim table for company_names
- Order by the company name alphabetically
*/
SELECT
    company_id,
    name AS company_name 
FROM 
    company_dim
WHERE company_id IN (
    SELECT 
            company_id
    FROM 
            job_postings_fact 
    WHERE 
            job_no_degree_mention = true
            AND job_country = 'Malaysia'
    ORDER BY
            company_id
)
ORDER BY
    name ASC

/*
Find the companies that have the most job openings in Malaysia. 
- Get the total number of job postings per company id (job_posting_fact)
- Return the total number of jobs with the company name (company_dim)
*/
WITH company_job_count AS (
    SELECT 
            company_id,
            COUNT(*) AS total_jobs
    FROM 
            job_postings_fact
    WHERE
            job_country = 'Malaysia' 
    GROUP BY
            company_id
)

SELECT 
    company_dim.name AS company_name,
    company_job_count.total_jobs
FROM 
    company_dim
LEFT JOIN company_job_count ON company_job_count.company_id = company_dim.company_id
WHERE total_jobs IS NOT NULL
ORDER BY
    total_jobs DESC
LIMIT 10

/*
[
  {
    "company_name": "Shopee",
    "total_jobs": "309"
  },
  {
    "company_name": "Agensi Pekerjaan BTC Sdn Bhd",
    "total_jobs": "258"
  },
  {
    "company_name": "Western Digital",
    "total_jobs": "223"
  },
  {
    "company_name": "AirAsia",
    "total_jobs": "121"
  },
  {
    "company_name": "Standard Chartered Bank",
    "total_jobs": "72"
  },
  {
    "company_name": "BTC Recruitment Malaysia - Executive Search Recruitment Agency",
    "total_jobs": "67"
  },
  {
    "company_name": "Grab",
    "total_jobs": "66"
  },
  {
    "company_name": "Accenture",
    "total_jobs": "66"
  },
  {
    "company_name": "Randstad Malaysia",
    "total_jobs": "65"
  },
  {
    "company_name": "S&P Global",
    "total_jobs": "64"
  }
]
*/