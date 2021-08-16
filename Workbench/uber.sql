Drop database uber;
CREATE  DATABASE Uber;
Use Uber;

Create Table CarBrand
(
	brandName varchar(50),
    model varchar(25),
    primary key(model)
);

Create Table Taxi
(
	taxiId int not null auto_increment,
    Primary Key(taxiId),
    model varchar(25),
    constraint FK_model foreign key(model) references CarBrand(model)
);

Create Table `Client`
(
	clientId int not null auto_increment,
    primary key(clientId),
    `name` varchar(50)
);

Create Table Driver
(
	driverId int not null auto_increment,
    primary key(driverId),
    `name` varchar(50)
);

Create Table City
(
	cityId int not null auto_increment,
    primary key(cityId),
	`name` varchar(25)
);

Create Table Suburb
(
	postalCode int not null,
    primary key(postalCode),
	`name` varchar(50),
    cityId int not null,
    constraint FK_cityId foreign key(cityId) references City(cityId)
);

Create Table Address
(
	addressId int not null,
    primary key(addressId),
	street varchar(50),
    num int not null,
    postalCode int not null,
    constraint FK_postalCode foreign key(postalCode) references Suburb(postalCode)
);

Create Table Trip
(
	tripId int not null auto_increment,
    primary key(tripId),
    tripDate timestamp,
    pickUpAddress int not null,
    dropOffAddress int not null,
    driverId int not null,
    clientId int not null,
    taxiId int not null,
    precio float not null, 
    constraint FK_pickUpAddress foreign key(pickUpAddress) references Address(addressId),
    constraint FK_dropOffAddress foreign key(dropOffAddress) references Address(addressId),
	constraint FK_driverId foreign key (driverId) references Driver(driverId),
    constraint FK_clientId foreign key (clientId) references `Client`(clientId),
    constraint FK_taxiId foreign key (taxiId) references Taxi(taxiId)
);

insert into CarBrand(brandName, model) values
('kia', 'sportage'),
('voltswagen', 'passat'), 
('bmw', 'sport'),
('mercedes', 'camioneta'),
('tesla', 'basic');

insert into Taxi(taxiId, model) values
(null, 'sportage'),
(null, 'passat'),
(null, 'sport'),
(null, 'camioneta'),
(null, 'basic');

insert into Client(clientId, name) values
(null, 'mateo'),
(null, 'caro'),
(null, 'xime'),
(null, 'juncos'),
(null, 'dichi');

insert into Driver(driverId, name) values
(null, 'mariana'),
(null, 'vale'),
(null, 'emilia'),
(null, 'nacho'),
(null, 'jorge');

insert into City(cityId, name) values
(null, 'tijuana'),
(null, 'cdmx'),
(null, 'cancun'),
(null, 'mty'),
(null, 'qro');

insert into Suburb(postalCode, name, cityId) values
(55432, 'alamar', 1),
(23459, 'herradura',2),
(65489, 'cumbres',3),
(12874, 'san Pedro',4),
(90876, 'campestre',5);

insert into Address(addressId, street, num, PostalCode) values
(10, 'marzo', 50, 55432),
(11, 'abril', 51, 23459),
(12, 'mayo', 52, 65489),
(13, 'junio', 53, 12874),
(14, 'julio', 54, 90876);

insert into Trip(tripId, tripDate, pickUpAddress, dropOffAddress, precio, driverId, clientId, taxiId) values
(null, '2000-04-27 08:45:00', 10, 14, 150.00, 1, 1, 1),
(null, '2000-01-24 08:45:40', 11, 14, 20.76, 1, 2, 1),
(null, '2010-05-10 18:35:50', 11, 13, 45.34, 2, 2, 2),
(null, '2010-05-10 18:35:50', 14, 13, 11.00, 5, 2, 2),
(null, '2015-02-10 21:30:32', 10, 13, 78.72, 2, 4, 5),
(null, '2020-12-12 04:48:29', 13, 10, 56.98, 3, 4, 3),
(null, '2014-11-26 16:42:58', 10, 12, 12.32, 4, 4, 2),
(null, '2010-01-21 10:22:21', 12, 11, 189.07, 3, 3, 3),
(null, '2011-02-01 20:34:34', 13, 12, 123.11, 4, 4, 4),
(null, '2020-08-20 22:56:59', 14, 10, 67.67, 5, 5, 5);
USE Uber;
/*select * from Trip;*/

/* ejercicio 1: contar num de viajes por id de conductor*/
create view ejercicio_1 as 
select driver.driverId as 'driver id', count(Trip.tripId) as 'num viajes' from Driver
join Trip on (Trip.driverId = driver.driverId)
group by driver.driverId;

/*ejercicio 2: num de viajes por taxi*/
create view ejercicio_2 as 
select Taxi.taxiId as 'taxi id', count(Trip.tripId) as 'num de viajes' from Taxi
join Trip on (Trip.taxiId= Taxi.taxiId)
group by Taxi.taxiId;

/*ejercicio 3: mostrar ganancia por mes y año*/
create view ejercicio3_1 as
select SUBSTRING(Trip.tripDate,6,2) 'month', sum(Trip.precio) as 'suma' from Trip
group by month;

use Uber;
create view ejercicio3_2 as
select SUBSTRING(Trip.tripDate,0,4) 'año', sum(Trip.precio) as 'suma' from Trip
group by año;

/* ejercicio 4: mostrar info de los viajes*/
create view ejercicio_4 as 
select * from Trip;