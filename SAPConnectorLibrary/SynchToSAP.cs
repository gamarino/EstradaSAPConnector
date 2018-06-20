using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel;
using System.Text;
using System.Threading.Tasks;

namespace SAPConnectorLibrary
{
    class SessionContext
    {
        public Models.SAPC_Session Session;
        public string Credentials;
        public Models.EstradaSAPConnectorContainer Context;

        public void Close()
        {
            Context.SaveChanges();
        }
    }

    public class SynchToSAP
    {
        static string FONDO_ACTIVO = "Activo";

        static string ADELANTO_A_PROCESAR = "AProcesar";
        static string ADELANTO_PROCESADO = "Procesado";
        static string ADELANTO_RECHAZADO = "Rechazado";

        static string RENDICION_A_PROCESAR = "AProcesar";
        static string RENDICION_PROCESADA = "Procesado";
        static string RENDICION_RECHAZADA = "Rechazado";

        static string FACTURA_A_PROCESAR = "AProcesar";
        static string FACTURA_PROCESADA = "Procesado";
        static string FACTURA_RECHAZADA = "Rechazado";

        Models.EstradaSAPConnectorContainer context;
        SessionContext session;

        Models.SAPC_Estados estadoRENDICION_PROCESADA;
        Models.SAPC_Estados estadoRENDICION_RECHAZADA;

        Models.SAPC_Estados estadoADELANTO_PROCESADO;
        Models.SAPC_Estados estadoADELANTO_RECHAZADO;

        Models.SAPC_Estados estadoFACTURA_PROCESADA;
        Models.SAPC_Estados estadoFACTURA_RECHAZADA;


        SessionContext CreateSession(int endPointId)
        {
            Models.SAPC_EndPoint endPoint = context.SAPC_EndPoint.Find(endPointId);
            Models.SAPC_Session newSession = new Models.SAPC_Session
            {
                EndPoint = endPoint,
                StartedOn = DateTime.UtcNow
            };

            context.SAPC_Session.Add(newSession);

            estadoADELANTO_PROCESADO = context.SAPC_Estados
                                       .Where(e => e.Codigo == ADELANTO_PROCESADO &&
                                                   e.EntityName == "SAPC_Adelantos")
                                       .FirstOrDefault();
            estadoADELANTO_RECHAZADO = context.SAPC_Estados
                                       .Where(e => e.Codigo == ADELANTO_RECHAZADO &&
                                                   e.EntityName == "SAPC_Adelantos")
                                       .FirstOrDefault();
            estadoFACTURA_PROCESADA = context.SAPC_Estados
                                       .Where(e => e.Codigo == FACTURA_PROCESADA &&
                                                   e.EntityName == "SAPC_FacturaProveedor")
                                       .FirstOrDefault();
            estadoFACTURA_RECHAZADA = context.SAPC_Estados
                                       .Where(e => e.Codigo == FACTURA_RECHAZADA &&
                                                   e.EntityName == "SAPC_FacturaProveedor")
                                       .FirstOrDefault();
            estadoRENDICION_PROCESADA = context.SAPC_Estados
                                        .Where(e => e.Codigo == RENDICION_PROCESADA &&
                                                    e.EntityName == "SAPC_RendicionABC")
                                        .FirstOrDefault();
            estadoRENDICION_RECHAZADA = context.SAPC_Estados
                                        .Where(e => e.Codigo == RENDICION_RECHAZADA &&
                                                    e.EntityName == "SAPC_RendicionABC")
                                        .FirstOrDefault();

            return new SessionContext
            {
                Session = newSession,
                Context = context,
            };
        }



        void SAPLogin()
        {
            // TODO Login SAP  
        }

