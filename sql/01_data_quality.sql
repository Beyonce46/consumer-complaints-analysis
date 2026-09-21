-- Check total number of complaints
SELECT COUNT(*) AS total_complaints
FROM complaints;


-- Check for duplicate Complaint IDs
SELECT
    Complaint_ID,
    COUNT(*) AS duplicate_count
FROM complaints
GROUP BY Complaint_ID
HAVING COUNT(*) > 1;


-- Check complaint volume by company
SELECT
    Company,
    COUNT(*) AS complaint_count
FROM complaints
GROUP BY Company
ORDER BY complaint_count DESC;

SELECT 
	COUNT(*) AS Total_complaints,
    COUNT(DISTINCT Complaint_ID) AS Unique_ID,
    MIN(Date_received) AS earliest_complaints,
    MAX(Date_received) AS Latest_complains,
    DATEDIFF(MAX(Date_received),MIN(Date_received)) AS range_days
FROM complaints;

SELECT 
	EXTRACT(MONTH FROM Date_received) as complain_month,
    COUNT(*) AS complains_count
FROM complaints
GROUP BY complain_month
ORDER BY complain_month;

-- Which financial products generate the most customer friction overall?
SELECT 
	Product,
	COUNT(*) AS complain_count,
	ROUND(COUNT(*) * 100.00 / (SELECT COUNT(*) FROM complaints),2) as pct_share
FROM complaints
GROUP BY product
ORDER BY complain_count desc;

-- Which financial institution accounts for the highest volume of customer complaints in our dataset?
SELECT
	Company,
	COUNT(*) AS complain_count
FROM complaints
GROUP BY Company
ORDER BY complain_count desc;

-- How consumers submit complaints
SELECT 
	Submitted_via,
	COUNT(*) AS complain_count
FROM complaints
GROUP BY Submitted_via
ORDER BY complain_count desc;

 -- High-level breakdown of company resolutions
SELECT 
	Company_response_to_consumer,
	COUNT(*) AS complain_count
FROM complaints
GROUP BY Company_response_to_consumer
ORDER BY complain_count desc;
