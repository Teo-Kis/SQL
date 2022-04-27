USE MASTER 
GO
ALTER DATABASE APPOINTMENT SET  single_user WITH ROLLBACK IMMEDIATE

DROP DATABASE APPOINTMENT
 
 IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'APPOINTMENT')
	DROP DATABASE APPOINTMENT
 GO

CREATE DATABASE APPOINTMENT;
GO

USE APPOINTMENT;
GO

IF OBJECT_ID('Owner', 'U') IS NOT NULL
  DROP TABLE Owner
GO


CREATE TABLE Owner(
owner_id		NCHAR(5)				NOT NULL,
owner_name		NVARCHAR(40)			NOT NULL			,
owner_address	NVARCHAR(40)			NOT NULL			,
owner_tel_nr	NVARCHAR(15)			NOT NULL	UNIQUE,
	CONSTRAINT PK_OwnerID PRIMARY KEY (owner_id),
	CONSTRAINT CK_owner_id CHECK (owner_id LIKE 'N[0-9][0-9][0-9][0-9]'),
	CONSTRAINT CK_owner_tel_nr CHECK (owner_tel_nr LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
	);




IF OBJECT_ID('Pet', 'U') IS NOT NULL
  DROP TABLE Pet
GO

CREATE TABLE Pet(
owner_id		NCHAR(5)				NOT NULL,
pet_name		NVARCHAR(20)			NOT NULL,
pet_age			NCHAR(3)				NOT NULL,
pet_type		NVARCHAR(20)			NOT NULL,
pet_breed		NVARCHAR(30)			NOT NULL,											
	CONSTRAINT PK_Pet_Name PRIMARY KEY (pet_name),
	CONSTRAINT FK_Pet_ownerID FOREIGN KEY (owner_id) REFERENCES Owner(owner_id),
);


IF OBJECT_ID('Vet', 'U') IS NOT NULL
  DROP TABLE Vet
GO

CREATE TABLE Vet(
vet_id			NCHAR(4)				NOT NULL,
vet_name		NVARCHAR(40)			NOT NULL UNIQUE,
speciality		NVARCHAR(40)			NOT NULL
	CONSTRAINT PK_VetID PRIMARY KEY (vet_id),
	CONSTRAINT CK_vet_id CHECK (vet_id LIKE 'V[0-9][0-9][0-9]'),
);



IF OBJECT_ID('Appointment', 'U') IS NOT NULL
  DROP TABLE Appointment
GO

CREATE TABLE Appointment(
owner_id			NCHAR(5)				NOT NULL,
pet_name			NVARCHAR(20)			NOT NULL,
reason				NVARCHAR(100)			NOT NULL,
appointment_date	DATE 					NOT NULL, 
room				INT						NOT NULL,
vet					NCHAR(4)				NOT NULL,
diagnosis			NVARCHAR(100)					,
treatment			NVARCHAR(100)					,
prescription		NVARCHAR(100)					,
"cost(in £)"		MONEY					NOT NULL,
	CONSTRAINT FK_App_PetID_name FOREIGN KEY (pet_name) REFERENCES Pet(pet_name),
	CONSTRAINT FK_App_PetID_owner FOREIGN KEY (owner_id) REFERENCES Owner(owner_id),
	CONSTRAINT FK_App_vet FOREIGN KEY (vet) REFERENCES Vet(vet_id)
);



