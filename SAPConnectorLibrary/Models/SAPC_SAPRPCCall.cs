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
            this.Adelantos = new HashSet<SAPC_Adelantos>();
            this.RendicionesGastos = new HashSet<SAPC_RendicionABC>();
            this.RendicionesComprobantes = new HashSet<SAPC_RendicionComp>();
        }
    
        public int Id { get; set; }
        public string Method { get; set; }
        public string StartedOn { get; set; }
        public string FinishedOn { get; set; }
        public string ErrorCode { get; set; }
        public string ErrorMsg { get; set; }
        public string InputParameters { get; set; }
        public string Results { get; set; }
    
        public virtual SAPC_Session Session { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SAPC_Adelantos> Adelantos { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SAPC_RendicionABC> RendicionesGastos { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SAPC_RendicionComp> RendicionesComprobantes { get; set; }
        public virtual SAPC_EndPoint EndPoint { get; set; }
    }
}