        void SAPPushAdelanto(Models.SAPC_Adelantos adelanto)
        {
            Models.SAPC_SAPRPCCall call = new Models.SAPC_SAPRPCCall
            {
                Method = "Adelanto",
                ErrorCode = "",
                ErrorMsg = ""
            };

            try
            {
                BasicHttpBinding binding = new BasicHttpBinding();
                EndpointAddress address = new EndpointAddress(session.Session.EndPoint.URLAdelantos);
                Solicitud_Anticipo.ZWS_SOLICITUD_ANTICIPOClient client = new Solicitud_Anticipo.ZWS_SOLICITUD_ANTICIPOClient(binding, address);

                List<Solicitud_Anticipo.ZFI_RFC_ANTICIPOS> comp = new List<Solicitud_Anticipo.ZFI_RFC_ANTICIPOS>();
                comp.Add(new Solicitud_Anticipo.ZFI_RFC_ANTICIPOS
                {
                    CTA_CONTABLE1 = "????",
                    CLASE_DOC = "?????",
                    FECHA_DOC = adelanto.Fecha,
                    FECHA_VTO = adelanto.Fecha, // Fecha + 30 días
                    IMPORTE = adelanto.Importe,
                    IND_CME = "?????",
                    MONEDA = "???",
                    REFERENCIA = "????",
                    SOCIEDAD = "????",
                    TEXTO_CAB = "????",
                    TEXTO_POS = "????",
                    TIENDA = "???",
                });

                Solicitud_Anticipo.ZFI_RFC_SOLICITUD_ANTICIPO request = new Solicitud_Anticipo.ZFI_RFC_SOLICITUD_ANTICIPO
                {
                    T_DETALLE = comp.ToArray(),
                    
                };

                Solicitud_Anticipo.ZFI_RFC_SOLICITUD_ANTICIPOResponse response = client.ZFI_RFC_SOLICITUD_ANTICIPO(request);

                call.InputParameters = request.ToString();
                call.Results = response.MENSAJE;

                if (response.RESULTADO != "OK")
                {
                    adelanto.Estado = estadoRENDICION_RECHAZADA;
                }
                else
                {
                    adelanto.SAPNroDoc = response.NRO_DOC;
                    adelanto.Estado = estadoADELANTO_PROCESADO;
                }
            }
            catch (Exception e)
            {
                call.ErrorCode = "Unexpected exception";
                call.ErrorMsg = e.ToString();
                throw e;
            }
            finally
            {
                session.Context.SAPC_SAPRPCCall.Add(call);
            }
        }

        void SAPPushRendicionABC(Models.SAPC_RendicionABC rendicion)
        {
            Models.SAPC_SAPRPCCall call = new Models.SAPC_SAPRPCCall
            {
                Method = "RendicionABC",
                ErrorCode = "",
                ErrorMsg = ""
            };

            try
            {
                BasicHttpBinding binding = new BasicHttpBinding();
                EndpointAddress address = new EndpointAddress(session.Session.EndPoint.URLAdelantos);
                Comprobantes_ABC.ZWS_COMPROBANTES_ABCClient client = new Comprobantes_ABC.ZWS_COMPROBANTES_ABCClient(binding, address);


                // TODO Esto no tiene sentido. Como está planteado cada rendición contempla una sola factura!!!!

                Comprobantes_ABC.ZFI_RFC_COMPROBANTES_ABC1 request = new Comprobantes_ABC.ZFI_RFC_COMPROBANTES_ABC1
                {
                    ACREEDOR = "",
                    CAE = "",
                    CAE_VTO = new DateTime(),
                    CALLE = "",
                    CLASE_DOC = "",
                    CPOSTAL = "",
                    CUIT = "",
                    FECHACONT = new DateTime(),
                    FECHACONTSpecified = true,
                    FECHAFACTURA = new DateTime(),
                    IMPORTE = new Decimal(0.0),
                    MONEDA = "",
                    NOMBRE = "",
                    PAIS = "",
                    POBLACION = "",
                    REFERENCIA = "",
                    SOCIEDAD = "",
                    TEXTO = "",
                    TIENDA = ""
                };

                List<Comprobantes_ABC.ZFI_RFC_COMPROBANTES_ABC> comp = new List<Comprobantes_ABC.ZFI_RFC_COMPROBANTES_ABC>();
                foreach (var factura in rendicion.FacturasProveedor)
                {
                    comp.Add(new Comprobantes_ABC.ZFI_RFC_COMPROBANTES_ABC
                    {
                        CECO = "???",
                        CTA_CONTABLE = factura.Proveedor.CtaContable,
                        IMPORTE = factura.ImporteNeto,
                        IND_IMP = "????",
                    });
                }

                request.T_DETALLE = comp.ToArray();

                Comprobantes_ABC.ZFI_RFC_COMPROBANTES_ABCResponse response = client.ZFI_RFC_COMPROBANTES_ABC(request);

                call.InputParameters = request.ToString();
                call.Results = response.MENSAJE;

                if (response.RESULTADO != "OK")
                {
                    rendicion.Estado = estadoRENDICION_RECHAZADA;
                }
                else
                {
                    rendicion.SAPNroDoc = response.NRO_DOC;
                    rendicion.Estado = estadoRENDICION_PROCESADA;
                }
            }
            catch (Exception e)
            {
                call.ErrorCode = "Unexpected exception";
                call.ErrorMsg = e.ToString();
                throw e;
            }
            finally
            {
                session.Context.SAPC_SAPRPCCall.Add(call);
            }
        }


