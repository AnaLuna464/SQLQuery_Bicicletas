-- 1. Ventas totales
SELECT SUM(TotalDue) AS ingreso_total
FROM [SalesLT].[SalesOrderHeader]; 

-- 2. Clientes que mas compran? 
SELECT FirstName, LastName, SUM(OD.OrderQty) AS ventas_totales
FROM SalesLT.Customer C 
JOIN SalesLT.SalesOrderHeader OH ON OH.CustomerID=C.CustomerID
JOIN SalesLT.SalesOrderDetail OD ON OD.SalesOrderID=OH.SalesOrderID
GROUP BY FirstName, LastName
ORDER BY ventas_totales DESC;

-- 3. Mayor volumen de ventas por región?
SELECT CountryRegion, SUM(OD.OrderQty) AS ventas_totales
FROM [SalesLT].[Address] AD
JOIN SalesLT.SalesOrderHeader OH ON OH.ShipToAddressID=AD.AddressID
JOIN SalesLT.SalesOrderDetail OD ON OD.SalesOrderID=OH.SalesOrderID
Group by AD.CountryRegion
Order by ventas_totales DESC;

-- 4. Producto que mas se vende por región? ** Poner un Join mas para la región!
SELECT PC.Name, P.ListPrice, SUM(OD.OrderQty) AS ventas_totales
FROM SalesLT.Product P
JOIN SalesLT.ProductCategory PC ON PC.ProductCategoryID = P.ProductCategoryID
JOIN SalesLT.SalesOrderDetail OD ON OD.ProductID = P.ProductID

GROUP BY PC.Name, P.ListPrice
ORDER BY ventas_totales DESC;

-- 5. Cual es el producto que se vende mas? 
SELECT PC.Name, P.ListPrice, SUM(OD.OrderQty) AS ventas_totales
FROM SalesLT.Product P
JOIN SalesLT.ProductCategory PC ON PC.ProductCategoryID = P.ProductCategoryID
JOIN SalesLT.SalesOrderDetail OD ON OD.ProductID = P.ProductID
GROUP BY PC.Name, P.ListPrice
ORDER BY ventas_totales DESC;
