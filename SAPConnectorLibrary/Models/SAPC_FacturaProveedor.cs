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
    
    public partial class SAPC_FacturaProveedor
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public SAPC_FacturaProveedor()
        {
            this.Inputaciones = new HashSet<SAPC_Inputaciones>();
            this.RPCCalls = new HashSet<SAPC_SAPRPCCall>();
        }
    
        public int Id { get; set; }
        public System.DateTime FechaContable { get; set; }
        public string FechaFactura { get; set; }
        public string Referencia { get; set; }
        public decimal Importe { get; set; }
        public string Texto { get; set; }
        public string CAE { get; set; }
        public System.DateTime CAEVto { get; set; }
    
        public virtual SAPC_RendicionABC RendicionGastos { get; set; }
        public virtual SAPC_Proveedores Proveedor { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SAPC_Inputaciones> Inputaciones { get; set; }
        public virtual SAPC_Estados Estado { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SAPC_SAPRPCCall> RPCCalls { get; set; }
        public virtual SAPC_Sociedades Sociedad { get; set; }
        public virtual SAPC_ClaseDoc ClaseDoc { get; set; }
        public virtual SAPC_Monedas Moneda { get; set; }
    }
}
