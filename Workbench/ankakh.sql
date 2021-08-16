/*CREATE SCHEMA `ankakh` ;*/
DROP TABLE user;
CREATE TABLE ankakh.user (
Name varchar(50) NOT NULL,
id int NOT NULL,
gameCompleted bool NOT NULL);

INSERT INTO ankakh.user(Name, gameCompleted) VALUES("Caro", false);

