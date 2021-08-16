use classicmodels;
select * from customers;
select * from employees;

/*2*/
select concat(contactFirstName, " ", contactLastName) as 'name_cus_emp', 'customer' as 'type' from customers
union
select concat(firstName, " ", lastName) as 'name_cus_emp', 'employee' as 'type' from employees;
/*mismo domnio y mismo numero de columnas*/

/*select contactFirstName as 'name', contactLastName as 'last name', salesRepEmployeeNumber as 'no order' from customers
where salesRepEmployeeNumber is null;*/

/*3*/
select customerName from customers where customerNumber not in (select customerNumber from orders);


/*4*/
select offices.city as 'city', customers.customerName as 'customer name' from offices
join employees on (employees.officeCode=offices.officeCode)
join  customers on (customers.salesRepEmployeeNumber=employees.employeeNumber);

/*5*/
select offices.city as 'city', count(customers.customerName) as '#' from offices
join employees on (employees.officeCode=offices.officeCode)
join  customers on (customers.salesRepEmployeeNumber=employees.employeeNumber)
group by offices.city;

/* numero 6 */
select products.productName as 'nombre', avg(orderdetails.priceEach * orderdetails.quantityOrdered) as 'avg' 
from products
join orderdetails on (orderdetails.productCode=products.productCode)
where products.productName like '%Harley%'
group by products.productName;

/*7*/
select concat(employees.firstName, " ", employees.lastName) as 'name', employees.employeeNumber as 'emp #', customers.customerNumber as 'cust #'
from employees
left join customers on (customers.salesRepEmployeeNumber= employees.employeeNumber)
where customers.customerNumber is null;

/*8*/
select concat(employees.firstName, " ", employees.lastName) as 'name emp', concat(customers.contactFirstName, " ", customers.contactLastName) as 'client',
customers.customerName as 'cust_name', payments.checkNumber, payments.amount 
from employees
left join customers on (customers.salesRepEmployeeNumber= employees.employeeNumber)
left join payments on (payments.customerNumber=customers.customerNumber)
where payments.amount is null and customers.customerName is not null;

/*9*/
select concat(employees.firstName, " ", employees.lastName) as 'name emp', sum(payments.amout) as 'payment'
from employees
join customers on (customers.salesRepEmployeeNumber= employees.employeeNumber)
join payments on (payments.customerNumber=customers.customerNumber)
group by concat(employees.firstName,' ',employees.lastName);