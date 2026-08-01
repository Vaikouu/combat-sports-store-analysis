## About this project

My third portfolio project, focused specifically on Sales & Marketing analytics — 
a different angle from my first two projects (fraud detection and logistics/operations). 
The dataset is a mock combat sports equipment store (think gloves, shin guards, gis, 
punching bags), a theme I picked because I've trained Muay Thai myself.

The goal here was to answer marketing-style questions: which campaigns actually pay off, 
whether discounts help or hurt, and whether customer segments behave the way you'd expect.

## Tools used
- **Power Query** — data cleaning (dates, prices, emails, inconsistent boolean values)
- **MySQL** — analysis, from basic aggregations up to subqueries and data validation logic
- **Power BI / DAX** — dashboard, custom measures, relationship modeling

## What I cleaned
- Dates in multiple formats
- Country names inconsistent (Bulgaria / BG / bulgaria, etc.)
- Prices stored as text (comma decimals, € symbol, stray spaces)
- Emails missing "@"
- A discount-used field stored inconsistently as Yes/No, 1/0, and TRUE/FALSE
- Duplicate rows and missing values across all tables

## SQL work
Progressed from simple aggregations (revenue by category, orders by segment) to more 
advanced queries:
- Campaign attribution date validation (orders whose date falls outside their campaign's 
  actual date range)
- ROI per campaign (revenue vs. budget)
- Customers who have never used a discount, using a subquery
- Organic/direct vs. paid traffic comparison

## Key findings
- **Campaign attribution is unreliable**: most orders linked to a campaign fall outside 
  that campaign's actual date range, which inflates ROI figures if not corrected. I flagged 
  this explicitly in the dashboard instead of letting it skew the numbers.
- **VIP customers have the lowest average order value** of all customer segments — lower 
  than both New and Returning customers, which raises questions about how the VIP tier 
  is actually defined.
- A handful of campaigns (e.g. one heavily promoted one) show disproportionately high ROI 
  once corrected for valid campaign dates — worth a closer look before trusting it at face value.

## Dashboard — 3 pages
1. **Sales Overview** — revenue, top products, stock levels needing restocking (conditional 
   formatting), monthly revenue trend
2. **Campaign & Marketing Performance** — ROI by campaign, revenue by channel, and a data 
   quality view of campaign attribution issues
3. **Customer Segments** — average order value by segment, customer locations, signup 
   sources, top customers by revenue
