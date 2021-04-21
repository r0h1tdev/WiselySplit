CREATE TABLE [dbo].[Authenticate] (
    [Id]                INT           NOT NULL,
    [uname]          NVARCHAR (50) NOT NULL,
    [Security Question] NVARCHAR (50) NOT NULL,
    [Security Answer]   BINARY (50)   NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    UNIQUE NONCLUSTERED ([uname] ASC),
    FOREIGN KEY ([Id]) REFERENCES [dbo].[Login] ([Id])
);

