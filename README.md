# Delicious Delivery: Basic Bakery Business Analysis with MySQL

Portfolio owner: **Subjana Islam Tasnia**.

## Business context and data disclosure

I previously ran an online baking business in Naogaon, Bangladesh, from December 2020 to August 2021. Business page: https://www.facebook.com/deliciousdelivery100

**This is a simulated educational case study inspired by that experience.** All customers, ages, religions, genders, orders, quantities, products, prices and costs are fictional. They do not represent the business's actual records, customers, historical performance or Naogaon's population distribution. Names follow Bangladeshi Muslim and Hindu naming conventions, with fictional religion labels assigned for the simulation, not inferred from real people. No phone numbers, private addresses or Facebook user data are included.

## Project scope

- Currency: Bangladeshi taka (BDT).
- Reporting window: 2020-12-01 through 2021-08-31, inclusive.
- 60 customers, 8 products, 180 completed orders.
- Tools: MySQL Server and MySQL Workbench only.
- SQL: SELECT, WHERE, ORDER BY, SUM, COUNT, AVG, JOIN, GROUP BY, HAVING, CASE.

## Tables and relationships

| CSV / table | One row represents | Join key |
|---|---|---|
| data/customers.csv | One fictional customer | customer_id |
| data/products.csv | One fictional product and sale unit | product_id |
| data/orders.csv | One completed order for one product | customer_id and product_id |

Each customer can have multiple orders. Each product can appear in multiple orders. For simplicity, an order contains a single product type, with quantity indicating multiple cakes or boxes. This is a learning simplification, not a full order system.

Product units vary: a cake is one pound; other products are boxes with a stated count. Unit rankings count these sale units, not individual cupcakes/cookies or product weight. Prices and unit costs are assumed fixed across the study period. No returns, cancellations, discounts, tax or delivery charges are modeled.

Customers are located in Naogaon city, elsewhere in Naogaon Sadar, or other Naogaon upazilas. Official district location reference: https://en.wikipedia.org/wiki/Naogaon_District Coverage beyond the city is hypothetical. It does not claim historical deliveries.

## Business questions

1. What are total orders, revenue and estimated gross profit?
2. Which month generated the most revenue?
3. Which products sold most units and generated most revenue?
4. Which products contributed the most estimated gross profit?
5. Which customers placed repeat orders?
6. Which areas generated the most orders and revenue?
7. What was the average order value?
8. How did orders vary across age groups and gender?

Religion is simulation background only and is not used for business recommendations. All demographic patterns are generated examples, not evidence about real communities.
