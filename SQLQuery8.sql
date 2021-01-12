/*1*/
SELECT *
FROM Diagnosis
WHERE Category LIKE('%Disease%')
ORDER BY Diagnosis_name
/*2*/
SELECT Id_patient,First_name as 'Patient name',Second_name as 'Patient surname',Birthday
FROM Patient
ORDER BY Birthday DESC
/*3*/
SELECT MAX(p.First_name+p.Second_name)as Patient,d.First_name as Doctor
FROM Patient p INNER JOIN Appointment app ON p.Id_patient=app.Id_patient
INNER JOIN Doctor d ON d.Id_doctor=app.Id_appointment
GROUP BY d.First_name

