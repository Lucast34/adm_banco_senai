use w3school;
/*
A clausula SQL WHERE 
A WHERE é usada para filtrar registrar
*/
select distinct country from customers;

SELECT * FROM Customers WHERE Country='Mexico'; 

SELECT * FROM Products ORDER BY Price;

SELECT * FROM Products ORDER BY Price DESC;

SELECT * FROM Products ORDER BY Price, ProductID;

SELECT * FROM Customers ORDER BY Country asc, CustomerName desc;

select * from customers where country = 'Spain' and customername like 'G%';

select * from customers where country = 'Spain' and (customername like 'G%' or customername like 'R%');

select * from customers where country = 'Spain' or country = 'Germany';

SELECT * FROM Customers WHERE NOT Country = 'Spain';

update customers set address = null where customerid = 3 or customerid = 5;
select * from customers where address is null; 

select city, postalcode from customers;