        void SAPPushFactura(Models.SAPC_FacturaProveedor factura)
        {
            Models.SAPC_SAPRPCCall call = new Models.SAPC_SAPRPCCall
            {
                Method = "RendicionABC",
                ErrorCode = "",
                ErrorMsg = ""
            };

            try
            {
                BasicHttpBinding binding = new BasicHttpBinding();
                EndpointAddress address = new EndpointAddress(session.Session.EndPoint.URLAdelantos);
                Comprobantes_ABC.ZWS_COMPROBANTES_ABCClient client = new Comprobantes_ABC.ZWS_COMPROBANTES_ABCClient(binding, address);


                Comprobantes_ABC.ZFI_RFC_COMPROBANTES_ABC1 request = new Comprobantes_ABC.ZFI_RFC_COMPROBANTES_ABC1
                {
                    ACREEDOR = "",
                    CAE = "",
                    CAE_VTO = new DateTime(),
                    CALLE = "",
                    CLASE_DOC = "",
                    CPOSTAL = "",
                    CUIT = "",
                    FECHACONT = new DateTime(),
                    FECHACONTSpecified = true,
                    FECHAFACTURA = new DateTime(),
                    IMPORTE = new Decimal(0.0),
                    MONEDA = "",
                    NOMBRE = "",
                    PAIS = "",
                    POBLACION = "",
                    REFERENCIA = "",
                    SOCIEDAD = "",
                    TEXTO = "",
                    TIENDA = ""
                };

                List<Comprobantes_ABC.ZFI_RFC_COMPROBANTES_ABC> comp = new List<Comprobantes_ABC.ZFI_RFC_COMPROBANTES_ABC>();
                comp.Add(new Comprobantes_ABC.ZFI_RFC_COMPROBANTES_ABC
                {
                    CECO = "???",
                    CTA_CONTABLE = factura.Proveedor.CtaContable,
                    IMPORTE = factura.ImporteNeto,
                    IND_IMP = "????",
                });

                request.T_DETALLE = comp.ToArray();

                Comprobantes_ABC.ZFI_RFC_COMPROBANTES_ABCResponse response = client.ZFI_RFC_COMPROBANTES_ABC(request);

                call.InputParameters = request.ToString();
                call.Results = response.MENSAJE;

                if (response.RESULTADO != "OK")
                {
                    factura.Estado = estadoRENDICION_RECHAZADA;
                }
                else
                {
                    factura.SAPNroDoc = response.NRO_DOC;
                    factura.Estado = estadoFACTURA_PROCESADA;
                }
            }
            catch (Exception e)
            {
                call.ErrorCode = "Unexpected exception";
                call.ErrorMsg = e.ToString();
                throw e;
            }
            finally
            {
                session.Context.SAPC_SAPRPCCall.Add(call);
            }
        }

