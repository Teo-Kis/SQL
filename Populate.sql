/*CREATE SEQUENCE Room  
   AS tinyint  
    START WITH 1  
    INCREMENT BY 1  
    MINVALUE 1  
    MAXVALUE 6  
    CYCLE ;  
GO  
  
SELECT NEXT VALUE FOR Room AS AppRoom, Name FROM sys.objects ;  
GO


DECLARE @id INT 
SET @id = N 
UPDATE accounts2 
SET @id = id = @id + 1 
GO 

SELECT * FROM accounts2 
GO 

*/

USE Appointment
GO

INSERT INTO Owner (
owner_id,
owner_name,
owner_address,
owner_tel_nr)
VALUES
	('N0001',
	'Simon Blackquill',
	'87 Elpis Drive, Aberdeen',
	'01224496476'),

	('N0002',
	'Phoenix Wright',
	'3 Ishgard Close, Aberdeen',
	'01224496390'),

	('N0003',
	'Athena Cykes',
	'23 Thavnair Road, Inverurie',
	'01224496180'),

	('N0004',
	'Maya Fey',
	'11 Sharlayan Street, Dyce',
	'01224496853'),
	('N0005',
	'Miles Edgeworth',
	'57 Tempest Avenue, Westhill',
	'01224496398'),

	('N0006',
	'Franziska von Karma',
	'8 Amaurot Lane, Portlethen',
	'01224496094');

/*SELECT *
FROM Owner;*/



INSERT INTO Pet(
owner_id,
pet_name,
pet_age,
pet_type,
pet_breed
)
VALUES
('N0001',
'Rory',
'9',
'Cat',
'Ragdoll'),

('N0001',
'Hades',
'14',
'Cat',
'Persian'),

('N0002',
'Maddie',
'11',
'Dog',
'Chihuahua'),

('N0002',
'Wease',
'11',
'Dog',
'Chihuahua'),

('N0002',
'Phoebe',
'1',
'Dog',
'Chihuahua'),

('N0003',
'Chip',
'3',
'Guinea Pig',
'NULL'),

('N0003',
'Dale',
'3',
'Guinea Pig',
'NULL'),

('N0004',
'Evie',
'5',
'Cat',
'Tortoiseshell'),

('N0004',
'Izzy',
'3',
'Cat',
'Mixed'),

('N0005',
'Henry',
'4',
'Dog',
'Husky'),

('N0006',
'William',
'14',
'Horse',
'Appaloosa');



/*SELECT *
FROM Pet
ORDER BY owner_id;*/

INSERT INTO Vet (
vet_id,
vet_name,
speciality
)
VALUES
('V001',
'Steve Rogers',
'Equine'),

('V002',
'Tony Stark',
'Canine'),

('V003',
'Natasha Romanova',
'Feline'),

('V004',
'Peter Parker',
'Small Animal Care'),

('V005',
'Bruce Banner',
'Dentistry');

/*SELECT *
FROM Vet;*/


INSERT INTO Appointment (
owner_id,
pet_name,
reason,
appointment_date,
room,
vet,
diagnosis,
treatment,
prescription,
"cost(in £)")
VALUES
('N0001',
'Rory',
'Injured from cat fight',
'2022-01-11',
'4',
'V003',
'Scratches and wounds',
'Antibiotics and stiches',
'Painkillers',
'£150'),

('N0001',
'Hades',
'Vaccinations',
'2022-01-15',
'5',
'V003',
'NULL',
'Vaccinations',
'NULL',
'£50'),

('N0002',
'Maddie',
'Annual Check-Up',
'2022-01-10',
'2',
'V005',
'NULL',
'Clean teeth',
'NULL',
'£100'),

('N0002',
'Wease',
'Annual Check-Up',
'2022-01-10',
'2',
'V005',
'NULL',
'Clean teeth',
'NULL',
'£100'),

('N0002',
'Phoebe',
'Puppy Check-Up',
'2022-02-02',
'1',
'V002',
'NULL',
'Vaccinations, flea and wormer',
'NULL',
'£80'),

('N0003',
'Chip',
'Not eating',
'2022-01-05',
'3',
'V004',
'Fussy',
'Offer different food',
'NULL',
'£30'),

('N0004',
'Evie',
'Car Accident',
'2022-01-11',
'2',
'V003',
'Broken Leg',
'Surgery and rest',
'Painkillers and cone for head',
'£450'),

('N0004',
'Evie',
'Follow-Up',
'2022-02-08',
'2',
'V003',
'Healing Well',
'Continue Treatment Plan',
'NULL',
'£30'),

('N0005',
'Henry',
'Ate chocolate',
'2021-12-26',
'2',
'V002',
'Chocolate Poisoning',
'Stomach Pumped',
'Painkillers and laxatives',
'£300'),

('N0006',
'William',
'Vaccinations',
'2022-01-27',
'1',
'V001',
'NULL',
'Vaccinations',
'NULL',
'£75'),

('N0006',
'William',
'Injury',
'2022-02-03',
'1',
'V001',
'Kicked, caused lameness',
'Box Rest',
'Painkillers',
'£85'),

('N0006',
'William',
'Follow-Up',
'2022-02-07',
'1',
'V001',
'Healed',
'Back to usual management',
'NULL',
'£60');

/*UPDATE Appointment 
SET Appointment.owner_id = Pet.owner_id
WHERE Appointment.pet_name = Pet.pet_name;*/

/*INSERT INTO Appointment
SELECT Pet.owner_id,Pet.pet_name, Appointment.pet_name
FROM Pet, Appointment
WHERE Pet.pet_name = Appointment.pet_name;*/


/*UPDATE Appointment 
SET Appointment.vet = Vet.vet_id
WHERE Appointment.vet = Vet.vet_id;*/

SELECT *
FROM APPOINTMENT;