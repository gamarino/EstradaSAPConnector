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
        static string FONDO_ACTIVO = "xx";

        static string ADELANTO_A_PROCESAR = "xx";
        static string ADELANTO_PROCESADO = "xx";
        static string ADELANTO_RECHAZADO = "xx";

        static string RENDICION_A_PROCESAR = "xx";
        static string RENDICION_PROCESADA = "xx";
        static string RENDICION_RECHAZADA = "xx";

        static string RENDCOMP_A_PROCESAR = "xx";
        static string RENDCOMP_PROCESADA = "xx";
        static string RENDCOMP_RECHAZADA = "xx";

        Models.EstradaSAPConnectorContainer context;
        SessionContext session;

        Models.SAPC_Estados estadoRENDICION_PROCESADA;
        Models.SAPC_Estados estadoRENDICION_RECHAZADA;

        Models.SAPC_Estados estadoRENDCOMP_PROCESADA;
        Models.SAPC_Estados estadoRENDCOMP_RECHAZADA;

        Models.SAPC_Estados estadoADELANTO_PROCESADO;
        Models.SAPC_Estados estadoADELANTO_RECHAZADO;


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
            estadoRENDICION_PROCESADA = context.SAPC_Estados
                                        .Where(e => e.Codigo == RENDICION_PROCESADA &&
                                                    e.EntityName == "SAPC_RendicionABC")
                                        .FirstOrDefault();
            estadoRENDICION_RECHAZADA = context.SAPC_Estados
                                        .Where(e => e.Codigo == RENDICION_RECHAZADA &&
                                                    e.EntityName == "SAPC_RendicionABC")
                                        .FirstOrDefault();
            estadoRENDCOMP_PROCESADA = context.SAPC_Estados
                                        .Where(e => e.Codigo == RENDCOMP_PROCESADA &&
                                                    e.EntityName == "SAPC_RendicionComp")
                                        .FirstOrDefault();
            estadoRENDCOMP_RECHAZADA = context.SAPC_Estados
                                        .Where(e => e.Codigo == RENDCOMP_RECHAZADA &&
                                                    e.EntityName == "SAPC_RendicionComp")
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
                SolicitudAnticipo.ZWS_SOLICITUD_ANTICIPOClient client = new SolicitudAnticipo.ZWS_SOLICITUD_ANTICIPOClient(binding, address);

                List<SolicitudAnticipo.ZFI_RFC_ANTICIPOS> comp = new List<SolicitudAnticipo.ZFI_RFC_ANTICIPOS>();
                foreach (var ae in adelanto.AdelantosEmpleados) {
                    comp.Add(new SolicitudAnticipo.ZFI_RFC_ANTICIPOS
                    {
                        CTA_CONTABLE1 = ae.Empleado.CtaContable,
                        CLASE_DOC = "?????",
                        FECHA_DOC = ae.Fecha,
                        FECHA_VTO = ae.FechaVto,
                        IMPORTE = ae.Importe,
                        IND_CME = "?????",
                        MONEDA = "???",
                        REFERENCIA = ae.Referencia,
                        SOCIEDAD = "????",
                        TEXTO_CAB = "????",
                        TEXTO_POS = "????",
                        TIENDA = "???",
                    });
                }

                SolicitudAnticipo.ZFI_RFC_SOLICITUD_ANTICIPO request = new SolicitudAnticipo.ZFI_RFC_SOLICITUD_ANTICIPO
                {
                    T_DETALLE = comp.ToArray(),
                };

                SolicitudAnticipo.ZFI_RFC_SOLICITUD_ANTICIPOResponse response = client.ZFI_RFC_SOLICITUD_ANTICIPO(request);

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

        void SAPPushRendicionNoABC(Models.SAPC_RendicionComp rendicion)
        {
            Models.SAPC_SAPRPCCall call = new Models.SAPC_SAPRPCCall
            {
                Method = "RendicionNoABC",
                ErrorCode = "",
                ErrorMsg = ""
            };

            try
            {
                BasicHttpBinding binding = new BasicHttpBinding();
                EndpointAddress address = new EndpointAddress(session.Session.EndPoint.URLAdelantos);
                Comprobantes_NO_ABC.ZWS_COMPROBANTES_NO_ABCClient client = new Comprobantes_NO_ABC.ZWS_COMPROBANTES_NO_ABCClient(binding, address);

                // TODO Esto no tiene sentido. Cada rendición sería un solo comprobante!!!

                Comprobantes_NO_ABC.ZFI_RFC_COMPROBANTES_NO_ABC1 request = new Comprobantes_NO_ABC.ZFI_RFC_COMPROBANTES_NO_ABC1
                {
                    FECHACONT = new DateTime(),
                    FECHACONTSpecified = true,
                    MONEDA = "",
                    REFERENCIA = "",
                    SOCIEDAD = "",
                    TIENDA = "",
                    CLASE_DOC = "",
                    FECHADOCUMENTO = new DateTime(),
                };

                List<Comprobantes_NO_ABC.ZFI_RFC_COMPROBANTES_NO_ABC> comp = new List<Comprobantes_NO_ABC.ZFI_RFC_COMPROBANTES_NO_ABC>();

                foreach (var comprobante in rendicion.Comprobantes)
                {
                    comp.Add(new Comprobantes_NO_ABC.ZFI_RFC_COMPROBANTES_NO_ABC
                    {
                        CECO = "",
                        IMPORTE = new Decimal(0.0),
                        IND_IMP = "",
                        CLAVE_CT = "",
                        CTA_CONTABLE1 = "",
                        TEXTO = "",
                        TEXTOS = ""
                    });
                }

                request.CUENTAS = comp.ToArray();

                Comprobantes_NO_ABC.ZFI_RFC_COMPROBANTES_NO_ABCResponse response = client.ZFI_RFC_COMPROBANTES_NO_ABC(request);

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

        public void SynchNow()
        {
            using (var context = new Models.EstradaSAPConnectorContainer())
            {
                // Tomar adelantos a procesar
                var adelantos = from a in context.SAPC_Adelantos
                                where a.Estado.Codigo == ADELANTO_A_PROCESAR && 
                                      a.FondoFijo.Estado.Codigo == FONDO_ACTIVO                                    
                                select a;
                
                var adelantosPorEndpoint = from aep in adelantos
                                           group aep by aep.FondoFijo.EndPoint.Id
                                           into g select g;

                // Tomar rendiciones ABC a procesar
                var rendicionesABC = from r in context.SAPC_RendicionABC
                                     where r.Estado.Codigo == RENDICION_A_PROCESAR &&
                                           r.FondoFijo.Estado.Codigo == FONDO_ACTIVO
                                     select r;

                var rendicionesABCporEndpoint = from rabc in rendicionesABC
                                                group rabc by rabc.FondoFijo.EndPoint.Id
                                                into g select g;

                // Tomar rendiciones NO ABC a procesar
                var rendicionesNoABC = from r in context.SAPC_RendicionComp
                                       where r.Estado.Codigo == RENDCOMP_A_PROCESAR &&
                                             r.FondoFijo.Estado.Codigo == FONDO_ACTIVO
                                       select r;

                var rendicionesNoABCporEndpoint = from rnabc in rendicionesNoABC
                                                  group rnabc by rnabc.FondoFijo.EndPoint.Id
                                                  into g select g;

                ISet< int > endPoints = new HashSet<int> { };
                foreach (var endPointGroup in adelantosPorEndpoint)
                {
                    endPoints.Add(endPointGroup.Key);
                }
                foreach (var endPointGroup in rendicionesABCporEndpoint)
                {
                    endPoints.Add(endPointGroup.Key);
                }
                foreach (var endPointGroup in rendicionesNoABCporEndpoint)
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

                            foreach (var r in rendicionesABCporEndpoint.ElementAt(endPoint))
                                if (r.FondoFijo.EndPoint.Id == endPoint)
                                    this.SAPPushRendicionABC(r);

                            foreach (var r in rendicionesNoABCporEndpoint.ElementAt(endPoint))
                                if (r.FondoFijo.EndPoint.Id == endPoint)
                                    this.SAPPushRendicionNoABC(r);

                            session.Session.ErrorCode = "";
                            session.Session.ErrorMessage = "";
                        }
                        catch (Exception e) {
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
