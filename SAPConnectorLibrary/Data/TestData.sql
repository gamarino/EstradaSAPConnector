SET IDENTITY_INSERT [dbo].[SAPC_Empleado] ON
INSERT INTO [dbo].[SAPC_Empleado] ([Id], [Nombre], [DNI], [CtaContable]) VALUES (1, N'Juan Rodriguez', N'12345678', N'123456')
INSERT INTO [dbo].[SAPC_Empleado] ([Id], [Nombre], [DNI], [CtaContable]) VALUES (2, N'Jose Perez', N'14345678', N'123457')
INSERT INTO [dbo].[SAPC_Empleado] ([Id], [Nombre], [DNI], [CtaContable]) VALUES (3, N'Pablo Ruiz', N'16345678', N'123458')
SET IDENTITY_INSERT [dbo].[SAPC_Empleado] OFF

SET IDENTITY_INSERT [dbo].[SAPC_EndPoint] ON
INSERT INTO [dbo].[SAPC_EndPoint] ([Id], [Name], [URLAdelantos], [LastConnectionOn], [URLRendicionABC], [URLRendicionNoABC], [LoginName], [LoginPassword]) 
       VALUES (1, N'PtoPrueba1', N'https://prueba1/Adelantos', N'2018-01-01 00:00:00', N'https://prueba1/RendicionesABC', N'https://prueba1/RendicionesNoABC', N'prueba', N'pruebaPwd')
SET IDENTITY_INSERT [dbo].[SAPC_EndPoint] OFF

SET IDENTITY_INSERT [dbo].[SAPC_FondoFijo] ON
INSERT INTO [dbo].[SAPC_FondoFijo] ([Id], [Nombre], [CreadoEn], [SAPId], [Estado_Id], [EndPoint_Id]) 
       VALUES (1, N'Fondo1', N'2018-1-15', N'SAPFondo1', 20, 1)
SET IDENTITY_INSERT [dbo].[SAPC_FondoFijo] OFF

SET IDENTITY_INSERT [dbo].[SAPC_CECO] ON
INSERT INTO [dbo].[SAPC_CECO] ([Id], [Nombre], [CodCECO]) VALUES (1, N'Marketing', N'CECO1')
INSERT INTO [dbo].[SAPC_CECO] ([Id], [Nombre], [CodCECO]) VALUES (2, N'Ventas', N'CECO2')
INSERT INTO [dbo].[SAPC_CECO] ([Id], [Nombre], [CodCECO]) VALUES (3, N'Proyecto X', N'CECO3')
SET IDENTITY_INSERT [dbo].[SAPC_CECO] OFF

SET IDENTITY_INSERT [dbo].[SAPC_Adelantos] ON
INSERT INTO [dbo].[SAPC_Adelantos] ([Id], [SAPNroDoc], [Fecha], [FondoFijo_Id], [Estado_Id]) 
       VALUES (3, N'NoDisponible', N'2018-01-22 00:00:00', 1, 3)
SET IDENTITY_INSERT [dbo].[SAPC_Adelantos] OFF

SET IDENTITY_INSERT [dbo].[SAPC_Adelanto_Empleado] ON
INSERT INTO [dbo].[SAPC_Adelanto_Empleado] ([Id], [Fecha], [FechaVto], [Importe], [Referencia], [Adelanto_Id], [Empleado_Id]) 
       VALUES (3, N'2018-01-12 00:00:00', N'2018-02-12 00:00:00', CAST(1000 AS Decimal(18, 0)), N'Adelanto1', 3, 1)
INSERT INTO [dbo].[SAPC_Adelanto_Empleado] ([Id], [Fecha], [FechaVto], [Importe], [Referencia], [Adelanto_Id], [Empleado_Id]) 
       VALUES (4, N'2018-01-12 00:00:00', N'2018-02-12 00:00:00', CAST(2000 AS Decimal(18, 0)), N'Adelanto2', 3, 1)
INSERT INTO [dbo].[SAPC_Adelanto_Empleado] ([Id], [Fecha], [FechaVto], [Importe], [Referencia], [Adelanto_Id], [Empleado_Id]) 
       VALUES (5, N'2018-01-15 00:00:00', N'2018-02-15 00:00:00', CAST(4000 AS Decimal(18, 0)), N'Adelanto3', 3, 2)
SET IDENTITY_INSERT [dbo].[SAPC_Adelanto_Empleado] OFF

SET IDENTITY_INSERT [dbo].[SAPC_RendicionABC] ON
INSERT INTO [dbo].[SAPC_RendicionABC] ([Id], [SAPNroDoc], [Fecha], [FondoFijo_Id], [Estado_Id]) 
       VALUES (1, N'NoDisponible', N'1/23/18', 1, 16)
SET IDENTITY_INSERT [dbo].[SAPC_RendicionABC] OFF


