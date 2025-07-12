use CLASSPRACTICE

SELECT * FROM Patients
SELECT * FROM Appointments


CREATE VIEW Active_Insured_Patients
AS
SELECT PatientID, PatientName, City, InsuranceProvider FROM Patients
WHERE IsActive='True' AND InsuranceProvider IS NOT NULL;


SELECT * FROM Active_Insured_Patients

DROP VIEW Active_Insured_Patients;


--- 2. View for Appointments needing Followup

CREATE VIEW FollowUp_Appointment
AS
SELECT AppointmentID, PatientID, DoctorName, AppointmentDate, Department FROM Appointments
WHERE FollowUpRequired =  'TRUE'


SELECT * FROM FollowUp_Appointment

---3. View for Recent high bill appointments

CREATE VIEW High_Bill_Appointment
AS
SELECT AppointmentID, AppointmentDate, BillAmount FROM Appointments
WHERE BillAmount > 3000	

SELECT * FROM High_Bill_Appointment
ORDER BY BillAmount DESC;

---- With max

CREATE VIEW HIGH_BILLS
AS
SELECT AT.AppointmentID, AT.AppointmentDate,
MAX(AT.BillAmount) AS MAX_AMOUNT, PT.IsActive
FROM Appointments AS AT
LEFT JOIN PATIENTS AS PT
ON AT.PatientID = PT.PatientID
WHERE IsActive = 'TRUE'
GROUP BY AppointmentID, AppointmentDate, PT.IsActive

SELECT * FROM HIGH_BILLS
order by MAX_AMOUNT DESC