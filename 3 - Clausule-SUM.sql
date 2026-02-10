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
