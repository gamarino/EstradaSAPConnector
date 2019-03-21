using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel;
using System.Text;
using System.Threading.Tasks;
using System.Globalization;
using ObjectDumper;

namespace SAPConnectorLibrary
{
    public class DocInfo
    {
        public string Resultado;
        public string Mensaje;
        public DateTime Fechadoc;
        public DateTime Fechaing;
        public string Id;
        public Decimal Importelocal;
        public Decimal Importerendido;
        public string Moneda;
        public string Nombre;
        public string Rindio;
        public Decimal Tipocambio;
    }

    class SessionContext
    {
        public Models.SAPC_Session Session;
    }

    class SynchException : Exception
    {
        public SynchException(string msg) : base(msg) { }
    }

    public class SynchToSAP
    {
        static readonly string FONDO_ACTIVO = "Activo";

        static readonly string ADELANTO_A_PROCESAR = "SAPC_Adelanto_A_Procesar";
        static readonly string ADELANTO_PROCESADO = "SAPC_Adelanto_Procesado";
        static readonly string ADELANTO_RECHAZADO = "SAPC_Adelanto_Rechazado";

        static readonly string RENDICION_APROBADA = "SAPC_Rendicion_Aprobada";
        static readonly string RENDICION_A_PROCESAR = "SAPC_Rendicion_A_Procesar";
        static readonly string RENDICION_PROCESADA = "SAPC_Rendicion_Procesada";
        static readonly string RENDICION_RECHAZADA = "SAPC_Rendicion_Rechazada";

        static readonly string FACTURA_A_PROCESAR = "SAPC_FacturaProveedor_A_Procesar";
        static readonly string FACTURA_PROCESADA = "SAPC_FacturaProveedor_Procesada";
        static readonly string FACTURA_RECHAZADA = "SAPC_FacturaProveedor_Rechazada";

        Models.EstradaSAPConnectorContainer context;
        SessionContext session;
        Models.SAPC_Estados estadoRENDICION_APROBADA;
        Models.SAPC_Estados estadoRENDICION_A_PROCESAR;
        Models.SAPC_Estados estadoRENDICION_PROCESADA;
        Models.SAPC_Estados estadoRENDICION_RECHAZADA;

        Models.SAPC_Estados estadoADELANTO_A_PROCESAR;
        Models.SAPC_Estados estadoADELANTO_PROCESADO;
        Models.SAPC_Estados estadoADELANTO_RECHAZADO;

        Models.SAPC_Estados estadoFACTURA_A_PROCESAR;
        Models.SAPC_Estados estadoFACTURA_PROCESADA;
        Models.SAPC_Estados estadoFACTURA_RECHAZADA;

        SessionContext CreateSession(int endPointId)
        {
            Models.SAPC_EndPoint endPoint = this.context.SAPC_EndPoint.Find(endPointId);
            Models.SAPC_Session newSession = new Models.SAPC_Session
            {
                EndPoint = endPoint,
                Comienzo = DateTime.Now,
                Final = DateTime.Now,
                ErrorCode = "In progress",
                ErrorMessage = "In progress",
            };

            this.context.SAPC_Session.Add(newSession);

            if (estadoADELANTO_A_PROCESAR == null)
            {
                estadoADELANTO_A_PROCESAR = this.context.SAPC_Estados
                                           .Where(e => e.Codigo == ADELANTO_A_PROCESAR &&
                                                       e.EntityName == "SAPC_Adelantos")
                                           .FirstOrDefault();
                estadoADELANTO_PROCESADO = this.context.SAPC_Estados
                                           .Where(e => e.Codigo == ADELANTO_PROCESADO &&
                                                       e.EntityName == "SAPC_Adelantos")
                                           .FirstOrDefault();
                estadoADELANTO_RECHAZADO = this.context.SAPC_Estados
                                           .Where(e => e.Codigo == ADELANTO_RECHAZADO &&
                                                       e.EntityName == "SAPC_Adelantos")
                                           .FirstOrDefault();

                estadoFACTURA_A_PROCESAR = this.context.SAPC_Estados
                                           .Where(e => e.Codigo == FACTURA_A_PROCESAR &&
                                                       e.EntityName == "SAPC_FacturaProveedor")
                                           .FirstOrDefault();
                estadoFACTURA_PROCESADA = this.context.SAPC_Estados
                                           .Where(e => e.Codigo == FACTURA_PROCESADA &&
                                                       e.EntityName == "SAPC_FacturaProveedor")
                                           .FirstOrDefault();
                estadoFACTURA_RECHAZADA = this.context.SAPC_Estados
                                           .Where(e => e.Codigo == FACTURA_RECHAZADA &&
                                                       e.EntityName == "SAPC_FacturaProveedor")
                                           .FirstOrDefault();

                estadoRENDICION_APROBADA = this.context.SAPC_Estados
                                           .Where(e => e.Codigo == RENDICION_APROBADA &&
                                                       e.EntityName == "SAPC_Rendicion")
                                           .FirstOrDefault();
                estadoRENDICION_A_PROCESAR = this.context.SAPC_Estados
                                             .Where(e => e.Codigo == RENDICION_A_PROCESAR &&
                                                       e.EntityName == "SAPC_Rendicion")
                                           .FirstOrDefault();
                estadoRENDICION_PROCESADA = this.context.SAPC_Estados
                                            .Where(e => e.Codigo == RENDICION_PROCESADA &&
                                                        e.EntityName == "SAPC_Rendicion")
                                            .FirstOrDefault();
                estadoRENDICION_RECHAZADA = this.context.SAPC_Estados
                                            .Where(e => e.Codigo == RENDICION_RECHAZADA &&
                                                        e.EntityName == "SAPC_Rendicion")
                                            .FirstOrDefault();
            }

            this.context.SaveChanges();

            return new SessionContext
            {
                Session = newSession,
            };
        }

