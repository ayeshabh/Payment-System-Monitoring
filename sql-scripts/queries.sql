-- Query 1: Success Rate of Transactions
-- This query calculates the total transactions, successful transactions, and success rate in percentage
SELECT 
    COUNT(*) AS total_transactions,
    SUM(CASE WHEN status = 'success' THEN 1 ELSE 0 END) AS successful_transactions,
    ROUND(SUM(CASE WHEN status = 'success' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS success_rate
FROM transactions;

-- Query 2: Top Failure Reasons
-- This query lists the most common reasons for transaction failures, sorted by frequency
SELECT 
    failure_reason, 
    COUNT(*) AS occurrence
FROM transactions
WHERE status = 'failure'
GROUP BY failure_reason
ORDER BY occurrence DESC;

-- Query 3: Hourly Transaction Volume
-- This query calculates the number of transactions processed per hour
SELECT 
    DATE_TRUNC('hour', timestamp) AS hour,
    COUNT(*) AS transaction_count
FROM transactions
GROUP BY DATE_TRUNC('hour', timestamp)
ORDER BY hour;

