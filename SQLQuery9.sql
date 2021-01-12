/*1*/
SELECT COUNT(p.Id_patient) as 'Number of patients', d.First_name as 'Doctor name',d.Second_name as 'Doctor surname'
FROM Patient p INNER JOIN Appointment app ON p.Id_patient=app.Id_patient
INNER JOIN Doctor d ON d.Id_doctor=app.Id_doctor
GROUP BY d.First_name,d.Second_name
/*2*/
SELECT YEAR(p.Birthday) AS year, MONTH(p.Birthday) AS month,COUNT(p.First_name) AS Doctor
FROM Patient p
GROUP BY YEAR(p.Birthday) , MONTH(p.Birthday) WITH ROLLUP;
/*3*/
SELECT p.First_name as Patient, AVG(ex.Sets_amount) as Average_number_of_sets
FROM Patient p INNER JOIN Rehabilitation_program rp ON p.Id_patient=rp.Id_patient
INNER JOIN Exercise ex ON ex.Id_exercise=rp.Id_exercise
GROUP BY p.First_name
/*4*/
SELECT d.First_name+d.Second_name as Doctor,COUNT(DISTINCT p.First_name)*AVG(d.Experience)*0.01 as 'Doctor rate'
FROM Patient p INNER JOIN Appointment app ON p.Id_patient=app.Id_patient
INNER JOIN Doctor d ON d.Id_doctor=app.Id_doctor
GROUP BY d.First_name,d.Second_name