        void SAPPushAdelanto(Models.SAPC_Adelantos adelanto)
        {
            Models.SAPC_SAPRPCCall call = new Models.SAPC_SAPRPCCall
            {
                Method = "Adelanto",
                ErrorCode = "In progress",
                ErrorMsg = "In progress",
                Results1 = "In progress",
                Adelanto = adelanto,
                Session = this.session.Session,
                EndPoint = this.session.Session.EndPoint,
            };

            try
            {
                BasicHttpBinding binding = new BasicHttpBinding();
                EndpointAddress address = new EndpointAddress(session.Session.EndPoint.URLAdelantos);
                Solicitud_Anticipo.ZWS_SOLICITUD_ANTICIPOClient client = new Solicitud_Anticipo.ZWS_SOLICITUD_ANTICIPOClient(binding, address);

                var fvto = adelanto.Fecha;
                fvto = fvto.AddDays(3);

                List<Solicitud_Anticipo.ZFI_RFC_ANTICIPOS> comp = new List<Solicitud_Anticipo.ZFI_RFC_ANTICIPOS>
                {
                    new Solicitud_Anticipo.ZFI_RFC_ANTICIPOS
                    {
                        FECHA_DOC = adelanto.Fecha,
                        FECHA_CONT = adelanto.FechaCont,
                        CLASE_DOC = adelanto.ClaseDoc.Codigo,
                        SOCIEDAD = adelanto.Sociedad.Codigo,
                        MONEDA = adelanto.Moneda.Codigo,
                        REFERENCIA = adelanto.Referencia,
                        TIENDA = "",
                        TEXTO_CAB = adelanto.TextoCab,
                        // CTA_CONTABLE1 = "1105021",
                        CTA_CONTABLE1 = adelanto.CtaContable,
                        IND_CME = "B",
                        IMPORTE = adelanto.Importe,
                        FECHA_VTO = fvto, // Fecha hoy + 3 días
                        TEXTO_POS = adelanto.TextoPOS,
                    }
                };

                Solicitud_Anticipo.ZFI_RFC_SOLICITUD_ANTICIPO request = new Solicitud_Anticipo.ZFI_RFC_SOLICITUD_ANTICIPO
                {
                    T_DETALLE = comp.ToArray(),
                    RESULTS = new Solicitud_Anticipo.T100[0],
                };

                using (var writer = new System.IO.StringWriter())
                {
                    ObjectDumper.Dumper.Dump(request, "Anticipo request", writer);
                    call.InputParameters = writer.ToString();
                }
                call.StartedOn = DateTime.Now;

                Solicitud_Anticipo.ZFI_RFC_SOLICITUD_ANTICIPOResponse response = client.ZFI_RFC_SOLICITUD_ANTICIPO(request);

                call.FinishedOn = DateTime.Now;
                call.ErrorCode = response.RESULTADO;
                call.Results1 = "OK";
                using (var writer = new System.IO.StringWriter())
                {
                    ObjectDumper.Dumper.Dump(response, "Anticipo response", writer);
                    call.ErrorMsg = writer.ToString();
                }

                if (response.RESULTADO != "001")
                {
                    adelanto.Estado = estadoADELANTO_RECHAZADO;
                    adelanto.Error = response.MENSAJE;
                }
                else
                {
                    adelanto.SAPNroDoc = response.NRO_DOC;
                    adelanto.Estado = estadoADELANTO_PROCESADO;
                }
                context.Entry(adelanto).State = System.Data.Entity.EntityState.Modified;
            }
            catch (Exception e)
            {
                call.FinishedOn = DateTime.Now;
                call.ErrorCode = "Unexpected exception";
                call.ErrorMsg = e.ToString();
                call.Results1 = "Exception";
            }
            finally
            {
                this.context.SAPC_SAPRPCCall.Add(call);
                this.context.SaveChanges();
            }
        }

