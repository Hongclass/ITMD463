CREATE TABLE [dbo].[Event]
(
	[EventID] INT IDENTITY (1, 1) NOT NULL, 
    [Description] NVARCHAR(MAX) NULL, 
    [StartDate] DATETIME NULL, 
    [EndDate] DATETIME NULL, 
    [Location] NVARCHAR(MAX) NULL,
    PRIMARY KEY CLUSTERED ([EventID] ASC)
)