        void SAPSynchVendors()
        {
            try
            {
                BasicHttpBinding binding = new BasicHttpBinding();
                EndpointAddress address = new EndpointAddress(session.Session.EndPoint.URLProveedores);

                Datos_Proveedores.ZWS_DATOS_PROVEEDORES client = new Datos_Proveedores.ZWS_DATOS_PROVEEDORESClient(binding, address);

                DateTime lastUpdate = context.SAPC_Proveedores.Max(p => p.UltimaActualizacion);
                DateTime now = new DateTime();

                Datos_Proveedores.ZFI_RFC_DATOS_PROVEEDORESRequest request = new Datos_Proveedores.ZFI_RFC_DATOS_PROVEEDORESRequest
                {
                      ZFI_RFC_DATOS_PROVEEDORES = new Datos_Proveedores.ZFI_RFC_DATOS_PROVEEDORES
                      {
                          FECHA_CREACION = lastUpdate != null ? lastUpdate : new DateTime(0),
                          FECHA_CREACIONSpecified = (lastUpdate != null ? true : false),
                      }
                };

                Datos_Proveedores.ZFI_RFC_DATOS_PROVEEDORESResponse1 r1 = client.ZFI_RFC_DATOS_PROVEEDORES(request);
                var response = r1.ZFI_RFC_DATOS_PROVEEDORESResponse;
                if (response.RESULTADO != "OK")
                {
                    // synch datos recibidos en tabla de proveedores
                    foreach (var vendor in response.T_DETALLE)
                    {
                        var vendors = from a in context.SAPC_Proveedores
                                          where a.SAPId == vendor.PROVEEDOR
                                          select a;
                        if (vendors.Count() != 0)
                        {
                            Models.SAPC_Proveedores existingVendor = vendors.ElementAt(0);
                            existingVendor.Calle = vendor.CALLE;
                            existingVendor.CPostal = vendor.CPOSTAL;
                            existingVendor.CUIT = vendor.CUIT;
                            existingVendor.Flag = vendor.FLAG != " ";
                            existingVendor.Mail = vendor.MAIL;
                            existingVendor.Nombre = vendor.NOMBRE;
                            existingVendor.Pais = vendor.PAIS;
                            existingVendor.Poblacion = vendor.POBLACION;
                            existingVendor.Telefono = vendor.TELEFONO;
                            existingVendor.UltimaActualizacion = now;
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
                                Pais = vendor.PAIS,
                                Poblacion = vendor.POBLACION,
                                Telefono = vendor.TELEFONO,
                                UltimaActualizacion = now,
                            });
                        }
                    }
                }