        void SAPPushFactura(Models.SAPC_FacturaProveedor factura)
        {
            Models.SAPC_SAPRPCCall call = new Models.SAPC_SAPRPCCall
            {
                Method = "Factura",
                ErrorCode = "In progress",
                ErrorMsg = "In progress",
                Results1 = "In progress",
                FacturaProveedor = factura,
                Session = this.session.Session,
                EndPoint = this.session.Session.EndPoint,
            };

            try
            {
                BasicHttpBinding binding = new BasicHttpBinding();
                EndpointAddress address = new EndpointAddress(session.Session.EndPoint.URLRendicionABC);
                Comprobantes_ABC.ZWS_COMPROBANTES_ABCClient client = new Comprobantes_ABC.ZWS_COMPROBANTES_ABCClient(binding, address);


                Comprobantes_ABC.ZFI_RFC_COMPROBANTES_ABC1 request = new Comprobantes_ABC.ZFI_RFC_COMPROBANTES_ABC1
                {
                    ACREEDOR = factura.Proveedor.SAPId,
                    FECHACONT = factura.FechaContable,
                    FECHAFACTURA = factura.FechaFactura,
                    REFERENCIA = factura.Referencia,
                    CLASE_DOC = factura.ClaseDoc.Codigo,
                    SOCIEDAD = factura.Sociedad.Codigo,
                    MONEDA = factura.Moneda.Codigo,
                    IMPORTE = factura.Importe,
                    TEXTO = factura.Texto,
                    TIENDA = factura.Tienda,
                    CAE = factura.CAE,
                    CAE_VTO = factura.CAEVto,
                    NOMBRE = factura.Proveedor.Nombre,
                    CALLE = factura.Proveedor.Calle,
                    CPOSTAL = factura.Proveedor.CPostal,
                    POBLACION = factura.Proveedor.Poblacion.Codigo,
                    PAIS = factura.Proveedor.Poblacion.Pais.Codigo,
                    CUIT = factura.Proveedor.CUIT,
                };

                List<Comprobantes_ABC.ZFI_RFC_COMPROBANTES_ABC> comp = new List<Comprobantes_ABC.ZFI_RFC_COMPROBANTES_ABC>();
                foreach (var inputacion in factura.Inputaciones)
                {
                    comp.Add(new Comprobantes_ABC.ZFI_RFC_COMPROBANTES_ABC
                    {
                        CECO = inputacion.CECO.CodCECO,
                        CTA_CONTABLE = inputacion.CtaContable,
                        IMPORTE = inputacion.Importe,
                        IND_IMP = inputacion.IndImp,
                    });
                }

                if (comp.Count() == 0)
                {
                    if (factura.Rendicion != null)
                    {
                        comp.Add(new Comprobantes_ABC.ZFI_RFC_COMPROBANTES_ABC
                        {
                            CECO = "",
                            CTA_CONTABLE = factura.Rendicion.FondoFijo.SAPId,
                            IMPORTE = factura.Importe,
                            IND_IMP = "",
                        });
                    }
                    else if (factura.Rendicion.RendidoPor != null)
                    {
                        comp.Add(new Comprobantes_ABC.ZFI_RFC_COMPROBANTES_ABC
                        {
                            CECO = "",
                            CTA_CONTABLE = factura.Rendicion.RendidoPor.CtaContable,
                            IMPORTE = factura.Importe,
                            IND_IMP = "",
                        });
                    }
                }

                request.T_DETALLE = comp.ToArray();
                request.RESULTS = new Comprobantes_ABC.T100[0];

                using (var writer = new System.IO.StringWriter())
                {
                    ObjectDumper.Dumper.Dump(request, "Comprobante_ABC request", writer);
                    call.InputParameters = writer.ToString();
                }
                call.StartedOn = DateTime.Now;

                Comprobantes_ABC.ZFI_RFC_COMPROBANTES_ABCResponse response = client.ZFI_RFC_COMPROBANTES_ABC(request);

                call.FinishedOn = DateTime.Now;
                call.ErrorCode = response.RESULTADO;
                call.Results1 = "OK";
                using (var writer = new System.IO.StringWriter())
                {
                    ObjectDumper.Dumper.Dump(response, "Comprobante_ABC response", writer);
                    call.ErrorMsg = writer.ToString();
                }

                if (response.RESULTADO != "001")
                {
                    factura.Estado = estadoFACTURA_RECHAZADA;
                    factura.Error = response.MENSAJE;
                }
                else
                {
                    factura.SAPNroDoc = response.NRO_DOC;
                    factura.Estado = estadoFACTURA_PROCESADA;
                }
                context.Entry(factura).State = System.Data.Entity.EntityState.Modified;

            }
            catch (Exception e)
            {
                call.FinishedOn = DateTime.Now;
                call.ErrorCode = "Unexpected exception";
                call.ErrorMsg = e.ToString();
                call.Results1 = "Exception";
            }
            finally
            {
                this.context.SAPC_SAPRPCCall.Add(call);
                this.context.SaveChanges();
            }
        }

