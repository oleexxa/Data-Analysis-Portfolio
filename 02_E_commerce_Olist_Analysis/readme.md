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

## 📊 Power BI Dashboard

### Dashboard 1: Sales & Revenue
Built on top of SQL Data Marts — connecting pre-aggregated data to interactive visualizations.

**Visuals:**
- KPI Cards: Total Revenue, Total Orders, Avg Order Value — with Year-over-Year comparison (DAX)
- Monthly Revenue Trend — line chart across 2016–2018
- Top 10 Categories by Revenue — bar chart
- Revenue by State — Brazil bubble map with tooltips

**DAX Measures:**
- LY comparisons (Total Revenue LY, Total Orders LY, Avg Order Value LY)
- YoY % growth calculations
- Conditional color formatting on main KPI values (green/red)

**What I learned:**
Power BI course completed — but applying theory to real data is a different story. Building this dashboard showed me exactly what still needs improvement:
- Tables are not connected via relationships — filters don't work globally yet
- MoM Growth calculated in SQL (LAG function) — still searching for the best way to visualize it
- Brazil map doesn't respond to date filters — requires Data Mart architecture rebuild

**Status:** Dashboard 1 built — architecture improvements planned  
**Tools:** Power BI Desktop, DAX

![Dashboard Sales Revenue](dashboard_sales_revenue.png)

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
- **Sales Trends Mart:** Monthly revenue, order volume, u
