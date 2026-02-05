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

-- Exercise 04: Vendas por Categoria: Mostre o total vendido agrupado por categoria de produto.
SELECT pc.[Name] as Nome_Categoria_Produto, 
       SUM(sod.LineTotal) as Total_Vendido_Produto
FROM SalesLT.[Product] as p INNER JOIN SalesLT.[ProductCategory] as pc ON p.ProductCategoryID = pc.ProductCategoryID
     INNER JOIN SalesLT.SalesOrderDetail as sod ON p.ProductID = sod.ProductID
GROUP BY pc.[Name]
ORDER BY Total_Vendido_Produto DESC

-- Exercise 05: Impacto dos Descontos: Qual foi o valor total (em dolares) que a empresa deixou de ganhar devido aos descontos (UnitPriceDiscount) aplicados?
SELECT SUM (sod.UnitPriceDiscount) as Total_Desconto_Somados
FROM SalesLT.SalesOrderDetail as sod

-- Exercise 06: Sazonalidade Mensal - Agrupe o faturamento total por ano e mes para identificar os melhores periodos de venda.
SELECT MAX (sod.LineTotal) as Faturamento_Total,
       YEAR(soh.OrderDate) as Ano_Faturamento,
       MONTH(soh.OrderDate) as Mes_Faturamento
FROM SalesLT.SalesOrderDetail as sod INNER JOIN SalesLT.SalesOrderHeader as soh ON sod.SalesOrderID = soh.SalesOrderID
GROUP BY (soh.OrderDate)

-- Exercise 07: Pedidos de Alto Valor - Liste todos os pedidos cujo TotalDue seja superior a $10.000,00.
SELECT soh.CustomerID as ID_Cliente,
       soh.SalesOrderID as Ordem_Pedido_ID,
       soh.TotalDue as Total_Devido
FROM SalesLT.SalesOrderHeader as soh
WHERE soh.TotalDue > 10000
ORDER BY soh.TotalDue DESC