        void SAPCheckRendicion(Models.SAPC_Rendicion rendicion)
        {
            // Checkea que la rendición tenga todas las facturas y adelantos aprobadas y este en estado aprobada para marcarla A Procesar
            if (rendicion.Estado != estadoRENDICION_APROBADA)
                return;

            bool AllAproved = true;
            foreach (var adelanto in rendicion.Adelantos)
            {
                if (adelanto.Estado != estadoADELANTO_PROCESADO)
                {
                    AllAproved = false;
                    break;
                }
            }
            if (!AllAproved)
                return;

            AllAproved = true;
            foreach (var factura in rendicion.FacturasProveedor)
            {
                if (factura.Estado != estadoFACTURA_PROCESADA)
                {
                    AllAproved = false;
                    break;
                }
            }
            if (!AllAproved)
                return;

            rendicion.Estado = estadoRENDICION_PROCESADA;
        }
        void SAPPushRendicion(Models.SAPC_Rendicion rendicion)
        {
            DateTime now = DateTime.Now;

            Models.SAPC_SAPRPCCall call = new Models.SAPC_SAPRPCCall
            {
                Method = "Rendiciones",
                ErrorCode = "In progress",
                ErrorMsg = "In progress",
                Results1 = "In progress",
                RendicionGastos = rendicion,
                Session = this.session.Session,
                EndPoint = this.session.Session.EndPoint,
                StartedOn = now,
                FinishedOn = now,
            };

            try
            {
                BasicHttpBinding binding = new BasicHttpBinding();
                EndpointAddress address = new EndpointAddress(session.Session.EndPoint.URLRendicionNoABC);
                Comprobantes_NO_ABC.ZWS_COMPROBANTES_NO_ABCClient client = new Comprobantes_NO_ABC.ZWS_COMPROBANTES_NO_ABCClient(binding, address);

                if (rendicion.Comprobante == null)
                {
                    rendicion.Comprobante = new Models.SAPC_Comprobante
                    {
                        FechaCont = now.Date,
                        FechaDocumento = now.Date,
                        Referencia = "",
                    };
                }

                List<string> comprobantesSAP = new List<string>();

                // Asume que las facturas tienen lugar
                foreach (var factura in rendicion.FacturasProveedor)
                    comprobantesSAP.Add(factura.SAPNroDoc);

                foreach (var otroComprobante in rendicion.OtrosComprobantes)
                    comprobantesSAP.Add(otroComprobante.SAPNroDoc);

                if (comprobantesSAP.Count > 11)
                {
                    rendicion.Estado = estadoRENDICION_RECHAZADA;
                    rendicion.Error = "La cantidad de adelantos + facturas + otros comprobantes supera el máximo de 11 documentos";
                }
                else
                {
                    int index;
                    for (index = 1; index <= 11; index++)
                    {
                        string nroDoc;

                        if (index > comprobantesSAP.Count)
                            nroDoc = "";
                        else
                            nroDoc = comprobantesSAP.ElementAt(index - 1);

                        if (index == 1)
                            rendicion.Comprobante.DocComp1 = nroDoc;
                        if (index == 2)
                            rendicion.Comprobante.DocComp2 = nroDoc;
                        if (index == 3)
                            rendicion.Comprobante.DocComp3 = nroDoc;
                        if (index == 4)
                            rendicion.Comprobante.DocComp4 = nroDoc;
                        if (index == 5)
                            rendicion.Comprobante.DocComp5 = nroDoc;
                        if (index == 6)
                            rendicion.Comprobante.DocComp6 = nroDoc;
                        if (index == 7)
                            rendicion.Comprobante.DocComp7 = nroDoc;
                        if (index == 8)
                            rendicion.Comprobante.DocComp8 = nroDoc;
                        if (index == 9)
                            rendicion.Comprobante.DocComp9 = nroDoc;
                        if (index == 10)
                            rendicion.Comprobante.DocComp10 = nroDoc;
                        if (index == 11)
                            rendicion.Comprobante.DocComp11 = nroDoc;
                    }
                    rendicion.Error = "";

                    Comprobantes_NO_ABC.ZFI_RFC_COMPROBANTES_NO_ABC1 request = new Comprobantes_NO_ABC.ZFI_RFC_COMPROBANTES_NO_ABC1
                    {
                        FECHACONT = rendicion.Comprobante.FechaCont,
                        FECHADOCUMENTO = rendicion.Comprobante.FechaDocumento,
                        REFERENCIA = rendicion.Comprobante.Referencia,
                        CLASE_DOC = rendicion.Comprobante.ClaseDoc != null ?
                                        rendicion.Comprobante.ClaseDoc.Codigo :
                                        "AB",
                        SOCIEDAD = rendicion.Comprobante.Sociedad != null ?
                                        rendicion.Comprobante.Sociedad.Codigo :
                                        "ESTR",
                        MONEDA = rendicion.Comprobante.Moneda != null ?
                                        rendicion.Comprobante.Moneda.Codigo :
                                        "ARS",
                        TIENDA = rendicion.Comprobante.Tienda,
                        DOC_COMP1 = rendicion.Comprobante.DocComp1,
                        DOC_COMP2 = rendicion.Comprobante.DocComp2,
                        DOC_COMP3 = rendicion.Comprobante.DocComp3,
                        DOC_COMP4 = rendicion.Comprobante.DocComp4,
                        DOC_COMP5 = rendicion.Comprobante.DocComp5,
                        DOC_COMP6 = rendicion.Comprobante.DocComp6,
                        DOC_COMP7 = rendicion.Comprobante.DocComp7,
                        DOC_COMP8 = rendicion.Comprobante.DocComp8,
                        DOC_COMP9 = rendicion.Comprobante.DocComp9,
                        DOC_COMP10 = rendicion.Comprobante.DocComp10,
                        DOC_COMP11 = rendicion.Comprobante.DocComp11,
                    };

                    List<Comprobantes_NO_ABC.ZFI_RFC_COMPROBANTES_NO_ABC> comp = new List<Comprobantes_NO_ABC.ZFI_RFC_COMPROBANTES_NO_ABC>();
                    foreach (var cuenta in rendicion.Comprobante.Inputaciones)
                    {
                        comp.Add(new Comprobantes_NO_ABC.ZFI_RFC_COMPROBANTES_NO_ABC
                        {
                            CLAVE_CT = cuenta.ClaveCT,
                            CTA_CONTABLE1 = cuenta.CtaContable,
                            IMPORTE = cuenta.Importe,
                            TEXTOS = cuenta.Textos,
                            IND_IMP = cuenta.IndImp,
                            CECO = cuenta.CECO.CodCECO,
                            TEXTO = cuenta.Texto
                        });
                    }

                    request.CUENTAS = comp.ToArray();

                    using (var writer = new System.IO.StringWriter())
                    {
                        ObjectDumper.Dumper.Dump(request, "Comprobante_NO_ABC request", writer);
                        call.InputParameters = writer.ToString();
                    }
                    call.StartedOn = DateTime.Now;

                    Comprobantes_NO_ABC.ZFI_RFC_COMPROBANTES_NO_ABCResponse response = client.ZFI_RFC_COMPROBANTES_NO_ABC(request);

                    call.FinishedOn = DateTime.Now;
                    call.ErrorCode = response.RESULTADO;
                    call.Results1 = "OK";
                    using (var writer = new System.IO.StringWriter())
                    {
                        ObjectDumper.Dumper.Dump(response, "Comprobante_NO_ABC response", writer);
                        call.ErrorMsg = writer.ToString();
                    }

                    if (response.RESULTADO != "001")
                    {
                        rendicion.Estado = estadoRENDICION_RECHAZADA;
                        rendicion.Error = response.MENSAJE;
                    }
                    else
                    {
                        rendicion.Comprobante.SAPNroDoc = response.NRO_DOC;
                        rendicion.SAPNroDoc = response.NRO_DOC;
                        rendicion.Estado = estadoRENDICION_PROCESADA;
                    }
                    context.Entry(rendicion).State = System.Data.Entity.EntityState.Modified;

                }
            }
            catch (Exception e)
            {
                call.FinishedOn = DateTime.Now;
                call.ErrorCode = "Unexpected exception";
                call.ErrorMsg = e.ToString();
                call.Results1 = "Exception";
            }
            finally
            {
                this.context.SAPC_SAPRPCCall.Add(call);
                this.context.SaveChanges();
            }
        }

