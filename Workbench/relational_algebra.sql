Drop database if exists relational_algebra;
create database if not exists relational_algebra;

use relational_algebra;

CREATE TABLE a (x INT, y VARCHAR(5));
CREATE TABLE b (x INT, y VARCHAR(5));

INSERT INTO a(x,y) VALUES(1,'A');
INSERT INTO a(x,y) VALUES(2,'B');
INSERT INTO a(x,y) VALUES(3,'C');
INSERT INTO a(x,y) VALUES(4,'D');
INSERT INTO b(x,y) VALUES(1,'A');
INSERT INTO b(x,y) VALUES(3,'C');

create table products(productid int primary key auto_increment not null, productname varchar(20), price int);
create table orders(orderid int primary key auto_increment not null, productid int, quantity int, foreign key(productid) references products(productid));

insert into products(productname, price) values
('Roquefort', '95'),
('Camembert', '72'),
('Cotija', '68'),
('Chèvre', '21'),
('Feta', '72'),
('Mozzarella', '15'),
('Emmental', '31'),
('Cheddar', '12'),
('Gouda', '43'),
( 'Manchego', '82');

insert into orders(productid, quantity) values
('10', '99'),
('4', '61'),
('10', '90'),
('8', '72'),
('5', '21'),
('8', '28'),
('1', '62'),
('9', '28'),
('8', '70'),
( '5', '89');
