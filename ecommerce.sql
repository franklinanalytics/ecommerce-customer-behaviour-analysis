CREATE TABLE ecommerce(
	CustomerID				INT PRIMARY KEY,
	Gender					VARCHAR(50),
	Age						INT,
	City 					VARCHAR(50),
	MembershipType			VARCHAR(50),
	TotalSpend				DECIMAL(10,2),
	ItemsPurchased			INT,
	AverageRating			DECIMAL(10,2),
	DiscountApplied			BOOLEAN,
	DaysSinceLastPurchase	INT,
	SatisfactionLevel		VARCHAR(50)
);

--1. BASIC DATA EXPLORATION--

--To check all records
SELECT * FROM ecommerce

--To verify Column Names & Data Types
SELECT column_name, data_type 
FROM information_schema.columns 
WHERE table_name = 'ecommerce';

--To verify total number of rows in the dataset
SELECT COUNT(*) FROM ecommerce

--2. Customer Insights
--Total Customers by Gender
SELECT Gender, COUNT(*) AS customer_count
FROM ecommerce
GROUP BY Gender
ORDER BY customer_count DESC;

--Average Age of Customers
SELECT AVG(Age) AS avg_age FROM ecommerce;

--Top 5 High-Spending Customers
SELECT CustomerID, TotalSpend
FROM ecommerce
ORDER BY TotalSpend DESC
LIMIT 5;

--3. Sales & Revenue Trends
--Total Items sold
SELECT SUM(ItemsPurchased) AS total_items_sold
FROM ecommerce

--Total Revenue & Average Spend per Customer
SELECT SUM(TotalSpend) AS total_revenue, 
       AVG(TotalSpend) AS avg_spend_per_customer
FROM ecommerce;

--Number of Customers Who Applied a Discount
SELECT COUNT(*) AS discount_users
FROM ecommerce
WHERE DiscountApplied = TRUE;

--4. Customer Behavior Analysis
--Customers Grouped by Membership Type
SELECT MembershipType, COUNT(*) AS customers
FROM ecommerce
GROUP BY MembershipType
ORDER BY customers DESC;

--Customers Who Havent Purchased in 30+ Days
SELECT CustomerID, DaysSinceLastPurchase
FROM ecommerce
WHERE DaysSinceLastPurchase > 30
ORDER BY DaysSinceLastPurchase DESC;

--5. Customer Satisfaction
--Average Rating Based on Membership Type
SELECT MembershipType, AVG(AverageRating) AS avg_rating
FROM ecommerce
GROUP BY MembershipType
ORDER BY avg_rating DESC;

--Satisfaction Level Distribution
SELECT SatisfactionLevel, COUNT(*) AS count
FROM ecommerce
GROUP BY SatisfactionLevel
ORDER BY count DESC;

--6. Customer Retention and Loyalty Analysis
--Churn Prediction – Customers Who Haven't Purchased in 60+ Days
SELECT COUNT(*) AS potential_churn
FROM ecommerce
WHERE DaysSinceLastPurchase > 60

--Which Membership Type Has the Highest Retention?
SELECT MembershipType, AVG(DaysSinceLastPurchase) AS avg_days_since_last_purchase
FROM ecommerce
GROUP BY MembershipType
ORDER BY avg_days_since_last_purchase DESC;
--Gold Customers have the highest retention

--7. Discount & Revenue Correlation
--Do Customers Who Receive Discounts Spend More?
SELECT 
    DiscountApplied,
	SUM(TotalSpend) AS sum_spend,
    AVG(TotalSpend) AS avg_spend
FROM ecommerce
GROUP BY DiscountApplied;

--8. Demographic Customer Insights
--Top 5 Cities with the Highest Revenue
SELECT City, SUM(TotalSpend) AS total_revenue
FROM ecommerce
GROUP BY City
ORDER BY total_revenue DESC
LIMIT 5;

--Which City has the most high spending customers on Average
SELECT City, AVG(TotalSpend) AS Avg_spend
FROM ecommerce
GROUP BY City
ORDER BY Avg_spend DESC
LIMIT 1;

--9. Customer Experience & Ratings
--To check the relationship between Customer Total Spending and Ratings
SELECT 
    CASE 
        WHEN TotalSpend < 500 THEN 'Low Spender'
        WHEN TotalSpend BETWEEN 500 AND 1000 THEN 'Medium Spender'
        ELSE 'High Spender'
    END AS spender_category,
	COUNT(*),
    AVG(AverageRating) AS avg_rating
FROM ecommerce
GROUP BY spender_category
ORDER BY avg_rating DESC;
