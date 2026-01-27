SELECT 
    CASE 
        WHEN tenure < 6 THEN '0–6 months'
        WHEN tenure BETWEEN 6 AND 12 THEN '6–12 months'
        WHEN tenure BETWEEN 13 AND 24 THEN '1–2 years'
        ELSE '2+ years'
    END AS tenure_group,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS churn_rate_percent
FROM customer_churn
GROUP BY tenure_group
ORDER BY churn_rate_percent DESC;
