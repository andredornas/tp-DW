use master
go

IF NOT EXISTS (SELECT name FROM master.sys.databases WHERE name = N'DW_IGN') CREATE DATABASE DW_IGN
go

use DW_IGN
go

IF EXISTS (SELECT name FROM DW_IGN.sys.tables WHERE name = N'Fato') DROP TABLE Fato
GO

IF EXISTS (SELECT name FROM DW_IGN.sys.tables WHERE name = N'DimLocation') DROP TABLE DimLocation
GO

IF EXISTS (SELECT name FROM DW_IGN.sys.tables WHERE name = N'DimPlatform') DROP TABLE DimPlatform
GO

IF EXISTS (SELECT name FROM DW_IGN.sys.tables WHERE name = N'DimGame') DROP TABLE DimGame
GO

IF EXISTS (SELECT name FROM DW_IGN.sys.tables WHERE name = N'DimGenre') DROP TABLE DimGenre
GO

CREATE TABLE DimGame (
	IdGame INT IDENTITY NOT NULL,
	Name VARCHAR(255) NOT NULL,
	Year VARCHAR(255) NOT NULL,
	Publisher VARCHAR(255) NOT NULL,
	PRIMARY KEY (IdGame)
);

CREATE TABLE DimGenre (
	IdGenre INT IDENTITY NOT NULL,
	Genre VARCHAR(255) NOT NULL,
	PRIMARY KEY (IdGenre)
);

CREATE TABLE DimLocation (
	IdLocation INT IDENTITY NOT NULL,
	Country VARCHAR(255) NOT NULL,
	PRIMARY KEY (IdLocation)
);

CREATE TABLE DimPlatform (
	IdPlatform INT IDENTITY NOT NULL,
	Name VARCHAR(255) NOT NULL,
	PRIMARY KEY (IdPlatform)
);

CREATE TABLE Fato (
	IdGame INT NOT NULL,
	IdLocation INT NOT NULL,
	IdPlatform INT NOT NULL,
	IdGenre INT NOT NULL,
	Score VARCHAR(255) NOT NULL,
	Sales VARCHAR(255) NOT NULL,
	PRIMARY KEY (IdGame, IdLocation, IdPlatform, IdGenre)
);

ALTER TABLE Fato ADD CONSTRAINT Fato_fk0 FOREIGN KEY (IdGame) REFERENCES DimGame(IdGame);

ALTER TABLE Fato ADD CONSTRAINT Fato_fk1 FOREIGN KEY (IdLocation) REFERENCES DimLocation(IdLocation);

ALTER TABLE Fato ADD CONSTRAINT Fato_fk2 FOREIGN KEY (IdPlatform) REFERENCES DimPlatform(IdPlatform);

ALTER TABLE Fato ADD CONSTRAINT Fato_fk3 FOREIGN KEY (IdGenre) REFERENCES DimGenre(IdGenre);

