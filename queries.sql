-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
SELECT ProductName, CategoryId, CategoryName FROM Product P
JOIN Category  C on P.CategoryId = C.id

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
SELECT O.Id, S.CompanyName, S.id, O.OrderDate
FROM [Order] AS O --syntax error without [] wrapped around Order
JOIN Shipper AS S
ON O.ShipVia = S.Id
WHERE O.OrderDate < "2012-08-09"

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
SELECT OD.OrderId, P.ProductName,OD.Quantity
FROM OrderDetail AS OD
JOIN Product AS P
ON OD.ProductId= P.Id
WHERE OD.OrderId= 10251

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
SELECT O.id  AS OrderID ,  C.CompanyName AS CustomerCompanyName, E.LastName AS EmployeeLastName
FROM [Order] AS O 
JOIN Employee AS E
ON O.EmployeeId= E.Id
JOIN Customer AS C
ON O.CustomerId = C.id