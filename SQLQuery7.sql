/*1*/
SELECT First_name as 'Doctor Name',Second_name as 'Doctor Surname'
FROM Doctor
WHERE Id_doctor=4
/*2*/
SELECT d.First_name,d.Second_name,c.Id_cabinet,c.Cabinet_floor
FROM Doctor d LEFT JOIN Cabinet c ON c.Id_cabinet=d.Id_cabinet
/*3*/
SELECT d.First_name,d.Second_name,c.Id_cabinet,c.Cabinet_floor
FROM Doctor d INNER JOIN Cabinet c ON c.Id_cabinet=d.Id_cabinet
WHERE c.Cabinet_floor=1
/*4*/
SELECT d.Id_doctor,d.First_name as 'Doctor name',d.Second_name as 'Doctor surname',
p.First_name as 'Patient name',p.Second_name as 'Patient surname',p.Id_patient
FROM Doctor d INNER JOIN Appointment app ON d.Id_doctor=app.Id_doctor INNER JOIN Patient p ON p.Id_patient=app.Id_patient
WHERE d.Id_doctor=1
/*5*/
SELECT p.First_name as 'Patient name', p.Birthday , Doctor.First_name as 'Doctor name', Doctor.Id_doctor
FROM Doctor INNER JOIN Appointment ON Doctor.Id_doctor=Appointment.Id_patient
INNER JOIN Patient p ON p.Id_patient=Appointment.Id_patient
WHERE p.Id_patient IN(SELECT d.Id_doctor FROM Doctor d
WHERE d.Id_doctor in(1,2))
ORDER BY p.Birthday DESC 
/*6*/
SELECT Doctor.Id_doctor,Doctor.First_name
FROM Doctor
WHERE  NOT EXISTS( SELECT app.Id_doctor FROM Appointment app WHERE app.Id_doctor=Doctor.Id_doctor)
/*7*/
SELECT Category,Diagnosis_name,First_name,Second_name
FROM Diagnosis INNER JOIN Patient 
ON Patient.Id_diadnosis=Diagnosis.Id_diagnosis
WHERE Diagnosis.Category in(SELECT Category FROM Diagnosis
WHERE Category LIKE('%Physical%'))