        void SAPSynchVendors()
        {

            BasicHttpBinding binding = new BasicHttpBinding();
            binding.MaxReceivedMessageSize = 9999999;
            binding.MaxBufferSize = 9999999;
            binding.MaxBufferPoolSize = 9999999;
            /*
          binding.Security.Transport = new HttpTransportSecurity(); 
          binding.Security.Transport.ClientCredentialType = HttpClientCredentialType.Basic;
            binding.Security.Mode = BasicHttpSecurityMode.TransportCredentialOnly;
            binding.Security.Message = new BasicHttpMessageSecurity();
            binding.Security.Message.ClientCredentialType = BasicHttpMessageCredentialType.UserName;
            */

            EndpointAddress address = new EndpointAddress(session.Session.EndPoint.URLProveedores);
          
                var client = new Datos_Proveedores.ZWS_DATOS_PROVEEDORESClient(binding, address);
              /*  client.ClientCredentials.UserName.UserName = "Prueba";
                client.ClientCredentials.UserName.Password = "Prueba";
        */



            DateTime lastUpdate = DateTime.MinValue;
                if (context.SAPC_Proveedores.Count() != 0)
                {
                    lastUpdate = context.SAPC_Proveedores.Max(p => p.UltimaActualizacion);
                }
               

            var datosProv = new Datos_Proveedores.ZFI_RFC_DATOS_PROVEEDORES
            {
                FECHA_CREACION = lastUpdate != DateTime.MinValue ? lastUpdate : new DateTime(2015, 1, 1),
                FECHA_CREACIONSpecified = true,
                T_DETALLE = new Datos_Proveedores.ZFI_RFC_PROVEEDORES[0],
            };




            //Datos_Proveedores.ZFI_RFC_DATOS_PROVEEDORESResponse1 r1 = client.ZFI_RFC_DATOS_PROVEEDORES(request);
            var response = client.ZFI_RFC_DATOS_PROVEEDORES(datosProv);

            
              
            if (response.RESULTADO == "001")
            {
                // synch datos recibidos en tabla de proveedores
                
                foreach (var vendor in response.T_DETALLE)
                {
                       
                    if (vendor.PERNR == "00000000")
                    {
                        Models.SAPC_Paises country;
                        Models.SAPC_Poblaciones city;

                        var countries = from a in context.SAPC_Paises
                                        where a.Codigo == vendor.PAIS
                                        select a;

                        if (countries.Count() == 0)
                        {
                            country = new Models.SAPC_Paises
                            {
                                Codigo = vendor.PAIS,
                                Nombre = vendor.PAIS
                            };
                            context.SAPC_Paises.Add(country);
                        }
                        else
                            country = countries.First();

                        var cities = from a in context.SAPC_Poblaciones
                                        where a.Codigo == vendor.POBLACION && a.Pais.Id == country.Id
                                        select a;
                        if (cities.Count() == 0)
                        {
                            city = new Models.SAPC_Poblaciones
                            {
                                Codigo = vendor.POBLACION,
                                Nombre = vendor.POBLACION,
                                Pais = country,
                            };
                            context.SAPC_Poblaciones.Add(city);
                        }
                        else
                            city = cities.First();


                        var vendors = from a in context.SAPC_Proveedores
                                        where a.SAPId == vendor.PROVEEDOR
                                        select a;
                        if (vendors.Count() != 0)
                        {
                            Models.SAPC_Proveedores existingVendor = vendors.First();
                            existingVendor.Calle = vendor.CALLE;
                            existingVendor.CPostal = vendor.CPOSTAL;
                            existingVendor.CUIT = vendor.CUIT;
                            existingVendor.Flag = vendor.FLAG != " ";
                            existingVendor.Mail = vendor.MAIL;
                            existingVendor.Nombre = vendor.NOMBRE;
                            existingVendor.Poblacion = city;
                            existingVendor.Telefono = vendor.TELEFONO;
                            existingVendor.UltimaActualizacion = DateTime.Now;
                        }
                        else
                        {

                       
                            context.SAPC_Proveedores.Add(new Models.SAPC_Proveedores
                            {
                                SAPId = vendor.PROVEEDOR,
                                Calle = vendor.CALLE,
                                CPostal = vendor.CPOSTAL,
                                CUIT = vendor.CUIT,
                                Flag = vendor.FLAG != " ",
                                Mail = vendor.MAIL,
                                Nombre = vendor.NOMBRE,
                                Poblacion = city,
                                Telefono = vendor.TELEFONO,
                                CtaContable = vendor.PROVEEDOR,
                                UltimaActualizacion = DateTime.Now,
                            });
                        }
                    }
                    else
                    {
                        // Es un empleado
                        var employees = from a in context.SAPC_Empleado
                                        where a.NroEmpleado == vendor.PERNR
                                        select a;
                        if (employees.Count() != 0)
                        {
                            Models.SAPC_Empleado existingEmployee = employees.First();
                            existingEmployee.Nombre = vendor.NOMBRE;
                            existingEmployee.CtaContable = vendor.PROVEEDOR;
                        }
                        else
                        {
                            context.SAPC_Empleado.Add(new Models.SAPC_Empleado
                            {
                                NroEmpleado = vendor.PERNR,
                                DNI = vendor.CUIT,
                                CtaContable = vendor.PROVEEDOR,
                                Nombre = vendor.NOMBRE
                            });
                        }
                    }
                }
            }
        }

