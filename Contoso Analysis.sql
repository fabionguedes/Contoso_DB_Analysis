-- Return Analysis by Store
SELECT TOP(1000) * FROM FactSales

SELECT 
	StoreName,
	SUM(SalesQuantity) AS 'Total Sales',
	SUM(ReturnQuantity) AS 'Total Return',
	100.0*SUM(ReturnQuantity)/SUM(SalesQuantity) AS '% Return'
FROM
	FactSales

INNER JOIN DimStore
	ON FactSales.StoreKey = DimStore.StoreKey
GROUP BY StoreName
ORDER BY [% Return]

-- Contoso Guangzhou Store is the store with the lowest % return (0.56%)
-- Contoso Toulouse Store is the store with the highest % returns (1.22%)
-- The percentage difference between the worst store and the best is almost double. Why?

-- Return Analysis by Channel
SELECT * FROM DimChannel

SELECT 
	ChannelName,
	SUM(SalesQuantity) AS 'Total Sales',
	SUM(ReturnQuantity) AS 'Total Return',
	100.0*SUM(ReturnQuantity)/SUM(SalesQuantity) AS '% Return'
FROM
	FactSales

INNER JOIN DimChannel
	ON FactSales.channelKey = DimChannel.ChannelKey
GROUP BY ChannelName
ORDER BY [% Return]

-- No points of attention

-- Return Analysis by Product Brand
SELECT * FROM DimProduct

SELECT 
	BrandName,
	SUM(SalesQuantity) AS 'Total Sales',
	SUM(ReturnQuantity) AS 'Total Return',
	100.0*SUM(ReturnQuantity)/SUM(SalesQuantity) AS '% Return'
FROM
	FactSales

INNER JOIN DimProduct
	ON FactSales.ProductKey = DimProduct.ProductKey
GROUP BY BrandName
ORDER BY [% Return]

-- Northwind Traders had a smaller share of the total sold by the company, however, the highest percentage of returns

