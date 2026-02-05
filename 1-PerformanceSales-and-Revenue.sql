/*
Author: Francisco Gomes da Silva Junior
College: Estacio de Sa
Description: Performance of sales and revenue company
Date: 04-02-2026, in format Brazil
Version: 1.0
*/

-- Exercise 01: Ranking de Faturamento: Liste os 10 produtos que mais geraram receita total (SubTotal). / Ranking of invoicing: return 10 products of generate bigger revenue (SubTotal)
SELECT TOP 10 p.[Name]
FROM SalesLT.[Product] as p INNER JOIN SalesLT.SalesOrderDetail as sod ON p.ProductID = sod.ProductID
     INNER JOIN SalesLT.SalesOrderHeader as soh ON sod.SalesOrderID = soh.SalesOrderID
ORDER BY soh.SubTotal DESC

-- Exercise 02: Margem de Lucro por Produto: Calcule a margem de lucro de cada produto vendido (UnitPrice - StandardCost) e ordene pelos mais lucrativos.
SELECT p.[Name] as Produto,
       SUM(sod.OrderQty) as Quantidade_Total_Vendida,
       SUM(sod.LineTotal) as Faturamento_Total,
       SUM(p.StandardCost - sod.UnitPrice) as Margem_Lucro
FROM SalesLT.[Product] as p INNER JOIN SalesLT.SalesOrderDetail as sod ON p.ProductID = sod.ProductID
GROUP BY p.[Name]
ORDER BY Margem_Lucro DESC

-- Exercise 03: Ticket Medio por Cliente - Qual o valor medio gasto por pedido para cada cliente?
SELECT c.CustomerID as ID_Cliente,
       AVG(soh.TotalDue) as Media_Total_Gasto
FROM SalesLT.SalesOrderHeader as soh INNER JOIN SalesLT.SalesOrderDetail as sod ON soh.SalesOrderID = sod.SalesOrderID
     INNER JOIN SalesLT.Customer as c ON c.CustomerID = soh.CustomerID
GROUP BY c.CustomerID
ORDER BY Media_Total_Gasto DESC