        public void SynchNow()
        {
         
            using (var context = new Models.EstradaSAPConnectorContainer())
            {
                if (context != null)
                {
                    this.context = context;


                   

                    IQueryable<IGrouping<int, Models.SAPC_Adelantos>> adelantosPorEndpoint, adelantosPorEmpleadoPorEndpoint;
                    IQueryable<IGrouping<int, Models.SAPC_FacturaProveedor>> facturasPorEndpoint;
                    ISet<int> endPoints;



                    ProcesarProveedores(context);
                    GetFinalEndpoints(context, out adelantosPorEndpoint, out adelantosPorEmpleadoPorEndpoint, out facturasPorEndpoint, out endPoints);

                    if (endPoints != null)
                    {
                        if (endPoints.Count > 0)
                        {
                            session = null;

                          
                            ProcesarDocumentos(context, endPoints, adelantosPorEndpoint, adelantosPorEmpleadoPorEndpoint, facturasPorEndpoint);

                            ProcesarRendiciones(context, endPoints);

                          
                        }
                    }
                    else
                    {
                        throw new Exception("No Endpoints available");
                    }
                }
                else {
                    throw new Exception("Error entre el modelo y la base de datos");
                }
            }
            
        }


        private void ProcesarProveedores(Models.EstradaSAPConnectorContainer context) {

            var allEndPoints = context.SAPC_EndPoint;


            foreach (var endPoint in allEndPoints.ToList())
            {


                session = this.CreateSession(endPoint.Id);
                //si quito la siguiente linea, llega a loguear en la sesion, pero con ese metodo llamado no
                //aparentemente tira errror en sap
                //el error es de credenciales, cambiando la estructura y el codigo
                this.SAPSynchVendors();
                this.session.Session.ErrorCode = "OK";
                this.session.Session.ErrorMessage = "Normal ending - Vendor synch";
                session.Session.Final = DateTime.Now;
                context.Entry(session.Session).State = System.Data.Entity.EntityState.Modified;
                context.SaveChanges();
                
            }
        }

