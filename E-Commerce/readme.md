## E-commerce Data Analytics Project

This dbt (data build tool) project provides a robust and scalable data transformation framework for a multi-channel e-commerce business. The goal is to create a reliable and easily understandable data platform for all analytics and business intelligence needs.

---

## Purpose & Objective

The primary objective of this project is to transform raw, messy data from various operational sources into a clean, harmonized, and business-friendly format. This enables stakeholders across the organization to make confident, data-driven decisions related to sales performance, customer behavior, and product profitability.

---

## Project Layers

The project is structured into distinct layers to ensure modularity, maintainability, and reusability.

### Staging (`stg_ecommerce`)

This layer contains the foundational models that perform initial data cleaning and preparation. Each model here corresponds directly to a raw source table, applying simple transformations like renaming columns, casting data types, and filtering out bad data. The models in this layer serve as the single source of truth for the raw data.

### Data Marts (`marts`)

This layer consists of final, business-ready models designed for direct consumption by BI tools, dashboards, and ad-hoc analysis. These models aggregate data from the staging layer to create logical entities like **customers** and **products**, which are crucial for business reporting.

---

## Getting Started

To run this project, you will need:

1.  A dbt Core installation.
2.  A connection to your data warehouse (e.g., BigQuery, Snowflake, Redshift).
3.  The necessary credentials configured in your `profiles.yml` file.

To compile and run all models, use the following commands:

```bash
dbt deps        # Installs any necessary dbt packages
dbt run        # Runs all models in the project
dbt test       # Executes all data tests to ensure data quality
dbt docs generate # Generates project documentation
dbt docs serve    # Serves the documentation website locally
```

## Data Documentation
This project is fully documented. The column descriptions, data types, and data tests are all defined in the `.yml` files alongside the models. This documentation can be viewed as a static website by running `dbt docs generate` and `dbt docs serve`.