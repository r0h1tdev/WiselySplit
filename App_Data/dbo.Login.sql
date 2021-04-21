CREATE TABLE [dbo].[Login] (
    [Id]           INT           IDENTITY (1, 1) NOT NULL,
    [uname]     NVARCHAR (50) NOT NULL,
    [upass] BINARY (50)   NOT NULL,
    [Email]        NVARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    UNIQUE NONCLUSTERED ([Id] ASC)
);

