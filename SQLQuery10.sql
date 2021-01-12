/*1*/
CREATE FUNCTION Encription (@First_name char(50))
RETURNS char(50)
BEGIN  
    DECLARE @Result char(50)  
    SET @Result = EncryptByPassPhrase('passphrase',@First_name) 
    RETURN @Result  
END



CREATE FUNCTION Decription (@Value_for_decription char(50))
RETURNS char(50)
BEGIN  
    DECLARE @First_name char(50)  
    SET @First_name = DecryptByPassPhrase('passphrase',@Value_for_decription)
    RETURN @First_name  
END

SELECT First_name,dbo.Encription(First_name) as Encripted_Name 
FROM Doctor; 
/*2*/
CREATE PROCEDURE Appointments (@date1 datetime,@date2 datetime)
AS
BEGIN
    DECLARE @error CHAR;
	SET @error = 'Некоректно задані дати';
	IF (@date1<=@date2) 
	BEGIN
		SELECT  COUNT(DISTINCT Appointment.Id_appointment) as Number_of_appointmentss,MAX(Doctor.First_name) as Doctor,  @date1 as 'From', @date2 as 'To' 
		FROM Patient p INNER JOIN Appointment ON p.Id_patient=Appointment.Id_patient
		INNER JOIN Doctor ON Appointment.Id_doctor=Doctor.Id_doctor
		WHERE Appointment.Appointment_date BETWEEN @date1 and @date2
		GROUP BY Appointment.Id_appointment;
	END;
	ELSE SELECT @error;
END;



EXEC Appointments'2021-01-01', '2021-05-05';
