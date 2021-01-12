/*1*/
INSERT INTO Patient VALUES (1,'Vasyl','Kashapov','1993-12-3','+380963859906',1);

INSERT INTO Patient VALUES (2,'Vitaliy', 'Garcia','2001-08-12','+380963643906',4);
INSERT INTO Patient VALUES (3,'Xander','Torres','1999-6-12','+380963827606',3);
INSERT INTO Patient VALUES (4,'Yoshito','Hall','2013-01-17','+38097765906',2);
INSERT INTO Patient VALUES (5,'Zion','Rogers','2002-12-25','+380963187906',3);
/*2*/
BULK 
INSERT Doctor 
FROM ' D:\\ясад\doctors.csv'
WITH 
(
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
);
BULK 
INSERT Cabinets
FROM ' D:\\ясад\cabinets.csv'
WITH 
(
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n');

/*3*/
UPDATE Patient SET  Phone='+380937459645'
WHERE Id_patient=3;

SELECT * FROM Doctor
UPDATE Doctor SET Experience = Experience + 2
/*4*/
Select * FROM Patient
Where Birthday<'2000-01-01' AND Second_name<>'Hall' 