SET IDENTITY_INSERT [dbo].[SAPC_Proveedor] ON
INSERT INTO [dbo].[SAPC_Proveedor] ([Id], [Nombre], [CUIT], [CtaContable]) 
       VALUES (1, N'El carpintero SA', N'27123456780', N'6555')
INSERT INTO [dbo].[SAPC_Proveedor] ([Id], [Nombre], [CUIT], [CtaContable]) 
       VALUES (2, N'El plomero SA', N'27987654320', N'6556')
SET IDENTITY_INSERT [dbo].[SAPC_Proveedor] OFF

SET IDENTITY_INSERT [dbo].[SAPC_Jurisdicciones] ON
INSERT INTO [dbo].[SAPC_Jurisdicciones] ([Id], [Nombre]) VALUES (1, N'Buenos Aires')
INSERT INTO [dbo].[SAPC_Jurisdicciones] ([Id], [Nombre]) VALUES (2, N'San Luis')
INSERT INTO [dbo].[SAPC_Jurisdicciones] ([Id], [Nombre]) VALUES (3, N'Santa Fe')
INSERT INTO [dbo].[SAPC_Jurisdicciones] ([Id], [Nombre]) VALUES (4, N'CAPITAL')
INSERT INTO [dbo].[SAPC_Jurisdicciones] ([Id], [Nombre]) VALUES (5, N'Nacion')
SET IDENTITY_INSERT [dbo].[SAPC_Jurisdicciones] OFF

SET IDENTITY_INSERT [dbo].[SAPC_Percepciones] ON
INSERT INTO [dbo].[SAPC_Percepciones] ([Id], [Nombre], [CtaContable], [Jurisdiccion_Id]) 
       VALUES (1, N'Percepciones IIBB BA', N'8777', 1)
INSERT INTO [dbo].[SAPC_Percepciones] ([Id], [Nombre], [CtaContable], [Jurisdiccion_Id]) 
       VALUES (2, N'IIBBSL', N'8778', 2)
SET IDENTITY_INSERT [dbo].[SAPC_Percepciones] OFF

SET IDENTITY_INSERT [dbo].[SAPC_FacturaProveedor] ON
INSERT INTO [dbo].[SAPC_FacturaProveedor] ([Id], [TipoDocumento], [ImporteNeto], [Fecha], [PtoVenta], [NumeroDocumento], [BaseIVA21], [BaseIVA105], [BaseIVA27], [BaseIVA0], [ImporteTotalAPagar], [Percepcion1Importe], [Percepcion2Importe], [RendicionGastos_Id], [Proveedor_Id], [CECO_Id], [Percepcion1_Id], [Percepcion2_Id], [RendidoPor_Id]) 
       VALUES (1, N'001', CAST(1200 AS Decimal(18, 0)), N'2018-01-12 00:00:00', 1, 874, CAST(700 AS Decimal(18, 0)), CAST(500 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(1498 AS Decimal(18, 0)), CAST(50 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 1, 1, 1, 1, NULL, 1)
INSERT INTO [dbo].[SAPC_FacturaProveedor] ([Id], [TipoDocumento], [ImporteNeto], [Fecha], [PtoVenta], [NumeroDocumento], [BaseIVA21], [BaseIVA105], [BaseIVA27], [BaseIVA0], [ImporteTotalAPagar], [Percepcion1Importe], [Percepcion2Importe], [RendicionGastos_Id], [Proveedor_Id], [CECO_Id], [Percepcion1_Id], [Percepcion2_Id], [RendidoPor_Id]) 
       VALUES (2, N'001', CAST(1000 AS Decimal(18, 0)), N'2018-01-15 00:00:00', 1, 8887, CAST(1000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(1210 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 1, 2, 1, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[SAPC_FacturaProveedor] OFF

SET IDENTITY_INSERT [dbo].[SAPC_RendicionComp] ON
INSERT INTO [dbo].[SAPC_RendicionComp] ([Id], [SAPNroDoc], [Fecha], [FondoFijo_Id], [Estado_Id]) VALUES (1, NULL, N'1/22/18', 1, 10)
SET IDENTITY_INSERT [dbo].[SAPC_RendicionComp] OFF

SET IDENTITY_INSERT [dbo].[SAPC_Comprobante] ON
INSERT INTO [dbo].[SAPC_Comprobante] ([Id], [Fecha], [Importe], [RendicionComp_Id], [Proveedor_Id], [CECO_Id], [RendidoPor_Id]) 
       VALUES (1, N'2018-01-20 00:00:00', CAST(1454 AS Decimal(18, 0)), 1, 2, 2, 2)
INSERT INTO [dbo].[SAPC_Comprobante] ([Id], [Fecha], [Importe], [RendicionComp_Id], [Proveedor_Id], [CECO_Id], [RendidoPor_Id]) 
	   VALUES (2, N'2018-01-20 00:00:00', CAST(2376 AS Decimal(18, 0)), 1, 2, 2, 2)
SET IDENTITY_INSERT [dbo].[SAPC_Comprobante] OFF

