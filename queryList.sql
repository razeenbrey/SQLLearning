-- Question 1
SELECT productLines, textDescription FROM productlines;

-- Question 2
select city, country from offices order by country, city;

-- Question 3
select productVendor, productName, quantityInStock 
from products 
where quantityInStock < 2000 and productVendor like "%diecast%" or productVendor like "%dyecast%" ;

-- Question 4
select * from productlines limit  1;

-- Question 5
select country from offices where state is null;

-- Question 6
select round(avg(amount), 2) as mean, round(sum(amount), 2) as total from payments;

-- Questiuon 7
select city, postalCode from offices where country = "USA" or country = "UK" ;

-- Question 8
select distinct city from offices;

-- Question 9
select count(distinct productVendor) as numVendors from products;

-- Question 10
select round(max(buyPrice)*1.7,2) as top from products;

-- Question 11
select officeCode, state as location from offices where state is not null union all
select officeCode, country as location from offices where state is null union all
select officeCode, city as location from offices where country is null;

-- Question 12
select  customerNumber, round(sum(amount),2) as total from payments group by customerNumber;

-- Question 13 NOT WORKING
select CustomerName, round(sum(payments.amount), 2) as total from customers
join payments on customers.customerNumber = payments.customerNumber group by CustomerName;

-- Question 14
select CustomerName, 
round(sum(payments.amount), 2) as total
from customers
join payments on customers.customerNumber = payments.customerNumber where customers.city = "Paris"
group by CustomerName
having count(payments.amount) >4;

-- question 15
select customerName,
phone
from customers
left join payments on customers.customerNumber = payments.customerNumber where payments.paymentDate is null;

-- question 16
select p.productName,
p.quantityInStock,
t.textDescription
from products as p
join productlines as t on p.productLine = t.productLines where p.quantityInStock < 100;

-- Question 17
select productCode, sum(quantityOrdered) as Total from orderdetails
group by productCode
order by Total desc limit 1;

-- Question 18
select e.email
from employees as e
join customers as c on e.employeeNumber = c.salesRepEmployeeNumber
group by email having count(distinct c.CustomerNumber) < (select count(distinct c.CustomerNumber)
    from customers as c
    where c.SalesRepEmployeeNumber = 1166);
    
-- Question 19
select sum(priceEach * quantityOrdered) as totalCost
from orderdetails
join orders as o on orderdetails.orderNumber = o.orderNumber
where o.customerNumber = "121";


-- Question 20
select emp.firstName , emp.lastName, round(sum(pay.amount), 2) as total from employees as emp
join customers cc on emp.employeeNumber = cc.salesRepEmployeeNumber
join payments pay on cc.customerNumber = pay.customerNumber
where emp.officeCode = '7'
group by emp.firstName, emp.lastName order by emp.lastName, emp.firstName;