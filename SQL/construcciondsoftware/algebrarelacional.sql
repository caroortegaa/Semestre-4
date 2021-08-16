select * from customers;
select* from employees;

/*2*/
select contactFirstName as 'Name', contactLastName as 'Last Name', 'Client' as 'Type' from customers
union
select firstName as 'Name', lastName as 'Last Name' , 'Employee' as 'Type' from employees;

/*3*/
select customerName from customers where customerNumber not in (select customerNumber from orders);

/*4*/
select offices.city as 'City' , customers.customerName as 'Customer Name' from offices
join employees on(employees.officeCode = offices.officeCode)
join customers on(customers.salesRepEmployeeNumber = employees.employeeNumber);

/*5
select offices.city as 'City', count(customers.customerName) from offices
join employees on (office.officeCode=employees.officeCode)
join customers on (employees.officeCode=customers.city)
group by offices.city;*/
select count(customers.customerName) as 'Clients', offices.city as 'City' 
from customers
join employees on (employees.employeeNumber = customers.salesRepEmployeeNumber)
join offices on (employees.officeCode = offices.officeCode)
group by offices.city;

/*6*/
select products.productName as 'Product Name', avg (orderdetails.priceEach * orderdetails.quantityOrdered) as 'Promedio'
from products 
join orderdetails on (orderdetails.productCode = products.productCode)
where products.productName like '%Harley%'
group by products.productName;


/*7*/
select concat(employees.firstName, "", employees.lastName) as "Name", employees.employeeNumber as 'Employee Number'
, customers.customerNumber as "Customer number" from employees
left join customers on (employees.employeeNumber = customers.salesRepEmployeeNumber)
where customers.customerNumber is null;

/*8
select concat(employees.firstName, "", employees.lastName) as "Employee name",customers.customerName as 'Customer Name', 
, payments.checkNumber as 'Payment check',  payments.amount as 'Amount'
from employees
join customers on(employees.employeeNumber=customers.salesRepEmployeeNumber)
join payments on(payments.customerNumber=customers.customerNumber)
where customers.customerNumber is not null*/
select * from employees
join customers on (customers.salesRepEmployeeNumber= employees.employeeNumber)
join payments on (customers.customerNumber=payments.customerNumber);


select concat(employees.firstName,' ',employees.lastName) as 'Name', sum(payments.amount) as 'Payments'
from employees
join customers on (customers.salesRepEmployeeNumber = employees.employeeNumber)
join payments on (customers.customerNumber = payments.customerNumber)
group by concat(employees.firstName,' ',employees.lastName);