        private void ProcesarRendiciones(Models.EstradaSAPConnectorContainer context, ISet<int> endPoints)
        {
            var rendicionesAprobadas = from r in context.SAPC_Rendicion
                                       where r.Estado.Codigo == RENDICION_APROBADA &&
                                               r.FondoFijo != null &&
                                               r.FondoFijo.Estado.Codigo == FONDO_ACTIVO
                                       select r;

            foreach (var r in rendicionesAprobadas)
                this.SAPCheckRendicion(r);

            // Tomar rendiciones ABC a procesar, luego de procesar las facturas y adelantos
            var rendiciones = from r in context.SAPC_Rendicion
                              where r.Estado.Codigo == RENDICION_A_PROCESAR &&
                                  r.FondoFijo != null &&
                                  r.FondoFijo.Estado.Codigo == FONDO_ACTIVO
                              select r;

            var rendicionesPorEndpoint = from r in rendiciones
                                         group r by r.FondoFijo.EndPoint.Id
                                            into g
                                         select g;

            var rendicionesPorEmpleado = from r in context.SAPC_Rendicion
                                         where r.Estado.Codigo == RENDICION_A_PROCESAR &&
                                             r.RendidoPor != null
                                         select r;

            var rendicionesPorEmpleadoPorEndpoint = from rabc in rendicionesPorEmpleado
                                                    group rabc by rabc.RendidoPor.EndPoint.Id
                                                        into g
                                                    select g;

            foreach (var endPointGroup in rendicionesPorEndpoint)
            {
                endPoints.Add(endPointGroup.Key);
            }
            foreach (var endPointGroup in rendicionesPorEmpleadoPorEndpoint)
            {
                endPoints.Add(endPointGroup.Key);
            }

            if (endPoints.Count > 0)
            {
                foreach (int endPointId in endPoints)
                {
                    session = this.CreateSession(endPointId);

                    foreach (var a1Element in rendicionesPorEndpoint.ToList())
                    {
                        if (a1Element.Key == endPointId)
                        {
                            foreach (var r in a1Element.ToList())
                            {
                                this.SAPPushRendicion(r);
                            }
                        }

                        foreach (var a2Element in rendicionesPorEmpleadoPorEndpoint.ToList())
                        {
                            if (a2Element.Key == endPointId)
                            {
                                foreach (var r in a2Element.ToList())
                                {
                                    this.SAPPushRendicion(r);
                                }
                            }
                        }
                    }

                    this.session.Session.ErrorCode = "OK";
                    this.session.Session.ErrorMessage = "Normal ending - Renditions";
                    session.Session.Final = DateTime.Now;
                    context.Entry(session.Session).State = System.Data.Entity.EntityState.Modified;
                    context.SaveChanges();
                }

                
            }
        }

        private void ProcesarDocumentos(Models.EstradaSAPConnectorContainer context, ISet<int> endPoints, IQueryable<IGrouping<int, Models.SAPC_Adelantos>> adelantosPorEndpoint, IQueryable<IGrouping<int, Models.SAPC_Adelantos>> adelantosPorEmpleadoPorEndpoint, IQueryable<IGrouping<int, Models.SAPC_FacturaProveedor>> facturasPorEndpoint)
        {
            foreach (int endPointId in endPoints)
            {
                session = this.CreateSession(endPointId);

                foreach (var a1Element in adelantosPorEndpoint.ToList())
                {
                    if (a1Element.Key == endPointId)
                    {
                        foreach (var adelanto in a1Element.ToList())
                        {
                            this.SAPPushAdelanto(adelanto);
                        }
                    }
                }

                foreach (var a2Element in adelantosPorEmpleadoPorEndpoint.ToList())
                {
                    if (a2Element.Key == endPointId)
                    {
                        foreach (var adelanto in a2Element.ToList())
                            this.SAPPushAdelanto(adelanto);
                    }
                }

                foreach (var felement in facturasPorEndpoint.ToList())
                {
                    if (felement.Key == endPointId)
                    {
                        foreach (var factura in felement.ToList())
                            this.SAPPushFactura(factura);
                    }
                }

                this.session.Session.ErrorCode = "OK";
                this.session.Session.ErrorMessage = "Normal ending - Documents";
                session.Session.Final = DateTime.Now;
                context.Entry(session.Session).State = System.Data.Entity.EntityState.Modified;
                context.SaveChanges();
            }
        }

