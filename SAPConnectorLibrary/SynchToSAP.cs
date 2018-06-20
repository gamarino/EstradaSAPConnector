using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel;
using System.Text;
using System.Threading.Tasks;
using System.Globalization;

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

    class SynchException: Exception
    {
        public SynchException(string msg) : base (msg) { }
    }

    public class SynchToSAP
    {
        static string FONDO_ACTIVO = "Activo";

        static string ADELANTO_A_PROCESAR = "SAPC_Adelanto_Aprobado";
        static string ADELANTO_PROCESADO = "SAPC_Adelanto_Sincronizado";
        static string ADELANTO_RECHAZADO = "SAPC_Adelanto_Rechazado";

        static string RENDICION_A_PROCESAR = "SAPC_RendicionABC_Aprobado";
        static string RENDICION_PROCESADA = "SAPC_RendicionABC_Sincronizado";
        static string RENDICION_RECHAZADA = "SAPC_RendicionABC_Rechazado";

        static string FACTURA_A_PROCESAR = "SAPC_FacturaProveedor_Aprobado";
        static string FACTURA_PROCESADA = "SAPC_FacturaProveedor_Sincronizado";
        static string FACTURA_RECHAZADA = "SAPC_FacturaProveedor_Rechazado";

        static string COMPROBANTES_A_PROCESAR = "SAPC_Comprobantes_Aprobado";
        static string COMPROBANTES_PROCESADA = "SAPC_Comprobantes_Sincronizado";
        static string COMPROBANTES_RECHAZADA = "SAPC_Comprobantes_Rechazado";

        Models.EstradaSAPConnectorContainer context;
        SessionContext session;

        Models.SAPC_Estados estadoRENDICION_A_PROCESAR;
        Models.SAPC_Estados estadoRENDICION_PROCESADA;
        Models.SAPC_Estados estadoRENDICION_RECHAZADA;

        Models.SAPC_Estados estadoADELANTO_A_PROCESAR;
        Models.SAPC_Estados estadoADELANTO_PROCESADO;
        Models.SAPC_Estados estadoADELANTO_RECHAZADO;

        Models.SAPC_Estados estadoFACTURA_A_PROCESAR;
        Models.SAPC_Estados estadoFACTURA_PROCESADA;
        Models.SAPC_Estados estadoFACTURA_RECHAZADA;

        Models.SAPC_Estados estadoCOMPROBANTES_A_PROCESAR;
        Models.SAPC_Estados estadoCOMPROBANTES_PROCESADA;
        Models.SAPC_Estados estadoCOMPROBANTES_RECHAZADA;

        SessionContext CreateSession(int endPointId)
        {
            Models.SAPC_EndPoint endPoint = context.SAPC_EndPoint.Find(endPointId);
            Models.SAPC_Session newSession = new Models.SAPC_Session
            {
                EndPoint = endPoint,
                Comienzo = DateTime.UtcNow
            };

            context.SAPC_Session.Add(newSession);

            estadoADELANTO_A_PROCESAR = context.SAPC_Estados
                                       .Where(e => e.Codigo == ADELANTO_A_PROCESAR &&
                                                   e.EntityName == "SAPC_Adelantos")
                                       .FirstOrDefault();
            estadoADELANTO_PROCESADO = context.SAPC_Estados
                                       .Where(e => e.Codigo == ADELANTO_PROCESADO &&
                                                   e.EntityName == "SAPC_Adelantos")
                                       .FirstOrDefault();
            estadoADELANTO_RECHAZADO = context.SAPC_Estados
                                       .Where(e => e.Codigo == ADELANTO_RECHAZADO &&
                                                   e.EntityName == "SAPC_Adelantos")
                                       .FirstOrDefault();

            estadoFACTURA_A_PROCESAR = context.SAPC_Estados
                                       .Where(e => e.Codigo == FACTURA_A_PROCESAR &&
                                                   e.EntityName == "SAPC_FacturaProveedor")
                                       .FirstOrDefault();
            estadoFACTURA_PROCESADA = context.SAPC_Estados
                                       .Where(e => e.Codigo == FACTURA_PROCESADA &&
                                                   e.EntityName == "SAPC_FacturaProveedor")
                                       .FirstOrDefault();
            estadoFACTURA_RECHAZADA = context.SAPC_Estados
                                       .Where(e => e.Codigo == FACTURA_RECHAZADA &&
                                                   e.EntityName == "SAPC_FacturaProveedor")
                                       .FirstOrDefault();

            estadoRENDICION_A_PROCESAR = context.SAPC_Estados
                                       .Where(e => e.Codigo == RENDICION_A_PROCESAR &&
                                                   e.EntityName == "SAPC_RendicionABC")
                                       .FirstOrDefault();
            estadoRENDICION_PROCESADA = context.SAPC_Estados
                                        .Where(e => e.Codigo == RENDICION_PROCESADA &&
                                                    e.EntityName == "SAPC_RendicionABC")
                                        .FirstOrDefault();
            estadoRENDICION_RECHAZADA = context.SAPC_Estados
                                        .Where(e => e.Codigo == RENDICION_RECHAZADA &&
                                                    e.EntityName == "SAPC_RendicionABC")
                                        .FirstOrDefault();

            estadoCOMPROBANTES_A_PROCESAR = context.SAPC_Estados
                                       .Where(e => e.Codigo == RENDICION_A_PROCESAR &&
                                                   e.EntityName == "SAPC_Comprobantes")
                                       .FirstOrDefault();
            estadoCOMPROBANTES_PROCESADA = context.SAPC_Estados
                                        .Where(e => e.Codigo == RENDICION_PROCESADA &&
                                                    e.EntityName == "SAPC_Comprobantes")
                                        .FirstOrDefault();
            estadoCOMPROBANTES_RECHAZADA = context.SAPC_Estados
                                        .Where(e => e.Codigo == RENDICION_RECHAZADA &&
                                                    e.EntityName == "SAPC_Comprobantes")
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
                    FECHA_DOC = adelanto.Fecha,
                    FECHA_CONT = adelanto.FechaCont,
                    CLASE_DOC = adelanto.ClaseDoc.Codigo,
                    SOCIEDAD = adelanto.Sociedad.Codigo,
                    MONEDA = adelanto.Moneda.Codigo,
                    REFERENCIA = adelanto.Referencia,
                    TIENDA = adelanto.Tienda,
                    TEXTO_CAB = adelanto.TextoCab,
                    CTA_CONTABLE1 = adelanto.CtaContable,
                    IND_CME = "A",
                    IMPORTE = adelanto.Importe,
                    FECHA_VTO = adelanto.FechaVto, // Fecha + 30 días
                    TEXTO_POS = adelanto.TextoPOS,
                });

                Solicitud_Anticipo.ZFI_RFC_SOLICITUD_ANTICIPO request = new Solicitud_Anticipo.ZFI_RFC_SOLICITUD_ANTICIPO
                {
                    T_DETALLE = comp.ToArray(),
                    
                };

                Solicitud_Anticipo.ZFI_RFC_SOLICITUD_ANTICIPOResponse response = client.ZFI_RFC_SOLICITUD_ANTICIPO(request);

                call.InputParameters = request.ToString();
                call.ErrorMsg = response.MENSAJE;


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

        void SAPPushFactura(Models.SAPC_FacturaProveedor factura)
        {
            Models.SAPC_SAPRPCCall call = new Models.SAPC_SAPRPCCall
            {
                Method = "Factura",
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
                    if (factura.RendicionGastos != null)
                    {
                        comp.Add(new Comprobantes_ABC.ZFI_RFC_COMPROBANTES_ABC
                        {
                            CECO = "",
                            CTA_CONTABLE = factura.RendicionGastos.FondoFijo.SAPId,
                            IMPORTE = factura.Importe,
                            IND_IMP = "",
                        });
                    }
                    else if (factura.RendicionGastos.RendidoPor != null)
                    {
                        comp.Add(new Comprobantes_ABC.ZFI_RFC_COMPROBANTES_ABC
                        {
                            CECO = "",
                            CTA_CONTABLE = factura.RendicionGastos.RendidoPor.CtaContable ,
                            IMPORTE = factura.Importe,
                            IND_IMP = "",
                        });
                    }
                }

                request.T_DETALLE = comp.ToArray();

                Comprobantes_ABC.ZFI_RFC_COMPROBANTES_ABCResponse response = client.ZFI_RFC_COMPROBANTES_ABC(request);

                call.InputParameters = request.ToString();
                call.ErrorMsg = response.MENSAJE;

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

                // Checkea que la rendición tenga todas las facturas aprobadas
                bool AllAproved = true;
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

        void SAPPushComprobantes(Models.SAPC_Comprobantes comprobante)
        {
            Models.SAPC_SAPRPCCall call = new Models.SAPC_SAPRPCCall
            {
                Method = "Comprobantes",
                ErrorCode = "",
                ErrorMsg = ""
            };

            try
            {
                BasicHttpBinding binding = new BasicHttpBinding();
                EndpointAddress address = new EndpointAddress(session.Session.EndPoint.URLAdelantos);
                Comprobantes_NO_ABC.ZWS_COMPROBANTES_NO_ABCClient client = new Comprobantes_NO_ABC.ZWS_COMPROBANTES_NO_ABCClient(binding, address);


                Comprobantes_NO_ABC.ZFI_RFC_COMPROBANTES_NO_ABC1 request = new Comprobantes_NO_ABC.ZFI_RFC_COMPROBANTES_NO_ABC1
                {
                    FECHACONT = comprobante.FechaCont,
                    FECHADOCUMENTO = comprobante.FechaDocumento,
                    REFERENCIA = comprobante.Referencia,
                    CLASE_DOC = comprobante.ClaseDoc.Codigo,
                    SOCIEDAD = comprobante.Sociedad.Codigo,
                    MONEDA = comprobante.Moneda.Codigo,
                    TIENDA = comprobante.Tienda,
                    DOC_COMP1 = comprobante.DocComp1,
                    DOC_COMP2 = comprobante.DocComp2,
                    DOC_COMP3 = comprobante.DocComp3,
                    DOC_COMP4 = comprobante.DocComp4,
                    DOC_COMP5 = comprobante.DocComp5,
                    DOC_COMP6 = comprobante.DocComp6,
                    DOC_COMP7 = comprobante.DocComp7,
                    DOC_COMP8 = comprobante.DocComp8,
                    DOC_COMP9 = comprobante.DocComp9,
                    DOC_COMP10 = comprobante.DocComp10,
                    DOC_COMP11 = comprobante.DocComp11,
                };

                List<Comprobantes_NO_ABC.ZFI_RFC_COMPROBANTES_NO_ABC> comp = new List<Comprobantes_NO_ABC.ZFI_RFC_COMPROBANTES_NO_ABC>();
                foreach (var cuenta in comprobante.Inputaciones)
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

                Comprobantes_NO_ABC.ZFI_RFC_COMPROBANTES_NO_ABCResponse response = client.ZFI_RFC_COMPROBANTES_NO_ABC(request);

                call.InputParameters = request.ToString();
                call.ErrorMsg = response.MENSAJE;

                if (response.RESULTADO != "OK")
                {
                    comprobante.Estado = estadoCOMPROBANTES_RECHAZADA;
                }
                else
                {
                    comprobante.SAPNroDoc = response.NRO_DOC;
                    comprobante.Estado = estadoCOMPROBANTES_PROCESADA;
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
                        if (vendor.PERNR == null)
                        {
                            Models.SAPC_Paises country;
                            Models.SAPC_Poblaciones city;

                            var countries = from a in context.SAPC_Paises
                                            where a.Codigo == vendor.PAIS
                                            select a;
                            if (countries.Count() == 0)
                            {
                                context.SAPC_Paises.Add(new Models.SAPC_Paises
                                {
                                    Codigo = vendor.PAIS,
                                    Nombre = vendor.PAIS
                                });
                                countries = from a in context.SAPC_Paises
                                            where a.Codigo == vendor.PAIS
                                            select a;
                            }

                            country = countries.ElementAt(0);
                            var cities = from a in context.SAPC_Poblaciones
                                            where a.Codigo == vendor.POBLACION && a.Pais == country
                                            select a;
                            if (cities.Count() == 0)
                            {
                                context.SAPC_Poblaciones.Add(new Models.SAPC_Poblaciones
                                {
                                    Codigo = vendor.POBLACION,
                                    Nombre = vendor.POBLACION
                                });
                                cities = from a in context.SAPC_Poblaciones
                                         where a.Codigo == vendor.POBLACION
                                         select a;
                            }
                            
                            city = cities.ElementAt(0);

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
                                existingVendor.Poblacion = city;
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
                                    Poblacion = city,
                                    Telefono = vendor.TELEFONO,
                                    UltimaActualizacion = now,
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
                                Models.SAPC_Empleado existingEmployee = employees.ElementAt(0);
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
                                                      group aeep by aeep.PedidoPorEmpleado.EndPoint.Id
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
                                if (adelanto.PedidoPorEmpleado.EndPoint.Id == endPoint)
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
                                session.Session.Final = DateTime.UtcNow;
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
                                                            group rabc by rabc.RendidoPor.EndPoint.Id
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
                                if (r.RendidoPor.EndPoint.Id == endPoint)
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
                                session.Session.Comienzo = DateTime.UtcNow;
                            session.Close();
                            session = null;
                        }
                    }
                }

                // Tomar comprobantes a procesar
                var comprobantes = from r in context.SAPC_Comprobantes
                                     where r.Estado.Codigo == COMPROBANTES_A_PROCESAR &&
                                         r.FondoFijo.Estado.Codigo == FONDO_ACTIVO &&
                                         r.FondoFijo != null
                                     select r;

                var comprobantesPorEndpoint = from rabc in comprobantes
                                              group rabc by rabc.FondoFijo.EndPoint.Id
                                              into g
                                              select g;

                var comprobantesPorEmpleado = from r in context.SAPC_Comprobantes
                                              where r.Estado.Codigo == COMPROBANTES_A_PROCESAR &&
                                                    r.Empleado != null
                                              select r;

                var comprobantesPorEmpleadoPorEndpoint = from rabc in comprobantesPorEmpleado
                                                         group rabc by rabc.Empleado.EndPoint.Id
                                                         into g
                                                         select g;

                foreach (var endPointGroup in comprobantesPorEndpoint)
                {
                    endPoints.Add(endPointGroup.Key);
                }
                foreach (var endPointGroup in comprobantesPorEmpleadoPorEndpoint)
                {
                    endPoints.Add(endPointGroup.Key);
                }

                if (endPoints.Count > 0)
                {
                    foreach (int endPoint in endPoints)
                    {
                        try
                        {
                            session = this.CreateSession(endPoint);

                            this.SAPLogin();

                            foreach (var r in comprobantesPorEndpoint.ElementAt(endPoint))
                                if (r.FondoFijo.EndPoint.Id == endPoint)
                                    this.SAPPushComprobantes(r);

                            foreach (var r in comprobantesPorEmpleadoPorEndpoint.ElementAt(endPoint))
                                if (r.Empleado.EndPoint.Id == endPoint)
                                    this.SAPPushComprobantes(r);

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
                                session.Session.Comienzo = DateTime.UtcNow;
                            session.Close();
                            session = null;
                        }
                    }
                }
            }
        }
    }
}
