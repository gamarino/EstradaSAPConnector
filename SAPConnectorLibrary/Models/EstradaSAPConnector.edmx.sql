
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 12/04/2017 17:08:15
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
IF OBJECT_ID(N'[dbo].[FK_RendicionGastosSAPRPCCall_RendicionGastos]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[RendicionGastosSAPRPCCall] DROP CONSTRAINT [FK_RendicionGastosSAPRPCCall_RendicionGastos];
GO
IF OBJECT_ID(N'[dbo].[FK_RendicionGastosSAPRPCCall_SAPRPCCall]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[RendicionGastosSAPRPCCall] DROP CONSTRAINT [FK_RendicionGastosSAPRPCCall_SAPRPCCall];
GO
IF OBJECT_ID(N'[dbo].[FK_EstadoFondoFijoFondoFijo]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SAPC_FondoFijo] DROP CONSTRAINT [FK_EstadoFondoFijoFondoFijo];
GO
IF OBJECT_ID(N'[dbo].[FK_AdelantosSAPRPCCall_Adelantos]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AdelantosSAPRPCCall] DROP CONSTRAINT [FK_AdelantosSAPRPCCall_Adelantos];
GO
IF OBJECT_ID(N'[dbo].[FK_AdelantosSAPRPCCall_SAPRPCCall]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AdelantosSAPRPCCall] DROP CONSTRAINT [FK_AdelantosSAPRPCCall_SAPRPCCall];
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
IF OBJECT_ID(N'[dbo].[RendicionGastosSAPRPCCall]', 'U') IS NOT NULL
    DROP TABLE [dbo].[RendicionGastosSAPRPCCall];
GO
IF OBJECT_ID(N'[dbo].[AdelantosSAPRPCCall]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AdelantosSAPRPCCall];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'SAPC_RendicionGastos'
CREATE TABLE [dbo].[SAPC_RendicionGastos] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Username] nvarchar(max)  NOT NULL,
    [FondoFijo_Id] int  NOT NULL,
    [EstadoFondoFijoes_Id] int  NOT NULL
);
GO

-- Creating table 'SAPC_FacturaProveedor'
CREATE TABLE [dbo].[SAPC_FacturaProveedor] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [RendicionGasto_Id] int  NOT NULL
);
GO

-- Creating table 'SAPC_FondoFijo'
CREATE TABLE [dbo].[SAPC_FondoFijo] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [Estado] nvarchar(max)  NOT NULL,
    [CreadoEn] nvarchar(max)  NOT NULL,
    [SAPId] nvarchar(max)  NOT NULL,
    [EstadoFondoFijo_Id] int  NOT NULL,
    [SAPCredentials_Id] int  NOT NULL,
    [SAPEndPoints_Id] int  NOT NULL
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
    [SAPEndPoint_Id] int  NOT NULL,
    [SAPCredential_Id] int  NOT NULL
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
    [SAPSession_Id] int  NOT NULL
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

-- Creating table 'RendicionGastosSAPRPCCall'
CREATE TABLE [dbo].[RendicionGastosSAPRPCCall] (
    [RendicionGasto_Id] int  NOT NULL,
    [SAPRPCCalls_Id] int  NOT NULL
);
GO

-- Creating table 'AdelantosSAPRPCCall'
CREATE TABLE [dbo].[AdelantosSAPRPCCall] (
    [Adelanto_Id] int  NOT NULL,
    [SAPRPCCalls_Id] int  NOT NULL
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

-- Creating primary key on [RendicionGasto_Id], [SAPRPCCalls_Id] in table 'RendicionGastosSAPRPCCall'
ALTER TABLE [dbo].[RendicionGastosSAPRPCCall]
ADD CONSTRAINT [PK_RendicionGastosSAPRPCCall]
    PRIMARY KEY CLUSTERED ([RendicionGasto_Id], [SAPRPCCalls_Id] ASC);
GO

-- Creating primary key on [Adelanto_Id], [SAPRPCCalls_Id] in table 'AdelantosSAPRPCCall'
ALTER TABLE [dbo].[AdelantosSAPRPCCall]
ADD CONSTRAINT [PK_AdelantosSAPRPCCall]
    PRIMARY KEY CLUSTERED ([Adelanto_Id], [SAPRPCCalls_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [SAPEndPoint_Id] in table 'SAPC_Session'
ALTER TABLE [dbo].[SAPC_Session]
ADD CONSTRAINT [FK_SAPEndPointSAPSession]
    FOREIGN KEY ([SAPEndPoint_Id])
    REFERENCES [dbo].[SAPC_EndPoint]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SAPEndPointSAPSession'
CREATE INDEX [IX_FK_SAPEndPointSAPSession]
ON [dbo].[SAPC_Session]
    ([SAPEndPoint_Id]);
GO

-- Creating foreign key on [SAPCredential_Id] in table 'SAPC_Session'
ALTER TABLE [dbo].[SAPC_Session]
ADD CONSTRAINT [FK_SAPCredentialsSAPSession]
    FOREIGN KEY ([SAPCredential_Id])
    REFERENCES [dbo].[SAPC_Credentials]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SAPCredentialsSAPSession'
CREATE INDEX [IX_FK_SAPCredentialsSAPSession]
ON [dbo].[SAPC_Session]
    ([SAPCredential_Id]);
GO

-- Creating foreign key on [SAPSession_Id] in table 'SAPC_SAPRPCCall'
ALTER TABLE [dbo].[SAPC_SAPRPCCall]
ADD CONSTRAINT [FK_SAPSessionSAPRPCCall]
    FOREIGN KEY ([SAPSession_Id])
    REFERENCES [dbo].[SAPC_Session]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SAPSessionSAPRPCCall'
CREATE INDEX [IX_FK_SAPSessionSAPRPCCall]
ON [dbo].[SAPC_SAPRPCCall]
    ([SAPSession_Id]);
GO

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

-- Creating foreign key on [RendicionGasto_Id] in table 'SAPC_FacturaProveedor'
ALTER TABLE [dbo].[SAPC_FacturaProveedor]
ADD CONSTRAINT [FK_RendicionGastosFacturaProveedor]
    FOREIGN KEY ([RendicionGasto_Id])
    REFERENCES [dbo].[SAPC_RendicionGastos]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RendicionGastosFacturaProveedor'
CREATE INDEX [IX_FK_RendicionGastosFacturaProveedor]
ON [dbo].[SAPC_FacturaProveedor]
    ([RendicionGasto_Id]);
GO

-- Creating foreign key on [FondoFijo_Id] in table 'SAPC_Adelantos'
ALTER TABLE [dbo].[SAPC_Adelantos]
ADD CONSTRAINT [FK_FondoFijoAdelantos]
    FOREIGN KEY ([FondoFijo_Id])
    REFERENCES [dbo].[SAPC_FondoFijo]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FondoFijoAdelantos'
CREATE INDEX [IX_FK_FondoFijoAdelantos]
ON [dbo].[SAPC_Adelantos]
    ([FondoFijo_Id]);
GO

-- Creating foreign key on [RendicionGasto_Id] in table 'RendicionGastosSAPRPCCall'
ALTER TABLE [dbo].[RendicionGastosSAPRPCCall]
ADD CONSTRAINT [FK_RendicionGastosSAPRPCCall_RendicionGastos]
    FOREIGN KEY ([RendicionGasto_Id])
    REFERENCES [dbo].[SAPC_RendicionGastos]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [SAPRPCCalls_Id] in table 'RendicionGastosSAPRPCCall'
ALTER TABLE [dbo].[RendicionGastosSAPRPCCall]
ADD CONSTRAINT [FK_RendicionGastosSAPRPCCall_SAPRPCCall]
    FOREIGN KEY ([SAPRPCCalls_Id])
    REFERENCES [dbo].[SAPC_SAPRPCCall]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RendicionGastosSAPRPCCall_SAPRPCCall'
CREATE INDEX [IX_FK_RendicionGastosSAPRPCCall_SAPRPCCall]
ON [dbo].[RendicionGastosSAPRPCCall]
    ([SAPRPCCalls_Id]);
GO

-- Creating foreign key on [EstadoFondoFijo_Id] in table 'SAPC_FondoFijo'
ALTER TABLE [dbo].[SAPC_FondoFijo]
ADD CONSTRAINT [FK_EstadoFondoFijoFondoFijo]
    FOREIGN KEY ([EstadoFondoFijo_Id])
    REFERENCES [dbo].[SAPC_Estados]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EstadoFondoFijoFondoFijo'
CREATE INDEX [IX_FK_EstadoFondoFijoFondoFijo]
ON [dbo].[SAPC_FondoFijo]
    ([EstadoFondoFijo_Id]);
GO

-- Creating foreign key on [Adelanto_Id] in table 'AdelantosSAPRPCCall'
ALTER TABLE [dbo].[AdelantosSAPRPCCall]
ADD CONSTRAINT [FK_AdelantosSAPRPCCall_Adelantos]
    FOREIGN KEY ([Adelanto_Id])
    REFERENCES [dbo].[SAPC_Adelantos]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [SAPRPCCalls_Id] in table 'AdelantosSAPRPCCall'
ALTER TABLE [dbo].[AdelantosSAPRPCCall]
ADD CONSTRAINT [FK_AdelantosSAPRPCCall_SAPRPCCall]
    FOREIGN KEY ([SAPRPCCalls_Id])
    REFERENCES [dbo].[SAPC_SAPRPCCall]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AdelantosSAPRPCCall_SAPRPCCall'
CREATE INDEX [IX_FK_AdelantosSAPRPCCall_SAPRPCCall]
ON [dbo].[AdelantosSAPRPCCall]
    ([SAPRPCCalls_Id]);
GO

-- Creating foreign key on [SAPCredentials_Id] in table 'SAPC_FondoFijo'
ALTER TABLE [dbo].[SAPC_FondoFijo]
ADD CONSTRAINT [FK_FondoFijoSAPCredentials]
    FOREIGN KEY ([SAPCredentials_Id])
    REFERENCES [dbo].[SAPC_Credentials]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FondoFijoSAPCredentials'
CREATE INDEX [IX_FK_FondoFijoSAPCredentials]
ON [dbo].[SAPC_FondoFijo]
    ([SAPCredentials_Id]);
GO

-- Creating foreign key on [SAPEndPoints_Id] in table 'SAPC_FondoFijo'
ALTER TABLE [dbo].[SAPC_FondoFijo]
ADD CONSTRAINT [FK_FondoFijoSAPEndPoint]
    FOREIGN KEY ([SAPEndPoints_Id])
    REFERENCES [dbo].[SAPC_EndPoint]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FondoFijoSAPEndPoint'
CREATE INDEX [IX_FK_FondoFijoSAPEndPoint]
ON [dbo].[SAPC_FondoFijo]
    ([SAPEndPoints_Id]);
GO

-- Creating foreign key on [EstadoFondoFijoes_Id] in table 'SAPC_RendicionGastos'
ALTER TABLE [dbo].[SAPC_RendicionGastos]
ADD CONSTRAINT [FK_RendicionGastosEstadoFondoFijo]
    FOREIGN KEY ([EstadoFondoFijoes_Id])
    REFERENCES [dbo].[SAPC_Estados]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RendicionGastosEstadoFondoFijo'
CREATE INDEX [IX_FK_RendicionGastosEstadoFondoFijo]
ON [dbo].[SAPC_RendicionGastos]
    ([EstadoFondoFijoes_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------