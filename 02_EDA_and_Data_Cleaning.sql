-- -------------------------------
-- EDA and Data Cleaning: Olist Dataset
-- -------------------------------

-- Set the database
USE olist_ecommerce;

-- -------------------------------
-- 1. CUSTOMERS
-- -------------------------------

DESCRIBE customers;
SELECT * FROM customers LIMIT 10;
SELECT COUNT(*) AS total_customers FROM customers;
SELECT
  SUM(customer_unique_id IS NULL) AS null_unique_id,
  SUM(customer_zip_code_prefix IS NULL) AS null_zip,
  SUM(customer_city IS NULL) AS null_city,
  SUM(customer_state IS NULL) AS null_state
FROM customers;
SELECT customer_id, COUNT(*) FROM customers GROUP BY customer_id HAVING COUNT(*) > 1;

-- -------------------------------
-- 2. ORDERS
-- -------------------------------

DESCRIBE orders;
SELECT * FROM orders LIMIT 10;
SELECT COUNT(*) AS total_orders FROM orders;
SELECT
  SUM(order_status IS NULL) AS null_status,
  SUM(order_purchase_timestamp IS NULL) AS null_purchase_date
FROM orders;
SELECT order_id, COUNT(*) FROM orders GROUP BY order_id HAVING COUNT(*) > 1;
SELECT MIN(order_purchase_timestamp), MAX(order_purchase_timestamp) FROM orders;

-- -------------------------------
-- 3. ORDER ITEMS
-- -------------------------------

DESCRIBE order_items;
SELECT * FROM order_items LIMIT 10;
SELECT COUNT(*) AS total_order_items FROM order_items;
SELECT
  SUM(order_id IS NULL) AS null_order_id,
  SUM(product_id IS NULL) AS null_product_id,
  SUM(price IS NULL) AS null_price
FROM order_items;
SELECT order_id, product_id, COUNT(*) FROM order_items GROUP BY order_id, product_id HAVING COUNT(*) > 1;

-- -------------------------------
-- 4. ORDER PAYMENTS
-- -------------------------------

DESCRIBE order_payments;
SELECT * FROM order_payments LIMIT 10;
SELECT COUNT(*) AS total_payments FROM order_payments;
SELECT
  SUM(order_id IS NULL) AS null_order_id,
  SUM(payment_type IS NULL) AS null_payment_type
FROM order_payments;
SELECT order_id, COUNT(*) FROM order_payments GROUP BY order_id HAVING COUNT(*) > 1;

-- -------------------------------
-- 5. ORDER REVIEWS
-- -------------------------------

DESCRIBE order_reviews;
SELECT * FROM order_reviews LIMIT 10;
SELECT COUNT(*) AS total_reviews FROM order_reviews;
SELECT
  SUM(review_score IS NULL) AS null_score,
  SUM(review_creation_date IS NULL) AS null_creation
FROM order_reviews;
SELECT order_id, COUNT(*) FROM order_reviews GROUP BY order_id HAVING COUNT(*) > 1;

-- -------------------------------
-- 6. PRODUCTS
-- -------------------------------

DESCRIBE products;
SELECT * FROM products LIMIT 10;
SELECT COUNT(*) AS total_products FROM products;
SELECT
  SUM(product_id IS NULL) AS null_product_id,
  SUM(product_category_name IS NULL) AS null_category
FROM products;
SELECT product_id, COUNT(*) FROM products GROUP BY product_id HAVING COUNT(*) > 1;

-- -------------------------------
-- 7. SELLERS
-- -------------------------------

DESCRIBE sellers;
SELECT * FROM sellers LIMIT 10;
SELECT COUNT(*) AS total_sellers FROM sellers;
SELECT
  SUM(seller_id IS NULL) AS null_seller_id,
  SUM(seller_city IS NULL) AS null_city
FROM sellers;
SELECT seller_id, COUNT(*) FROM sellers GROUP BY seller_id HAVING COUNT(*) > 1;

-- -------------------------------
-- 8. PRODUCT CATEGORY TRANSLATION
-- -------------------------------

DESCRIBE category_translation;
SELECT * FROM category_translation LIMIT 10;
SELECT COUNT(*) AS total_translations FROM category_translation;
SELECT
  SUM(product_category_name IS NULL) AS null_pt,
  SUM(product_category_name_english IS NULL) AS null_en
FROM category_translation;
SELECT product_category_name, COUNT(*) FROM category_translation GROUP BY product_category_name HAVING COUNT(*) > 1;

-- -------------------------------
-- 9. GEOLOCATION
-- -------------------------------

DESCRIBE geolocation;
SELECT * FROM geolocation LIMIT 10;
SELECT COUNT(*) AS total_geos FROM geolocation;
SELECT
  SUM(geolocation_zip_code_prefix IS NULL) AS null_zip,
  SUM(geolocation_city IS NULL) AS null_city
FROM geolocation;
