
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 06/19/2018 22:41:39
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

IF OBJECT_ID(N'[dbo].[FK_FondoFijoRendicionGastos]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SAPC_RendicionABC] DROP CONSTRAINT [FK_FondoFijoRendicionGastos];
GO
IF OBJECT_ID(N'[dbo].[FK_SAPC_EstadosSAPC_FondoFijo]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SAPC_FondoFijo] DROP CONSTRAINT [FK_SAPC_EstadosSAPC_FondoFijo];
GO
IF OBJECT_ID(N'[dbo].[FK_SAPC_EndPointSAPC_Session]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SAPC_Session] DROP CONSTRAINT [FK_SAPC_EndPointSAPC_Session];
GO
IF OBJECT_ID(N'[dbo].[FK_SAPC_EndPointSAPC_FondoFijo]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SAPC_FondoFijo] DROP CONSTRAINT [FK_SAPC_EndPointSAPC_FondoFijo];
GO
IF OBJECT_ID(N'[dbo].[FK_SAPC_SessionSAPC_SAPRPCCall]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SAPC_SAPRPCCall] DROP CONSTRAINT [FK_SAPC_SessionSAPC_SAPRPCCall];
GO
IF OBJECT_ID(N'[dbo].[FK_SAPC_AdelantosSAPC_SAPRPCCall]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SAPC_SAPRPCCall] DROP CONSTRAINT [FK_SAPC_AdelantosSAPC_SAPRPCCall];
GO
IF OBJECT_ID(N'[dbo].[FK_SAPC_FondoFijoSAPC_Adelantos]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SAPC_Adelantos] DROP CONSTRAINT [FK_SAPC_FondoFijoSAPC_Adelantos];
GO
IF OBJECT_ID(N'[dbo].[FK_SAPC_RendicionGastosSAPC_SAPRPCCall]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SAPC_SAPRPCCall] DROP CONSTRAINT [FK_SAPC_RendicionGastosSAPC_SAPRPCCall];
GO
IF OBJECT_ID(N'[dbo].[FK_SAPC_EstadosSAPC_RendicionGastos]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SAPC_RendicionABC] DROP CONSTRAINT [FK_SAPC_EstadosSAPC_RendicionGastos];
GO
IF OBJECT_ID(N'[dbo].[FK_SAPC_RendicionGastosSAPC_FacturaProveedor]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SAPC_FacturaProveedor] DROP CONSTRAINT [FK_SAPC_RendicionGastosSAPC_FacturaProveedor];
GO
IF OBJECT_ID(N'[dbo].[FK_SAPC_EstadosSAPC_Adelantos]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SAPC_Adelantos] DROP CONSTRAINT [FK_SAPC_EstadosSAPC_Adelantos];
GO
IF OBJECT_ID(N'[dbo].[FK_SAPC_EndPointSAPC_SAPRPCCall]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SAPC_SAPRPCCall] DROP CONSTRAINT [FK_SAPC_EndPointSAPC_SAPRPCCall];
GO
IF OBJECT_ID(N'[dbo].[FK_SAPC_ProveedorSAPC_FacturaProveedor]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SAPC_FacturaProveedor] DROP CONSTRAINT [FK_SAPC_ProveedorSAPC_FacturaProveedor];
GO
IF OBJECT_ID(N'[dbo].[FK_InputacionesSAPC_FacturaProveedor]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SAPC_Inputaciones] DROP CONSTRAINT [FK_InputacionesSAPC_FacturaProveedor];
GO
IF OBJECT_ID(N'[dbo].[FK_SAPC_EmpleadoSAPC_FacturaProveedor]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SAPC_FacturaProveedor] DROP CONSTRAINT [FK_SAPC_EmpleadoSAPC_FacturaProveedor];
GO
IF OBJECT_ID(N'[dbo].[FK_SAPC_EmpleadoSAPC_RendicionABC]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SAPC_RendicionABC] DROP CONSTRAINT [FK_SAPC_EmpleadoSAPC_RendicionABC];
GO
IF OBJECT_ID(N'[dbo].[FK_SAPC_AdelantosSAPC_Empleado]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SAPC_Adelantos] DROP CONSTRAINT [FK_SAPC_AdelantosSAPC_Empleado];
GO
IF OBJECT_ID(N'[dbo].[FK_SAPC_EndPointSAPC_Empleado]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SAPC_Empleado] DROP CONSTRAINT [FK_SAPC_EndPointSAPC_Empleado];
GO
IF OBJECT_ID(N'[dbo].[FK_SAPC_FacturaProveedorSAPC_Estados]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SAPC_FacturaProveedor] DROP CONSTRAINT [FK_SAPC_FacturaProveedorSAPC_Estados];
GO
IF OBJECT_ID(N'[dbo].[FK_SAPC_FacturaProveedorSAPC_SAPRPCCall]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SAPC_SAPRPCCall] DROP CONSTRAINT [FK_SAPC_FacturaProveedorSAPC_SAPRPCCall];
GO
IF OBJECT_ID(N'[dbo].[FK_SAPC_SociedadesSAPC_FacturaProveedor]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SAPC_FacturaProveedor] DROP CONSTRAINT [FK_SAPC_SociedadesSAPC_FacturaProveedor];
GO
IF OBJECT_ID(N'[dbo].[FK_SAPC_ClaseDocSAPC_FacturaProveedor]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SAPC_FacturaProveedor] DROP CONSTRAINT [FK_SAPC_ClaseDocSAPC_FacturaProveedor];
GO
IF OBJECT_ID(N'[dbo].[FK_SAPC_MonedasSAPC_FacturaProveedor]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SAPC_FacturaProveedor] DROP CONSTRAINT [FK_SAPC_MonedasSAPC_FacturaProveedor];
GO
IF OBJECT_ID(N'[dbo].[FK_SAPC_CECOSAPC_Inputaciones]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SAPC_Inputaciones] DROP CONSTRAINT [FK_SAPC_CECOSAPC_Inputaciones];
GO
IF OBJECT_ID(N'[dbo].[FK_SAPC_SAPRPCCallSAPC_Results]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SAPC_Results] DROP CONSTRAINT [FK_SAPC_SAPRPCCallSAPC_Results];
GO
IF OBJECT_ID(N'[dbo].[FK_SAPC_PaisesSAPC_Poblaciones]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SAPC_Poblaciones] DROP CONSTRAINT [FK_SAPC_PaisesSAPC_Poblaciones];
GO
IF OBJECT_ID(N'[dbo].[FK_SAPC_PoblacionesSAPC_Proveedores]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SAPC_Proveedores] DROP CONSTRAINT [FK_SAPC_PoblacionesSAPC_Proveedores];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[SAPC_RendicionABC]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SAPC_RendicionABC];
GO
IF OBJECT_ID(N'[dbo].[SAPC_FacturaProveedor]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SAPC_FacturaProveedor];
GO
IF OBJECT_ID(N'[dbo].[SAPC_FondoFijo]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SAPC_FondoFijo];
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
IF OBJECT_ID(N'[dbo].[SAPC_Proveedores]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SAPC_Proveedores];
GO
IF OBJECT_ID(N'[dbo].[SAPC_Empleado]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SAPC_Empleado];
GO
IF OBJECT_ID(N'[dbo].[SAPC_CECO]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SAPC_CECO];
GO
IF OBJECT_ID(N'[dbo].[SAPC_Inputaciones]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SAPC_Inputaciones];
GO
IF OBJECT_ID(N'[dbo].[SAPC_Sociedades]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SAPC_Sociedades];
GO
IF OBJECT_ID(N'[dbo].[SAPC_ClaseDoc]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SAPC_ClaseDoc];
GO
IF OBJECT_ID(N'[dbo].[SAPC_Monedas]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SAPC_Monedas];
GO
IF OBJECT_ID(N'[dbo].[SAPC_Paises]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SAPC_Paises];
GO
IF OBJECT_ID(N'[dbo].[SAPC_Results]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SAPC_Results];
GO
IF OBJECT_ID(N'[dbo].[SAPC_Poblaciones]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SAPC_Poblaciones];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'SAPC_RendicionABC'
CREATE TABLE [dbo].[SAPC_RendicionABC] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [SAPNroDoc] nvarchar(max)  NULL,
    [Fecha] datetime  NOT NULL,
    [FondoFijo_Id] int  NULL,
    [Estado_Id] int  NOT NULL,
    [RendidoPor_Id] int  NULL
);
GO

-- Creating table 'SAPC_FacturaProveedor'
CREATE TABLE [dbo].[SAPC_FacturaProveedor] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [FechaContable] datetime  NOT NULL,
    [FechaFactura] nvarchar(max)  NOT NULL,
    [Referencia] nvarchar(max)  NOT NULL,
    [Importe] decimal(18,0)  NOT NULL,
    [Texto] nvarchar(max)  NOT NULL,
    [CAE] nvarchar(max)  NOT NULL,
    [CAEVto] datetime  NOT NULL,
    [RendicionGastos_Id] int  NOT NULL,
    [Proveedor_Id] int  NOT NULL,
    [SAPC_EmpleadoSAPC_FacturaProveedor_SAPC_FacturaProveedor_Id] int  NOT NULL,
    [Estado_Id] int  NOT NULL,
    [Sociedad_Id] int  NOT NULL,
    [ClaseDoc_Id] int  NOT NULL,
    [Moneda_Id] int  NOT NULL
);
GO

-- Creating table 'SAPC_FondoFijo'
CREATE TABLE [dbo].[SAPC_FondoFijo] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [CreadoEn] datetime  NOT NULL,
    [SAPId] nvarchar(max)  NOT NULL,
    [Estado_Id] int  NOT NULL,
    [EndPoint_Id] int  NOT NULL
);
GO

-- Creating table 'SAPC_Session'
CREATE TABLE [dbo].[SAPC_Session] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Comienzo] datetime  NOT NULL,
    [Final] datetime  NOT NULL,
    [ErrorMessage] nvarchar(max)  NOT NULL,
    [ErrorCode] nvarchar(max)  NOT NULL,
    [EndPoint_Id] int  NOT NULL
);
GO

-- Creating table 'SAPC_SAPRPCCall'
CREATE TABLE [dbo].[SAPC_SAPRPCCall] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Method] nvarchar(max)  NOT NULL,
    [StartedOn] datetime  NOT NULL,
    [FinishedOn] datetime  NOT NULL,
    [ErrorCode] nvarchar(max)  NOT NULL,
    [ErrorMsg] nvarchar(max)  NOT NULL,
    [InputParameters] nvarchar(max)  NOT NULL,
    [Session_Id] int  NOT NULL,
    [Adelanto_Id] int  NULL,
    [RendicionGastos_Id] int  NULL,
    [EndPoint_Id] int  NOT NULL,
    [FacturaProveedor_Id] int  NULL
);
GO

-- Creating table 'SAPC_EndPoint'
CREATE TABLE [dbo].[SAPC_EndPoint] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [URLAdelantos] nvarchar(max)  NOT NULL,
    [LastConnectionOn] datetime  NULL,
    [URLRendicionABC] nvarchar(max)  NOT NULL,
    [URLRendicionNoABC] nvarchar(max)  NOT NULL,
    [LoginName] nvarchar(max)  NOT NULL,
    [LoginPassword] nvarchar(max)  NOT NULL,
    [URLProveedores] nvarchar(max)  NOT NULL,
    [UltActProveedores] datetime  NOT NULL
);
GO

-- Creating table 'SAPC_Adelantos'
CREATE TABLE [dbo].[SAPC_Adelantos] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [SAPNroDoc] nvarchar(max)  NULL,
    [Fecha] datetime  NOT NULL,
    [Importe] decimal(18,0)  NOT NULL,
    [FechaVto] datetime  NOT NULL,
    [FondoFijo_Id] int  NULL,
    [Estado_Id] int  NOT NULL,
    [PedidoPorEmpleado_Id] int  NULL
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

-- Creating table 'SAPC_Proveedores'
CREATE TABLE [dbo].[SAPC_Proveedores] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [CUIT] nvarchar(max)  NOT NULL,
    [CtaContable] nvarchar(max)  NOT NULL,
    [SAPId] nvarchar(max)  NOT NULL,
    [Calle] nvarchar(max)  NOT NULL,
    [CPostal] nvarchar(max)  NOT NULL,
    [Flag] bit  NOT NULL,
    [Telefono] nvarchar(max)  NOT NULL,
    [UltimaActualizacion] datetime  NOT NULL,
    [Mail] nvarchar(max)  NOT NULL,
    [Poblacion_Id] int  NOT NULL
);
GO

-- Creating table 'SAPC_Empleado'
CREATE TABLE [dbo].[SAPC_Empleado] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [DNI] nvarchar(max)  NOT NULL,
    [CtaContable] nvarchar(max)  NOT NULL,
    [NroEmpleado] nvarchar(max)  NOT NULL,
    [SAPEndPoint_Id] int  NOT NULL
);
GO

-- Creating table 'SAPC_CECO'
CREATE TABLE [dbo].[SAPC_CECO] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [CodCECO] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'SAPC_Inputaciones'
CREATE TABLE [dbo].[SAPC_Inputaciones] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [CtaContable] nvarchar(max)  NOT NULL,
    [Importe] decimal(18,0)  NOT NULL,
    [InputacionesSAPC_FacturaProveedor_Percepciones_Id] int  NOT NULL,
    [CECO_Id] int  NOT NULL
);
GO

-- Creating table 'SAPC_Sociedades'
CREATE TABLE [dbo].[SAPC_Sociedades] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Codigo] nvarchar(max)  NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'SAPC_ClaseDoc'
CREATE TABLE [dbo].[SAPC_ClaseDoc] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Codigo] nvarchar(max)  NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'SAPC_Monedas'
CREATE TABLE [dbo].[SAPC_Monedas] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Codigo] nvarchar(max)  NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'SAPC_Paises'
CREATE TABLE [dbo].[SAPC_Paises] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Codigo] nvarchar(max)  NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'SAPC_Results'
CREATE TABLE [dbo].[SAPC_Results] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Message] nvarchar(max)  NOT NULL,
    [SAPRPCCall_Id] int  NOT NULL
);
GO

-- Creating table 'SAPC_Poblaciones'
CREATE TABLE [dbo].[SAPC_Poblaciones] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Codigo] nvarchar(max)  NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [Pais_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'SAPC_RendicionABC'
ALTER TABLE [dbo].[SAPC_RendicionABC]
ADD CONSTRAINT [PK_SAPC_RendicionABC]
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

-- Creating primary key on [Id] in table 'SAPC_Proveedores'
ALTER TABLE [dbo].[SAPC_Proveedores]
ADD CONSTRAINT [PK_SAPC_Proveedores]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'SAPC_Empleado'
ALTER TABLE [dbo].[SAPC_Empleado]
ADD CONSTRAINT [PK_SAPC_Empleado]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'SAPC_CECO'
ALTER TABLE [dbo].[SAPC_CECO]
ADD CONSTRAINT [PK_SAPC_CECO]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'SAPC_Inputaciones'
ALTER TABLE [dbo].[SAPC_Inputaciones]
ADD CONSTRAINT [PK_SAPC_Inputaciones]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'SAPC_Sociedades'
ALTER TABLE [dbo].[SAPC_Sociedades]
ADD CONSTRAINT [PK_SAPC_Sociedades]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'SAPC_ClaseDoc'
ALTER TABLE [dbo].[SAPC_ClaseDoc]
ADD CONSTRAINT [PK_SAPC_ClaseDoc]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'SAPC_Monedas'
ALTER TABLE [dbo].[SAPC_Monedas]
ADD CONSTRAINT [PK_SAPC_Monedas]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'SAPC_Paises'
ALTER TABLE [dbo].[SAPC_Paises]
ADD CONSTRAINT [PK_SAPC_Paises]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'SAPC_Results'
ALTER TABLE [dbo].[SAPC_Results]
ADD CONSTRAINT [PK_SAPC_Results]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'SAPC_Poblaciones'
ALTER TABLE [dbo].[SAPC_Poblaciones]
ADD CONSTRAINT [PK_SAPC_Poblaciones]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [FondoFijo_Id] in table 'SAPC_RendicionABC'
ALTER TABLE [dbo].[SAPC_RendicionABC]
ADD CONSTRAINT [FK_FondoFijoRendicionGastos]
    FOREIGN KEY ([FondoFijo_Id])
    REFERENCES [dbo].[SAPC_FondoFijo]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FondoFijoRendicionGastos'
CREATE INDEX [IX_FK_FondoFijoRendicionGastos]
ON [dbo].[SAPC_RendicionABC]
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

-- Creating foreign key on [Adelanto_Id] in table 'SAPC_SAPRPCCall'
ALTER TABLE [dbo].[SAPC_SAPRPCCall]
ADD CONSTRAINT [FK_SAPC_AdelantosSAPC_SAPRPCCall]
    FOREIGN KEY ([Adelanto_Id])
    REFERENCES [dbo].[SAPC_Adelantos]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SAPC_AdelantosSAPC_SAPRPCCall'
CREATE INDEX [IX_FK_SAPC_AdelantosSAPC_SAPRPCCall]
ON [dbo].[SAPC_SAPRPCCall]
    ([Adelanto_Id]);
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

-- Creating foreign key on [RendicionGastos_Id] in table 'SAPC_SAPRPCCall'
ALTER TABLE [dbo].[SAPC_SAPRPCCall]
ADD CONSTRAINT [FK_SAPC_RendicionGastosSAPC_SAPRPCCall]
    FOREIGN KEY ([RendicionGastos_Id])
    REFERENCES [dbo].[SAPC_RendicionABC]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SAPC_RendicionGastosSAPC_SAPRPCCall'
CREATE INDEX [IX_FK_SAPC_RendicionGastosSAPC_SAPRPCCall]
ON [dbo].[SAPC_SAPRPCCall]
    ([RendicionGastos_Id]);
GO

-- Creating foreign key on [Estado_Id] in table 'SAPC_RendicionABC'
ALTER TABLE [dbo].[SAPC_RendicionABC]
ADD CONSTRAINT [FK_SAPC_EstadosSAPC_RendicionGastos]
    FOREIGN KEY ([Estado_Id])
    REFERENCES [dbo].[SAPC_Estados]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SAPC_EstadosSAPC_RendicionGastos'
CREATE INDEX [IX_FK_SAPC_EstadosSAPC_RendicionGastos]
ON [dbo].[SAPC_RendicionABC]
    ([Estado_Id]);
GO

-- Creating foreign key on [RendicionGastos_Id] in table 'SAPC_FacturaProveedor'
ALTER TABLE [dbo].[SAPC_FacturaProveedor]
ADD CONSTRAINT [FK_SAPC_RendicionGastosSAPC_FacturaProveedor]
    FOREIGN KEY ([RendicionGastos_Id])
    REFERENCES [dbo].[SAPC_RendicionABC]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SAPC_RendicionGastosSAPC_FacturaProveedor'
CREATE INDEX [IX_FK_SAPC_RendicionGastosSAPC_FacturaProveedor]
ON [dbo].[SAPC_FacturaProveedor]
    ([RendicionGastos_Id]);
GO

-- Creating foreign key on [Estado_Id] in table 'SAPC_Adelantos'
ALTER TABLE [dbo].[SAPC_Adelantos]
ADD CONSTRAINT [FK_SAPC_EstadosSAPC_Adelantos]
    FOREIGN KEY ([Estado_Id])
    REFERENCES [dbo].[SAPC_Estados]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SAPC_EstadosSAPC_Adelantos'
CREATE INDEX [IX_FK_SAPC_EstadosSAPC_Adelantos]
ON [dbo].[SAPC_Adelantos]
    ([Estado_Id]);
GO

-- Creating foreign key on [EndPoint_Id] in table 'SAPC_SAPRPCCall'
ALTER TABLE [dbo].[SAPC_SAPRPCCall]
ADD CONSTRAINT [FK_SAPC_EndPointSAPC_SAPRPCCall]
    FOREIGN KEY ([EndPoint_Id])
    REFERENCES [dbo].[SAPC_EndPoint]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SAPC_EndPointSAPC_SAPRPCCall'
CREATE INDEX [IX_FK_SAPC_EndPointSAPC_SAPRPCCall]
ON [dbo].[SAPC_SAPRPCCall]
    ([EndPoint_Id]);
GO

-- Creating foreign key on [Proveedor_Id] in table 'SAPC_FacturaProveedor'
ALTER TABLE [dbo].[SAPC_FacturaProveedor]
ADD CONSTRAINT [FK_SAPC_ProveedorSAPC_FacturaProveedor]
    FOREIGN KEY ([Proveedor_Id])
    REFERENCES [dbo].[SAPC_Proveedores]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SAPC_ProveedorSAPC_FacturaProveedor'
CREATE INDEX [IX_FK_SAPC_ProveedorSAPC_FacturaProveedor]
ON [dbo].[SAPC_FacturaProveedor]
    ([Proveedor_Id]);
GO

-- Creating foreign key on [InputacionesSAPC_FacturaProveedor_Percepciones_Id] in table 'SAPC_Inputaciones'
ALTER TABLE [dbo].[SAPC_Inputaciones]
ADD CONSTRAINT [FK_InputacionesSAPC_FacturaProveedor]
    FOREIGN KEY ([InputacionesSAPC_FacturaProveedor_Percepciones_Id])
    REFERENCES [dbo].[SAPC_FacturaProveedor]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_InputacionesSAPC_FacturaProveedor'
CREATE INDEX [IX_FK_InputacionesSAPC_FacturaProveedor]
ON [dbo].[SAPC_Inputaciones]
    ([InputacionesSAPC_FacturaProveedor_Percepciones_Id]);
GO

-- Creating foreign key on [SAPC_EmpleadoSAPC_FacturaProveedor_SAPC_FacturaProveedor_Id] in table 'SAPC_FacturaProveedor'
ALTER TABLE [dbo].[SAPC_FacturaProveedor]
ADD CONSTRAINT [FK_SAPC_EmpleadoSAPC_FacturaProveedor]
    FOREIGN KEY ([SAPC_EmpleadoSAPC_FacturaProveedor_SAPC_FacturaProveedor_Id])
    REFERENCES [dbo].[SAPC_Empleado]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SAPC_EmpleadoSAPC_FacturaProveedor'
CREATE INDEX [IX_FK_SAPC_EmpleadoSAPC_FacturaProveedor]
ON [dbo].[SAPC_FacturaProveedor]
    ([SAPC_EmpleadoSAPC_FacturaProveedor_SAPC_FacturaProveedor_Id]);
GO

-- Creating foreign key on [RendidoPor_Id] in table 'SAPC_RendicionABC'
ALTER TABLE [dbo].[SAPC_RendicionABC]
ADD CONSTRAINT [FK_SAPC_EmpleadoSAPC_RendicionABC]
    FOREIGN KEY ([RendidoPor_Id])
    REFERENCES [dbo].[SAPC_Empleado]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SAPC_EmpleadoSAPC_RendicionABC'
CREATE INDEX [IX_FK_SAPC_EmpleadoSAPC_RendicionABC]
ON [dbo].[SAPC_RendicionABC]
    ([RendidoPor_Id]);
GO

-- Creating foreign key on [PedidoPorEmpleado_Id] in table 'SAPC_Adelantos'
ALTER TABLE [dbo].[SAPC_Adelantos]
ADD CONSTRAINT [FK_SAPC_AdelantosSAPC_Empleado]
    FOREIGN KEY ([PedidoPorEmpleado_Id])
    REFERENCES [dbo].[SAPC_Empleado]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SAPC_AdelantosSAPC_Empleado'
CREATE INDEX [IX_FK_SAPC_AdelantosSAPC_Empleado]
ON [dbo].[SAPC_Adelantos]
    ([PedidoPorEmpleado_Id]);
GO

-- Creating foreign key on [SAPEndPoint_Id] in table 'SAPC_Empleado'
ALTER TABLE [dbo].[SAPC_Empleado]
ADD CONSTRAINT [FK_SAPC_EndPointSAPC_Empleado]
    FOREIGN KEY ([SAPEndPoint_Id])
    REFERENCES [dbo].[SAPC_EndPoint]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SAPC_EndPointSAPC_Empleado'
CREATE INDEX [IX_FK_SAPC_EndPointSAPC_Empleado]
ON [dbo].[SAPC_Empleado]
    ([SAPEndPoint_Id]);
GO

-- Creating foreign key on [Estado_Id] in table 'SAPC_FacturaProveedor'
ALTER TABLE [dbo].[SAPC_FacturaProveedor]
ADD CONSTRAINT [FK_SAPC_FacturaProveedorSAPC_Estados]
    FOREIGN KEY ([Estado_Id])
    REFERENCES [dbo].[SAPC_Estados]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SAPC_FacturaProveedorSAPC_Estados'
CREATE INDEX [IX_FK_SAPC_FacturaProveedorSAPC_Estados]
ON [dbo].[SAPC_FacturaProveedor]
    ([Estado_Id]);
GO

-- Creating foreign key on [FacturaProveedor_Id] in table 'SAPC_SAPRPCCall'
ALTER TABLE [dbo].[SAPC_SAPRPCCall]
ADD CONSTRAINT [FK_SAPC_FacturaProveedorSAPC_SAPRPCCall]
    FOREIGN KEY ([FacturaProveedor_Id])
    REFERENCES [dbo].[SAPC_FacturaProveedor]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SAPC_FacturaProveedorSAPC_SAPRPCCall'
CREATE INDEX [IX_FK_SAPC_FacturaProveedorSAPC_SAPRPCCall]
ON [dbo].[SAPC_SAPRPCCall]
    ([FacturaProveedor_Id]);
GO

-- Creating foreign key on [Sociedad_Id] in table 'SAPC_FacturaProveedor'
ALTER TABLE [dbo].[SAPC_FacturaProveedor]
ADD CONSTRAINT [FK_SAPC_SociedadesSAPC_FacturaProveedor]
    FOREIGN KEY ([Sociedad_Id])
    REFERENCES [dbo].[SAPC_Sociedades]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SAPC_SociedadesSAPC_FacturaProveedor'
CREATE INDEX [IX_FK_SAPC_SociedadesSAPC_FacturaProveedor]
ON [dbo].[SAPC_FacturaProveedor]
    ([Sociedad_Id]);
GO

-- Creating foreign key on [ClaseDoc_Id] in table 'SAPC_FacturaProveedor'
ALTER TABLE [dbo].[SAPC_FacturaProveedor]
ADD CONSTRAINT [FK_SAPC_ClaseDocSAPC_FacturaProveedor]
    FOREIGN KEY ([ClaseDoc_Id])
    REFERENCES [dbo].[SAPC_ClaseDoc]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SAPC_ClaseDocSAPC_FacturaProveedor'
CREATE INDEX [IX_FK_SAPC_ClaseDocSAPC_FacturaProveedor]
ON [dbo].[SAPC_FacturaProveedor]
    ([ClaseDoc_Id]);
GO

-- Creating foreign key on [Moneda_Id] in table 'SAPC_FacturaProveedor'
ALTER TABLE [dbo].[SAPC_FacturaProveedor]
ADD CONSTRAINT [FK_SAPC_MonedasSAPC_FacturaProveedor]
    FOREIGN KEY ([Moneda_Id])
    REFERENCES [dbo].[SAPC_Monedas]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SAPC_MonedasSAPC_FacturaProveedor'
CREATE INDEX [IX_FK_SAPC_MonedasSAPC_FacturaProveedor]
ON [dbo].[SAPC_FacturaProveedor]
    ([Moneda_Id]);
GO

-- Creating foreign key on [CECO_Id] in table 'SAPC_Inputaciones'
ALTER TABLE [dbo].[SAPC_Inputaciones]
ADD CONSTRAINT [FK_SAPC_CECOSAPC_Inputaciones]
    FOREIGN KEY ([CECO_Id])
    REFERENCES [dbo].[SAPC_CECO]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SAPC_CECOSAPC_Inputaciones'
CREATE INDEX [IX_FK_SAPC_CECOSAPC_Inputaciones]
ON [dbo].[SAPC_Inputaciones]
    ([CECO_Id]);
GO

-- Creating foreign key on [SAPRPCCall_Id] in table 'SAPC_Results'
ALTER TABLE [dbo].[SAPC_Results]
ADD CONSTRAINT [FK_SAPC_SAPRPCCallSAPC_Results]
    FOREIGN KEY ([SAPRPCCall_Id])
    REFERENCES [dbo].[SAPC_SAPRPCCall]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SAPC_SAPRPCCallSAPC_Results'
CREATE INDEX [IX_FK_SAPC_SAPRPCCallSAPC_Results]
ON [dbo].[SAPC_Results]
    ([SAPRPCCall_Id]);
GO

-- Creating foreign key on [Pais_Id] in table 'SAPC_Poblaciones'
ALTER TABLE [dbo].[SAPC_Poblaciones]
ADD CONSTRAINT [FK_SAPC_PaisesSAPC_Poblaciones]
    FOREIGN KEY ([Pais_Id])
    REFERENCES [dbo].[SAPC_Paises]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SAPC_PaisesSAPC_Poblaciones'
CREATE INDEX [IX_FK_SAPC_PaisesSAPC_Poblaciones]
ON [dbo].[SAPC_Poblaciones]
    ([Pais_Id]);
GO

-- Creating foreign key on [Poblacion_Id] in table 'SAPC_Proveedores'
ALTER TABLE [dbo].[SAPC_Proveedores]
ADD CONSTRAINT [FK_SAPC_PoblacionesSAPC_Proveedores]
    FOREIGN KEY ([Poblacion_Id])
    REFERENCES [dbo].[SAPC_Poblaciones]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SAPC_PoblacionesSAPC_Proveedores'
CREATE INDEX [IX_FK_SAPC_PoblacionesSAPC_Proveedores]
ON [dbo].[SAPC_Proveedores]
    ([Poblacion_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------