# Sales_Distribution_Analysis

This project delivers an interactive and dynamic Power BI dashboard to analyze sales performance across time, regions, product categories, and customer segments. It provides insights into key performance indicators (KPIs) such as revenue, profit, discount impact, and order trends, helping business stakeholders make data-driven decisions.

🚀 **Project Objective**

To build a comprehensive Sales Performance dashboard using Power BI that helps:

Track total revenue, profit, and discount trends

Analyze sales by region, segment, product, and time

Monitor KPIs such as Average Order Value, Profit Margin, and YoY/MoM growth

Identify top-performing products and high-value customers


📁 **Data Sources**

The project uses the following CSV files as data sources:

sales.csv: Contains sales transactions (OrderDate, CustomerID, ProductID, Quantity, UnitPrice, Discount, TotalAmount)

products.csv: Product catalog with category, sub-category, and cost price

customers.csv: Customer data with Region and Segment

date.csv: Date dimension with Year, Month, Quarter, and DayOfWeek

🧱 **Data Model**

The Power BI model uses a star schema:

Fact Table: sales

Dimension Tables: customers, products, date

 **Relationships**:

sales.CustomerID → customers.CustomerID

sales.ProductID → products.ProductID

sales.OrderDate → date.Date

![image alt](https://github.com/VaishnaviGhorpade99/Sales_Distribution_Analysis/blob/main/Relationships..png?raw=true)




📌 **Key Measures (DAX)**

Total Sales:
Total Sales = SUM(sales[TotalAmount])

Total Profit:
Total Profit = SUMX(sales, sales[Quantity] * (sales[UnitPrice] - RELATED(products[CostPrice])))

Average Order Value:
AOV = AVERAGE(sales[TotalAmount])

YoY Sales Growth %:
Sales YoY % =
VAR PrevYearSales = CALCULATE([Total Sales], SAMEPERIODLASTYEAR(date[Date]))
RETURN DIVIDE([Total Sales] - PrevYearSales, PrevYearSales)

📈 **Dashboard Visuals**

KPI Cards: Total Sales, Total Profit, Average Order Value, YoY Growth

Line Chart: Monthly Sales Trend

Bar Chart: Sales by Region

Stacked Bar: Sales by Segment and Year

TreeMap: Sales by Category and Sub-Category

Pie Chart: Customer Segment Distribution

Table: Top 10 Products by Sales/Profit

Slicers: Year, Month, Region, Category

📎 **Requirements**

Power BI Desktop

Python or Excel (for data simulation, if needed)

Optional: SQL Server / MySQL (for backend database)


📝 **How to Use**

Open Power BI Desktop

Load CSV files (sales.csv, products.csv, customers.csv, date.csv)

Create relationships between tables as shown above

Add DAX measures

Create visualizations as described

Customize filters, themes, and interactions

Save the project as .pbix

📦 **Folder Structure**

/
├── data/

│ ├── sales.csv

│ ├── products.csv

│ ├── customers.csv
│ └── date.csv

├── pbix/
│ └── SalesDashboard.pbix (optional)

├── queries/
│ └── sales_analysis_queries.sql

└── README.md








📸 **Dashboard Preview**



![Image alt](https://github.com/VaishnaviGhorpade99/Sales_Distribution_Analysis/blob/main/Dashboard%20Picture.png?raw=true)
























