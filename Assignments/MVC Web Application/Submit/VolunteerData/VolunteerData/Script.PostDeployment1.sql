/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

MERGE INTO Event AS Target 
USING (VALUES 
        (1, 'Volunteer Orientation Session - 1', '2016-09-01 8:00', '2016-09-01 10:00','Lakeview Pantry Sheridan'), 
        (2, 'Volunteer Orientation Session - 2', '2016-09-01 8:00', '2016-09-01 10:00','Lakeview Pantry Sheridan'), 
        (3, 'Cooking with Open Door Shelter', '2016-09-02 8:00', '2016-09-02 10:00','Glenwood Sunday Market'), 
        (4, 'Pet Therapy', '2016-09-07 8:00', '2016-09-07 10:00','Rogers Park')
) 
AS Source (EventID, Description, StartDate, EndDate, Location) 
ON Target.EventID = Source.EventID 
WHEN NOT MATCHED BY TARGET THEN 
INSERT (Description, StartDate, EndDate, Location) 
VALUES (Description, StartDate, EndDate, Location);

MERGE INTO Volunteer AS Target
USING (VALUES 
        (1, 'Tibbetts', 'Donnie', 43, '331-331-3333', 'dtibbetts@gmail.com'), 
        (2, 'Guzman', 'Liza',36, '555-555-5555', 'lguzman@hotmail.com'), 
		(3, 'Catlett', 'Phil',49, '345-123-3333', 'pgatlett@yahoo.com')
)
AS Source (VolunteerID, LastName, FirstName, Age, Phone, Email)
ON Target.VolunteerID = Source.VolunteerID
WHEN NOT MATCHED BY TARGET THEN
INSERT (LastName, FirstName, Age, Phone, Email)
VALUES (LastName, FirstName, Age, Phone, Email);


MERGE INTO Assignment AS Target
USING (VALUES 
	(1, 1, 1),
	(2, 1, 2),
	(3, 2, 3),
	(4, 2, 1),
	(5, 3, 1),
	(6, 3, 2)
)
AS Source (AssignmentID, EventID, VolunteerID)
ON Target.AssignmentID = Source.AssignmentID
WHEN NOT MATCHED BY TARGET THEN
INSERT (EventID, VolunteerID)
VALUES (EventID, VolunteerID);