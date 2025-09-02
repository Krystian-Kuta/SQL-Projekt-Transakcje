 -- 1. Przychód miesięczny
SELECT DATE_FORMAT(date, '%Y-%m') AS month,
       SUM(amount) AS revenue
FROM transactions
WHERE status = 'success'
GROUP BY month
ORDER BY month;

-- 2. Odsetek odrzuconych transakcji
SELECT payment_type,
       COUNT(*) AS total,
       SUM(CASE WHEN status='declined' THEN 1 ELSE 0 END)*100.0/COUNT(*) AS decline_rate
FROM transactions
GROUP BY payment_type;

-- 3. TOP 5 klientów wg wydatków
SELECT t.customer_id,
       SUM(amount) AS total_spent
FROM transactions t
WHERE status='success'
GROUP BY t.customer_id
ORDER BY total_spent DESC
LIMIT 5;

-- 4. Analiza subskrypcji
SELECT plan, COUNT(*) AS active_count
FROM subscriptions
WHERE status='active'
GROUP BY plan;
