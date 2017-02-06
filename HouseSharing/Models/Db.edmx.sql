
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 02/06/2017 13:37:53
-- Generated from EDMX file: C:\Curs\Asp.net\HouseSharing\HouseSharing\Models\Db.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [HouseSharing];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK__Bien__CategoryID__1DE57479]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Bien] DROP CONSTRAINT [FK__Bien__CategoryID__1DE57479];
GO
IF OBJECT_ID(N'[dbo].[FK__Bien__CountryID__1CF15040]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Bien] DROP CONSTRAINT [FK__Bien__CountryID__1CF15040];
GO
IF OBJECT_ID(N'[dbo].[FK__Bien__OptionID__6E01572D]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Bien] DROP CONSTRAINT [FK__Bien__OptionID__6E01572D];
GO
IF OBJECT_ID(N'[dbo].[FK__Bien__UserID__38996AB5]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Bien] DROP CONSTRAINT [FK__Bien__UserID__38996AB5];
GO
IF OBJECT_ID(N'[dbo].[FK__Photo__BienID__20C1E124]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Photo] DROP CONSTRAINT [FK__Photo__BienID__20C1E124];
GO
IF OBJECT_ID(N'[dbo].[FK__User__CountryID__1920BF5C]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[User] DROP CONSTRAINT [FK__User__CountryID__1920BF5C];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Bien]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Bien];
GO
IF OBJECT_ID(N'[dbo].[Category]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Category];
GO
IF OBJECT_ID(N'[dbo].[Country]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Country];
GO
IF OBJECT_ID(N'[dbo].[Options]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Options];
GO
IF OBJECT_ID(N'[dbo].[Photo]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Photo];
GO
IF OBJECT_ID(N'[dbo].[User]', 'U') IS NOT NULL
    DROP TABLE [dbo].[User];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Biens'
CREATE TABLE [dbo].[Biens] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Adresse] varchar(255)  NULL,
    [City] varchar(255)  NULL,
    [ZipCode] int  NULL,
    [PricePerNight] int  NULL,
    [CountryID] int  NULL,
    [CategoryID] int  NULL,
    [UserID] int  NULL,
    [Description] varchar(max)  NULL,
    [OptionID] int  NULL
);
GO

-- Creating table 'Categories'
CREATE TABLE [dbo].[Categories] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(255)  NULL
);
GO

-- Creating table 'Countries'
CREATE TABLE [dbo].[Countries] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(255)  NULL
);
GO

-- Creating table 'Options'
CREATE TABLE [dbo].[Options] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Surface] int  NOT NULL,
    [Rooms] int  NOT NULL,
    [Bathrooms] int  NOT NULL,
    [Garage] bit  NOT NULL,
    [Garden] bit  NOT NULL,
    [Terrace] bit  NOT NULL,
    [WashingMachine] bit  NOT NULL,
    [DishWasher] bit  NOT NULL,
    [BabyBed] bit  NOT NULL
);
GO

-- Creating table 'Photos'
CREATE TABLE [dbo].[Photos] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(255)  NULL,
    [BienID] int  NULL
);
GO

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [LastName] nvarchar(255)  NULL,
    [FirstName] varchar(255)  NULL,
    [Adresse] varchar(255)  NULL,
    [City] varchar(255)  NULL,
    [ZipCode] int  NULL,
    [Telephone] varchar(30)  NULL,
    [Email] varchar(255)  NULL,
    [Login] varchar(15)  NULL,
    [Password] varchar(max)  NULL,
    [CountryID] int  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [ID] in table 'Biens'
ALTER TABLE [dbo].[Biens]
ADD CONSTRAINT [PK_Biens]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Categories'
ALTER TABLE [dbo].[Categories]
ADD CONSTRAINT [PK_Categories]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Countries'
ALTER TABLE [dbo].[Countries]
ADD CONSTRAINT [PK_Countries]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Options'
ALTER TABLE [dbo].[Options]
ADD CONSTRAINT [PK_Options]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Photos'
ALTER TABLE [dbo].[Photos]
ADD CONSTRAINT [PK_Photos]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [CategoryID] in table 'Biens'
ALTER TABLE [dbo].[Biens]
ADD CONSTRAINT [FK__Bien__CategoryID__1DE57479]
    FOREIGN KEY ([CategoryID])
    REFERENCES [dbo].[Categories]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Bien__CategoryID__1DE57479'
CREATE INDEX [IX_FK__Bien__CategoryID__1DE57479]
ON [dbo].[Biens]
    ([CategoryID]);
GO

-- Creating foreign key on [CountryID] in table 'Biens'
ALTER TABLE [dbo].[Biens]
ADD CONSTRAINT [FK__Bien__CountryID__1CF15040]
    FOREIGN KEY ([CountryID])
    REFERENCES [dbo].[Countries]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Bien__CountryID__1CF15040'
CREATE INDEX [IX_FK__Bien__CountryID__1CF15040]
ON [dbo].[Biens]
    ([CountryID]);
GO

-- Creating foreign key on [OptionID] in table 'Biens'
ALTER TABLE [dbo].[Biens]
ADD CONSTRAINT [FK__Bien__OptionID__6E01572D]
    FOREIGN KEY ([OptionID])
    REFERENCES [dbo].[Options]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Bien__OptionID__6E01572D'
CREATE INDEX [IX_FK__Bien__OptionID__6E01572D]
ON [dbo].[Biens]
    ([OptionID]);
GO

-- Creating foreign key on [UserID] in table 'Biens'
ALTER TABLE [dbo].[Biens]
ADD CONSTRAINT [FK__Bien__UserID__38996AB5]
    FOREIGN KEY ([UserID])
    REFERENCES [dbo].[Users]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Bien__UserID__38996AB5'
CREATE INDEX [IX_FK__Bien__UserID__38996AB5]
ON [dbo].[Biens]
    ([UserID]);
GO

-- Creating foreign key on [BienID] in table 'Photos'
ALTER TABLE [dbo].[Photos]
ADD CONSTRAINT [FK__Photo__BienID__20C1E124]
    FOREIGN KEY ([BienID])
    REFERENCES [dbo].[Biens]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Photo__BienID__20C1E124'
CREATE INDEX [IX_FK__Photo__BienID__20C1E124]
ON [dbo].[Photos]
    ([BienID]);
GO

-- Creating foreign key on [CountryID] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [FK__User__CountryID__1920BF5C]
    FOREIGN KEY ([CountryID])
    REFERENCES [dbo].[Countries]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__User__CountryID__1920BF5C'
CREATE INDEX [IX_FK__User__CountryID__1920BF5C]
ON [dbo].[Users]
    ([CountryID]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------