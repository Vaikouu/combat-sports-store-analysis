USE combat_sports_store;

-- Total Price from Orders
SELECT SUM(TotalPriceFix) AS total_price
	FROM orders;

-- Number of Clients by Customer Segment
SELECT COUNT(CustomerID) AS customers, CustomerSegment
	FROM customers
		GROUP BY CustomerSegment
			ORDER BY customers DESC;
            
-- The 10 Most Purchased Products
SELECT p.ProductName, p.Category, SUM(o.Quantity) AS total_amount_sold
	FROM products AS p
JOIN orders AS o
	ON p.ProductID = o.ProductID
GROUP BY p.ProductName, p.Category
	ORDER BY total_amount_sold DESC
LIMIT 10;

-- Count of Orders with a Discount
SELECT COUNT(OrderID) AS orders
	FROM orders
WHERE DiscountsUsedFixed = "Yes";
