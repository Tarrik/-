CREATE DATABASE Rehabilitation_center ;

use Rehabilitation_center
go

CREATE TABLE Diagnosis  (
	Id_diagnosis  INTEGER NOT NULL,
	Category  CHAR(40) NOT NULL,
	Diagnosis_name  CHAR(100) NOT NULL,
PRIMARY KEY (Id_diagnosis) );

CREATE TABLE Patient  (
	Id_patient INTEGER NOT NULL,
	First_name CHAR(20) NOT NULL,
	Second_name CHAR(20) NOT NULL,
	Birthday DATE NOT NULL,
	Prone CHAR(20) NULL,
	Id_diadnosis INTEGER NOT NULL,
PRIMARY KEY (Id_patient),
CONSTRAINT  FK_diagnosis FOREIGN KEY (Id_diagnosis) 
REFERENCES Diagnosis ON DELETE CASCADE ON UPDATE CASCADE
); 

CREATE TABLE Exercise   (
	Id_exercise  INTEGER NOT NULL,
	Exercise_name   CHAR(20) NOT NULL,
	Repetition_amount  INTEGER NOT NULL,
	Sets_amount INTEGER NOT NULL,
PRIMARY KEY (Id_exercise) ,
);    

CREATE TABLE Rehabilitation_program   (
	Id_patient   INTEGER NOT NULL,
	Id_exercise     INTEGER NOT NULL,
PRIMARY KEY (Id_patient,Id_exercise),
CONSTRAINT  PK_patient FOREIGN KEY (Id_patient) 
REFERENCES Patient ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT PR_exercise FOREIGN KEY (Id_exercise) 
REFERENCES Exercise ON DELETE CASCADE ON UPDATE CASCADE ,
);

CREATE TABLE Doctor  (
	Id_doctor INTEGER NOT NULL,
	First_name CHAR(20) NOT NULL,
	Second_name CHAR(20) NOT NULL,
	Birthday DATE NOT NULL,
	Experience INTEGER NULL,
	Prone CHAR(20) NULL,
	Id_cabinet INTEGER NOT NULL,
PRIMARY KEY (Id_doctor) ,
CONSTRAINT  FK_cabinet FOREIGN KEY (Id_cabinet) 
REFERENCES Cabinet ON DELETE CASCADE ON UPDATE CASCADE,
); 


CREATE TABLE Cabinet   (
	Id_cabinet  INTEGER NOT NULL,
	Cabinet_floor  INTEGER NOT NULL,
	Responsible_doctor_name  CHAR(20) NOT NULL,
	Responsible_doctor_surname  CHAR(20) NOT NULL,
PRIMARY KEY (Id_cabinet ),
);

CREATE TABLE Appointment (
Id_appointment   INTEGER NOT NULL,
Id_patient    INTEGER NOT NULL,
Id_doctor  INTEGER NOT NULL,
Appointment_date DATE NOT NULL,
PRIMARY KEY (Id_appointment ),
CONSTRAINT  FK_patient FOREIGN KEY (Id_patient) 
REFERENCES Patient ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT  FK_doctor FOREIGN KEY (Id_doctor) 
REFERENCES Doctor ON DELETE CASCADE ON UPDATE CASCADE, 
);

