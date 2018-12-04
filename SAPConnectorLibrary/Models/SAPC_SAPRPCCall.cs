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
    
    public partial class SAPC_SAPRPCCall
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public SAPC_SAPRPCCall()
        {
            this.Results = new HashSet<SAPC_Results>();
            this.Comprobantes = new HashSet<SAPC_Comprobante>();
            this.SAPC_RendicionGastosSAPC_SAPRPCCall = new HashSet<SAPC_RendicionGastosSAPC_SAPRPCCall1>();
            this.SAPC_Adelantos = new HashSet<SAPC_Adelantos>();
        }
    
        public int Id { get; set; }
        public string Method { get; set; }
        public System.DateTime StartedOn { get; set; }
        public System.DateTime FinishedOn { get; set; }
        public string ErrorCode { get; set; }
        public string ErrorMsg { get; set; }
        public string InputParameters { get; set; }
        public string Results1 { get; set; }
    
        public virtual SAPC_Session Session { get; set; }
        public virtual SAPC_Adelantos Adelanto { get; set; }
        public virtual SAPC_Rendicion RendicionGastos { get; set; }
        public virtual SAPC_EndPoint EndPoint { get; set; }
        public virtual SAPC_FacturaProveedor FacturaProveedor { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SAPC_Results> Results { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SAPC_Comprobante> Comprobantes { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SAPC_RendicionGastosSAPC_SAPRPCCall1> SAPC_RendicionGastosSAPC_SAPRPCCall { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SAPC_Adelantos> SAPC_Adelantos { get; set; }
    }
}
