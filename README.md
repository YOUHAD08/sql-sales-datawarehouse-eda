# 📊 SQL Exploratory Data Analysis - Sales Data Warehouse

A comprehensive SQL-based exploratory data analysis (EDA) project built on top of a production-ready Sales Data Warehouse. This project demonstrates advanced analytical techniques including time-series analysis, customer segmentation, product performance tracking, and business intelligence reporting using T-SQL.

## 📋 Table of Contents

- [Project Overview](#-project-overview)
- [Project Context](#-project-context)
- [Analysis Categories](#-analysis-categories)
- [Key Features](#-key-features)
- [Key Insights & Metrics](#-key-insights--metrics)
- [Prerequisites](#-prerequisites)
- [Next Steps](#-next-steps)
- [Acknowledgments](#-acknowledgments)
- [License](#-license)
- [Author](#-author)

---

## 🎯 Project Overview

This project extends the **Sales Data Warehouse** (Medallion Architecture: Bronze → Silver → Gold) with a comprehensive suite of analytical queries and business intelligence views. The analysis focuses on extracting actionable insights from sales, customer, and product data to support data-driven decision-making.

**Business Objectives:**

- Understand customer behavior and lifecycle patterns
- Analyze product performance and profitability
- Track sales trends and temporal patterns
- Enable strategic segmentation for targeted marketing
- Create reusable analytical views for BI reporting

---

## 🔗 Project Context

This analysis layer builds upon the **Sales Data Warehouse** project, which implements:

- **Medallion Architecture** (Bronze → Silver → Gold layers)
- **Star Schema** design with fact and dimension tables
- **ETL pipelines** for data integration from CRM and ERP systems
- **Data quality framework** ensuring analytical accuracy

For more details on the underlying data warehouse, see the [main project documentation](https://github.com/YOUHAD08/SQL-Exploratory-Data-Analysis-ED).

---

## 📊 Analysis Categories

### 1. **Database & Schema Exploration** (`01_database_exploration.sql`)

- Metadata discovery using `INFORMATION_SCHEMA`
- Table and column structure inspection
- Dimension cardinality profiling

### 2. **Dimension Analysis** (`02_dimensions_exploration.sql`)

- Distinct value enumeration for categorical attributes
- Customer demographics profiling (country, gender, marital status)
- Product hierarchy exploration (categories, subcategories, product lines)

### 3. **Temporal Analysis** (`03_date_range_exploration.sql`)

- Date range boundaries for sales transactions
- Customer age distribution analysis
- Time span calculations for data coverage

### 4. **Business Metrics** (`04_measures_exploration.sql`)

- Core KPI calculations (total sales, quantity, average price)
- Customer and product counts
- Consolidated business performance report using `UNION ALL`

### 5. **Magnitude Analysis** (`05_magnitude_analysis.sql`)

- Aggregated metrics by dimensions (country, gender, category)
- Revenue distribution analysis
- Customer and product concentration patterns

### 6. **Ranking Analysis** (`06_ranking_analysis.sql`)

- Top/Bottom performers identification
- Window function rankings (`DENSE_RANK()`, `ROW_NUMBER()`)
- Comparative analysis across products, customers, countries, and categories

### 7. **Time-Series Analysis** (`07_change_over_time_analysis.sql`)

- Temporal granularity analysis (yearly, monthly)
- Date aggregation techniques (`YEAR()`, `MONTH()`, `DATETRUNC()`, `FORMAT()`)
- Sales trend visualization preparation

### 8. **Advanced Time-Series** (`08_cumulative_analysis.sql`)

- Running totals using `SUM() OVER()`
- Moving averages with window functions
- Cumulative metrics for trend analysis

### 9. **Year-over-Year Analysis** (`09_performance_analysis.sql`)

- Product performance benchmarking against historical averages
- YoY growth/decline tracking using `LAG()`
- Performance classification (Above/Below Average, Increase/Decrease)

### 10. **Part-to-Whole Analysis** (`10_part_to_whole_analysis.sql`)

- Category sales contribution percentages
- Market share calculations
- Portfolio composition analysis

### 11. **Data Segmentation** (`11_data_segmentation.sql`)

- Product cost tier segmentation (Budget/Mid-Range/Premium/Luxury)
- Customer lifecycle segmentation (VIP/Regular/New)
- Behavioral clustering using `CASE` logic

### 12. **Customer Analytics View** (`12_report_customers.sql`)

- Comprehensive customer intelligence view
- RFM metrics (Recency, Frequency, Monetary)
- Demographic and behavioral segmentation
- Customer lifetime value indicators

### 13. **Product Analytics View** (`13_report_products.sql`)

- Product performance intelligence view
- Sales velocity and lifecycle metrics
- Profitability analysis
- Performance tier classification

---

## 📊 Key Insights & Metrics

### Customer Analytics

- **18,484** unique customers across **6 countries**
- Customer segmentation: VIP / Regular / New based on spend and tenure
- Age group distribution: Gen Z → Senior (6 categories)
- RFM analysis: Recency, Frequency, Monetary value tracking

### Product Analytics

- **295** active products across **4 categories**
- Cost tiers: Budget (<€100) / Mid-Range (€100-€500) / Premium (€500-€1K) / Luxury (>€1K)
- Performance classification: High/Mid/Low performers based on revenue
- Product lifecycle tracking with last sale date and recency metrics

### Sales Analytics

- **60,398** transactions spanning **48 months** (2011-2014)
- Time-series analysis: yearly, monthly, daily granularities
- Running totals and moving averages for trend analysis
- Year-over-year comparisons for growth tracking

---

## 🔧 Prerequisites

- **Database**: SQL Server 2017 or higher
- **Data Warehouse**: Existing implementation with Gold layer (star schema)
- **Tables Required**:
  - `gold.fact_sales` (sales transactions)
  - `gold.dim_customers` (customer dimension)
  - `gold.dim_products` (product dimension)
- **Permissions**: `SELECT` on Gold layer, `CREATE VIEW` for BI views

---

## 🎓 Next Steps

**Planned Enhancements**:

- **📊 Tableau Dashboard**: Interactive visualizations for sales performance, customer analytics, and product insights
- **📈 Power BI Dashboard**: Executive dashboards with KPIs, trends, and drill-down capabilities
- **🔗 BI Tool Integration**: Direct connection of `gold.report_customers` and `gold.report_products` views to visualization platforms

---

## 🙏 Acknowledgments

This project builds upon the foundational **Sales Data Warehouse** project, implementing best practices in:

- **Data Warehousing** (Medallion Architecture, Star Schema)
- **SQL Analytics** (Window Functions, CTEs, Advanced Aggregations)
- **Business Intelligence** (KPI Design, Segmentation, Reporting)

Special thanks to **Baraa Khatib Salkini** ([Data With Baraa](https://datawithbaraa.com)) for educational guidance in data engineering and analytics.

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 👤 Author

**Youhad Ayoub**

- 🌐 GitHub: [@YOUHAD08](https://github.com/YOUHAD08)
- 💼 LinkedIn: [Ayoub Youhad](https://www.linkedin.com/in/ayoub-youhad)
- 📧 Email: ayoubyouhad79@gmail.com

---

_Last Updated: January 2026_
