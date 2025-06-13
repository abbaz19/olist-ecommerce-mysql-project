# ✅ SQL Query 1: Overall Payment Type Distribution
SELECT
    payment_type,
    COUNT(*) AS total_payments
FROM order_payments
GROUP BY payment_type
ORDER BY total_payments DESC;

# ✅ SQL Query 2: Payment Type Usage Over Time (by Month)
SELECT
    DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m') AS month,
    op.payment_type,
    COUNT(*) AS total_payments
FROM order_payments op
JOIN orders o ON op.order_id = o.order_id
GROUP BY month, op.payment_type
ORDER BY month ASC, total_payments DESC;
