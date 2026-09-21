-- 1. What percentage of complaints are responded to within the required regulatory timeframe across all banks?
SELECT
	`Timely_response?` AS Timely_response,
	COUNT(*) AS complains_count,
	ROUND(COUNT(*) * 100 / (SELECT COUNT(*) FROM complaints), 2) as pct
FROM complaints
GROUP BY  `Timely_response?`
ORDER BY complains_count DESC;

-- 2. What are the top 5 most frequent issue descriptions submitted by consumers?
SELECT 
	issue,
	COUNT(*) AS complain_count
FROM complaints
GROUP BY issue
ORDER BY complain_count DESC
LIMIT 5;

-- 
SELECT
	Company,Company_response_to_consumer,
	COUNT(*) AS complain_count
FROM complaints
GROUP BY Company,Company_response_to_consumer
ORDER BY complain_count desc;

-- 3. How do major financial institutions compare in total complaint volume, and what proportion of their resolutions result in financial compensation versus non-financial outcomes?
SELECT 
	Company,
	COUNT(*) AS total_complains,
	SUM(
		CASE 
			WHEN Company_response_to_consumer = 'Closed with monetary relief'
    THEN 1 ELSE 0 
    END
		) AS Monetary_relief,
        
SUM(CASE
	WHEN Company_response_to_consumer = 'Closed with non-monetary relief'
THEN 1 ELSE 0
END 
) AS Non_monetary_relief,
ROUND(
	SUM(CASE 
			WHEN Company_response_to_consumer = 'Closed with monetary relief'
		THEN 1 ELSE 0
	END
    )* 100.00 / COUNT(*),2
		)AS monetary_relief_pct,
ROUND(
	SUM(CASE 
			WHEN Company_response_to_consumer = 'Closed with non-monetary relief'
            THEN 1 ELSE 0
		END
	)* 100.00 / COUNT(*),2
		)AS non_monetary_relief_pct
FROM complaints
GROUP BY Company
ORDER BY total_complains DESC;

SELECT
	MIN(Date_received) AS earliest_received,
	MAX(Date_received) AS Latest_received,
	MIN(Date_sent) AS early_sent,
	MAX(Date_sent) AS late_sent
FROM complaints;    


-- 4. Which financial products experience the highest processing delays (>15 days)?
SELECT
    Product,
    COUNT(*) AS total_complaints,

    SUM(
        CASE
            WHEN DATEDIFF(Date_sent, Date_received) > 15
            THEN 1 ELSE 0
        END
    ) AS Delayed_over_15days,

    ROUND(
        SUM(
            CASE
                WHEN DATEDIFF(Date_sent, Date_received) > 15
                THEN 1 ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS Delayed_over_15days_pct,

    ROUND(AVG(DATEDIFF(Date_sent, Date_received)), 2)
        AS AVG_Response_days

FROM complaints
GROUP BY Product
ORDER BY Delayed_over_15days_pct DESC;   

-- 5. What are the TOP 3 specific  ISSUES  within each product line?
WITH issue_counts AS (
	SELECT 
		Product,
		Issue,
COUNT(*) AS complain_count
	FROM complaints
	GROUP BY Product,Issue
	),
ranked_issues AS (
	SELECT
		Product,
        Issue,
		complain_count,
	ROW_NUMBER() OVER (
    PARTITION BY PRODUCT
    ORDER BY complain_count DESC
    )AS Issue_rank
FROM Issue_counts
)
SELECT
	Product,
    Issue,
    complain_count,
    Issue_rank
FROM ranked_issues
WHERE Issue_Rank <=3
ORDER BY Product,Issue_rank;
    
-- 6. Does the submission channel affect how quickly companies respond to complaints?
SELECT 
	Submitted_via,
    COUNT(*) AS complain_count,
ROUND(
		AVG(DATEDIFF(Date_sent, Date_received)),2
        ) AS AVG_Response_days,
ROUND(
		MIN(DATEDIFF(Date_sent, Date_received)),2
        ) AS Minimum_response_days,
ROUND(
		MAX(DATEDIFF(Date_sent, Date_received)),2
        ) AS Maximum_response_days,
ROUND(
	SUM(CASE
		WHEN `Timely_response?` = 'Yes'
        THEN 1 ELSE 0
	END) * 100.00/COUNT(*),
    2
    ) AS Timely_response_pct
FROM complaints
GROUP BY Submitted_via
ORDER BY AVG_Response_days;
    
-- 7. Which states have the highest complaint volume?
SELECT
	State,
    COUNT(*) AS complain_count,
ROUND(COUNT(*) * 100.00/ SUM(COUNT(*)) OVER(),2) AS pct
FROM complaints
GROUP BY State
ORDER BY complain_count DESC
LIMIT 10;
