
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 03/15/2019 15:22:19
-- Generated from EDMX file: C:\Users\Complex\Desktop\GitRepo\EstradaSAPConnector\SAPConnectorLibrary\Models\EstradaSAPConnector.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [EstradaTest];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_FondoFijoRendicionGastos]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SAPC_Rendicion] DROP CONSTRAINT [FK_FondoFijoRendicionGastos];
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
IF OBJECT_ID(N'[dbo].[FK_SAPC_RendicionSAPC_SAPRPCCall]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SAPC_SAPRPCCall] DROP CONSTRAINT [FK_SAPC_RendicionSAPC_SAPRPCCall];
GO
IF OBJECT_ID(N'[dbo].[FK_SAPC_EstadosSAPC_RendicionGastos]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SAPC_Rendicion] DROP CONSTRAINT [FK_SAPC_EstadosSAPC_RendicionGastos];
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
    ALTER TABLE [dbo].[SAPC_InputacionesFacturas] DROP CONSTRAINT [FK_InputacionesSAPC_FacturaProveedor];
GO
IF OBJECT_ID(N'[dbo].[FK_SAPC_EmpleadoSAPC_RendicionABC]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SAPC_Rendicion] DROP CONSTRAINT [FK_SAPC_EmpleadoSAPC_RendicionABC];
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
    ALTER TABLE [dbo].[SAPC_InputacionesFacturas] DROP CONSTRAINT [FK_SAPC_CECOSAPC_Inputaciones];
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
IF OBJECT_ID(N'[dbo].[FK_SAPC_ClaseDocSAPC_Comprobantes]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SAPC_Comprobante] DROP CONSTRAINT [FK_SAPC_ClaseDocSAPC_Comprobantes];
GO
IF OBJECT_ID(N'[dbo].[FK_SAPC_SociedadesSAPC_Comprobantes]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SAPC_Comprobante] DROP CONSTRAINT [FK_SAPC_SociedadesSAPC_Comprobantes];
GO
IF OBJECT_ID(N'[dbo].[FK_SAPC_MonedasSAPC_Comprobantes]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SAPC_Comprobante] DROP CONSTRAINT [FK_SAPC_MonedasSAPC_Comprobantes];
GO
IF OBJECT_ID(N'[dbo].[FK_SAPC_ComprobantesSAPC_InputacionesComprobantes]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SAPC_InputacionesComprobantes] DROP CONSTRAINT [FK_SAPC_ComprobantesSAPC_InputacionesComprobantes];
GO
IF OBJECT_ID(N'[dbo].[FK_SAPC_EmpleadoSAPC_Comprobantes]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SAPC_Comprobante] DROP CONSTRAINT [FK_SAPC_EmpleadoSAPC_Comprobantes];
GO
IF OBJECT_ID(N'[dbo].[FK_SAPC_SAPRPCCallSAPC_Comprobantes_SAPC_SAPRPCCall]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SAPC_SAPRPCCallSAPC_Comprobantes] DROP CONSTRAINT [FK_SAPC_SAPRPCCallSAPC_Comprobantes_SAPC_SAPRPCCall];
GO
IF OBJECT_ID(N'[dbo].[FK_SAPC_SAPRPCCallSAPC_Comprobantes_SAPC_Comprobantes]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SAPC_SAPRPCCallSAPC_Comprobantes] DROP CONSTRAINT [FK_SAPC_SAPRPCCallSAPC_Comprobantes_SAPC_Comprobantes];
GO
IF OBJECT_ID(N'[dbo].[FK_SAPC_CECOSAPC_InputacionesComprobantes]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SAPC_InputacionesComprobantes] DROP CONSTRAINT [FK_SAPC_CECOSAPC_InputacionesComprobantes];
GO
IF OBJECT_ID(N'[dbo].[FK_SAPC_EstadosSAPC_Comprobantes]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SAPC_Comprobante] DROP CONSTRAINT [FK_SAPC_EstadosSAPC_Comprobantes];
GO
IF OBJECT_ID(N'[dbo].[FK_SAPC_ClaseDocSAPC_Adelantos]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SAPC_Adelantos] DROP CONSTRAINT [FK_SAPC_ClaseDocSAPC_Adelantos];
GO
IF OBJECT_ID(N'[dbo].[FK_SAPC_SociedadesSAPC_Adelantos]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SAPC_Adelantos] DROP CONSTRAINT [FK_SAPC_SociedadesSAPC_Adelantos];
GO
IF OBJECT_ID(N'[dbo].[FK_SAPC_MonedasSAPC_Adelantos]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SAPC_Adelantos] DROP CONSTRAINT [FK_SAPC_MonedasSAPC_Adelantos];
GO
IF OBJECT_ID(N'[dbo].[FK_SAPC_EmpleadoSAPC_FacturaProveedor]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SAPC_FacturaProveedor] DROP CONSTRAINT [FK_SAPC_EmpleadoSAPC_FacturaProveedor];
GO
IF OBJECT_ID(N'[dbo].[FK_InnovActionWFAccionEstado_InnovACtionWFCasos]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[InnovActionWFAccionEstadoes] DROP CONSTRAINT [FK_InnovActionWFAccionEstado_InnovACtionWFCasos];
GO
IF OBJECT_ID(N'[dbo].[FK_InnovACtionWFCasos_InnovACtionWFCasos]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[InnovActionWFCasos] DROP CONSTRAINT [FK_InnovACtionWFCasos_InnovACtionWFCasos];
GO
IF OBJECT_ID(N'[dbo].[FK_InnovActionWFInst_InnovActionWFCasos]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[InnovActionWFInsts] DROP CONSTRAINT [FK_InnovActionWFInst_InnovActionWFCasos];
GO
IF OBJECT_ID(N'[dbo].[FK_InnovActionWFRoleAprobador_InnovActionWFCasos]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[InnovActionWFRoleAprobadors] DROP CONSTRAINT [FK_InnovActionWFRoleAprobador_InnovActionWFCasos];
GO
IF OBJECT_ID(N'[dbo].[FK_SAPC_BotonesWF_InnovActionWFCasos]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SAPC_BotonesWF] DROP CONSTRAINT [FK_SAPC_BotonesWF_InnovActionWFCasos];
GO
IF OBJECT_ID(N'[dbo].[FK_InnovActionWFInst_InnovActionWFInst]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[InnovActionWFInsts] DROP CONSTRAINT [FK_InnovActionWFInst_InnovActionWFInst];
GO
IF OBJECT_ID(N'[dbo].[FK_InnovActionWFInstHist_InnovActionWFInst]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[InnovActionWFInstHists] DROP CONSTRAINT [FK_InnovActionWFInstHist_InnovActionWFInst];
GO
IF OBJECT_ID(N'[dbo].[FK_InnovActionWFVariables_InnovActionWFInst]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[InnovActionWFVariables] DROP CONSTRAINT [FK_InnovActionWFVariables_InnovActionWFInst];
GO
IF OBJECT_ID(N'[dbo].[FK_InnovActionWFVariables_InnovActionWFInstHist]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[InnovActionWFVariables] DROP CONSTRAINT [FK_InnovActionWFVariables_InnovActionWFInstHist];
GO
IF OBJECT_ID(N'[dbo].[FK_SAPC_AnticipoGastos_SAPC_Rechazos]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SAPC_AnticipoGastos] DROP CONSTRAINT [FK_SAPC_AnticipoGastos_SAPC_Rechazos];
GO
IF OBJECT_ID(N'[dbo].[FK_SAPC_BotonesWF_SAPC_BotonesWFTipos]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SAPC_BotonesWF] DROP CONSTRAINT [FK_SAPC_BotonesWF_SAPC_BotonesWFTipos];
GO
IF OBJECT_ID(N'[dbo].[FK_SAPC_CeCo_Username_SAPC_CeCo_Username]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SAPC_CeCo_UserID] DROP CONSTRAINT [FK_SAPC_CeCo_Username_SAPC_CeCo_Username];
GO
IF OBJECT_ID(N'[dbo].[FK_SAPC_HistFacturas_SAPC_FacturaRendicion]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SAPC_HistFacturas] DROP CONSTRAINT [FK_SAPC_HistFacturas_SAPC_FacturaRendicion];
GO
IF OBJECT_ID(N'[dbo].[FK_SAPC_RendicionGastos_SAPC_FondoFijo]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SAPC_RendicionFF] DROP CONSTRAINT [FK_SAPC_RendicionGastos_SAPC_FondoFijo];
GO
IF OBJECT_ID(N'[dbo].[FK_SAPC_ReintegroGastos_SAPC_Rechazos]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SAPC_ReintegroGastos] DROP CONSTRAINT [FK_SAPC_ReintegroGastos_SAPC_Rechazos];
GO
IF OBJECT_ID(N'[dbo].[FK_SAPC_RendicionG_SAPC_Rechazos]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SAPC_RendicionG] DROP CONSTRAINT [FK_SAPC_RendicionG_SAPC_Rechazos];
GO
IF OBJECT_ID(N'[dbo].[FK_SAPC_RendicionGastos_SAPC_Rechazos]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SAPC_RendicionFF] DROP CONSTRAINT [FK_SAPC_RendicionGastos_SAPC_Rechazos];
GO
IF OBJECT_ID(N'[dbo].[FK_SAPC_RendicionGastosSAPC_SAPRPCCall_SAPC_SAPRPCCall]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SAPC_RendicionGastosSAPC_SAPRPCCall1] DROP CONSTRAINT [FK_SAPC_RendicionGastosSAPC_SAPRPCCall_SAPC_SAPRPCCall];
GO
IF OBJECT_ID(N'[dbo].[FK_SAPC_AdelantosSAPC_SAPRPCCall1_SAPC_Adelantos]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SAPC_AdelantosSAPC_SAPRPCCall1] DROP CONSTRAINT [FK_SAPC_AdelantosSAPC_SAPRPCCall1_SAPC_Adelantos];
GO
IF OBJECT_ID(N'[dbo].[FK_SAPC_AdelantosSAPC_SAPRPCCall1_SAPC_SAPRPCCall]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SAPC_AdelantosSAPC_SAPRPCCall1] DROP CONSTRAINT [FK_SAPC_AdelantosSAPC_SAPRPCCall1_SAPC_SAPRPCCall];
GO
IF OBJECT_ID(N'[dbo].[FK_SAPC_ComprobantesSAPC_Rendicion]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SAPC_Comprobante] DROP CONSTRAINT [FK_SAPC_ComprobantesSAPC_Rendicion];
GO
IF OBJECT_ID(N'[dbo].[FK_SAPC_RendicionSAPC_OtrosComprobantes]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SAPC_OtrosComprobantes] DROP CONSTRAINT [FK_SAPC_RendicionSAPC_OtrosComprobantes];
GO
IF OBJECT_ID(N'[dbo].[FK_SAPC_RendicionSAPC_Adelantos]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SAPC_Adelantos] DROP CONSTRAINT [FK_SAPC_RendicionSAPC_Adelantos];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[SAPC_Rendicion]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SAPC_Rendicion];
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
IF OBJECT_ID(N'[dbo].[SAPC_InputacionesFacturas]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SAPC_InputacionesFacturas];
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
IF OBJECT_ID(N'[dbo].[SAPC_Comprobante]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SAPC_Comprobante];
GO
IF OBJECT_ID(N'[dbo].[SAPC_InputacionesComprobantes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SAPC_InputacionesComprobantes];
GO
IF OBJECT_ID(N'[dbo].[InnovActionWFAccionEstadoes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[InnovActionWFAccionEstadoes];
GO
IF OBJECT_ID(N'[dbo].[InnovActionWFAnticipoDeGastos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[InnovActionWFAnticipoDeGastos];
GO
IF OBJECT_ID(N'[dbo].[InnovActionWFAntiRendRelationships]', 'U') IS NOT NULL
    DROP TABLE [dbo].[InnovActionWFAntiRendRelationships];
GO
IF OBJECT_ID(N'[dbo].[InnovActionWFAprobadores]', 'U') IS NOT NULL
    DROP TABLE [dbo].[InnovActionWFAprobadores];
GO
IF OBJECT_ID(N'[dbo].[InnovActionWFCasos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[InnovActionWFCasos];
GO
IF OBJECT_ID(N'[dbo].[InnovActionWFCCAprobadores]', 'U') IS NOT NULL
    DROP TABLE [dbo].[InnovActionWFCCAprobadores];
GO
IF OBJECT_ID(N'[dbo].[InnovActionWFEmailAccounts]', 'U') IS NOT NULL
    DROP TABLE [dbo].[InnovActionWFEmailAccounts];
GO
IF OBJECT_ID(N'[dbo].[InnovActionWFEstadoRolOwners]', 'U') IS NOT NULL
    DROP TABLE [dbo].[InnovActionWFEstadoRolOwners];
GO
IF OBJECT_ID(N'[dbo].[InnovActionWFFiles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[InnovActionWFFiles];
GO
IF OBJECT_ID(N'[dbo].[InnovActionWFInsts]', 'U') IS NOT NULL
    DROP TABLE [dbo].[InnovActionWFInsts];
GO
IF OBJECT_ID(N'[dbo].[InnovActionWFInstHists]', 'U') IS NOT NULL
    DROP TABLE [dbo].[InnovActionWFInstHists];
GO
IF OBJECT_ID(N'[dbo].[InnovActionWFLicVariasExas]', 'U') IS NOT NULL
    DROP TABLE [dbo].[InnovActionWFLicVariasExas];
GO
IF OBJECT_ID(N'[dbo].[InnovActionWFLicVariasFalls]', 'U') IS NOT NULL
    DROP TABLE [dbo].[InnovActionWFLicVariasFalls];
GO
IF OBJECT_ID(N'[dbo].[InnovActionWFLicVariasMats]', 'U') IS NOT NULL
    DROP TABLE [dbo].[InnovActionWFLicVariasMats];
GO
IF OBJECT_ID(N'[dbo].[InnovActionWFLicVariasMuds]', 'U') IS NOT NULL
    DROP TABLE [dbo].[InnovActionWFLicVariasMuds];
GO
IF OBJECT_ID(N'[dbo].[InnovActionWFLicVariasNacs]', 'U') IS NOT NULL
    DROP TABLE [dbo].[InnovActionWFLicVariasNacs];
GO
IF OBJECT_ID(N'[dbo].[InnovActionWFLicVariasOtros]', 'U') IS NOT NULL
    DROP TABLE [dbo].[InnovActionWFLicVariasOtros];
GO
IF OBJECT_ID(N'[dbo].[InnovActionWFLicVariasTipoes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[InnovActionWFLicVariasTipoes];
GO
IF OBJECT_ID(N'[dbo].[InnovActionWFPageDomains]', 'U') IS NOT NULL
    DROP TABLE [dbo].[InnovActionWFPageDomains];
GO
IF OBJECT_ID(N'[dbo].[InnovActionWFPedidoVacaciones]', 'U') IS NOT NULL
    DROP TABLE [dbo].[InnovActionWFPedidoVacaciones];
GO
IF OBJECT_ID(N'[dbo].[InnovActionWFReintegroDeGastos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[InnovActionWFReintegroDeGastos];
GO
IF OBJECT_ID(N'[dbo].[InnovActionWFRendicionDeGastos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[InnovActionWFRendicionDeGastos];
GO
IF OBJECT_ID(N'[dbo].[InnovActionWFRoleAprobadors]', 'U') IS NOT NULL
    DROP TABLE [dbo].[InnovActionWFRoleAprobadors];
GO
IF OBJECT_ID(N'[dbo].[InnovActionWFStates]', 'U') IS NOT NULL
    DROP TABLE [dbo].[InnovActionWFStates];
GO
IF OBJECT_ID(N'[dbo].[InnovActionWFStockDias]', 'U') IS NOT NULL
    DROP TABLE [dbo].[InnovActionWFStockDias];
GO
IF OBJECT_ID(N'[dbo].[InnovActionWFVariables]', 'U') IS NOT NULL
    DROP TABLE [dbo].[InnovActionWFVariables];
GO
IF OBJECT_ID(N'[dbo].[SAPC_AnticipoGastos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SAPC_AnticipoGastos];
GO
IF OBJECT_ID(N'[dbo].[SAPC_Aprobadores]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SAPC_Aprobadores];
GO
IF OBJECT_ID(N'[dbo].[SAPC_BotonesWFTipos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SAPC_BotonesWFTipos];
GO
IF OBJECT_ID(N'[dbo].[SAPC_CeCo_UserID]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SAPC_CeCo_UserID];
GO
IF OBJECT_ID(N'[dbo].[SAPC_CuentasContables]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SAPC_CuentasContables];
GO
IF OBJECT_ID(N'[dbo].[SAPC_EmailTemplates]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SAPC_EmailTemplates];
GO
IF OBJECT_ID(N'[dbo].[SAPC_Facturas]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SAPC_Facturas];
GO
IF OBJECT_ID(N'[dbo].[SAPC_HistFacturas]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SAPC_HistFacturas];
GO
IF OBJECT_ID(N'[dbo].[SAPC_JefeAprobadores]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SAPC_JefeAprobadores];
GO
IF OBJECT_ID(N'[dbo].[SAPC_Rechazos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SAPC_Rechazos];
GO
IF OBJECT_ID(N'[dbo].[SAPC_ReintegroGastos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SAPC_ReintegroGastos];
GO
IF OBJECT_ID(N'[dbo].[SAPC_RendicionFF]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SAPC_RendicionFF];
GO
IF OBJECT_ID(N'[dbo].[SAPC_RendicionG]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SAPC_RendicionG];
GO
IF OBJECT_ID(N'[dbo].[SAPC_RendicionGastosSAPC_SAPRPCCall1]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SAPC_RendicionGastosSAPC_SAPRPCCall1];
GO
IF OBJECT_ID(N'[dbo].[SAPC_TipoFacturas]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SAPC_TipoFacturas];
GO
IF OBJECT_ID(N'[dbo].[SAPC_BotonesWF]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SAPC_BotonesWF];
GO
IF OBJECT_ID(N'[dbo].[SAPC_OtrosComprobantes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SAPC_OtrosComprobantes];
GO
IF OBJECT_ID(N'[dbo].[SAPC_SAPRPCCallSAPC_Comprobantes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SAPC_SAPRPCCallSAPC_Comprobantes];
GO
IF OBJECT_ID(N'[dbo].[SAPC_AdelantosSAPC_SAPRPCCall1]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SAPC_AdelantosSAPC_SAPRPCCall1];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'SAPC_Rendicion'
CREATE TABLE [dbo].[SAPC_Rendicion] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [SAPNroDoc] nvarchar(max)  NULL,
    [Fecha] datetime  NOT NULL,
    [Error] nvarchar(max)  NOT NULL,
    [FondoFijo_Id] int  NULL,
    [Estado_Id] int  NOT NULL,
    [RendidoPor_Id] int  NULL
);
GO

-- Creating table 'SAPC_FacturaProveedor'
CREATE TABLE [dbo].[SAPC_FacturaProveedor] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [FechaContable] datetime  NOT NULL,
    [FechaFactura] datetime  NOT NULL,
    [Referencia] nvarchar(max)  NOT NULL,
    [Importe] decimal(18,0)  NOT NULL,
    [Texto] nvarchar(max)  NOT NULL,
    [CAE] nvarchar(max)  NOT NULL,
    [CAEVto] datetime  NOT NULL,
    [SAPNroDoc] nvarchar(max)  NOT NULL,
    [Tienda] nvarchar(max)  NOT NULL,
    [Error] nvarchar(max)  NOT NULL,
    [Rendicion_Id] int  NOT NULL,
    [Proveedor_Id] int  NOT NULL,
    [Estado_Id] int  NOT NULL,
    [Sociedad_Id] int  NOT NULL,
    [ClaseDoc_Id] int  NOT NULL,
    [Moneda_Id] int  NOT NULL,
    [SAPC_Empleado_Id] int  NOT NULL
);
GO

-- Creating table 'SAPC_FondoFijo'
CREATE TABLE [dbo].[SAPC_FondoFijo] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [CreadoEn] datetime  NULL,
    [SAPId] nvarchar(max)  NOT NULL,
    [Credentials_Id] int  NULL,
    [UserIDTitular] int  NULL,
    [UserIDSuplente] int  NULL,
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
    [Results1] nvarchar(max)  NOT NULL,
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
    [URLConsultaID] nvarchar(max)  NULL
);
GO

-- Creating table 'SAPC_Adelantos'
CREATE TABLE [dbo].[SAPC_Adelantos] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [SAPNroDoc] nvarchar(max)  NULL,
    [Fecha] datetime  NOT NULL,
    [Importe] decimal(18,0)  NOT NULL,
    [FechaVto] datetime  NOT NULL,
    [FechaCont] datetime  NOT NULL,
    [Referencia] nvarchar(max)  NOT NULL,
    [Tienda] nvarchar(max)  NOT NULL,
    [TextoCab] nvarchar(max)  NOT NULL,
    [CtaContable] nvarchar(max)  NOT NULL,
    [TextoPOS] nvarchar(max)  NOT NULL,
    [SAPId] nvarchar(max)  NOT NULL,
    [PedidoEl] datetime  NOT NULL,
    [Error] nvarchar(max)  NOT NULL,
    [FondoFijo_Id] int  NULL,
    [Estado_Id] int  NOT NULL,
    [PedidoPorEmpleado_Id] int  NULL,
    [ClaseDoc_Id] int  NOT NULL,
    [Sociedad_Id] int  NOT NULL,
    [Moneda_Id] int  NOT NULL,
    [Rendicion_Id] int  NOT NULL
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
    [EndPoint_Id] int  NOT NULL
);
GO

-- Creating table 'SAPC_CECO'
CREATE TABLE [dbo].[SAPC_CECO] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [CodCECO] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'SAPC_InputacionesFacturas'
CREATE TABLE [dbo].[SAPC_InputacionesFacturas] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [CtaContable] nvarchar(max)  NOT NULL,
    [Importe] decimal(18,0)  NOT NULL,
    [IndImp] nvarchar(max)  NOT NULL,
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

-- Creating table 'SAPC_Comprobante'
CREATE TABLE [dbo].[SAPC_Comprobante] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [FechaCont] datetime  NOT NULL,
    [FechaDocumento] datetime  NOT NULL,
    [Referencia] nvarchar(max)  NOT NULL,
    [Tienda] nvarchar(max)  NOT NULL,
    [SAPNroDoc] nvarchar(max)  NOT NULL,
    [DocComp1] nvarchar(max)  NOT NULL,
    [DocComp2] nvarchar(max)  NOT NULL,
    [DocComp3] nvarchar(max)  NOT NULL,
    [DocComp4] nvarchar(max)  NOT NULL,
    [DocComp5] nvarchar(max)  NOT NULL,
    [DocComp6] nvarchar(max)  NOT NULL,
    [DocComp7] nvarchar(max)  NOT NULL,
    [DocComp8] nvarchar(max)  NOT NULL,
    [DocComp9] nvarchar(max)  NOT NULL,
    [DocComp10] nvarchar(max)  NOT NULL,
    [DocComp11] nvarchar(max)  NOT NULL,
    [ClaseDoc_Id] int  NOT NULL,
    [Sociedad_Id] int  NOT NULL,
    [Moneda_Id] int  NOT NULL,
    [Empleado_Id] int  NOT NULL,
    [Estado_Id] int  NOT NULL,
    [Rendicion_Id] int  NOT NULL
);
GO

-- Creating table 'SAPC_InputacionesComprobantes'
CREATE TABLE [dbo].[SAPC_InputacionesComprobantes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [ClaveCT] nvarchar(max)  NOT NULL,
    [CtaContable] nvarchar(max)  NOT NULL,
    [Importe] decimal(18,0)  NOT NULL,
    [Textos] nvarchar(max)  NOT NULL,
    [IndImp] nvarchar(max)  NOT NULL,
    [Texto] nvarchar(max)  NOT NULL,
    [Comprobante_Id] int  NOT NULL,
    [CECO_Id] int  NOT NULL
);
GO

-- Creating table 'InnovActionWFAccionEstadoes'
CREATE TABLE [dbo].[InnovActionWFAccionEstadoes] (
    [AccionEstado_ID] int IDENTITY(1,1) NOT NULL,
    [Accion] varchar(50)  NOT NULL,
    [StateCode] int  NOT NULL,
    [StoreProcedure] varchar(2000)  NOT NULL,
    [CasoID] int  NOT NULL,
    [EstadoInicial] bit  NOT NULL
);
GO

-- Creating table 'InnovActionWFAnticipoDeGastos'
CREATE TABLE [dbo].[InnovActionWFAnticipoDeGastos] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [InstanceID] int  NULL
);
GO

-- Creating table 'InnovActionWFAntiRendRelationships'
CREATE TABLE [dbo].[InnovActionWFAntiRendRelationships] (
    [IDRelationship] int IDENTITY(1,1) NOT NULL,
    [InstanceIDAnti] int  NOT NULL,
    [InstanceIDRend] int  NOT NULL
);
GO

-- Creating table 'InnovActionWFAprobadores'
CREATE TABLE [dbo].[InnovActionWFAprobadores] (
    [IdAprobador] int IDENTITY(1,1) NOT NULL,
    [UserGenerator] int  NOT NULL,
    [UserAprobador] int  NOT NULL
);
GO

-- Creating table 'InnovActionWFCasos'
CREATE TABLE [dbo].[InnovActionWFCasos] (
    [CasoID] int IDENTITY(1,1) NOT NULL,
    [Caso] varchar(250)  NULL
);
GO

-- Creating table 'InnovActionWFCCAprobadores'
CREATE TABLE [dbo].[InnovActionWFCCAprobadores] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [UserID] int  NULL,
    [CentroDeCostos] varchar(25)  NULL
);
GO

-- Creating table 'InnovActionWFEmailAccounts'
CREATE TABLE [dbo].[InnovActionWFEmailAccounts] (
    [IDEmail] int IDENTITY(1,1) NOT NULL,
    [Email] varchar(50)  NULL
);
GO

-- Creating table 'InnovActionWFEstadoRolOwners'
CREATE TABLE [dbo].[InnovActionWFEstadoRolOwners] (
    [EstadoRolOwner_iD] int IDENTITY(1,1) NOT NULL,
    [State_ID] int  NULL,
    [Role_Id] int  NULL
);
GO

-- Creating table 'InnovActionWFFiles'
CREATE TABLE [dbo].[InnovActionWFFiles] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [FilePath] varchar(max)  NULL,
    [FileName] varchar(max)  NULL,
    [FolderGUID] uniqueidentifier  NULL
);
GO

-- Creating table 'InnovActionWFInsts'
CREATE TABLE [dbo].[InnovActionWFInsts] (
    [InstanceID] int IDENTITY(1,1) NOT NULL,
    [CasoID] int  NOT NULL,
    [UserIDOwner] int  NOT NULL,
    [StateCode] int  NOT NULL,
    [FechaCreacion] datetime  NULL,
    [FechaModificacion] datetime  NULL,
    [InstGUID] uniqueidentifier  NULL
);
GO

-- Creating table 'InnovActionWFInstHists'
CREATE TABLE [dbo].[InnovActionWFInstHists] (
    [HistoryID] int IDENTITY(1,1) NOT NULL,
    [InstanceID] int  NOT NULL,
    [UserIDSignedBy] int  NOT NULL,
    [UserIDNextSigner] int  NULL,
    [RoleIDNextSigner] int  NULL,
    [GroupID] int  NULL,
    [StateID] int  NOT NULL,
    [Create_tstamp] datetime  NOT NULL,
    [Description] varchar(max)  NULL,
    [Remindersent] bit  NULL,
    [Systemurl] varchar(max)  NULL,
    [FolderGUID] uniqueidentifier  NULL,
    [HistGuid] uniqueidentifier  NULL
);
GO

-- Creating table 'InnovActionWFLicVariasExas'
CREATE TABLE [dbo].[InnovActionWFLicVariasExas] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [InstanceID] int  NULL
);
GO

-- Creating table 'InnovActionWFLicVariasFalls'
CREATE TABLE [dbo].[InnovActionWFLicVariasFalls] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [InstanceID] int  NULL
);
GO

-- Creating table 'InnovActionWFLicVariasMats'
CREATE TABLE [dbo].[InnovActionWFLicVariasMats] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [InstanceID] int  NULL
);
GO

-- Creating table 'InnovActionWFLicVariasMuds'
CREATE TABLE [dbo].[InnovActionWFLicVariasMuds] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [InstanceID] int  NULL
);
GO

-- Creating table 'InnovActionWFLicVariasNacs'
CREATE TABLE [dbo].[InnovActionWFLicVariasNacs] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [InstanceID] int  NULL
);
GO

-- Creating table 'InnovActionWFLicVariasOtros'
CREATE TABLE [dbo].[InnovActionWFLicVariasOtros] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [InstanceID] int  NULL
);
GO

-- Creating table 'InnovActionWFLicVariasTipoes'
CREATE TABLE [dbo].[InnovActionWFLicVariasTipoes] (
    [IDTipoLicencia] int IDENTITY(1,1) NOT NULL,
    [TipoLicencia] varchar(100)  NULL
);
GO

-- Creating table 'InnovActionWFPageDomains'
CREATE TABLE [dbo].[InnovActionWFPageDomains] (
    [Domain] varchar(100)  NULL,
    [InnovActionWFPageDomainID] bigint IDENTITY(1,1) NOT NULL
);
GO

-- Creating table 'InnovActionWFPedidoVacaciones'
CREATE TABLE [dbo].[InnovActionWFPedidoVacaciones] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [InstanceID] int  NULL
);
GO

-- Creating table 'InnovActionWFReintegroDeGastos'
CREATE TABLE [dbo].[InnovActionWFReintegroDeGastos] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [InstanceID] int  NULL
);
GO

-- Creating table 'InnovActionWFRendicionDeGastos'
CREATE TABLE [dbo].[InnovActionWFRendicionDeGastos] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [InstanceID] int  NULL
);
GO

-- Creating table 'InnovActionWFRoleAprobadors'
CREATE TABLE [dbo].[InnovActionWFRoleAprobadors] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [RoleID] int  NOT NULL,
    [CasoID] int  NOT NULL,
    [StateCode] int  NOT NULL
);
GO

-- Creating table 'InnovActionWFStates'
CREATE TABLE [dbo].[InnovActionWFStates] (
    [StateID] int IDENTITY(1,1) NOT NULL,
    [StateCode] int  NOT NULL,
    [StateName] varchar(50)  NOT NULL,
    [CasoID] int  NOT NULL
);
GO

-- Creating table 'InnovActionWFStockDias'
CREATE TABLE [dbo].[InnovActionWFStockDias] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [UserID] int  NULL,
    [StockDias] int  NULL
);
GO

-- Creating table 'InnovActionWFVariables'
CREATE TABLE [dbo].[InnovActionWFVariables] (
    [ValueID] int IDENTITY(1,1) NOT NULL,
    [InstanceID] int  NULL,
    [HistoryID] int  NULL,
    [text] varchar(max)  NULL,
    [value] varchar(max)  NULL,
    [timestamp] datetime  NULL
);
GO

-- Creating table 'SAPC_AnticipoGastos'
CREATE TABLE [dbo].[SAPC_AnticipoGastos] (
    [AnticipoGastosID] int IDENTITY(1,1) NOT NULL,
    [InstanceID] int  NULL,
    [UserID] int  NOT NULL,
    [Descripcion] varchar(1000)  NULL,
    [FechaCreacion] datetime  NOT NULL,
    [FechaAdelanto] datetime  NULL,
    [Adelanto] decimal(18,2)  NULL,
    [Saldo] decimal(18,2)  NULL,
    [FirmaJefe] int  NULL,
    [FirmaSegundaAprob] int  NULL,
    [FirmaTerceraAprobCentral] int  NULL,
    [FirmaIFContabilidad] int  NULL,
    [FirmaTerceraAprobAdmin] int  NULL,
    [FirmaIFAdministracion] int  NULL,
    [AnticipoGastosGUID] varchar(36)  NULL,
    [IsDeleted] bit  NULL,
    [ModificadoPor] int  NULL,
    [FechaModificacion] datetime  NOT NULL,
    [RechazoID] int  NULL,
    [RechazoTexto] varchar(500)  NULL,
    [RechazadoPor] int  NULL
);
GO

-- Creating table 'SAPC_Aprobadores'
CREATE TABLE [dbo].[SAPC_Aprobadores] (
    [AprobadorID] int IDENTITY(1,1) NOT NULL,
    [UserID] int  NOT NULL,
    [Jefe] int  NULL,
    [SegundaAprob] int  NULL,
    [TerceraAprobCentral] int  NULL,
    [IFContabilidad] int  NULL,
    [TerceraAprobAdmin] int  NULL,
    [IFAdministracion] int  NULL
);
GO

-- Creating table 'SAPC_BotonesWFTipos'
CREATE TABLE [dbo].[SAPC_BotonesWFTipos] (
    [TipoBotonID] int IDENTITY(1,1) NOT NULL,
    [Tipo] varchar(100)  NOT NULL
);
GO

-- Creating table 'SAPC_CeCo_UserID'
CREATE TABLE [dbo].[SAPC_CeCo_UserID] (
    [UsernameCeCoID] int IDENTITY(1,1) NOT NULL,
    [UserID] int  NOT NULL,
    [CeCoID] int  NOT NULL
);
GO

-- Creating table 'SAPC_CuentasContables'
CREATE TABLE [dbo].[SAPC_CuentasContables] (
    [CuentaID] int IDENTITY(1,1) NOT NULL,
    [Nombre] varchar(100)  NOT NULL,
    [CodSAP] varchar(100)  NOT NULL
);
GO

-- Creating table 'SAPC_EmailTemplates'
CREATE TABLE [dbo].[SAPC_EmailTemplates] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Template] varchar(max)  NULL,
    [StateCode] int  NULL
);
GO

-- Creating table 'SAPC_Facturas'
CREATE TABLE [dbo].[SAPC_Facturas] (
    [FacturaID] int IDENTITY(1,1) NOT NULL,
    [InstanceID] int  NULL,
    [TipoFacturaID] int  NOT NULL,
    [Referencia] varchar(13)  NOT NULL,
    [Fecha] datetime  NOT NULL,
    [ProveedorID] int  NOT NULL,
    [Concepto] varchar(2000)  NOT NULL,
    [NetoGravado] decimal(18,2)  NULL,
    [IVA27] decimal(18,2)  NULL,
    [IVA21] decimal(18,2)  NULL,
    [IVA105] decimal(18,2)  NULL,
    [IVA5] decimal(18,2)  NULL,
    [IVA25] decimal(18,2)  NULL,
    [IVA0] decimal(18,2)  NULL,
    [PerDeIVA] decimal(18,2)  NULL,
    [PerIngresosBrutos] decimal(18,2)  NULL,
    [NoGravados] decimal(18,2)  NULL,
    [Total] decimal(18,2)  NOT NULL,
    [CuentaID] int  NOT NULL,
    [FechaContabilizacion] datetime  NOT NULL,
    [CeCoID] int  NOT NULL,
    [IsDeleted] bit  NOT NULL,
    [ModificadoPor] int  NULL,
    [FechaModificacion] datetime  NULL,
    [StateCode] int  NULL
);
GO

-- Creating table 'SAPC_HistFacturas'
CREATE TABLE [dbo].[SAPC_HistFacturas] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Referencia] varchar(13)  NOT NULL,
    [CUIT] varchar(500)  NOT NULL,
    [FacturaID] int  NULL
);
GO

-- Creating table 'SAPC_JefeAprobadores'
CREATE TABLE [dbo].[SAPC_JefeAprobadores] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [UserIDEmp] int  NOT NULL,
    [UserIDJefe] int  NOT NULL
);
GO

-- Creating table 'SAPC_Rechazos'
CREATE TABLE [dbo].[SAPC_Rechazos] (
    [RechazoID] int IDENTITY(1,1) NOT NULL,
    [Descripcion] varchar(200)  NOT NULL
);
GO

-- Creating table 'SAPC_ReintegroGastos'
CREATE TABLE [dbo].[SAPC_ReintegroGastos] (
    [ReintegroGastosID] int IDENTITY(1,1) NOT NULL,
    [InstanceID] int  NULL,
    [UserID] int  NOT NULL,
    [Descripcion] varchar(1000)  NULL,
    [FechaCreacion] datetime  NOT NULL,
    [FechaAdelanto] datetime  NULL,
    [Adelanto] decimal(18,2)  NULL,
    [Saldo] decimal(18,2)  NULL,
    [FirmaJefe] int  NULL,
    [FirmaSegundaAprob] int  NULL,
    [FirmaTerceraAprobCentral] int  NULL,
    [FirmaIFContabilidad] int  NULL,
    [FirmaTerceraAprobAdmin] int  NULL,
    [FirmaIFAdministracion] int  NULL,
    [ReintegroGastosGUID] varchar(36)  NULL,
    [IsDeleted] bit  NULL,
    [ModificadoPor] int  NULL,
    [FechaModificacion] datetime  NOT NULL,
    [RechazoID] int  NULL,
    [RechazoTexto] varchar(500)  NULL,
    [RechazadoPor] int  NULL
);
GO

-- Creating table 'SAPC_RendicionFF'
CREATE TABLE [dbo].[SAPC_RendicionFF] (
    [RendicionID] int IDENTITY(1,1) NOT NULL,
    [InstanceID] int  NULL,
    [UserID] int  NOT NULL,
    [FondoFijoID] int  NOT NULL,
    [Descripcion] varchar(1000)  NULL,
    [FechaCreacion] datetime  NOT NULL,
    [FechaAdelanto] datetime  NULL,
    [Adelanto] decimal(18,2)  NULL,
    [Saldo] decimal(18,2)  NULL,
    [FirmaJefe] int  NULL,
    [FirmaAdministracion] int  NULL,
    [FirmaContabilidad] int  NULL,
    [RendicionGUID] varchar(36)  NULL,
    [IsDeleted] bit  NULL,
    [ModificadoPor] int  NULL,
    [FechaModificacion] datetime  NOT NULL,
    [RechazoID] int  NULL,
    [RechazoTexto] varchar(500)  NULL,
    [RechazadoPor] int  NULL
);
GO

-- Creating table 'SAPC_RendicionG'
CREATE TABLE [dbo].[SAPC_RendicionG] (
    [RendicionGID] int IDENTITY(1,1) NOT NULL,
    [InstanceID] int  NULL,
    [UserID] int  NOT NULL,
    [Descripcion] varchar(1000)  NULL,
    [FechaCreacion] datetime  NOT NULL,
    [FechaAdelanto] datetime  NULL,
    [Adelanto] decimal(18,2)  NULL,
    [Saldo] decimal(18,2)  NULL,
    [FirmaJefe] int  NULL,
    [FirmaSegundaAprob] int  NULL,
    [FirmaTerceraAprobCentral] int  NULL,
    [FirmaIFContabilidad] int  NULL,
    [FirmaTerceraAprobAdmin] int  NULL,
    [FirmaIFAdministracion] int  NULL,
    [RendicionGGUID] varchar(36)  NULL,
    [IsDeleted] bit  NULL,
    [ModificadoPor] int  NULL,
    [FechaModificacion] datetime  NOT NULL,
    [RechazoID] int  NULL,
    [RechazoTexto] varchar(500)  NULL,
    [RechazadoPor] int  NULL
);
GO

-- Creating table 'SAPC_RendicionGastosSAPC_SAPRPCCall1'
CREATE TABLE [dbo].[SAPC_RendicionGastosSAPC_SAPRPCCall1] (
    [RendicionesGastos_Id] int  NOT NULL,
    [SAPRPCCall_Id] int  NOT NULL
);
GO

-- Creating table 'SAPC_TipoFacturas'
CREATE TABLE [dbo].[SAPC_TipoFacturas] (
    [TipoFacturaID] int IDENTITY(1,1) NOT NULL,
    [Nombre] varchar(50)  NOT NULL,
    [CodSAP] varchar(50)  NOT NULL
);
GO

-- Creating table 'SAPC_BotonesWF'
CREATE TABLE [dbo].[SAPC_BotonesWF] (
    [BotonID] int IDENTITY(1,1) NOT NULL,
    [CasoID] int  NOT NULL,
    [Color] varchar(50)  NULL,
    [Accion] varchar(150)  NULL,
    [Texto] varchar(50)  NOT NULL,
    [FontAwesome] varchar(50)  NULL,
    [Estilo] varchar(150)  NULL,
    [TipoBotonID] int  NULL
);
GO

-- Creating table 'SAPC_OtrosComprobantes'
CREATE TABLE [dbo].[SAPC_OtrosComprobantes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [SAPNroDoc] nvarchar(max)  NOT NULL,
    [FechaDocumento] datetime  NOT NULL,
    [Importe] decimal(18,0)  NOT NULL,
    [Rendicion_Id] int  NOT NULL
);
GO

-- Creating table 'SAPC_SAPRPCCallSAPC_Comprobantes'
CREATE TABLE [dbo].[SAPC_SAPRPCCallSAPC_Comprobantes] (
    [RPCCalls_Id] int  NOT NULL,
    [Comprobantes_Id] int  NOT NULL
);
GO

-- Creating table 'SAPC_AdelantosSAPC_SAPRPCCall1'
CREATE TABLE [dbo].[SAPC_AdelantosSAPC_SAPRPCCall1] (
    [SAPC_Adelantos_Id] int  NOT NULL,
    [SAPC_SAPRPCCall_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'SAPC_Rendicion'
ALTER TABLE [dbo].[SAPC_Rendicion]
ADD CONSTRAINT [PK_SAPC_Rendicion]
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

-- Creating primary key on [Id] in table 'SAPC_InputacionesFacturas'
ALTER TABLE [dbo].[SAPC_InputacionesFacturas]
ADD CONSTRAINT [PK_SAPC_InputacionesFacturas]
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

-- Creating primary key on [Id] in table 'SAPC_Comprobante'
ALTER TABLE [dbo].[SAPC_Comprobante]
ADD CONSTRAINT [PK_SAPC_Comprobante]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'SAPC_InputacionesComprobantes'
ALTER TABLE [dbo].[SAPC_InputacionesComprobantes]
ADD CONSTRAINT [PK_SAPC_InputacionesComprobantes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [AccionEstado_ID] in table 'InnovActionWFAccionEstadoes'
ALTER TABLE [dbo].[InnovActionWFAccionEstadoes]
ADD CONSTRAINT [PK_InnovActionWFAccionEstadoes]
    PRIMARY KEY CLUSTERED ([AccionEstado_ID] ASC);
GO

-- Creating primary key on [ID] in table 'InnovActionWFAnticipoDeGastos'
ALTER TABLE [dbo].[InnovActionWFAnticipoDeGastos]
ADD CONSTRAINT [PK_InnovActionWFAnticipoDeGastos]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [IDRelationship] in table 'InnovActionWFAntiRendRelationships'
ALTER TABLE [dbo].[InnovActionWFAntiRendRelationships]
ADD CONSTRAINT [PK_InnovActionWFAntiRendRelationships]
    PRIMARY KEY CLUSTERED ([IDRelationship] ASC);
GO

-- Creating primary key on [IdAprobador] in table 'InnovActionWFAprobadores'
ALTER TABLE [dbo].[InnovActionWFAprobadores]
ADD CONSTRAINT [PK_InnovActionWFAprobadores]
    PRIMARY KEY CLUSTERED ([IdAprobador] ASC);
GO

-- Creating primary key on [CasoID] in table 'InnovActionWFCasos'
ALTER TABLE [dbo].[InnovActionWFCasos]
ADD CONSTRAINT [PK_InnovActionWFCasos]
    PRIMARY KEY CLUSTERED ([CasoID] ASC);
GO

-- Creating primary key on [ID] in table 'InnovActionWFCCAprobadores'
ALTER TABLE [dbo].[InnovActionWFCCAprobadores]
ADD CONSTRAINT [PK_InnovActionWFCCAprobadores]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [IDEmail] in table 'InnovActionWFEmailAccounts'
ALTER TABLE [dbo].[InnovActionWFEmailAccounts]
ADD CONSTRAINT [PK_InnovActionWFEmailAccounts]
    PRIMARY KEY CLUSTERED ([IDEmail] ASC);
GO

-- Creating primary key on [EstadoRolOwner_iD] in table 'InnovActionWFEstadoRolOwners'
ALTER TABLE [dbo].[InnovActionWFEstadoRolOwners]
ADD CONSTRAINT [PK_InnovActionWFEstadoRolOwners]
    PRIMARY KEY CLUSTERED ([EstadoRolOwner_iD] ASC);
GO

-- Creating primary key on [ID] in table 'InnovActionWFFiles'
ALTER TABLE [dbo].[InnovActionWFFiles]
ADD CONSTRAINT [PK_InnovActionWFFiles]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [InstanceID] in table 'InnovActionWFInsts'
ALTER TABLE [dbo].[InnovActionWFInsts]
ADD CONSTRAINT [PK_InnovActionWFInsts]
    PRIMARY KEY CLUSTERED ([InstanceID] ASC);
GO

-- Creating primary key on [HistoryID] in table 'InnovActionWFInstHists'
ALTER TABLE [dbo].[InnovActionWFInstHists]
ADD CONSTRAINT [PK_InnovActionWFInstHists]
    PRIMARY KEY CLUSTERED ([HistoryID] ASC);
GO

-- Creating primary key on [ID] in table 'InnovActionWFLicVariasExas'
ALTER TABLE [dbo].[InnovActionWFLicVariasExas]
ADD CONSTRAINT [PK_InnovActionWFLicVariasExas]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'InnovActionWFLicVariasFalls'
ALTER TABLE [dbo].[InnovActionWFLicVariasFalls]
ADD CONSTRAINT [PK_InnovActionWFLicVariasFalls]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'InnovActionWFLicVariasMats'
ALTER TABLE [dbo].[InnovActionWFLicVariasMats]
ADD CONSTRAINT [PK_InnovActionWFLicVariasMats]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'InnovActionWFLicVariasMuds'
ALTER TABLE [dbo].[InnovActionWFLicVariasMuds]
ADD CONSTRAINT [PK_InnovActionWFLicVariasMuds]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'InnovActionWFLicVariasNacs'
ALTER TABLE [dbo].[InnovActionWFLicVariasNacs]
ADD CONSTRAINT [PK_InnovActionWFLicVariasNacs]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'InnovActionWFLicVariasOtros'
ALTER TABLE [dbo].[InnovActionWFLicVariasOtros]
ADD CONSTRAINT [PK_InnovActionWFLicVariasOtros]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [IDTipoLicencia] in table 'InnovActionWFLicVariasTipoes'
ALTER TABLE [dbo].[InnovActionWFLicVariasTipoes]
ADD CONSTRAINT [PK_InnovActionWFLicVariasTipoes]
    PRIMARY KEY CLUSTERED ([IDTipoLicencia] ASC);
GO

-- Creating primary key on [InnovActionWFPageDomainID] in table 'InnovActionWFPageDomains'
ALTER TABLE [dbo].[InnovActionWFPageDomains]
ADD CONSTRAINT [PK_InnovActionWFPageDomains]
    PRIMARY KEY CLUSTERED ([InnovActionWFPageDomainID] ASC);
GO

-- Creating primary key on [ID] in table 'InnovActionWFPedidoVacaciones'
ALTER TABLE [dbo].[InnovActionWFPedidoVacaciones]
ADD CONSTRAINT [PK_InnovActionWFPedidoVacaciones]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'InnovActionWFReintegroDeGastos'
ALTER TABLE [dbo].[InnovActionWFReintegroDeGastos]
ADD CONSTRAINT [PK_InnovActionWFReintegroDeGastos]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'InnovActionWFRendicionDeGastos'
ALTER TABLE [dbo].[InnovActionWFRendicionDeGastos]
ADD CONSTRAINT [PK_InnovActionWFRendicionDeGastos]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'InnovActionWFRoleAprobadors'
ALTER TABLE [dbo].[InnovActionWFRoleAprobadors]
ADD CONSTRAINT [PK_InnovActionWFRoleAprobadors]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [StateID] in table 'InnovActionWFStates'
ALTER TABLE [dbo].[InnovActionWFStates]
ADD CONSTRAINT [PK_InnovActionWFStates]
    PRIMARY KEY CLUSTERED ([StateID] ASC);
GO

-- Creating primary key on [ID] in table 'InnovActionWFStockDias'
ALTER TABLE [dbo].[InnovActionWFStockDias]
ADD CONSTRAINT [PK_InnovActionWFStockDias]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ValueID] in table 'InnovActionWFVariables'
ALTER TABLE [dbo].[InnovActionWFVariables]
ADD CONSTRAINT [PK_InnovActionWFVariables]
    PRIMARY KEY CLUSTERED ([ValueID] ASC);
GO

-- Creating primary key on [AnticipoGastosID] in table 'SAPC_AnticipoGastos'
ALTER TABLE [dbo].[SAPC_AnticipoGastos]
ADD CONSTRAINT [PK_SAPC_AnticipoGastos]
    PRIMARY KEY CLUSTERED ([AnticipoGastosID] ASC);
GO

-- Creating primary key on [AprobadorID] in table 'SAPC_Aprobadores'
ALTER TABLE [dbo].[SAPC_Aprobadores]
ADD CONSTRAINT [PK_SAPC_Aprobadores]
    PRIMARY KEY CLUSTERED ([AprobadorID] ASC);
GO

-- Creating primary key on [TipoBotonID] in table 'SAPC_BotonesWFTipos'
ALTER TABLE [dbo].[SAPC_BotonesWFTipos]
ADD CONSTRAINT [PK_SAPC_BotonesWFTipos]
    PRIMARY KEY CLUSTERED ([TipoBotonID] ASC);
GO

-- Creating primary key on [UsernameCeCoID] in table 'SAPC_CeCo_UserID'
ALTER TABLE [dbo].[SAPC_CeCo_UserID]
ADD CONSTRAINT [PK_SAPC_CeCo_UserID]
    PRIMARY KEY CLUSTERED ([UsernameCeCoID] ASC);
GO

-- Creating primary key on [CuentaID] in table 'SAPC_CuentasContables'
ALTER TABLE [dbo].[SAPC_CuentasContables]
ADD CONSTRAINT [PK_SAPC_CuentasContables]
    PRIMARY KEY CLUSTERED ([CuentaID] ASC);
GO

-- Creating primary key on [ID] in table 'SAPC_EmailTemplates'
ALTER TABLE [dbo].[SAPC_EmailTemplates]
ADD CONSTRAINT [PK_SAPC_EmailTemplates]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [FacturaID] in table 'SAPC_Facturas'
ALTER TABLE [dbo].[SAPC_Facturas]
ADD CONSTRAINT [PK_SAPC_Facturas]
    PRIMARY KEY CLUSTERED ([FacturaID] ASC);
GO

-- Creating primary key on [ID] in table 'SAPC_HistFacturas'
ALTER TABLE [dbo].[SAPC_HistFacturas]
ADD CONSTRAINT [PK_SAPC_HistFacturas]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'SAPC_JefeAprobadores'
ALTER TABLE [dbo].[SAPC_JefeAprobadores]
ADD CONSTRAINT [PK_SAPC_JefeAprobadores]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [RechazoID] in table 'SAPC_Rechazos'
ALTER TABLE [dbo].[SAPC_Rechazos]
ADD CONSTRAINT [PK_SAPC_Rechazos]
    PRIMARY KEY CLUSTERED ([RechazoID] ASC);
GO

-- Creating primary key on [ReintegroGastosID] in table 'SAPC_ReintegroGastos'
ALTER TABLE [dbo].[SAPC_ReintegroGastos]
ADD CONSTRAINT [PK_SAPC_ReintegroGastos]
    PRIMARY KEY CLUSTERED ([ReintegroGastosID] ASC);
GO

-- Creating primary key on [RendicionID] in table 'SAPC_RendicionFF'
ALTER TABLE [dbo].[SAPC_RendicionFF]
ADD CONSTRAINT [PK_SAPC_RendicionFF]
    PRIMARY KEY CLUSTERED ([RendicionID] ASC);
GO

-- Creating primary key on [RendicionGID] in table 'SAPC_RendicionG'
ALTER TABLE [dbo].[SAPC_RendicionG]
ADD CONSTRAINT [PK_SAPC_RendicionG]
    PRIMARY KEY CLUSTERED ([RendicionGID] ASC);
GO

-- Creating primary key on [RendicionesGastos_Id], [SAPRPCCall_Id] in table 'SAPC_RendicionGastosSAPC_SAPRPCCall1'
ALTER TABLE [dbo].[SAPC_RendicionGastosSAPC_SAPRPCCall1]
ADD CONSTRAINT [PK_SAPC_RendicionGastosSAPC_SAPRPCCall1]
    PRIMARY KEY CLUSTERED ([RendicionesGastos_Id], [SAPRPCCall_Id] ASC);
GO

-- Creating primary key on [TipoFacturaID] in table 'SAPC_TipoFacturas'
ALTER TABLE [dbo].[SAPC_TipoFacturas]
ADD CONSTRAINT [PK_SAPC_TipoFacturas]
    PRIMARY KEY CLUSTERED ([TipoFacturaID] ASC);
GO

-- Creating primary key on [BotonID], [CasoID], [Texto] in table 'SAPC_BotonesWF'
ALTER TABLE [dbo].[SAPC_BotonesWF]
ADD CONSTRAINT [PK_SAPC_BotonesWF]
    PRIMARY KEY CLUSTERED ([BotonID], [CasoID], [Texto] ASC);
GO

-- Creating primary key on [Id] in table 'SAPC_OtrosComprobantes'
ALTER TABLE [dbo].[SAPC_OtrosComprobantes]
ADD CONSTRAINT [PK_SAPC_OtrosComprobantes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [RPCCalls_Id], [Comprobantes_Id] in table 'SAPC_SAPRPCCallSAPC_Comprobantes'
ALTER TABLE [dbo].[SAPC_SAPRPCCallSAPC_Comprobantes]
ADD CONSTRAINT [PK_SAPC_SAPRPCCallSAPC_Comprobantes]
    PRIMARY KEY CLUSTERED ([RPCCalls_Id], [Comprobantes_Id] ASC);
GO

-- Creating primary key on [SAPC_Adelantos_Id], [SAPC_SAPRPCCall_Id] in table 'SAPC_AdelantosSAPC_SAPRPCCall1'
ALTER TABLE [dbo].[SAPC_AdelantosSAPC_SAPRPCCall1]
ADD CONSTRAINT [PK_SAPC_AdelantosSAPC_SAPRPCCall1]
    PRIMARY KEY CLUSTERED ([SAPC_Adelantos_Id], [SAPC_SAPRPCCall_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [FondoFijo_Id] in table 'SAPC_Rendicion'
ALTER TABLE [dbo].[SAPC_Rendicion]
ADD CONSTRAINT [FK_FondoFijoRendicionGastos]
    FOREIGN KEY ([FondoFijo_Id])
    REFERENCES [dbo].[SAPC_FondoFijo]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FondoFijoRendicionGastos'
CREATE INDEX [IX_FK_FondoFijoRendicionGastos]
ON [dbo].[SAPC_Rendicion]
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
ADD CONSTRAINT [FK_SAPC_RendicionSAPC_SAPRPCCall]
    FOREIGN KEY ([RendicionGastos_Id])
    REFERENCES [dbo].[SAPC_Rendicion]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SAPC_RendicionSAPC_SAPRPCCall'
CREATE INDEX [IX_FK_SAPC_RendicionSAPC_SAPRPCCall]
ON [dbo].[SAPC_SAPRPCCall]
    ([RendicionGastos_Id]);
GO

-- Creating foreign key on [Estado_Id] in table 'SAPC_Rendicion'
ALTER TABLE [dbo].[SAPC_Rendicion]
ADD CONSTRAINT [FK_SAPC_EstadosSAPC_RendicionGastos]
    FOREIGN KEY ([Estado_Id])
    REFERENCES [dbo].[SAPC_Estados]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SAPC_EstadosSAPC_RendicionGastos'
CREATE INDEX [IX_FK_SAPC_EstadosSAPC_RendicionGastos]
ON [dbo].[SAPC_Rendicion]
    ([Estado_Id]);
GO

-- Creating foreign key on [Rendicion_Id] in table 'SAPC_FacturaProveedor'
ALTER TABLE [dbo].[SAPC_FacturaProveedor]
ADD CONSTRAINT [FK_SAPC_RendicionGastosSAPC_FacturaProveedor]
    FOREIGN KEY ([Rendicion_Id])
    REFERENCES [dbo].[SAPC_Rendicion]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SAPC_RendicionGastosSAPC_FacturaProveedor'
CREATE INDEX [IX_FK_SAPC_RendicionGastosSAPC_FacturaProveedor]
ON [dbo].[SAPC_FacturaProveedor]
    ([Rendicion_Id]);
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

-- Creating foreign key on [InputacionesSAPC_FacturaProveedor_Percepciones_Id] in table 'SAPC_InputacionesFacturas'
ALTER TABLE [dbo].[SAPC_InputacionesFacturas]
ADD CONSTRAINT [FK_InputacionesSAPC_FacturaProveedor]
    FOREIGN KEY ([InputacionesSAPC_FacturaProveedor_Percepciones_Id])
    REFERENCES [dbo].[SAPC_FacturaProveedor]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_InputacionesSAPC_FacturaProveedor'
CREATE INDEX [IX_FK_InputacionesSAPC_FacturaProveedor]
ON [dbo].[SAPC_InputacionesFacturas]
    ([InputacionesSAPC_FacturaProveedor_Percepciones_Id]);
GO

-- Creating foreign key on [RendidoPor_Id] in table 'SAPC_Rendicion'
ALTER TABLE [dbo].[SAPC_Rendicion]
ADD CONSTRAINT [FK_SAPC_EmpleadoSAPC_RendicionABC]
    FOREIGN KEY ([RendidoPor_Id])
    REFERENCES [dbo].[SAPC_Empleado]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SAPC_EmpleadoSAPC_RendicionABC'
CREATE INDEX [IX_FK_SAPC_EmpleadoSAPC_RendicionABC]
ON [dbo].[SAPC_Rendicion]
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

-- Creating foreign key on [EndPoint_Id] in table 'SAPC_Empleado'
ALTER TABLE [dbo].[SAPC_Empleado]
ADD CONSTRAINT [FK_SAPC_EndPointSAPC_Empleado]
    FOREIGN KEY ([EndPoint_Id])
    REFERENCES [dbo].[SAPC_EndPoint]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SAPC_EndPointSAPC_Empleado'
CREATE INDEX [IX_FK_SAPC_EndPointSAPC_Empleado]
ON [dbo].[SAPC_Empleado]
    ([EndPoint_Id]);
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

-- Creating foreign key on [CECO_Id] in table 'SAPC_InputacionesFacturas'
ALTER TABLE [dbo].[SAPC_InputacionesFacturas]
ADD CONSTRAINT [FK_SAPC_CECOSAPC_Inputaciones]
    FOREIGN KEY ([CECO_Id])
    REFERENCES [dbo].[SAPC_CECO]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SAPC_CECOSAPC_Inputaciones'
CREATE INDEX [IX_FK_SAPC_CECOSAPC_Inputaciones]
ON [dbo].[SAPC_InputacionesFacturas]
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

-- Creating foreign key on [ClaseDoc_Id] in table 'SAPC_Comprobante'
ALTER TABLE [dbo].[SAPC_Comprobante]
ADD CONSTRAINT [FK_SAPC_ClaseDocSAPC_Comprobantes]
    FOREIGN KEY ([ClaseDoc_Id])
    REFERENCES [dbo].[SAPC_ClaseDoc]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SAPC_ClaseDocSAPC_Comprobantes'
CREATE INDEX [IX_FK_SAPC_ClaseDocSAPC_Comprobantes]
ON [dbo].[SAPC_Comprobante]
    ([ClaseDoc_Id]);
GO

-- Creating foreign key on [Sociedad_Id] in table 'SAPC_Comprobante'
ALTER TABLE [dbo].[SAPC_Comprobante]
ADD CONSTRAINT [FK_SAPC_SociedadesSAPC_Comprobantes]
    FOREIGN KEY ([Sociedad_Id])
    REFERENCES [dbo].[SAPC_Sociedades]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SAPC_SociedadesSAPC_Comprobantes'
CREATE INDEX [IX_FK_SAPC_SociedadesSAPC_Comprobantes]
ON [dbo].[SAPC_Comprobante]
    ([Sociedad_Id]);
GO

-- Creating foreign key on [Moneda_Id] in table 'SAPC_Comprobante'
ALTER TABLE [dbo].[SAPC_Comprobante]
ADD CONSTRAINT [FK_SAPC_MonedasSAPC_Comprobantes]
    FOREIGN KEY ([Moneda_Id])
    REFERENCES [dbo].[SAPC_Monedas]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SAPC_MonedasSAPC_Comprobantes'
CREATE INDEX [IX_FK_SAPC_MonedasSAPC_Comprobantes]
ON [dbo].[SAPC_Comprobante]
    ([Moneda_Id]);
GO

-- Creating foreign key on [Comprobante_Id] in table 'SAPC_InputacionesComprobantes'
ALTER TABLE [dbo].[SAPC_InputacionesComprobantes]
ADD CONSTRAINT [FK_SAPC_ComprobantesSAPC_InputacionesComprobantes]
    FOREIGN KEY ([Comprobante_Id])
    REFERENCES [dbo].[SAPC_Comprobante]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SAPC_ComprobantesSAPC_InputacionesComprobantes'
CREATE INDEX [IX_FK_SAPC_ComprobantesSAPC_InputacionesComprobantes]
ON [dbo].[SAPC_InputacionesComprobantes]
    ([Comprobante_Id]);
GO

-- Creating foreign key on [Empleado_Id] in table 'SAPC_Comprobante'
ALTER TABLE [dbo].[SAPC_Comprobante]
ADD CONSTRAINT [FK_SAPC_EmpleadoSAPC_Comprobantes]
    FOREIGN KEY ([Empleado_Id])
    REFERENCES [dbo].[SAPC_Empleado]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SAPC_EmpleadoSAPC_Comprobantes'
CREATE INDEX [IX_FK_SAPC_EmpleadoSAPC_Comprobantes]
ON [dbo].[SAPC_Comprobante]
    ([Empleado_Id]);
GO

-- Creating foreign key on [RPCCalls_Id] in table 'SAPC_SAPRPCCallSAPC_Comprobantes'
ALTER TABLE [dbo].[SAPC_SAPRPCCallSAPC_Comprobantes]
ADD CONSTRAINT [FK_SAPC_SAPRPCCallSAPC_Comprobantes_SAPC_SAPRPCCall]
    FOREIGN KEY ([RPCCalls_Id])
    REFERENCES [dbo].[SAPC_SAPRPCCall]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Comprobantes_Id] in table 'SAPC_SAPRPCCallSAPC_Comprobantes'
ALTER TABLE [dbo].[SAPC_SAPRPCCallSAPC_Comprobantes]
ADD CONSTRAINT [FK_SAPC_SAPRPCCallSAPC_Comprobantes_SAPC_Comprobantes]
    FOREIGN KEY ([Comprobantes_Id])
    REFERENCES [dbo].[SAPC_Comprobante]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SAPC_SAPRPCCallSAPC_Comprobantes_SAPC_Comprobantes'
CREATE INDEX [IX_FK_SAPC_SAPRPCCallSAPC_Comprobantes_SAPC_Comprobantes]
ON [dbo].[SAPC_SAPRPCCallSAPC_Comprobantes]
    ([Comprobantes_Id]);
GO

-- Creating foreign key on [CECO_Id] in table 'SAPC_InputacionesComprobantes'
ALTER TABLE [dbo].[SAPC_InputacionesComprobantes]
ADD CONSTRAINT [FK_SAPC_CECOSAPC_InputacionesComprobantes]
    FOREIGN KEY ([CECO_Id])
    REFERENCES [dbo].[SAPC_CECO]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SAPC_CECOSAPC_InputacionesComprobantes'
CREATE INDEX [IX_FK_SAPC_CECOSAPC_InputacionesComprobantes]
ON [dbo].[SAPC_InputacionesComprobantes]
    ([CECO_Id]);
GO

-- Creating foreign key on [Estado_Id] in table 'SAPC_Comprobante'
ALTER TABLE [dbo].[SAPC_Comprobante]
ADD CONSTRAINT [FK_SAPC_EstadosSAPC_Comprobantes]
    FOREIGN KEY ([Estado_Id])
    REFERENCES [dbo].[SAPC_Estados]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SAPC_EstadosSAPC_Comprobantes'
CREATE INDEX [IX_FK_SAPC_EstadosSAPC_Comprobantes]
ON [dbo].[SAPC_Comprobante]
    ([Estado_Id]);
GO

-- Creating foreign key on [ClaseDoc_Id] in table 'SAPC_Adelantos'
ALTER TABLE [dbo].[SAPC_Adelantos]
ADD CONSTRAINT [FK_SAPC_ClaseDocSAPC_Adelantos]
    FOREIGN KEY ([ClaseDoc_Id])
    REFERENCES [dbo].[SAPC_ClaseDoc]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SAPC_ClaseDocSAPC_Adelantos'
CREATE INDEX [IX_FK_SAPC_ClaseDocSAPC_Adelantos]
ON [dbo].[SAPC_Adelantos]
    ([ClaseDoc_Id]);
GO

-- Creating foreign key on [Sociedad_Id] in table 'SAPC_Adelantos'
ALTER TABLE [dbo].[SAPC_Adelantos]
ADD CONSTRAINT [FK_SAPC_SociedadesSAPC_Adelantos]
    FOREIGN KEY ([Sociedad_Id])
    REFERENCES [dbo].[SAPC_Sociedades]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SAPC_SociedadesSAPC_Adelantos'
CREATE INDEX [IX_FK_SAPC_SociedadesSAPC_Adelantos]
ON [dbo].[SAPC_Adelantos]
    ([Sociedad_Id]);
GO

-- Creating foreign key on [Moneda_Id] in table 'SAPC_Adelantos'
ALTER TABLE [dbo].[SAPC_Adelantos]
ADD CONSTRAINT [FK_SAPC_MonedasSAPC_Adelantos]
    FOREIGN KEY ([Moneda_Id])
    REFERENCES [dbo].[SAPC_Monedas]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SAPC_MonedasSAPC_Adelantos'
CREATE INDEX [IX_FK_SAPC_MonedasSAPC_Adelantos]
ON [dbo].[SAPC_Adelantos]
    ([Moneda_Id]);
GO

-- Creating foreign key on [SAPC_Empleado_Id] in table 'SAPC_FacturaProveedor'
ALTER TABLE [dbo].[SAPC_FacturaProveedor]
ADD CONSTRAINT [FK_SAPC_EmpleadoSAPC_FacturaProveedor]
    FOREIGN KEY ([SAPC_Empleado_Id])
    REFERENCES [dbo].[SAPC_Empleado]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SAPC_EmpleadoSAPC_FacturaProveedor'
CREATE INDEX [IX_FK_SAPC_EmpleadoSAPC_FacturaProveedor]
ON [dbo].[SAPC_FacturaProveedor]
    ([SAPC_Empleado_Id]);
GO

-- Creating foreign key on [CasoID] in table 'InnovActionWFAccionEstadoes'
ALTER TABLE [dbo].[InnovActionWFAccionEstadoes]
ADD CONSTRAINT [FK_InnovActionWFAccionEstado_InnovACtionWFCasos]
    FOREIGN KEY ([CasoID])
    REFERENCES [dbo].[InnovActionWFCasos]
        ([CasoID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_InnovActionWFAccionEstado_InnovACtionWFCasos'
CREATE INDEX [IX_FK_InnovActionWFAccionEstado_InnovACtionWFCasos]
ON [dbo].[InnovActionWFAccionEstadoes]
    ([CasoID]);
GO

-- Creating foreign key on [CasoID] in table 'InnovActionWFCasos'
ALTER TABLE [dbo].[InnovActionWFCasos]
ADD CONSTRAINT [FK_InnovACtionWFCasos_InnovACtionWFCasos]
    FOREIGN KEY ([CasoID])
    REFERENCES [dbo].[InnovActionWFCasos]
        ([CasoID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [CasoID] in table 'InnovActionWFInsts'
ALTER TABLE [dbo].[InnovActionWFInsts]
ADD CONSTRAINT [FK_InnovActionWFInst_InnovActionWFCasos]
    FOREIGN KEY ([CasoID])
    REFERENCES [dbo].[InnovActionWFCasos]
        ([CasoID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_InnovActionWFInst_InnovActionWFCasos'
CREATE INDEX [IX_FK_InnovActionWFInst_InnovActionWFCasos]
ON [dbo].[InnovActionWFInsts]
    ([CasoID]);
GO

-- Creating foreign key on [CasoID] in table 'InnovActionWFRoleAprobadors'
ALTER TABLE [dbo].[InnovActionWFRoleAprobadors]
ADD CONSTRAINT [FK_InnovActionWFRoleAprobador_InnovActionWFCasos]
    FOREIGN KEY ([CasoID])
    REFERENCES [dbo].[InnovActionWFCasos]
        ([CasoID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_InnovActionWFRoleAprobador_InnovActionWFCasos'
CREATE INDEX [IX_FK_InnovActionWFRoleAprobador_InnovActionWFCasos]
ON [dbo].[InnovActionWFRoleAprobadors]
    ([CasoID]);
GO

-- Creating foreign key on [CasoID] in table 'SAPC_BotonesWF'
ALTER TABLE [dbo].[SAPC_BotonesWF]
ADD CONSTRAINT [FK_SAPC_BotonesWF_InnovActionWFCasos]
    FOREIGN KEY ([CasoID])
    REFERENCES [dbo].[InnovActionWFCasos]
        ([CasoID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SAPC_BotonesWF_InnovActionWFCasos'
CREATE INDEX [IX_FK_SAPC_BotonesWF_InnovActionWFCasos]
ON [dbo].[SAPC_BotonesWF]
    ([CasoID]);
GO

-- Creating foreign key on [InstanceID] in table 'InnovActionWFInsts'
ALTER TABLE [dbo].[InnovActionWFInsts]
ADD CONSTRAINT [FK_InnovActionWFInst_InnovActionWFInst]
    FOREIGN KEY ([InstanceID])
    REFERENCES [dbo].[InnovActionWFInsts]
        ([InstanceID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [InstanceID] in table 'InnovActionWFInstHists'
ALTER TABLE [dbo].[InnovActionWFInstHists]
ADD CONSTRAINT [FK_InnovActionWFInstHist_InnovActionWFInst]
    FOREIGN KEY ([InstanceID])
    REFERENCES [dbo].[InnovActionWFInsts]
        ([InstanceID])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_InnovActionWFInstHist_InnovActionWFInst'
CREATE INDEX [IX_FK_InnovActionWFInstHist_InnovActionWFInst]
ON [dbo].[InnovActionWFInstHists]
    ([InstanceID]);
GO

-- Creating foreign key on [InstanceID] in table 'InnovActionWFVariables'
ALTER TABLE [dbo].[InnovActionWFVariables]
ADD CONSTRAINT [FK_InnovActionWFVariables_InnovActionWFInst]
    FOREIGN KEY ([InstanceID])
    REFERENCES [dbo].[InnovActionWFInsts]
        ([InstanceID])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_InnovActionWFVariables_InnovActionWFInst'
CREATE INDEX [IX_FK_InnovActionWFVariables_InnovActionWFInst]
ON [dbo].[InnovActionWFVariables]
    ([InstanceID]);
GO

-- Creating foreign key on [HistoryID] in table 'InnovActionWFVariables'
ALTER TABLE [dbo].[InnovActionWFVariables]
ADD CONSTRAINT [FK_InnovActionWFVariables_InnovActionWFInstHist]
    FOREIGN KEY ([HistoryID])
    REFERENCES [dbo].[InnovActionWFInstHists]
        ([HistoryID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_InnovActionWFVariables_InnovActionWFInstHist'
CREATE INDEX [IX_FK_InnovActionWFVariables_InnovActionWFInstHist]
ON [dbo].[InnovActionWFVariables]
    ([HistoryID]);
GO

-- Creating foreign key on [RechazoID] in table 'SAPC_AnticipoGastos'
ALTER TABLE [dbo].[SAPC_AnticipoGastos]
ADD CONSTRAINT [FK_SAPC_AnticipoGastos_SAPC_Rechazos]
    FOREIGN KEY ([RechazoID])
    REFERENCES [dbo].[SAPC_Rechazos]
        ([RechazoID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SAPC_AnticipoGastos_SAPC_Rechazos'
CREATE INDEX [IX_FK_SAPC_AnticipoGastos_SAPC_Rechazos]
ON [dbo].[SAPC_AnticipoGastos]
    ([RechazoID]);
GO

-- Creating foreign key on [TipoBotonID] in table 'SAPC_BotonesWF'
ALTER TABLE [dbo].[SAPC_BotonesWF]
ADD CONSTRAINT [FK_SAPC_BotonesWF_SAPC_BotonesWFTipos]
    FOREIGN KEY ([TipoBotonID])
    REFERENCES [dbo].[SAPC_BotonesWFTipos]
        ([TipoBotonID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SAPC_BotonesWF_SAPC_BotonesWFTipos'
CREATE INDEX [IX_FK_SAPC_BotonesWF_SAPC_BotonesWFTipos]
ON [dbo].[SAPC_BotonesWF]
    ([TipoBotonID]);
GO

-- Creating foreign key on [UsernameCeCoID] in table 'SAPC_CeCo_UserID'
ALTER TABLE [dbo].[SAPC_CeCo_UserID]
ADD CONSTRAINT [FK_SAPC_CeCo_Username_SAPC_CeCo_Username]
    FOREIGN KEY ([UsernameCeCoID])
    REFERENCES [dbo].[SAPC_CeCo_UserID]
        ([UsernameCeCoID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [FacturaID] in table 'SAPC_HistFacturas'
ALTER TABLE [dbo].[SAPC_HistFacturas]
ADD CONSTRAINT [FK_SAPC_HistFacturas_SAPC_FacturaRendicion]
    FOREIGN KEY ([FacturaID])
    REFERENCES [dbo].[SAPC_Facturas]
        ([FacturaID])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SAPC_HistFacturas_SAPC_FacturaRendicion'
CREATE INDEX [IX_FK_SAPC_HistFacturas_SAPC_FacturaRendicion]
ON [dbo].[SAPC_HistFacturas]
    ([FacturaID]);
GO

-- Creating foreign key on [FondoFijoID] in table 'SAPC_RendicionFF'
ALTER TABLE [dbo].[SAPC_RendicionFF]
ADD CONSTRAINT [FK_SAPC_RendicionGastos_SAPC_FondoFijo]
    FOREIGN KEY ([FondoFijoID])
    REFERENCES [dbo].[SAPC_FondoFijo]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SAPC_RendicionGastos_SAPC_FondoFijo'
CREATE INDEX [IX_FK_SAPC_RendicionGastos_SAPC_FondoFijo]
ON [dbo].[SAPC_RendicionFF]
    ([FondoFijoID]);
GO

-- Creating foreign key on [RechazoID] in table 'SAPC_ReintegroGastos'
ALTER TABLE [dbo].[SAPC_ReintegroGastos]
ADD CONSTRAINT [FK_SAPC_ReintegroGastos_SAPC_Rechazos]
    FOREIGN KEY ([RechazoID])
    REFERENCES [dbo].[SAPC_Rechazos]
        ([RechazoID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SAPC_ReintegroGastos_SAPC_Rechazos'
CREATE INDEX [IX_FK_SAPC_ReintegroGastos_SAPC_Rechazos]
ON [dbo].[SAPC_ReintegroGastos]
    ([RechazoID]);
GO

-- Creating foreign key on [RechazoID] in table 'SAPC_RendicionG'
ALTER TABLE [dbo].[SAPC_RendicionG]
ADD CONSTRAINT [FK_SAPC_RendicionG_SAPC_Rechazos]
    FOREIGN KEY ([RechazoID])
    REFERENCES [dbo].[SAPC_Rechazos]
        ([RechazoID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SAPC_RendicionG_SAPC_Rechazos'
CREATE INDEX [IX_FK_SAPC_RendicionG_SAPC_Rechazos]
ON [dbo].[SAPC_RendicionG]
    ([RechazoID]);
GO

-- Creating foreign key on [RechazoID] in table 'SAPC_RendicionFF'
ALTER TABLE [dbo].[SAPC_RendicionFF]
ADD CONSTRAINT [FK_SAPC_RendicionGastos_SAPC_Rechazos]
    FOREIGN KEY ([RechazoID])
    REFERENCES [dbo].[SAPC_Rechazos]
        ([RechazoID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SAPC_RendicionGastos_SAPC_Rechazos'
CREATE INDEX [IX_FK_SAPC_RendicionGastos_SAPC_Rechazos]
ON [dbo].[SAPC_RendicionFF]
    ([RechazoID]);
GO

-- Creating foreign key on [SAPRPCCall_Id] in table 'SAPC_RendicionGastosSAPC_SAPRPCCall1'
ALTER TABLE [dbo].[SAPC_RendicionGastosSAPC_SAPRPCCall1]
ADD CONSTRAINT [FK_SAPC_RendicionGastosSAPC_SAPRPCCall_SAPC_SAPRPCCall]
    FOREIGN KEY ([SAPRPCCall_Id])
    REFERENCES [dbo].[SAPC_SAPRPCCall]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SAPC_RendicionGastosSAPC_SAPRPCCall_SAPC_SAPRPCCall'
CREATE INDEX [IX_FK_SAPC_RendicionGastosSAPC_SAPRPCCall_SAPC_SAPRPCCall]
ON [dbo].[SAPC_RendicionGastosSAPC_SAPRPCCall1]
    ([SAPRPCCall_Id]);
GO

-- Creating foreign key on [SAPC_Adelantos_Id] in table 'SAPC_AdelantosSAPC_SAPRPCCall1'
ALTER TABLE [dbo].[SAPC_AdelantosSAPC_SAPRPCCall1]
ADD CONSTRAINT [FK_SAPC_AdelantosSAPC_SAPRPCCall1_SAPC_Adelantos]
    FOREIGN KEY ([SAPC_Adelantos_Id])
    REFERENCES [dbo].[SAPC_Adelantos]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [SAPC_SAPRPCCall_Id] in table 'SAPC_AdelantosSAPC_SAPRPCCall1'
ALTER TABLE [dbo].[SAPC_AdelantosSAPC_SAPRPCCall1]
ADD CONSTRAINT [FK_SAPC_AdelantosSAPC_SAPRPCCall1_SAPC_SAPRPCCall]
    FOREIGN KEY ([SAPC_SAPRPCCall_Id])
    REFERENCES [dbo].[SAPC_SAPRPCCall]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SAPC_AdelantosSAPC_SAPRPCCall1_SAPC_SAPRPCCall'
CREATE INDEX [IX_FK_SAPC_AdelantosSAPC_SAPRPCCall1_SAPC_SAPRPCCall]
ON [dbo].[SAPC_AdelantosSAPC_SAPRPCCall1]
    ([SAPC_SAPRPCCall_Id]);
GO

-- Creating foreign key on [Rendicion_Id] in table 'SAPC_Comprobante'
ALTER TABLE [dbo].[SAPC_Comprobante]
ADD CONSTRAINT [FK_SAPC_ComprobantesSAPC_Rendicion]
    FOREIGN KEY ([Rendicion_Id])
    REFERENCES [dbo].[SAPC_Rendicion]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SAPC_ComprobantesSAPC_Rendicion'
CREATE INDEX [IX_FK_SAPC_ComprobantesSAPC_Rendicion]
ON [dbo].[SAPC_Comprobante]
    ([Rendicion_Id]);
GO

-- Creating foreign key on [Rendicion_Id] in table 'SAPC_OtrosComprobantes'
ALTER TABLE [dbo].[SAPC_OtrosComprobantes]
ADD CONSTRAINT [FK_SAPC_RendicionSAPC_OtrosComprobantes]
    FOREIGN KEY ([Rendicion_Id])
    REFERENCES [dbo].[SAPC_Rendicion]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SAPC_RendicionSAPC_OtrosComprobantes'
CREATE INDEX [IX_FK_SAPC_RendicionSAPC_OtrosComprobantes]
ON [dbo].[SAPC_OtrosComprobantes]
    ([Rendicion_Id]);
GO

-- Creating foreign key on [Rendicion_Id] in table 'SAPC_Adelantos'
ALTER TABLE [dbo].[SAPC_Adelantos]
ADD CONSTRAINT [FK_SAPC_RendicionSAPC_Adelantos]
    FOREIGN KEY ([Rendicion_Id])
    REFERENCES [dbo].[SAPC_Rendicion]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SAPC_RendicionSAPC_Adelantos'
CREATE INDEX [IX_FK_SAPC_RendicionSAPC_Adelantos]
ON [dbo].[SAPC_Adelantos]
    ([Rendicion_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------