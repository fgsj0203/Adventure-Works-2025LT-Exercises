/*
Author: Francisco Gomes da Silva Junior
College: Estacio de Sa
Description: Exercises with clausule SUM
Database: AdventureWorks2025LT
Date: 08-02-2026, in format Brazil
Version: 1.0
*/

-- Exercise 01: Some o faturamento total bruto de todos os pedidos (SubTotal).
SELECT SUM(soh.SubTotal) as Total_Bruto_Pedido
FROM SalesLT.SalesOrderHeader as soh

-- Exercise 02: Calcule o valor total de todos os produtos em estoque na tabela Product.
SELECT SUM(p.ListPrice) as Preco_Lista_Final
FROM SalesLT.[Product] as p

-- Exercise 03: Some o valor total de todas as vendas realizadas na tabela SalesOrderHeader.
SELECT SUM(soh.TotalDue) as Total_Final
FROM SalesLT.SalesOrderHeader as soh

-- Exercise 04: Calcule a soma do frete pago em todos os pedidos.
SELECT SUM(soh.Freight) as Valor_Total_Frete
FROM SalesLT.SalesOrderHeader as soh

-- Exercise 05: Some a quantidade total de produtos vendidos na tabela SalesOrderDetail.
SELECT SUM(sod.OrderQty) as Quantidade_Produto
FROM SalesLT.SalesOrderDetail as sod

-- Exercise 06: Calcule o valor total devido (TotalDue) de todos os pedidos pendentes.
SELECT SUM(soh.TotalDue) as Total_Devido
FROM SalesLT.SalesOrderHeader as soh
		
-- Exercise 07: Some o valor total de desconto aplicado em todos os itens de pedidos.
SELECT SUM(sod.UnitPriceDiscount) as Desconto_Preco_Total
FROM SalesLT.SalesOrderDetail as sod

-- Exercise 08: Calcule a soma do valor de venda (LineTotal) por categoria de produto.
SELECT SUM(sod.LineTotal) as Total_Venda, pc.[Name] as Nome_Categoria
FROM SalesLT.[Product] as p INNER JOIN SalesLT.SalesOrderDetail as sod ON p.ProductID = sod.ProductID
     INNER JOIN SalesLT.ProductCategory as pc ON p.ProductCategoryID = pc.ProductCategoryID
GROUP BY pc.[Name]

-- Exercise 08: Some o valor total de vendas por ano, ordenando do maior para o menor.
SELECT SUM(sod.LineTotal) as Total_Vendas, YEAR(soh.OrderDate) as Ano_Venda
FROM SalesLT.SalesOrderDetail as sod INNER JOIN SalesLT.SalesOrderHeader as soh ON sod.SalesOrderID = soh.SalesOrderID
GROUP BY soh.OrderDate
ORDER BY soh.OrderDate DESC

-- Exercise 09: Some o valor total dos produtos que possuem a cor 'Black'.
SELECT SUM(p.ListPrice) as Preco_Final
FROM SalesLT.[Product] as p
WHERE p.Color = 'Black'
