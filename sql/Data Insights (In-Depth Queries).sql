USE combat_sports_store;

-- Which Campaign is most profitable
SELECT c.CampaignName AS campaign, SUM(o.Quantity) as total_amount_sold, SUM(o.TotalPriceFix) as total_revenue
	FROM orders AS o
JOIN campaigns AS c
	ON o.CampaignID = c.CampaignID
GROUP BY c.CampaignName
	ORDER BY total_profit DESC;
    
-- Which Channel(Ads) works the best
SELECT c.Channel AS type_of_ad, SUM(o.Quantity) as total_amount_sold, SUM(o.TotalPriceFix) AS total_revenue
	FROM campaigns AS c
JOIN orders AS o
	ON c.CampaignID = o.CampaignID
GROUP BY type_of_ad
	ORDER BY total_profit DESC;
    
-- Order Value by VIP Clients
SELECT c.CustomerSegment, COUNT(o.orderID) AS total_orders, ROUND(AVG(o.TotalPriceFix), 2) AS avg_order_value
	FROM customers AS c
JOIN orders AS o
	ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerSegment
	ORDER BY avg_order_value DESC;
    
-- Which Signup Source makes the most Orders
SELECT c.SignupSource AS signed_from, COUNT(o.OrderID) AS total_orders
	FROM customers AS c
JOIN orders AS o
	ON c.CustomerID = o.CustomerID
GROUP BY signed_from
	ORDER BY total_orders DESC;
	
-- Percent of Discounted Orders vs Non Discounted and the Average Order Values Between Them
SELECT DiscountsUsedFixed AS discount, 
COUNT(OrderID) AS total_orders, 
ROUND(AVG(TotalPriceFix), 2) AS avg_order_value,
ROUND(COUNT(OrderID) * 100.0 / (SELECT COUNT(*) FROM orders), 2) AS percent_of_total
	FROM orders
GROUP BY discount
	ORDER BY total_orders DESC;
	