using System;
using System.Collections.Generic;
using System.Linq;
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
        static string ADELANTO_A_PROCESAR = "xx";
        static string ADELANTO_PROCESADO = "xx";
        static string ADELANTO_RECHAZADO = "xx";
        static string FONDO_ACTIVO = "xx";
        static string RENDICION_A_PROCESAR = "xx";
        static string RENDICION_PROCESADA = "xx";
        static string RENDICION_RECHAZADA = "xx";

        static List<string> DOCUMENTOS_ABC = new List<string> { "001", "006", "002", "007" };
        static List<string> DOCUMENTOS_NO_ABC = new List<string> {"001", "006", "002", "007"};

        Models.EstradaSAPConnectorContainer context;
        SessionContext session;
        Models.SAPC_Estados estadoRENDICION_PROCESADA;
        Models.SAPC_Estados estadoRENDICION_RECHAZADA;
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
                                                    e.EntityName == "SAPC_Rendiciones")
                                        .FirstOrDefault();
            estadoRENDICION_RECHAZADA = context.SAPC_Estados
                                        .Where(e => e.Codigo == RENDICION_RECHAZADA &&
                                                    e.EntityName == "SAPC_Rendiciones")
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
                call.InputParameters = "Input parameters";

                // TODO Llamada a SAP

                call.Results = "Resultados";

                if (resultado != OK)
                {
                    adelanto.Estado = estadoRENDICION_RECHAZADA;
                }
                else
                    adelanto.Estado = estadoRENDICION_PROCESADA;
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

        void SAPPushRendicionABC(Models.SAPC_RendicionGastos rendicion)
        {
            Models.SAPC_SAPRPCCall call = new Models.SAPC_SAPRPCCall
            {
                Method = "RendicionABC",
                ErrorCode = "",
                ErrorMsg = ""
            };

            try
            {
                call.InputParameters = "Input parameters";

                // TODO Llamada a SAP

                call.Results = "Resultados";

                if (resultado != OK)
                {
                    rendicion.Estado = estadoRENDICION_RECHAZADA;
                }
                else
                    rendicion.Estado = estadoRENDICION_PROCESADA;
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

        void SAPPushRendicionNoABC(Models.SAPC_RendicionGastos rendicion)
        {
            Models.SAPC_SAPRPCCall call = new Models.SAPC_SAPRPCCall
            {
                Method = "RendicionNoABC",
                ErrorCode = "",
                ErrorMsg = ""
            };

            try
            {
                call.InputParameters = "Input parameters";

                // TODO Llamada a SAP

                call.Results = "Resultados";
                if (resultado != OK)
                {
                    rendicion.Estado = estadoRENDICION_RECHAZADA;
                }
                else
                    rendicion.Estado = estadoRENDICION_PROCESADA;
            }
            catch (Exception e)
            {
                call.ErrorCode = "Unexpected exception";
                call.ErrorMsg = e.ToString();
                throw e;
            }
            finally
            {
                context.SAPC_SAPRPCCall.Add(call);
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
                var rendicionesABC = from f in context.SAPC_FacturaProveedor
                                     where DOCUMENTOS_ABC.Contains(f.TipoDocumento) &&
                                           f.RendicionGastos.Estado.Codigo == RENDICION_A_PROCESAR &&
                                           f.RendicionGastos.FondoFijo.Estado.Codigo == FONDO_ACTIVO
                                     group f by f.RendicionGastos into r
                                     select new { Rendicion = r.Key, Facturas = r.ToList() };

                var rendicionesABCporEndopoint = from rabc in rendicionesABC
                                                 group rabc by rabc.Rendicion.FondoFijo.EndPoint.Id
                                                 into g select g;

                // Tomar rendiciones NO ABC a procesar
                var rendicionesNoABC = from f in context.SAPC_FacturaProveedor
                                       where DOCUMENTOS_ABC.Contains(f.TipoDocumento) &&
                                             f.RendicionGastos.Estado.Codigo == RENDICION_A_PROCESAR &&
                                             f.RendicionGastos.FondoFijo.Estado.Codigo == FONDO_ACTIVO
                                       group f by f.RendicionGastos into r
                                       select new { Rendicion = r.Key, Facturas = r.ToList() };

                var rendicionesNoABCporEndopoint = from rabc in rendicionesABC
                                                   group rabc by rabc.Rendicion.FondoFijo.EndPoint.Id
                                                   into g select g;

                ISet< int > endPoints = new HashSet<int> { };
                foreach (var endPointGroup in adelantosPorEndpoint)
                {
                    endPoints.Add(endPointGroup.Key);
                }
                foreach (var endPointGroup in rendicionesABCporEndopoint)
                {
                    endPoints.Add(endPointGroup.Key);
                }
                foreach (var endPointGroup in rendicionesNoABCporEndopoint)
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

                            foreach (var r in rendicionesABCporEndopoint.ElementAt(endPoint))
                                if (r.Rendicion.FondoFijo.EndPoint.Id == endPoint)
                                    this.SAPPushRendicionABC(r.Rendicion);

                            foreach (var r in rendicionesNoABCporEndopoint.ElementAt(endPoint))
                                if (r.Rendicion.FondoFijo.EndPoint.Id == endPoint)
                                    this.SAPPushRendicionNoABC(r.Rendicion);

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
