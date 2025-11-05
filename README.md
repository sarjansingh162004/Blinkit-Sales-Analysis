# Blinkit Data Analytics: End-to-End Insights with SQL, Python, and Power BI

_End-to-end Blinkit data analytics project integrating SQL, Python, and Power BI to uncover key business insights._

---

## Table of Contents
- [Project Overview](#project-overview)  
- [Problem Statement](#problem-statement)  
- [Objective](#objective)  
- [Dataset](#dataset)  
- [Data Cleaning & Preparation](#data-cleaning--preparation)  
- [Exploratory Data Analysis (EDA)](#exploratory-data-analysis-eda)  
- [Tools and Technologies](#tools-and-technologies)  
- [Methods](#methods)  
- [Key Insights](#key-insights)  
- [Repository Structure](#repository-structure)  
- [Dashboard](#dashboard)  
- [How to Run the Project](#how-to-run-the-project)  
- [Results and Conclusion](#results-and-conclusion)  
- [Future Work](#future-work)  
- [Author & Contact](#author--contact)  

---

## Project Overview
This project demonstrates a **complete data analytics pipeline** for Blinkit. Starting from raw Excel files, the data is ingested into a relational database using Python and SQLAlchemy. SQL queries are then employed to calculate KPIs, sales trends, and categorical breakdowns. Parallelly, Python (Pandas, Matplotlib, Seaborn) is used for exploratory data analysis and visualization to validate and enrich insights. Finally, a Power BI dashboard is built to present findings interactively, enabling decision-makers to explore sales, customer demand, and performance metrics dynamically.

The project not only covers analysis but also emphasizes **best practices in structuring analytics projects** — including modular notebooks, ingestion scripts, SQL query management, logging, and environment reproducibility through a requirements file.

---

## Problem Statement
Blinkit aims to optimize its retail operations and improve decision-making by leveraging data analytics. With large volumes of sales and product data, there is a need to analyze performance, customer preferences, and demand-supply gaps to drive business strategies.

---

## Objective
- Ingest raw data into a relational database for structured analysis.
- Perform SQL-based queries to derive KPIs and category-level insights.
- Conduct exploratory data analysis (EDA) in Python to validate and complement SQL insights.
- Build an interactive Power BI dashboard for executives and decision-makers.
- Establish a modular and reproducible project structure for analytics projects.

---

## Dataset
- **Source**: Excel files provided in `data/` folder  
- **Contents**: Product details, sales transactions, category information  
- **Format**: `.xlsx`

---

## Data Cleaning & Preparation  
Performed in Python (Jupyter Notebook) and SQL:  
- Handled missing values.  
- Standardized categorical values.  
- Removed duplicates.  
- Converted columns to correct data types.  
- Created structured tables for ingestion into SQL database.  

---

## Exploratory Data Analysis (EDA) 
Key steps performed:  
- Distribution of items across categories.  
- Relationship between item weight, visibility, and sales.  
- Analysis of fat content impact on sales.  
- Correlation analysis between variables.  
- Aggregation of sales by outlet type and location. 

---
## Tools and Technologies
- **SQL**: MySQL (for structured querying and KPI generation)
- **Python**: Pandas, Matplotlib, Seaborn, SQLAlchemy, Jupyter Notebook
- **Power BI**: Interactive dashboarding
- **Others**: Logging, requirements management

## Methods
1. **Data Ingestion**: Raw Excel files → SQL database using Python ingestion script (`src/ingestion_db.py`).
2. **SQL Analysis**: Querying database to derive insights, KPIs, and summary tables.
3. **Python EDA**: Data cleaning, descriptive statistics, and visualization of patterns.
4. **Dashboarding**: Power BI report for interactive visualization of insights.

## Key Insights
- Sales are unevenly distributed across product categories, with top categories driving majority of revenue.
- Seasonal trends affect demand and pricing.
- Certain low-performing categories need strategic interventions.
- Fat content has a measurable impact on sales trends.  
- Outlet location and type strongly influence revenue.  
- Item visibility is correlated with sales volume.  

## Repository Structure
```
├── data/                 # Raw dataset (Excel files)
├── images/               # Dashboard images, visualizations
├── logs/                 # Log files from ingestion and processing
├── notebooks/            # Jupyter notebooks (analysis & ingestion)
│   ├── BLINKIT ANALYSIS.ipynb
│   └── INGESTION_DB.ipynb
├── sql/                  # SQL scripts for queries and KPIs
├── src/                  # Source code (Python ingestion script)
│   └── ingestion_db.py
├── requirements.txt      # Python dependencies
└── README.md             # Project documentation
```

## Dashboard / Output
- **Power BI Dashboard**: Provides interactive analysis of sales, categories, and trends.  
- **SQL Outputs**: KPI and insights tables.  
- **Python Visualizations**: Charts/plots validating SQL results.

## How to Run this Project?
1. Clone this repository.  
   ```bash
   git clone <repo-url>
   cd blinkit-analysis
   ```

2. Create a virtual environment and install dependencies.  
   ```bash
   python -m venv venv
   source venv/bin/activate   # For Linux/Mac
   venv\Scripts\activate    # For Windows
   pip install -r requirements.txt
   ```

3. Run ingestion script to load data into database.  
   ```bash
   python src/ingestion_db.py
   ```

4. Open Jupyter Notebooks (`notebooks/`) to explore analysis.  

5. Explore the Power BI dashboard in the `images/` folder.  

## Results and Conclusion
- SQL and Python analysis confirmed key business trends in sales, revenue, and categories.  
- Power BI dashboard offers actionable insights with visual interactivity.  
- Project demonstrates how analytics can bridge raw data and business strategy.

## Future Work
- Automate data ingestion with scheduled ETL pipelines.  
- Add predictive modeling (e.g., demand forecasting).  
- Expand to real-time dashboards with live database connections.  

## Keywords
`SQL` · `MySQL` · `Python` · `pandas` · `matplotlib` · `seaborn` · `Power BI` · `Data Analysis` · `EDA` · `Data Cleaning` · `Business Intelligence` · `Retail Analytics` · `ETL Pipeline` · `Sales Insights` · `Visualization` · `Project Portfolio`



