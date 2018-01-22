SET IDENTITY_INSERT [dbo].[SAPC_Empleado] ON
INSERT INTO [dbo].[SAPC_Empleado] ([Id], [Nombre], [DNI], [CtaContable]) VALUES (1, N'Juan Rodriguez', N'12345678', N'123456')
INSERT INTO [dbo].[SAPC_Empleado] ([Id], [Nombre], [DNI], [CtaContable]) VALUES (2, N'Jose Perez', N'14345678', N'123457')
INSERT INTO [dbo].[SAPC_Empleado] ([Id], [Nombre], [DNI], [CtaContable]) VALUES (3, N'Pablo Ruiz', N'16345678', N'123458')
SET IDENTITY_INSERT [dbo].[SAPC_Empleado] OFF

SET IDENTITY_INSERT [dbo].[SAPC_EndPoint] ON
INSERT INTO [dbo].[SAPC_EndPoint] ([Id], [Name], [URLAdelantos], [LastConnectionOn], [URLRendicionABC], [URLRendicionNoABC], [LoginName], [LoginPassword]) VALUES (2, N'PtoPrueba1', N'https://prueba1/Adelantos', N'2018-01-01 00:00:00', N'https://prueba1/RendicionesABC', N'https://prueba1/RendicionesNoABC', N'prueba', N'pruebaPwd')
SET IDENTITY_INSERT [dbo].[SAPC_EndPoint] OFF

SET IDENTITY_INSERT [dbo].[SAPC_FondoFijo] ON
INSERT INTO [dbo].[SAPC_FondoFijo] ([Id], [Nombre], [CreadoEn], [SAPId], [Estado_Id], [EndPoint_Id]) VALUES (2, N'Fondo1', N'2018-1-15', N'SAPFondo1', 20, 1)
SET IDENTITY_INSERT [dbo].[SAPC_FondoFijo] OFF

SET IDENTITY_INSERT [dbo].[SAPC_CECO] ON
INSERT INTO [dbo].[SAPC_CECO] ([Id], [Nombre], [CodCECO]) VALUES (1, N'Marketing', N'CECO1')
INSERT INTO [dbo].[SAPC_CECO] ([Id], [Nombre], [CodCECO]) VALUES (2, N'Ventas', N'CECO2')
INSERT INTO [dbo].[SAPC_CECO] ([Id], [Nombre], [CodCECO]) VALUES (3, N'Proyecto X', N'CECO3')
SET IDENTITY_INSERT [dbo].[SAPC_CECO] OFF
