/*1*/
CREATE TRIGGER Doctor_delete_Trigger 
ON Doctor1 AFTER DELETE 
AS
INSERT INTO Doctor2
SELECT * FROM deleted
WHERE Id_doctor=(SELECT Id_doctor FROM deleted)

DELETE FROM Doctor1 WHERE Id_doctor=1
/*2*/
CREATE TRIGGER Doctor_update
ON Doctor2
AFTER UPDATE
AS
DELETE FROM Doctor1 
WHERE Doctor1.First_name=(SELECT First_name FROM DELETED);

UPDATE Doctor2 SET Experience=50 WHERE Id_Doctor=3;
/*3*/
CREATE TRIGGER Doctor_insert
ON Doctor1
AFTER INSERT
AS
INSERT INTO Doctor2(Id_doctor,First_name,Second_name,Birthday,Experience,Prone,Id_cabinet,Email)
SELECT Id_doctor,First_name,Second_name,Birthday,Experience,Prone,Id_cabinet,Email
FROM inserted;

INSERT INTO Doctor1 VALUES (7,'Yoshito','Hall','1980-01-17',30,'+38097765906',134,NULL);


