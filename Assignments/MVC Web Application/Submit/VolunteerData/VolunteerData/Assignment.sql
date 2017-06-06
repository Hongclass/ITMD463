CREATE TABLE [dbo].[Assignment]
(
	[AssignmentID] INT IDENTITY (1, 1) NOT NULL, 
	[EventID] INT NOT NULL,
    [VolunteerID] INT NOT NULL, 
	PRIMARY KEY CLUSTERED ([AssignmentID] ASC),
    CONSTRAINT [FK_dbo.Assignment_dbo.Event_EventID] FOREIGN KEY ([EventID]) 
        REFERENCES [dbo].[Event] ([EventID]) ON DELETE CASCADE,
    CONSTRAINT [FK_dbo.Assignment_dbo.Volunteer_VolunteerID] FOREIGN KEY ([VolunteerID]) 
        REFERENCES [dbo].[Volunteer] ([VolunteerID]) ON DELETE CASCADE
)
