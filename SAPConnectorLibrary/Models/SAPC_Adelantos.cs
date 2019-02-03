//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SAPConnectorLibrary.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class SAPC_Adelantos
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public SAPC_Adelantos()
        {
            this.RPCCalls = new HashSet<SAPC_SAPRPCCall>();
            this.SAPC_SAPRPCCall = new HashSet<SAPC_SAPRPCCall>();
        }
    
        public int Id { get; set; }
        public string SAPNroDoc { get; set; }
        public System.DateTime Fecha { get; set; }
        public decimal Importe { get; set; }
        public System.DateTime FechaVto { get; set; }
        public System.DateTime FechaCont { get; set; }
        public string Referencia { get; set; }
        public string Tienda { get; set; }
        public string TextoCab { get; set; }
        public string CtaContable { get; set; }
        public string TextoPOS { get; set; }
        public string SAPId { get; set; }
        public System.DateTime PedidoEl { get; set; }
        public string Error { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SAPC_SAPRPCCall> RPCCalls { get; set; }
        public virtual SAPC_FondoFijo FondoFijo { get; set; }
        public virtual SAPC_Estados Estado { get; set; }
        public virtual SAPC_Empleado PedidoPorEmpleado { get; set; }
        public virtual SAPC_ClaseDoc ClaseDoc { get; set; }
        public virtual SAPC_Sociedades Sociedad { get; set; }
        public virtual SAPC_Monedas Moneda { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SAPC_SAPRPCCall> SAPC_SAPRPCCall { get; set; }
        public virtual SAPC_Rendicion Rendicion { get; set; }
    }
}
