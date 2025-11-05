CREATE DATABASE IF NOT EXISTS blinkitdb;

USE blinkitdb;

SELECT * 
FROM blinkit_data;

SELECT count(*) 
FROM blinkit_data;

SELECT COUNT(*)
FROM information_schema.columns 
WHERE table_schema = 'blinkitdb'
AND table_name = 'blinkit_data';

SELECT DISTINCT TRIM(LOWER(item_fat_content)) AS cleaned_value
FROM blinkit_data;

SELECT item_fat_content,
	CASE
		WHEN TRIM(LOWER(item_fat_content)) IN ('low fat', 'lf') THEN 'Low Fat'
        WHEN TRIM(LOWER(item_fat_content)) IN ('reg', 'regular') THEN 'Regular'
        ELSE item_fat_content
	END AS updated_value
FROM blinkit_data;

SET SQL_SAFE_UPDATES = 0;

UPDATE blinkit_data
SET item_fat_content = 
	CASE 
		WHEN TRIM(LOWER(item_fat_content)) IN ('low fat', 'lf') THEN 'Low Fat'
        WHEN TRIM(LOWER(item_fat_content)) IN ('reg', 'regular') THEN 'Regular'
        ELSE item_fat_content
	END;

-- KPI's Requirements
-- Total Sales: Overall revenue generated from all items sold
SELECT CAST(SUM(sales) / 1000000 AS DECIMAL(10,2)) AS total_sales_in_millions
FROM blinkit_data;

-- Average Sales: Average revenue per sales
SELECT * 
FROM blinkit_data;

SELECT CAST(AVG(Sales) AS DECIMAL(10,2)) AS Avg_Sales
FROM blinkit_data; 

-- Number of items: Total count of different items sold 
SELECT * 
FROM blinkit_data;

SELECT DISTINCT(item_type)
FROM blinkit_data;

SELECT item_type, COUNT(*) AS item_sold
FROM blinkit_data
GROUP BY item_type
ORDER BY item_sold DESC;

-- Average rating: Average customer rating for items sold
SELECT * 
FROM blinkit_data;

SELECT CAST(AVG(rating) AS DECIMAL(10,2)) AS Avg_Customer_Rating
FROM blinkit_data;
 
 -- Granular Requirements
-- Total Sales by Fat Content:
-- Objective: Analyze the impact of fat content on total sales.
-- Additional KPI Metrics: Assess how other KPIs (Average Sales, Number of Items, Average Rating) vary with fat content.

SELECT * FROM blinkit_data;

SELECT item_fat_content, 
		CAST(SUM(sales) / 1000 AS DECIMAL(10,2)) AS total_sales_thousands,
        CAST(AVG(Sales) AS DECIMAL(10,2)) AS Avg_Sales,
        COUNT(*) AS no_of_items,
        CAST(AVG(rating) AS DECIMAL(10,2)) AS Avg_Customer_Rating
FROM blinkit_data
GROUP BY item_fat_content 
ORDER BY total_sales_thousands DESC;

-- Total Sales by Item Type:
-- Objective: Identify the performance of different item types in terms of total sales.
-- Additional KPI Metrics: Assess how other KPIs (Average Sales, Number of Items, Average Rating) vary with item type.

SELECT * FROM blinkit_data;

SELECT item_type, 
		CAST(SUM(sales) AS DECIMAL(10,2)) AS total_sales,
        CAST(AVG(Sales) AS DECIMAL(10,2)) AS Avg_Sales,
        COUNT(*) AS no_of_items,
        CAST(AVG(rating) AS DECIMAL(10,2)) AS Avg_Customer_Rating
FROM blinkit_data
GROUP BY item_type
ORDER BY total_sales DESC;

-- Fat Content by Outlet for Total Sales:
-- Objective: Compare total sales across different outlets segmented by fat content.
-- Additional KPI Metrics: Assess how other KPIs (Average Sales, Number of Items, Average Rating) vary with fat content.

SELECT * FROM blinkit_data;

SELECT outlet_location_type,
		CAST(SUM(CASE WHEN item_fat_content = 'Low Fat' THEN sales ELSE 0 END) AS DECIMAL(10,2)) AS Low_Fat,
        CAST(SUM(CASE WHEN item_fat_content = 'Regular' THEN sales ELSE 0 END) AS DECIMAL(10,2)) AS Regular
FROM blinkit_data
GROUP BY outlet_location_type
ORDER BY outlet_location_type;

-- Total Sales by Outlet Establishment:
-- Objective: Evaluate how the age or type of outlet establishment influences total sales.

SELECT * FROM blinkit_data;

SELECT outlet_establishment_year, 
		CAST(SUM(sales) AS DECIMAL(10,2)) AS total_sales,
        CAST(AVG(Sales) AS DECIMAL(10,2)) AS Avg_Sales,
        COUNT(*) AS no_of_items,
        CAST(AVG(rating) AS DECIMAL(10,2)) AS Avg_Customer_Rating
FROM blinkit_data
GROUP BY outlet_establishment_year
ORDER BY outlet_establishment_year ASC;

-- Chart's Requirements
-- Percentage of Sales by Outlet Size:
-- Objective: Analyze the correlation between outlet size and total sales.

SELECT * FROM blinkit_data;

SELECT 
	outlet_size,
	total_sales,
	total_sum,
	CAST(total_sales / total_sum * 100 AS DECIMAL(10,2)) AS sales_percentage
FROM (
	SELECT 
    outlet_size, 
    CAST(SUM(sales) AS DECIMAL(10, 2)) AS total_sales,
	CAST(SUM(SUM(sales)) OVER() AS DECIMAL(10,2)) AS total_sum
FROM blinkit_data
GROUP BY outlet_size
ORDER BY total_sales DESC
) AS sub;

-- Sales by Outlet Location:
-- Objective: Assess the geographic distribution of sales across different locations.
SELECT * FROM blinkit_data;

SELECT 
	outlet_location_type, 
	CAST(SUM(sales) AS DECIMAL(10,2)) AS total_sales
FROM blinkit_data
GROUP BY outlet_location_type
ORDER BY outlet_location_type;

-- All Metrics by Outlet Type:
-- Objective: Provide a comprehensive view of all key metrics (Total Sales, Average Sales, Number of Items, Average Rating) broken down by different outlet types.
SELECT * FROM blinkit_data;

SELECT 
	outlet_type,
    	CAST(SUM(sales) AS DECIMAL(10,2)) AS total_sales,
        CAST(SUM(sales) * 100 / SUM(SUM(sales)) OVER() AS DECIMAL(10,2)) AS sales_percentage,
		CAST(AVG(Sales) AS DECIMAL(10,2)) AS Avg_Sales,
        COUNT(*) AS no_of_items,
        CAST(AVG(rating) AS DECIMAL(10,2)) AS Avg_Customer_Rating
FROM  blinkit_data
GROUP BY outlet_type
ORDER BY total_sales DESC;
        




