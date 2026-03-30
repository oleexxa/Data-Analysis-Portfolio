# E-commerce Analysis — Olist Brazilian Market (SQL + Power BI)

🚀 **Status: In Progress (Evolving Project)**  
This project is a living documentation of my growth as a Data Analyst. The core SQL architecture is functional and I am currently building Power BI dashboards on top of the Data Marts.

---

## 📈 Roadmap

| Phase | Status |
|-------|--------|
| Data Cleaning & Staging | ✅ Complete |
| RFM Customer Segmentation | ✅ Complete |
| Data Marts (SQL) | ✅ Complete |
| Power BI Dashboard 1 — Sales & Revenue | 🔄 In Progress |
| Power BI Dashboard 2 — Customer Behaviour | ⏳ Planned |
| Power BI Dashboard 3 — Logistics & Operations | ⏳ Planned |

---

## 🎯 Learning Objectives (SQL Mastery)

This project served as a comprehensive exercise to transition from basic querying to advanced data manipulation. I practiced:

- **Complex Relational Logic:** Resolved a major issue where customer retention appeared to be zero. By mapping data to `customer_unique_id`, I successfully identified repeat purchasing patterns across 2,400+ customers.
- **Data Integrity & Cleaning:** Neutralized "row inflation" caused by installment payments and removed duplicates using Window Functions (`ROW_NUMBER`), ensuring accurate final metrics.
- **Data Quality Handling:** Resolved a case where 610 products had empty strings instead of NULL in the category field — handled using `COALESCE(NULLIF())` to preserve 1,300+ orders rather than discarding them.
- **Performance Engineering:** Built optimized **Data Marts** (pre-aggregated tables) that allow efficient analysis without processing thousands of raw records repeatedly.
- **Advanced SQL:** Applied `LAG` window function with nested subqueries to calculate Month-over-Month revenue growth — required due to MySQL's execution order constraints.

---

## 📌 Project Focus

Instead of jumping into visualization, I focused on creating high-quality, pre-aggregated data models. I developed six core analytical components:

- **Data Cleaning & Staging:** Validated schema, removed duplicates, standardized city names, resolved row inflation from installment payments.
- **RFM Segmentation:** Strategic table categorizing customers into segments like *Recent Champions*, *At Risk High-Value*, and *New/Active* — enabling targeted marketing based on customer lifetime value.
- **Sales Trends Mart:** Monthly revenue, order volume, unique customers, AOV and Month-over-Month growth % using LAG window function.
- **Category Performance Mart:** Revenue and order volume per product category with data quality handling for missing category names.
- **State Performance Mart:** Revenue and order volume per Brazilian state — prepared for geographic visualization in Power BI.
- **Logistics Performance Mart:** Delivery health by state — calculates `delay_day_avg` and `on_time_delivery_rate` to identify regional bottlenecks.

---

## 💡 Key Analytical Insights

- **Hidden Loyalty:** While most users are one-time buyers, I identified a core group of 2,400+ repeat customers previously "invisible" due to data structure errors.
- **Seasonal Peak:** November 2017 was the platform's peak period — over 1.15M BRL in revenue, likely driven by Black Friday.
- **Category Concentration:** Top 3 categories (bed_bath_table, health_beauty, computers_accessories) generate a disproportionate share of total revenue — indicating concentration risk.
- **Regional Dependency:** São Paulo (SP) accounts for ~37% of total revenue — the platform is heavily dependent on one region.
- **Logistics Gaps:** Most packages arrive 8–21 days before the estimated date. However, states like Alagoas (AL) exceed 20% late delivery rate — pointing to local supply chain challenges.

---

## 🛠️ Project Structure
```
02_E_commerce_Olist_Analysis/
│
├── 1_Phase_Data_cleaning/
│   └── 01_data_cleaning.sql
│
├── 2_Phase_RFM/
│   └── 02_rfm_customer_segmentation.sql
│
├── 3_Phase_Data_Marts/
│   ├── 03_sales_trends.sql
│   ├── 04_logistic_performance.sql
│   ├── 05_sales_by_category.sql
│   ├── 06_sales_by_state.sql
│   └── 03_Data_Marts_Summary.pdf
│
└── 4_Phase_Power_BI/ (in progress)
    └── Dashboard_Sales_Revenue.pbix
```

---

## 📊 Data Source

Brazilian E-Commerce Public Dataset by Olist (Kaggle) — 100,000+ orders from 2016–2018.

*Project Last Updated: March 2026*
