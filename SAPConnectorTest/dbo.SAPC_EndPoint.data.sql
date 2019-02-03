SET IDENTITY_INSERT [dbo].[SAPC_EndPoint] ON
INSERT INTO [dbo].[SAPC_EndPoint] ([Id], [Nombre], [URLAdelantos], [LastConnectionOn], [URLRendicionABC], [URLRendicionNoABC], [LoginName], [LoginPassword], [URLProveedores]) 
       VALUES (3, N'EstradaPrueba', 
	              N'http://estradades.ad.aesa.com.ar:8000/sap/bc/srt/rfc/sap/zws_solicitud_anticipo/200/zws_solicitud_anticipo/zws_solicitud_anticipo', 
				  NULL, 
				  N'http://estradades.ad.aesa.com.ar:8000/sap/bc/srt/rfc/sap/zws_comprobantes_abc/200/zws_comprobantes_abc/zws_comprobantes_abc', 
				  N'http://estradades.ad.aesa.com.ar:8000/sap/bc/srt/rfc/sap/zws_comprobantes_no_abc/200/zws_comprobantes_no_abc/zws_comprobantes_no_abc', 
				  N'prueba', 
				  N'prueba', 
				  N' http://estradades.ad.aesa.com.ar:8000/sap/bc/srt/rfc/sap/zws_datos_proveedores/200/zws_datos_proveedores/zws_datos_proveedores')
SET IDENTITY_INSERT [dbo].[SAPC_EndPoint] OFF
