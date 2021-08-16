USE taxis;

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
    tripDate datetime,
    pickUpAddress int not null,
    dropOffAddress int not null,
    driverId int not null,
    clientId int not null,
    taxiId int not null,
    constraint FK_pickUpAddress foreign key(pickUpAddress) references Address(addressId),
    constraint FK_dropOffAddress foreign key(dropOffAddress) references Address(addressId),
	constraint FK_driverId foreign key (driverId) references Driver(driverId),
    constraint FK_clientId foreign key (clientId) references `Client`(clientId),
    constraint FK_taxiId foreign key (taxiId) references Taxi(taxiId)
);