        private static void GetFinalEndpoints(Models.EstradaSAPConnectorContainer context, out IQueryable<IGrouping<int, Models.SAPC_Adelantos>> adelantosPorEndpoint, out IQueryable<IGrouping<int, Models.SAPC_Adelantos>> adelantosPorEmpleadoPorEndpoint, out IQueryable<IGrouping<int, Models.SAPC_FacturaProveedor>> facturasPorEndpoint, out ISet<int> endPoints)
        {
            // Tomar adelantos de fondos a procesar
            var adelantos = from a in context.SAPC_Adelantos
                            where a.Estado.Codigo == ADELANTO_A_PROCESAR
                            select a;

            adelantosPorEndpoint = from aep in adelantos
                                   group aep by aep.FondoFijo.EndPoint.Id
                                        into g
                                   select g;
            var adelantosPorEmpleado = from a in context.SAPC_Adelantos
                                       where a.Estado.Codigo == ADELANTO_A_PROCESAR &&
                                               a.PedidoPorEmpleado != null
                                       select a;

            adelantosPorEmpleadoPorEndpoint = from aeep in adelantosPorEmpleado
                                              group aeep by aeep.PedidoPorEmpleado.EndPoint.Id
                                                    into g
                                              select g;

            // Tomar facturas a procesar
            var facturas = from a in context.SAPC_FacturaProveedor
                           where a.Estado.Codigo == FACTURA_A_PROCESAR
                           select a;

            facturasPorEndpoint = from aep in facturas
                                  group aep by aep.Rendicion.FondoFijo.EndPoint.Id
                                        into g
                                  select g;
            endPoints = new HashSet<int> { };
            foreach (var endPointGroup in adelantosPorEndpoint)
            {
                endPoints.Add(endPointGroup.Key);
            }
            foreach (var endPointGroup in facturasPorEndpoint)
            {
                endPoints.Add(endPointGroup.Key);
            }
            foreach (var endPointGroup in adelantosPorEmpleadoPorEndpoint)
            {
                endPoints.Add(endPointGroup.Key);
            }
        }

        public DocInfo getDocData(int endPointId, string sapDocNbr, string rinde)
        {
            DocInfo retValue = new DocInfo();

            using (var context = new Models.EstradaSAPConnectorContainer())
            {
                try
                {
                    this.context = context;
                    session = this.CreateSession(endPointId);

                    BasicHttpBinding binding = new BasicHttpBinding();

                    EndpointAddress address = new EndpointAddress(session.Session.EndPoint.URLConsultaID);

                    Consulta_Id.ZWS_CONSULTA_ID client = new Consulta_Id.ZWS_CONSULTA_IDClient(binding, address);

                    Consulta_Id.ZfiRfcManIdRequest request = new Consulta_Id.ZfiRfcManIdRequest
                    {
                        ZfiRfcManId = new Consulta_Id.ZfiRfcManId
                        {
                            Documento = sapDocNbr,
                            Rinde = rinde,
                        }
                    };

                    Consulta_Id.ZfiRfcManIdResponse1 response = client.ZfiRfcManId(request);

                    retValue.Resultado = response.ZfiRfcManIdResponse.Resultado;
                    retValue.Mensaje = response.ZfiRfcManIdResponse.Mensaje;
                    retValue.Fechadoc = response.ZfiRfcManIdResponse.Fechadoc;
                    retValue.Fechaing = response.ZfiRfcManIdResponse.Fechaing;
                    retValue.Id = response.ZfiRfcManIdResponse.Id;
                    retValue.Importelocal = response.ZfiRfcManIdResponse.Importelocal;
                    retValue.Importerendido = response.ZfiRfcManIdResponse.Importerendido;
                    retValue.Moneda = response.ZfiRfcManIdResponse.Moneda;
                    retValue.Nombre = response.ZfiRfcManIdResponse.Nombre;
                    retValue.Rindio = response.ZfiRfcManIdResponse.Rindio;
                    retValue.Tipocambio = response.ZfiRfcManIdResponse.Tipocambio;
                }
                catch (Exception e)
                {
                    throw e;
                }
                finally
                {
                }
            }

            return retValue;
        }
    }
}
