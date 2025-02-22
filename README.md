# Project Overview
This project analyzes customer behavior and purchasing patterns for an e-commerce store using PostgreSQL and Power BI. The goal is to extract insights into customer demographics, retention, and revenue trends.

## Dataset
Source: Real-world e-commerce dataset  
Records: 350 rows

## Key Features:  
**CustomerID** – Unique customer identifier  
**Gender** – Customer’s gender  
**Age** – Age group of the customer  
**City** – Location of the customer  
**MembershipType** – Bronze, Silver, or Gold membership  
**TotalSpend** – Total amount spent by the customer  
**DaysSinceLastPurchase** – Days since the last purchase  
**SatisfactionLevel** – Customer feedback on service  

## Key Insights from Analysis  
**Customer Demographics:** 50% Male, 50% Female, with a majority between 20-40 years old.  
**Top Cities by Revenue:** San Francisco, New York, and Los Angeles.  
**Customer Retention Trend:** 64.57% Active, 34.57% Inactive, 0.85% Churned (based on purchase frequency).  
**Spending Patterns:** Customers with discounts spent X% more than non-discounted ones.  
**Membership Analysis:** Gold members contribute the highest revenue share.

## Tools & Technologies Used  
**SQL (PostgreSQL):** Data extraction, cleaning, and aggregation  
**Power BI:** Data visualization and dashboarding  
**DAX:** Calculated columns and measures for retention trends

### Power BI Dashboard  
![Dashboard Screenshot](https://github.com/franklinanalytics/ecommerce-customer-behaviour-analysis/blob/main/ecommerce.png)

## How to Use  
**SQL Queries:** Find the SQL scripts in the /SQL folder.  
**Power BI Report:** Open the .pbix file to explore the dashboard.  
**PDF Report:** Download the summary report in /Reports.

## Project Status  
✔ Data Cleaning & SQL Queries Completed  
✔ Power BI Dashboard Built & Refined  
✔ Final Report Ready for Upload