                context.SaveChanges();
            }
            catch (Exception e)
            {
                throw e;
            }
            finally
            {

            }
        }

        public void SynchNow()
        {
            using (var context = new Models.EstradaSAPConnectorContainer())
            {
                // Tomar adelantos a procesar
                var adelantos = from a in context.SAPC_Adelantos
                                where a.Estado.Codigo == ADELANTO_A_PROCESAR && 
                                      a.FondoFijo.Estado.Codigo == FONDO_ACTIVO &&
                                      a.FondoFijo != null                                      
                                select a;
                
                var adelantosPorEndpoint = from aep in adelantos
                                           group aep by aep.FondoFijo.EndPoint.Id
                                           into g select g;

                var adelantosPorEmpleado = from a in context.SAPC_Adelantos
                                where a.Estado.Codigo == ADELANTO_A_PROCESAR &&
                                      a.PedidoPorEmpleado != null
                                select a;

                var adelantosPorEmpleadoPorEndpoint = from aeep in adelantosPorEmpleado
                                                      group aeep by aeep.PedidoPorEmpleado.SAPEndPoint.Id
                                                       into g
                                                       select g;

                // Tomar facturas a procesar
                var facturas = from a in context.SAPC_FacturaProveedor
                                where a.Estado.Codigo == FACTURA_A_PROCESAR 
                                select a;

                var facturasPorEndpoint = from aep in facturas
                                           group aep by aep.RendicionGastos.FondoFijo.EndPoint.Id
                                           into g
                                           select g;

                ISet< int > endPoints = new HashSet<int> { };
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

                if (endPoints.Count > 0)
                {
                    session = null;

                    foreach (int endPoint in endPoints)
                    {
                        try
                        {
                            session = this.CreateSession(endPoint);

                            this.SAPLogin();

                            foreach (var adelanto in adelantosPorEndpoint.ElementAt(endPoint))
                                if (adelanto.FondoFijo.EndPoint.Id == endPoint)
                                    this.SAPPushAdelanto(adelanto);

                            foreach (var adelanto in adelantosPorEmpleadoPorEndpoint.ElementAt(endPoint))
                                if (adelanto.PedidoPorEmpleado.SAPEndPoint.Id == endPoint)
                                    this.SAPPushAdelanto(adelanto);

                            foreach (var factura in facturasPorEndpoint.ElementAt(endPoint))
                                if (factura.RendicionGastos.FondoFijo.EndPoint.Id == endPoint)
                                    this.SAPPushFactura(factura);

                        }
                        catch (Exception e)
                        {
                            if (session != null)
                            {
                                session.Session.ErrorCode = "Unexpected exception";
                                session.Session.ErrorMessage = string.Format("Unexpected exception: {0}", e);
                            }
                        }
                        finally
                        {
                            if (session != null)
                                session.Session.FinishedOn = DateTime.UtcNow;
                            session.Close();
                            session = null;
                        }
                    }
                }

                // Tomar rendiciones ABC a procesar, luego de procesar las facturas
                var rendicionesABC = from r in context.SAPC_RendicionABC
                                                where r.Estado.Codigo == RENDICION_A_PROCESAR &&
                                                    r.FondoFijo.Estado.Codigo == FONDO_ACTIVO &&
                                                    r.FondoFijo != null
                                                select r;

                var rendicionesABCPorEndpoint = from rabc in rendicionesABC
                                                group rabc by rabc.FondoFijo.EndPoint.Id
                                                into g
                                                select g;

                var rendicionesABCPorEmpleado = from r in context.SAPC_RendicionABC
                                                where r.Estado.Codigo == RENDICION_A_PROCESAR &&
                                                        r.RendidoPor != null
                                                select r;

                var rendicionesABCPorEmpleadoPorEndpoint = from rabc in rendicionesABCPorEmpleado
                                                            group rabc by rabc.RendidoPor.SAPEndPoint.Id
                                                            into g
                                                            select g;

                foreach (var endPointGroup in rendicionesABCPorEndpoint)
                {
                    endPoints.Add(endPointGroup.Key);
                }
                foreach (var endPointGroup in rendicionesABCPorEmpleadoPorEndpoint)
                {
                    endPoints.Add(endPointGroup.Key);
                }

                if (endPoints.Count > 0) { 
                    foreach (int endPoint in endPoints)
                    {
                        try
                        {
                            session = this.CreateSession(endPoint);

                            this.SAPLogin();

                            foreach (var r in rendicionesABCPorEndpoint.ElementAt(endPoint))
                                if (r.FondoFijo.EndPoint.Id == endPoint)
                                    this.SAPPushRendicionABC(r);

                            foreach (var r in rendicionesABCPorEmpleadoPorEndpoint.ElementAt(endPoint))
                                if (r.RendidoPor.SAPEndPoint.Id == endPoint)
                                    this.SAPPushRendicionABC(r);

                            session.Session.ErrorCode = "";
                            session.Session.ErrorMessage = "";

                            this.SAPSynchVendors();

                        }
                        catch (Exception e)
                        {
                            if (session != null)
                            {
                                session.Session.ErrorCode = "Unexpected exception";
                                session.Session.ErrorMessage = string.Format("Unexpected exception: {0}", e);
                            }
                        }
                        finally
                        {
                            if (session != null)
                                session.Session.FinishedOn = DateTime.UtcNow;
                            session.Close();
                            session = null;
                        }
                    }
                }
            }
        }
    }
}
