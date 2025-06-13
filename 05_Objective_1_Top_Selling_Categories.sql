SELECT
    ct.product_category_name_english AS category,
    COUNT(oi.product_id) AS total_items_sold,
    ROUND(SUM(oi.price), 2) AS total_revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
LEFT JOIN category_translation ct ON p.product_category_name = ct.product_category_name
GROUP BY category
ORDER BY total_items_sold DESC
LIMIT 10;
