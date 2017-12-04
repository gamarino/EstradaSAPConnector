
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 12/04/2017 17:54:46
-- Generated from EDMX file: C:\Users\GustavoMarino\Documents\Visual Studio 2017\Projects\EstradaSAPConnector\SAPConnectorLibrary\Models\EstradaSAPConnector.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [SAPConnector];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_SAPEndPointSAPSession]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SAPC_Session] DROP CONSTRAINT [FK_SAPEndPointSAPSession];
GO
IF OBJECT_ID(N'[dbo].[FK_SAPCredentialsSAPSession]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SAPC_Session] DROP CONSTRAINT [FK_SAPCredentialsSAPSession];
GO
IF OBJECT_ID(N'[dbo].[FK_SAPSessionSAPRPCCall]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SAPC_SAPRPCCall] DROP CONSTRAINT [FK_SAPSessionSAPRPCCall];
GO
IF OBJECT_ID(N'[dbo].[FK_FondoFijoRendicionGastos]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SAPC_RendicionGastos] DROP CONSTRAINT [FK_FondoFijoRendicionGastos];
GO
IF OBJECT_ID(N'[dbo].[FK_RendicionGastosFacturaProveedor]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SAPC_FacturaProveedor] DROP CONSTRAINT [FK_RendicionGastosFacturaProveedor];
GO
IF OBJECT_ID(N'[dbo].[FK_FondoFijoAdelantos]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SAPC_Adelantos] DROP CONSTRAINT [FK_FondoFijoAdelantos];
GO
IF OBJECT_ID(N'[dbo].[FK_EstadoFondoFijoFondoFijo]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SAPC_FondoFijo] DROP CONSTRAINT [FK_EstadoFondoFijoFondoFijo];
GO
IF OBJECT_ID(N'[dbo].[FK_FondoFijoSAPCredentials]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SAPC_FondoFijo] DROP CONSTRAINT [FK_FondoFijoSAPCredentials];
GO
IF OBJECT_ID(N'[dbo].[FK_FondoFijoSAPEndPoint]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SAPC_FondoFijo] DROP CONSTRAINT [FK_FondoFijoSAPEndPoint];
GO
IF OBJECT_ID(N'[dbo].[FK_RendicionGastosEstadoFondoFijo]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SAPC_RendicionGastos] DROP CONSTRAINT [FK_RendicionGastosEstadoFondoFijo];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[SAPC_RendicionGastos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SAPC_RendicionGastos];
GO
IF OBJECT_ID(N'[dbo].[SAPC_FacturaProveedor]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SAPC_FacturaProveedor];
GO
IF OBJECT_ID(N'[dbo].[SAPC_FondoFijo]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SAPC_FondoFijo];
GO
IF OBJECT_ID(N'[dbo].[SAPC_Credentials]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SAPC_Credentials];
GO
IF OBJECT_ID(N'[dbo].[SAPC_Session]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SAPC_Session];
GO
IF OBJECT_ID(N'[dbo].[SAPC_SAPRPCCall]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SAPC_SAPRPCCall];
GO
IF OBJECT_ID(N'[dbo].[SAPC_EndPoint]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SAPC_EndPoint];
GO
IF OBJECT_ID(N'[dbo].[SAPC_Adelantos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SAPC_Adelantos];
GO
IF OBJECT_ID(N'[dbo].[SAPC_Estados]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SAPC_Estados];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'SAPC_RendicionGastos'
CREATE TABLE [dbo].[SAPC_RendicionGastos] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Username] nvarchar(max)  NOT NULL,
    [FondoFijo_Id] int  NOT NULL,
    [Estado_Id] int  NOT NULL
);
GO

-- Creating table 'SAPC_FacturaProveedor'
CREATE TABLE [dbo].[SAPC_FacturaProveedor] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [RendicionGastos_Id] int  NOT NULL
);
GO

-- Creating table 'SAPC_FondoFijo'
CREATE TABLE [dbo].[SAPC_FondoFijo] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [CreadoEn] nvarchar(max)  NOT NULL,
    [SAPId] nvarchar(max)  NOT NULL,
    [Estado_Id] int  NOT NULL,
    [EndPoint_Id] int  NOT NULL,
    [Credentials_Id] int  NOT NULL
);
GO

-- Creating table 'SAPC_Credentials'
CREATE TABLE [dbo].[SAPC_Credentials] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [SAPLoginName] nvarchar(max)  NOT NULL,
    [SAPLoginPassword] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'SAPC_Session'
CREATE TABLE [dbo].[SAPC_Session] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [EndPoint_Id] int  NOT NULL,
    [Credential_Id] int  NOT NULL
);
GO

-- Creating table 'SAPC_SAPRPCCall'
CREATE TABLE [dbo].[SAPC_SAPRPCCall] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Method] nvarchar(max)  NOT NULL,
    [StartedOn] nvarchar(max)  NOT NULL,
    [FinishedOn] nvarchar(max)  NOT NULL,
    [ErrorCode] nvarchar(max)  NOT NULL,
    [ErrorMsg] nvarchar(max)  NOT NULL,
    [InputParameters] nvarchar(max)  NOT NULL,
    [Results] nvarchar(max)  NOT NULL,
    [Session_Id] int  NOT NULL
);
GO

-- Creating table 'SAPC_EndPoint'
CREATE TABLE [dbo].[SAPC_EndPoint] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [URL] nvarchar(max)  NOT NULL,
    [LastConnectionOn] datetime  NOT NULL
);
GO

-- Creating table 'SAPC_Adelantos'
CREATE TABLE [dbo].[SAPC_Adelantos] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [SAPId] nvarchar(max)  NOT NULL,
    [PedidoEl] datetime  NOT NULL,
    [FondoFijo_Id] int  NOT NULL
);
GO

-- Creating table 'SAPC_Estados'
CREATE TABLE [dbo].[SAPC_Estados] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Codigo] nvarchar(max)  NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [EntityName] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'SAPC_AdelantosSAPC_SAPRPCCall'
CREATE TABLE [dbo].[SAPC_AdelantosSAPC_SAPRPCCall] (
    [Adelantos_Id] int  NOT NULL,
    [SAPRPCCall_Id] int  NOT NULL
);
GO

-- Creating table 'SAPC_RendicionGastosSAPC_SAPRPCCall'
CREATE TABLE [dbo].[SAPC_RendicionGastosSAPC_SAPRPCCall] (
    [RendicionesGastos_Id] int  NOT NULL,
    [SAPRPCCall_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'SAPC_RendicionGastos'
ALTER TABLE [dbo].[SAPC_RendicionGastos]
ADD CONSTRAINT [PK_SAPC_RendicionGastos]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'SAPC_FacturaProveedor'
ALTER TABLE [dbo].[SAPC_FacturaProveedor]
ADD CONSTRAINT [PK_SAPC_FacturaProveedor]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'SAPC_FondoFijo'
ALTER TABLE [dbo].[SAPC_FondoFijo]
ADD CONSTRAINT [PK_SAPC_FondoFijo]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'SAPC_Credentials'
ALTER TABLE [dbo].[SAPC_Credentials]
ADD CONSTRAINT [PK_SAPC_Credentials]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'SAPC_Session'
ALTER TABLE [dbo].[SAPC_Session]
ADD CONSTRAINT [PK_SAPC_Session]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'SAPC_SAPRPCCall'
ALTER TABLE [dbo].[SAPC_SAPRPCCall]
ADD CONSTRAINT [PK_SAPC_SAPRPCCall]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'SAPC_EndPoint'
ALTER TABLE [dbo].[SAPC_EndPoint]
ADD CONSTRAINT [PK_SAPC_EndPoint]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'SAPC_Adelantos'
ALTER TABLE [dbo].[SAPC_Adelantos]
ADD CONSTRAINT [PK_SAPC_Adelantos]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'SAPC_Estados'
ALTER TABLE [dbo].[SAPC_Estados]
ADD CONSTRAINT [PK_SAPC_Estados]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Adelantos_Id], [SAPRPCCall_Id] in table 'SAPC_AdelantosSAPC_SAPRPCCall'
ALTER TABLE [dbo].[SAPC_AdelantosSAPC_SAPRPCCall]
ADD CONSTRAINT [PK_SAPC_AdelantosSAPC_SAPRPCCall]
    PRIMARY KEY CLUSTERED ([Adelantos_Id], [SAPRPCCall_Id] ASC);
GO

-- Creating primary key on [RendicionesGastos_Id], [SAPRPCCall_Id] in table 'SAPC_RendicionGastosSAPC_SAPRPCCall'
ALTER TABLE [dbo].[SAPC_RendicionGastosSAPC_SAPRPCCall]
ADD CONSTRAINT [PK_SAPC_RendicionGastosSAPC_SAPRPCCall]
    PRIMARY KEY CLUSTERED ([RendicionesGastos_Id], [SAPRPCCall_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [FondoFijo_Id] in table 'SAPC_RendicionGastos'
ALTER TABLE [dbo].[SAPC_RendicionGastos]
ADD CONSTRAINT [FK_FondoFijoRendicionGastos]
    FOREIGN KEY ([FondoFijo_Id])
    REFERENCES [dbo].[SAPC_FondoFijo]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FondoFijoRendicionGastos'
CREATE INDEX [IX_FK_FondoFijoRendicionGastos]
ON [dbo].[SAPC_RendicionGastos]
    ([FondoFijo_Id]);
GO

-- Creating foreign key on [Estado_Id] in table 'SAPC_FondoFijo'
ALTER TABLE [dbo].[SAPC_FondoFijo]
ADD CONSTRAINT [FK_SAPC_EstadosSAPC_FondoFijo]
    FOREIGN KEY ([Estado_Id])
    REFERENCES [dbo].[SAPC_Estados]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SAPC_EstadosSAPC_FondoFijo'
CREATE INDEX [IX_FK_SAPC_EstadosSAPC_FondoFijo]
ON [dbo].[SAPC_FondoFijo]
    ([Estado_Id]);
GO

-- Creating foreign key on [EndPoint_Id] in table 'SAPC_Session'
ALTER TABLE [dbo].[SAPC_Session]
ADD CONSTRAINT [FK_SAPC_EndPointSAPC_Session]
    FOREIGN KEY ([EndPoint_Id])
    REFERENCES [dbo].[SAPC_EndPoint]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SAPC_EndPointSAPC_Session'
CREATE INDEX [IX_FK_SAPC_EndPointSAPC_Session]
ON [dbo].[SAPC_Session]
    ([EndPoint_Id]);
GO

-- Creating foreign key on [Credential_Id] in table 'SAPC_Session'
ALTER TABLE [dbo].[SAPC_Session]
ADD CONSTRAINT [FK_SAPC_CredentialsSAPC_Session]
    FOREIGN KEY ([Credential_Id])
    REFERENCES [dbo].[SAPC_Credentials]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SAPC_CredentialsSAPC_Session'
CREATE INDEX [IX_FK_SAPC_CredentialsSAPC_Session]
ON [dbo].[SAPC_Session]
    ([Credential_Id]);
GO

-- Creating foreign key on [EndPoint_Id] in table 'SAPC_FondoFijo'
ALTER TABLE [dbo].[SAPC_FondoFijo]
ADD CONSTRAINT [FK_SAPC_EndPointSAPC_FondoFijo]
    FOREIGN KEY ([EndPoint_Id])
    REFERENCES [dbo].[SAPC_EndPoint]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SAPC_EndPointSAPC_FondoFijo'
CREATE INDEX [IX_FK_SAPC_EndPointSAPC_FondoFijo]
ON [dbo].[SAPC_FondoFijo]
    ([EndPoint_Id]);
GO

-- Creating foreign key on [Credentials_Id] in table 'SAPC_FondoFijo'
ALTER TABLE [dbo].[SAPC_FondoFijo]
ADD CONSTRAINT [FK_SAPC_CredentialsSAPC_FondoFijo]
    FOREIGN KEY ([Credentials_Id])
    REFERENCES [dbo].[SAPC_Credentials]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SAPC_CredentialsSAPC_FondoFijo'
CREATE INDEX [IX_FK_SAPC_CredentialsSAPC_FondoFijo]
ON [dbo].[SAPC_FondoFijo]
    ([Credentials_Id]);
GO

-- Creating foreign key on [Session_Id] in table 'SAPC_SAPRPCCall'
ALTER TABLE [dbo].[SAPC_SAPRPCCall]
ADD CONSTRAINT [FK_SAPC_SessionSAPC_SAPRPCCall]
    FOREIGN KEY ([Session_Id])
    REFERENCES [dbo].[SAPC_Session]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SAPC_SessionSAPC_SAPRPCCall'
CREATE INDEX [IX_FK_SAPC_SessionSAPC_SAPRPCCall]
ON [dbo].[SAPC_SAPRPCCall]
    ([Session_Id]);
GO

-- Creating foreign key on [Adelantos_Id] in table 'SAPC_AdelantosSAPC_SAPRPCCall'
ALTER TABLE [dbo].[SAPC_AdelantosSAPC_SAPRPCCall]
ADD CONSTRAINT [FK_SAPC_AdelantosSAPC_SAPRPCCall_SAPC_Adelantos]
    FOREIGN KEY ([Adelantos_Id])
    REFERENCES [dbo].[SAPC_Adelantos]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [SAPRPCCall_Id] in table 'SAPC_AdelantosSAPC_SAPRPCCall'
ALTER TABLE [dbo].[SAPC_AdelantosSAPC_SAPRPCCall]
ADD CONSTRAINT [FK_SAPC_AdelantosSAPC_SAPRPCCall_SAPC_SAPRPCCall]
    FOREIGN KEY ([SAPRPCCall_Id])
    REFERENCES [dbo].[SAPC_SAPRPCCall]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SAPC_AdelantosSAPC_SAPRPCCall_SAPC_SAPRPCCall'
CREATE INDEX [IX_FK_SAPC_AdelantosSAPC_SAPRPCCall_SAPC_SAPRPCCall]
ON [dbo].[SAPC_AdelantosSAPC_SAPRPCCall]
    ([SAPRPCCall_Id]);
GO

-- Creating foreign key on [FondoFijo_Id] in table 'SAPC_Adelantos'
ALTER TABLE [dbo].[SAPC_Adelantos]
ADD CONSTRAINT [FK_SAPC_FondoFijoSAPC_Adelantos]
    FOREIGN KEY ([FondoFijo_Id])
    REFERENCES [dbo].[SAPC_FondoFijo]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SAPC_FondoFijoSAPC_Adelantos'
CREATE INDEX [IX_FK_SAPC_FondoFijoSAPC_Adelantos]
ON [dbo].[SAPC_Adelantos]
    ([FondoFijo_Id]);
GO

-- Creating foreign key on [RendicionesGastos_Id] in table 'SAPC_RendicionGastosSAPC_SAPRPCCall'
ALTER TABLE [dbo].[SAPC_RendicionGastosSAPC_SAPRPCCall]
ADD CONSTRAINT [FK_SAPC_RendicionGastosSAPC_SAPRPCCall_SAPC_RendicionGastos]
    FOREIGN KEY ([RendicionesGastos_Id])
    REFERENCES [dbo].[SAPC_RendicionGastos]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [SAPRPCCall_Id] in table 'SAPC_RendicionGastosSAPC_SAPRPCCall'
ALTER TABLE [dbo].[SAPC_RendicionGastosSAPC_SAPRPCCall]
ADD CONSTRAINT [FK_SAPC_RendicionGastosSAPC_SAPRPCCall_SAPC_SAPRPCCall]
    FOREIGN KEY ([SAPRPCCall_Id])
    REFERENCES [dbo].[SAPC_SAPRPCCall]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SAPC_RendicionGastosSAPC_SAPRPCCall_SAPC_SAPRPCCall'
CREATE INDEX [IX_FK_SAPC_RendicionGastosSAPC_SAPRPCCall_SAPC_SAPRPCCall]
ON [dbo].[SAPC_RendicionGastosSAPC_SAPRPCCall]
    ([SAPRPCCall_Id]);
GO

-- Creating foreign key on [Estado_Id] in table 'SAPC_RendicionGastos'
ALTER TABLE [dbo].[SAPC_RendicionGastos]
ADD CONSTRAINT [FK_SAPC_EstadosSAPC_RendicionGastos]
    FOREIGN KEY ([Estado_Id])
    REFERENCES [dbo].[SAPC_Estados]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SAPC_EstadosSAPC_RendicionGastos'
CREATE INDEX [IX_FK_SAPC_EstadosSAPC_RendicionGastos]
ON [dbo].[SAPC_RendicionGastos]
    ([Estado_Id]);
GO

-- Creating foreign key on [RendicionGastos_Id] in table 'SAPC_FacturaProveedor'
ALTER TABLE [dbo].[SAPC_FacturaProveedor]
ADD CONSTRAINT [FK_SAPC_RendicionGastosSAPC_FacturaProveedor]
    FOREIGN KEY ([RendicionGastos_Id])
    REFERENCES [dbo].[SAPC_RendicionGastos]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SAPC_RendicionGastosSAPC_FacturaProveedor'
CREATE INDEX [IX_FK_SAPC_RendicionGastosSAPC_FacturaProveedor]
ON [dbo].[SAPC_FacturaProveedor]
    ([RendicionGastos_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------