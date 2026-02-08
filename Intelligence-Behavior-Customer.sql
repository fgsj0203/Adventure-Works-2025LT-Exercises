/*
Author: Francisco Gomes da Silva Junior
College: Estacio de Sa
Description: Intellingence and behavior Customer
Date: 05-02-2026, in format Brazil
Version: 1.0
*/

-- Exercise 01: Conte quantos clientes a empresa possui por cidade e estado.
SELECT *
FROM SalesLT.Customer as c INNER JOIN SalesLT.[Address] as a ON c.CustomerID = a.AddressID

-- Exercise 02: Conte quantos clientes a empresa possui por cidade e estado. / Count customers and companies having in cities and state province
SELECT COUNT(c.CustomerID) as Cliente_Cidade_Provincia, a.StateProvince as Estado 
FROM SalesLT.Customer as c INNER JOIN SalesLT.[Address] as a ON c.CustomerID = a.AddressID
GROUP BY a.StateProvince

-- Exercise 03: Liste os clientes que fizeram mais de 3 pedidos em toda a historia da empresa. / Return customers of having 3 sales orders in historic company
SELECT COUNT (soh.SalesOrderID) as Total_Pedidos
FROM SalesLT.Customer as c INNER JOIN SalesLT.SalesOrderHeader as soh ON c.CustomerID = soh.CustomerID
GROUP BY c.CompanyName
HAVING COUNT(soh.SalesOrderID) > 3
-- !!! Query in development... !!!

-- Exercise 04: Selecione os clientes que gastaram mais de $5.000,00 no total.
SELECT c.[FirstName] as Primeiro_Nome, soh.SubTotal as Total_Pedido
FROM SalesLT.Customer as c INNER JOIN SalesLT.SalesOrderHeader as soh ON c.CustomerID = soh.CustomerID
WHERE soh.SubTotal > 5000
