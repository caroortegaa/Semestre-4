USE api;
DROP TABLE api.user;
CREATE TABLE api.user (
id int NOT NULL,
Name varchar(50) NOT NULL,
LastName varchar(50) NOT NULL,
email varchar(50) NOT NULL
);
/*
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'Estrella5@';
flush privileges;*/

USE api;
/* con id: INSERT INTO api.user(id, nombre, apellido, email) VALUES("1","Caro", "Ortega", "caro@mail.com");*/
INSERT INTO api.user(Name, LastName, email) VALUES("Caro", "Ortega", "caro@mail.com");



