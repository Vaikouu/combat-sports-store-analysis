USE combat_sports_store;

SELECT * FROM campaigns;
SELECT * FROM orders;
SELECT * FROM customers;

-- Orders, ordered outside the Active Campaign Dates
SELECT o.OrderID AS orders, c.CampaignName, o.OrderDateFixed AS order_date, c.StartDateFixed, c.EndDateFixed
	FROM orders AS o
JOIN campaigns AS c
	ON o.CampaignID = o.CampaignID
WHERE o.OrderDateFixed < c.StartDateFixed
    OR o.OrderDateFixed > c.EndDateFixed
GROUP BY orders, order_date, c.CampaignName, c.StartDateFixed, c.EndDateFixed;

-- Revenue/Budget Ratio
SELECT c.CampaignName, SUM(o.TotalPriceFix) AS total_revenue, c.Budget,
	ROUND(SUM(o.TotalPriceFix) / c.Budget, 2) AS roi_ratio
FROM orders AS o
	JOIN campaigns AS c
ON o.CampaignID = c.CampaignID
	GROUP BY c.CampaignName, c.Budget
ORDER BY roi_ratio DESC;

-- The Top 5 Most Valuable Clients
SELECT c.FullName, COUNT(o.OrderID) AS total_orders, SUM(o.TotalPriceFix) AS total_revenue
FROM customers AS c
	JOIN orders AS o
ON c.CustomerID = o.CustomerID
	WHERE c.CustomerID NOT IN (
		SELECT DISTINCT CustomerID
        FROM orders
        WHERE DiscountsUsedFixed = "Yes"
	)
    GROUP BY c.FullName
    ORDER BY total_revenue DESC
    LIMIT 5;

-- Organic vs Paid Campaigns
SELECT 
	CASE WHEN CampaignID IS NULL
		THEN 'Organic/Direct' ELSE 'Paid'
	END AS traffic_type,
    COUNT(OrderID) AS total_orders,
    ROUND(AVG(TotalPriceFix), 2) AS avg_order_value
FROM orders
	GROUP BY traffic_type;