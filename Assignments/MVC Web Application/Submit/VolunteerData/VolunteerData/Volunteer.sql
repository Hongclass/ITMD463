CREATE TABLE [dbo].[Volunteer]
(
	[VolunteerID] INT IDENTITY (1, 1) NOT NULL, 
    [LastName] NVARCHAR(50) NULL, 
    [FirstName] NVARCHAR(50) NULL, 
    [Age] INT NULL, 
    [Phone] NVARCHAR(50) NULL,
    [Email] NVARCHAR(50) NULL, 
    PRIMARY KEY CLUSTERED ([VolunteerID] ASC)
)
