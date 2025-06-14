-- =====================================
-- 🧼 EDA & Data Cleaning: Olist Dataset
-- =====================================

-- Set the database context
USE olist_ecommerce;

-- ======================================================
-- 1. CUSTOMERS TABLE
-- ======================================================

-- Schema and sample
DESCRIBE customers;
SELECT * FROM customers LIMIT 10;

-- Total number of customers
SELECT COUNT(*) AS total_customers FROM customers;

-- Null value check
SELECT
  COUNT(*) - COUNT(customer_unique_id) AS null_unique_id,
  COUNT(*) - COUNT(customer_zip_code_prefix) AS null_zip,
  COUNT(*) - COUNT(customer_city) AS null_city,
  COUNT(*) - COUNT(customer_state) AS null_state
FROM customers;

-- Check for duplicate customer IDs
SELECT customer_id, COUNT(*) AS count
FROM customers
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- ======================================================
-- 2. ORDERS TABLE
-- ======================================================

DESCRIBE orders;
SELECT * FROM orders LIMIT 10;

-- Total orders
SELECT COUNT(*) AS total_orders FROM orders;

-- Null checks
SELECT
  COUNT(*) - COUNT(order_status) AS null_status,
  COUNT(*) - COUNT(order_purchase_timestamp) AS null_purchase_date
FROM orders;

-- Duplicate order IDs
SELECT order_id, COUNT(*) AS count
FROM orders
GROUP BY order_id
HAVING COUNT(*) > 1;

-- Order date range
SELECT
  MIN(order_purchase_timestamp) AS first_order_date,
  MAX(order_purchase_timestamp) AS last_order_date
FROM orders;

-- ======================================================
-- 3. ORDER ITEMS TABLE
-- ======================================================

DESCRIBE order_items;
SELECT * FROM order_items LIMIT 10;

-- Total records
SELECT COUNT(*) AS total_order_items FROM order_items;

-- Null checks
SELECT
  COUNT(*) - COUNT(order_id) AS null_order_id,
  COUNT(*) - COUNT(product_id) AS null_product_id,
  COUNT(*) - COUNT(price) AS null_price
FROM order_items;

-- Duplicate item records
SELECT order_id, product_id, COUNT(*) AS count
FROM order_items
GROUP BY order_id, product_id
HAVING COUNT(*) > 1;

-- ======================================================
-- 4. ORDER PAYMENTS TABLE
-- ======================================================

DESCRIBE order_payments;
SELECT * FROM order_payments LIMIT 10;

-- Total payment records
SELECT COUNT(*) AS total_payments FROM order_payments;

-- Null checks
SELECT
  COUNT(*) - COUNT(order_id) AS null_order_id,
  COUNT(*) - COUNT(payment_type) AS null_payment_type
FROM order_payments;

-- Duplicate payment records
SELECT order_id, COUNT(*) AS count
FROM order_payments
GROUP BY order_id
HAVING COUNT(*) > 1;

-- ======================================================
-- 5. ORDER REVIEWS TABLE
-- ======================================================

DESCRIBE order_reviews;
SELECT * FROM order_reviews LIMIT 10;

-- Total reviews
SELECT COUNT(*) AS total_reviews FROM order_reviews;

-- Null checks
SELECT
  COUNT(*) - COUNT(review_score) AS null_review_score,
  COUNT(*) - COUNT(review_creation_date) AS null_creation_date
FROM order_reviews;

-- Duplicate reviews per order
SELECT order_id, COUNT(*) AS count
FROM order_reviews
GROUP BY order_id
HAVING COUNT(*) > 1;

-- ======================================================
-- 6. PRODUCTS TABLE
-- ======================================================

DESCRIBE products;
SELECT * FROM products LIMIT 10;

-- Total products
SELECT COUNT(*) AS total_products FROM products;

-- Null checks
SELECT
  COUNT(*) - COUNT(product_id) AS null_product_id,
  COUNT(*) - COUNT(product_category_name) AS null_category
FROM products;

-- Duplicate products
SELECT product_id, COUNT(*) AS count
FROM products
GROUP BY product_id
HAVING COUNT(*) > 1;

-- ======================================================
-- 7. SELLERS TABLE
-- ======================================================

DESCRIBE sellers;
SELECT * FROM sellers LIMIT 10;

-- Total sellers
SELECT COUNT(*) AS total_sellers FROM sellers;

-- Null checks
SELECT
  COUNT(*) - COUNT(seller_id) AS null_seller_id,
  COUNT(*) - COUNT(seller_city) AS null_city
FROM sellers;

-- Duplicate sellers
SELECT seller_id, COUNT(*) AS count
FROM sellers
GROUP BY seller_id
HAVING COUNT(*) > 1;

-- ======================================================
-- 8. PRODUCT CATEGORY TRANSLATION
-- ======================================================

DESCRIBE category_translation;
SELECT * FROM category_translation LIMIT 10;

-- Total records
SELECT COUNT(*) AS total_translations FROM category_translation;

-- Null checks
SELECT
  COUNT(*) - COUNT(product_category_name) AS null_category_portuguese,
  COUNT(*) - COUNT(product_category_name_english) AS null_category_english
FROM category_translation;

-- Duplicate categories
SELECT product_category_name, COUNT(*) AS count
FROM category_translation
GROUP BY product_category_name
HAVING COUNT(*) > 1;

-- ======================================================
-- 9. GEOLOCATION TABLE
-- ======================================================

DESCRIBE geolocation;
SELECT * FROM geolocation LIMIT 10;

-- Total geolocation entries
SELECT COUNT(*) AS total_geos FROM geolocation;

-- Null checks
SELECT
  COUNT(*) - COUNT(geolocation_zip_code_prefix) AS null_zip,
  COUNT(*) - COUNT(geolocation_city) AS null_city
FROM geolocation;

-- Optionally: Find zip codes with multiple cities (potential quality issue)
SELECT geolocation_zip_code_prefix, COUNT(DISTINCT geolocation_city) AS unique_cities
FROM geolocation
GROUP BY geolocation_zip_code_prefix
HAVING COUNT(DISTINCT geolocation_city) > 1;
