# Step 4 – Analysis Objectives

This document outlines four key business questions to be answered through SQL analysis using the Olist Brazilian E-Commerce dataset.

---

## 🛒 Objective 1: Identify the Top-Selling Product Categories

**Goal:**  
Determine which product categories generate the highest number of sales.

**Why It Matters:**  
This helps the business understand customer demand, allocate inventory effectively, and focus on high-performing product lines.

**Related Tables:**  
- `order_items`
- `products`
- `category_translation`

---

## 🚚 Objective 2: Analyze Delivery Time Across Brazilian States

**Goal:**  
Calculate the average delivery time and compare it by customer state.

**Why It Matters:**  
Evaluating delivery speed helps identify logistics bottlenecks and regional disparities in service quality.

**Related Tables:**  
- `orders`
- `customers`

---

## 💳 Objective 3: Examine Payment Type Preferences

**Goal:**  
Understand the distribution of payment types used by customers over time.

**Why It Matters:**  
This can inform payment partner strategy and checkout optimization.

**Related Tables:**  
- `order_payments`
- `orders`

---

## 🌟 Objective 4: Investigate the Impact of Delivery Time on Review Scores

**Goal:**  
Analyze whether longer delivery times correlate with lower customer review scores.

**Why It Matters:**  
Improving delivery speed may lead to higher customer satisfaction and better ratings.

**Related Tables:**  
- `orders`
- `order_reviews`

---
