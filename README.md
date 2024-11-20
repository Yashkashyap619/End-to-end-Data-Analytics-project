# Bike Store Data Analysis - End-to-End Project
This repository contains an end-to-end data analysis project for a Bike Store, utilizing MySQL, MS Excel, and Power BI to manage and visualize the data. The project explores insights from two main datasets: Production and Sales. The goal is to analyze and visualize various aspects of the bike store's operations, from product details to customer sales performance.


# ***Project Overview***
This project showcases the entire data analysis process for a bike store, from database creation and data extraction to visualization. Key activities include:
### Creating Databases: 
- Production database containing information on brands, categories, products, and stores.
- Sales database containing details about staff, order items, customers, orders, and stores.

### SQL Queries:
Writing SQL queries to extract and create insightful tables that provide meaningful analysis.

### Excel Integration:
Using ODBC to connect MySQL to MS Excel, importing data, and creating pivot tables for a dynamic, interactive dashboard.

### Power BI Visualization:
Importing data from Excel into Power BI to create a different, more interactive dashboard with advanced visualization tools.


# ***Data Sources***
The project relies on two main datasets:

### Production Database:
Contains information about:

- Brands
- Categories
- Products
- Stores

### Sales Database:
Contains information about:

- Staff
- Order Items
- Orders
- Customers
- Stores
These databases are built with realistic data to reflect various aspects of the bike store’s operations.


# ***Workflow and Tools Used***
1. Database Creation (MySQL)
Created two databases (Production and Sales) in MySQL, structured to hold all relevant information about the bike store's products and sales.
2. SQL Querying (MySQL)
Wrote SQL queries to extract meaningful data from the databases and generate insightful tables for analysis.
3. Data Import and Analysis (MS Excel)
Connected MySQL to MS Excel using the ODBC connector.
Imported SQL query results directly into Excel.
Created pivot tables and an interactive dashboard to explore the data and present insights.
4. Visualization (Power BI)
Imported the MS Excel file into Power BI to create another interactive dashboard.
Used Power BI’s advanced visualization tools to enhance the presentation and provide a deeper analysis.


# ***Key Features***
### Production Database Insights:

- Product breakdown by brand and category.
- Store performance in terms of products.
### Sales Database Insights:

- Order analysis: quantity, price, and total sales per customer and staff.
- Customer behavior: which products and brands are most popular.
- Staff performance: analysis of the top-performing sales staff based on order totals.
### Excel Dashboard Features:

Interactive pivot tables to filter and explore sales and production data.
Dynamic charts to visualize sales trends, top products, and staff performance.
### Power BI Dashboard Features:

Visual representation of the sales data using charts, graphs, and maps.
Deeper insights into the performance of stores and staff with slicers and filters.
Interactive filtering of data by customer demographics, product categories, and order details.


# ***How to Use***
### Clone this repository:

1. Copy code
git clone https://github.com/yourusername/bike-store-data-analysis.git

2. MySQL Setup:
Set up MySQL and create the Production and Sales databases with the provided schema and data.
Use the SQL queries provided in the project to generate insightful tables.

3. Excel Dashboard:
Open the BikeStore_Analysis.xlsx file.
Refresh the data connections (ODBC) to pull in data from MySQL.
Explore the pivot tables and charts for a dynamic view of the data.

4. Power BI Dashboard:
Open the BikeStore_Analysis.pbix Power BI file.
Ensure the data is refreshed from the Excel file.
Explore the interactive visualizations and dashboards.


# ***Screenshots***

### SQL Query
![MySQL Query](https://github.com/user-attachments/assets/4f815b86-b86b-478e-969a-68e65daab49d)

### EXCEL Dashboard
![Excel Dashboard](https://github.com/user-attachments/assets/93c9378f-4cf4-4856-b325-b1f0e15ba89f)

### POWER BI Dashboard
![Power BI Dashboard](https://github.com/user-attachments/assets/4f3a146d-05cf-4685-ac61-a867454f9560)


# ***Acknowledgments***
Data Source: Synthetic data generated for the purpose of this analysis.
Tools Used:
MySQL for database management.
MS Excel for pivot tables and data analysis.
Power BI for advanced data visualization.
Feel free to explore, provide feedback, and contribute to this project. If you find it useful, don't forget to star the repository! ⭐

