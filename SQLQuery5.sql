SELECT * INTO Doctor1 
FROM Doctor WHERE Experience > 10

SELECT * INTO Doctor2
FROM Doctor WHERE Experience > 20

/*1*/
SELECT * FROM Doctor1
UNION SELECT * FROM Doctor2
/*2*/
SELECT * FROM Doctor1
INTERSECT
SELECT * FROM Doctor2
/*3*/
Select * FROM Doctor1
WHERE Id_doctor NOT IN(SELECT Id_doctor FROM Doctor2)
/*4*/
SELECT * FROM Doctor1,Doctor2

