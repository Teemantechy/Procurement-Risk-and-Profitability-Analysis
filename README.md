# Procurement-Risk-and-Profitability-Analysis

# Supply Chain & Procurement Command Center: Profitability & Risk Assessment

**Author:** Taiwo Adigun

## 📌 Project Overview
This project is an end-to-end data analytics case study designed to audit product profitability, map supply chain logistics, and identify critical manufacturing risks. By processing raw sales, product, and geographic data through a SQL ETL pipeline, I developed an executive-level Tableau dashboard that serves as a **Procurement Command Center**, enabling data-driven inventory prioritization and risk management.

## 🎯 The Business Problem
A manufacturing enterprise needed visibility into its operational efficiency and supply chain vulnerabilities. The core objectives of this analysis were to:
1. Calculate true unit economics and gross profit margins.
2. Track straight-line freight distances to assess logistical efficiency.
3. Compare actual divisional sales against corporate targets to identify stockout risks and dead stock.
4. Locate Single Points of Failure (SPOF) in the physical manufacturing supply chain.

## 🛠️ Tools & Methodology
* **Database / Data Engineering:** MySQL (CTEs, Subqueries, Geospatial Functions, Advanced Joins, Aggregations)
* **Data Visualization:** Tableau Public (Interactive Dashboards, Calculated Fields, KPI Design)

## 💡 Key Business Insights
Through rigorous SQL analysis and visual storytelling, the following operational realities were uncovered:
* **The Profit Engine:** Margin analysis revealed that the **Chocolate division generates 95.11%** of the company's total gross profit, drastically overperforming corporate targets by 377%.
* **The Dead Stock Drain:** The Sugar division is operating at a severe negative variance, contributing only 0.31% to the bottom line, indicating a need for immediate inventory liquidation or operational shutdown.
* **Single Point of Failure (SPOF) Identified:** Tracing financial volume back to physical locations revealed that a single facility ("Lot's O' Nuts") is responsible for over $51,000 of the total company profit. If this specific supply chain node goes offline, the company faces catastrophic revenue loss. 

## 📂 Repository Contents
All data extraction and transformation were performed using MySQL. The master script is divided into five core analytical phases:
1. `01_Product_Profitability_and_Unit_Economics.sql`: Bottom-up gross profit calculations.
2. `02_Geospatial_Supply_Chain_Routing.sql`: End-to-end freight distance mapping.
3. `03_Operational_Target_Variance_Analysis.sql`: Actual vs. Target performance auditing.
4. `04_Division_Margin_and_Profit_Contribution.sql`: Percentage contribution to the bottom line.
5. `05_Manufacturing_Risk_and_Reliance_Assessment.sql`: Tracing financial reliance to specific physical factories.

## 📊 Interactive Dashboard
The final output of this analysis is an interactive Tableau dashboard designed for executive stakeholders. 

👉 **[View the Live Dashboard on Tableau Public](https://public.tableau.com/app/profile/taiwo.adigun/viz/Procurement_Command_Center/SupplyChainProcurementCommandCenterProfitabilityRiskAssessment?publish=yes)**
