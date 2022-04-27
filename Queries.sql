USE master
USE APPOINTMENT
GO

/*3. Queries
Design the following queries in SQL:
a. List all appointments made for chihuahuas. Output the Pet’s name and breed.*/

SELECT pet_name, pet_breed
FROM  Pet
WHERE pet_breed = 'chihuahua';

/*SELECT *
FROM Appointment;*/

/*b. List all the appointment dates for William with Vet “Steve Rogers”. Output the pet's name, the appointment
date and the vet's name.*/
SELECT pet_name, appointment_date, vet_name
FROM Appointment, Vet
WHERE pet_name = 'William' AND vet_id = 'v001';

/*c. List all appointments in January. Output the appointment date, the pet’s name and the vet it is with.*/
/*SELECT appointment_date, pet_name, vet
FROM Appointment
WHERE appointment_date BETWEEN '2022-01-01' AND '2022-01-31';*/


SELECT appointment_date AS "Appointment Date", pet_name AS "Pet's Name", vet AS "Vet ID"
FROM Appointment
WHERE appointment_date BETWEEN '2022-01-01' AND '2022-01-31';
/*SELECT *
FROM Appointment;*/

/*d. List the number of appointments for every vet. Output the vet names and the total number of appointments
for all the vets.*/

SELECT Vet.vet_name, COUNT (Appointment.vet) AS "Total nr of appointments"
FROM Appointment, Vet
WHERE vet_id = vet
GROUP BY Vet.vet_name;

/*SELECT *
FROM Appointment;*/

/*e. List the pets that have multiple visits to the vet. Output all information for pets with more than 1
appointment. This includes all their treatment information.*/

SELECT pet_name,owner_id, COUNT(pet_name) AS "Pet details with more then 1 visits"
FROM APPOINTMENT
GROUP BY pet_name, owner_id
HAVING COUNT(pet_name) > 1;


/*SELECT *
FROM Appointment;*/

/*f. List all pet names and owner names with annual check-ups in date ascending order.*/ 

SELECT Appointment.pet_name, Owner.owner_name
FROM Appointment, Owner
WHERE Appointment.owner_id = Owner.owner_id AND Appointment.reason = 'annual check-up'
ORDER BY Appointment.appointment_date ASC;

/*SELECT Appointment.pet_name, Owner.owner_name, Appointment.appointment_date
FROM Appointment, Owner
WHERE Appointment.owner_id = Owner.owner_id AND Appointment.reason = 'annual check-up'
ORDER BY Appointment.appointment_date ASC;*/

/*SELECT *
FROM APPOINTMENT;*/