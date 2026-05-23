/*
===============================================================================
Project: End-to-End Supply Chain, Inventory, and Procurement Analysis
Description: A comprehensive data analysis project auditing product profitability, 
             supply chain logistics, operational variance, and manufacturing risk.
===============================================================================
*/

-- ============================================================================
-- Script 1: 01_Product_Profitability_and_Unit_Economics
-- Description: Identify the highest-yielding products by calculating raw 
--              gross profit from bottom-up unit metrics.
-- ============================================================================

SELECT 
    cp.Product_name, 
    ROUND(SUM((unit_price * units) - (units * unit_cost)), 2) AS Gross_profit
FROM candy_sales cs
JOIN candy_products cp
    ON cs.Product_id = cp.Product_id
GROUP BY cp.Product_name
ORDER BY Gross_profit DESC;


-- ============================================================================
-- Script 2: 02_Geospatial_Supply_Chain_Routing
-- Description: Map end-to-end supply chain routes and calculate straight-line 
--              shipping distances to assess freight efficiency.
-- ============================================================================

SELECT 
    cs.Product_name,
    cs.units,
    cs.City,
    cp.Factory,
    cf.longitude AS store_long,
    cf.latitude AS store_lat,
    u.city AS Dest_city,
    u.lat AS dest_lat,
    u.lng AS dest_lng,
    ROUND(ST_Distance_Sphere(POINT(cf.longitude, cf.latitude), POINT(u.lng, u.lat)) * 0.000621371, 2) AS distance_in_miles
FROM uszips u
JOIN candy_sales cs 
    ON u.city = cs.city
JOIN candy_products cp 
    ON cs.product_id = cp.product_id
JOIN candy_factories cf 
    ON cp.factory = cf.factory;


-- ============================================================================
-- Script 3: 03_Operational_Target_Variance_Analysis
-- Description: Audit operational performance by comparing actual division 
--              revenue against executive targets to identify stockout risks 
--              and dead stock.
-- ============================================================================

WITH CS AS (
    SELECT 
        Division, 
        ROUND(SUM(Sales), 2) AS Total_Actual_Sales
    FROM candy_sales
    GROUP BY Division
)
SELECT 
    CS.Division, 
    (Total_Actual_Sales - ct.Target) AS Variance, 
    ROUND(((Total_Actual_Sales - ct.Target) / ct.Target) * 100, 2) AS Variance_Percentage
FROM CS
JOIN candy_targets ct
    ON CS.Division = ct.Division;


-- ============================================================================
-- Script 4: 04_Division_Margin_and_Profit_Contribution
-- Description: Calculate each division's percentage contribution to the 
--              company's total gross profit to dictate procurement prioritization.
-- ============================================================================

SELECT 
    Division, 
    SUM(Gross_Profit) AS Division_Gross_Profit, 
    (SELECT SUM(Gross_Profit) FROM candy_sales) AS Total_Gross_Profit, 
    ROUND(SUM(Gross_Profit) / (SELECT SUM(Gross_Profit) FROM candy_sales) * 100, 2) AS Percentage_Gross_Profit
FROM candy_sales
GROUP BY Division;


-- ============================================================================
-- Script 5: 05_Manufacturing_Risk_and_Reliance_Assessment
-- Description: Identify Single Points of Failure (SPOF) in the supply chain 
--              by tracing total financial volume back to physical manufacturing 
--              locations.
-- ============================================================================

SELECT 
    factory, 
    ROUND(SUM(Gross_Profit), 2) AS Gross_Profit_Per_Factory
FROM candy_sales cs
JOIN candy_products cp
    ON cs.Product_id = cp.Product_id
GROUP BY factory
ORDER BY SUM(Gross_profit) DESC;