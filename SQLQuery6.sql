/*1*/
CREATE VIEW Patient2 
AS SELECT DISTINCT Id_patient, First_name, Second_name,Birthday
FROM Patient
/*2*/
SELECT *
FROM Patient2
WHERE PATINDEX('%V%',First_name)>0
/*3*/
SELECT Doctor.Id_doctor,Doctor.First_name,Doctor.Second_name,
Patient2.Id_patient,Patient2.First_name,Patient2.Second_name, Appointment.Id_patient,Appointment.Id_doctor
FROM Doctor ,Patient2,Appointment
WHERE Doctor.Id_doctor=Appointment.Id_doctor AND Patient2.Id_patient=Appointment.Id_patient
/*4*/
SELECT Doctor.Id_doctor,Doctor.First_name,Doctor.Second_name,Doctor.Birthday,
Patient2.Id_patient,Patient2.First_name,Patient2.Second_name,Patient2.Birthday, Appointment.Id_patient,Appointment.Id_doctor
FROM Doctor ,Patient2,Appointment
WHERE Doctor.Id_doctor=Appointment.Id_doctor
AND Patient2.Id_patient=Appointment.Id_patient 
AND Doctor.Birthday<Patient2.Birthday