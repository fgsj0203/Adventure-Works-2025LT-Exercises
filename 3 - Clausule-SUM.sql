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
		