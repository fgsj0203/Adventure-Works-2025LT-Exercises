/*
Author: Francisco Gomes da Silva Junior
College: Estacio de Sa
Description: Intellingence and behavior Customer
Date: 05-02-2026, in format Brazil
Version: 1.0
*/

-- Exercise 01: Conte quantos clientes a empresa possui por cidade e estado.
--SELECT *
--FROM SalesLT.Customer as c INNER JOIN SalesLT.[Address] as a ON c.CustomerID = a.id

-- Exercise 02: Conte quantos clientes a empresa possui por cidade e estado. / Count customers and companies having in cities and state province
SELECT COUNT(c.CustomerID) as Cliente_Cidade_Provincia, a.StateProvince as Estado 
FROM SalesLT.Customer as c INNER JOIN SalesLT.[Address] as a ON c.CustomerID = a.AddressID
GROUP BY a.StateProvince
