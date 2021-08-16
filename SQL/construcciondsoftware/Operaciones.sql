select * from a;
select * from b;

/*insert into b(x,y) values(5, 'E');*/

/*Union*/
select y from a
union 
/*union all es para que salgan todos los resultados,hasta los repetidos*/
select y from b;

/*Difference: Minus*/
select * from a where (x,y) not in (select * from b);
/*busca que los registros de tupla que esten en a no existan en b*/

/*join agrega columnas, atributos en lugar de tuplas*/
select * from a
left join b on (a.x = b.x and a.y =b.y)
where b.x is null and b.y is null;/*b.x= de la tabla b, saca la columna x*/

/*left join=a-b*/
/*la ventaja de using hace la labor de buscar y representar las columnas en común*/
select * from a
left join b using(x,y)
where b.x is null and b.y is null;

/*Intersection*/
select a.x as 'x', a.y as 'y'
from a
join b using (x,y);

/*Aggregation and grouping*/
/*count, sum, avg, min, max*/

select * from products;
select * from orders;

/*productname, price, quantity*/
select products.productname as 'Product Name', products.price as 'Price', orders.quantity as 'Quantity'
from products
join orders using(productid);/*alternativa=on products.productid=orders.productid*/

/*count*/
/*¿cuántas ordenes tengo de cada producto?*/
/*select count(products.productname)
from products
join orders using(productid);*/

select productname, count(products.productname)
from products
join orders using(productid)
group by products.productname;
/*por c/producto busca el nombre y la cuenta de cuantas ordenes hay de c/producto*/
/*organiza mi consulta en base a un atributo en particular*/

/*Sum*/
/*productname, total -> todas la ordenes*/
select products.productname as 'Product name',products.price,orders.quantity, sum(products.price*orders.quantity) as 'Total'
from products
join orders using(productid)
group by products.productid;
/*order by orders.orderid asc;para acomodar de manera ascendente*/

/*Avg*/
/*product name, average per sale -> todas las órdenes*/
select products.productname as 'Product name',products.price,orders.quantity, avg(products.price*orders.quantity) as 'Average per sale'
from products
join orders using(productid)
group by products.productid;