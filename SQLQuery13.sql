/*1*/
EXEC sp_helpindex Doctor
GO
EXEC sp_helpindex Patient
GO

/*2*/
CREATE INDEX DoctorIndex1 ON Doctor(Id_doctor,First_name)
EXEC sp_helpindex Doctor
go

CREATE INDEX PatientIndex1 ON Patient(Id_patient,First_name)
EXEC sp_helpindex Patient
go
/*3*/
SET SHOWPLAN_ALL ON;
GO
SELECT MAX(p.First_name+p.Second_name)as Patient,d.First_name as Doctor
FROM Patient p INNER JOIN Appointment app ON p.Id_patient=app.Id_patient
INNER JOIN Doctor d ON d.Id_doctor=app.Id_appointment
GROUP BY d.First_name
GO
SET SHOWPLAN_ALL OFF;


SET SHOWPLAN_ALL ON;
GO
SELECT MAX(p.First_name+p.Second_name)as Patient,d.First_name as Doctor
FROM Patient p LEFT JOIN Appointment app ON p.Id_patient=app.Id_patient
LEFT JOIN Doctor d ON d.Id_doctor=app.Id_appointment
GROUP BY d.First_name
GO
SET SHOWPLAN_ALL OFF;


