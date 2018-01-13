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
    
    public partial class SAPC_FondoFijo
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public SAPC_FondoFijo()
        {
            this.RendicionesGastos = new HashSet<SAPC_RendicionABC>();
            this.Adelantos = new HashSet<SAPC_Adelantos>();
            this.RendicionesComprobantes = new HashSet<SAPC_RendicionComp>();
        }
    
        public int Id { get; set; }
        public string Nombre { get; set; }
        public string CreadoEn { get; set; }
        public string SAPId { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SAPC_RendicionABC> RendicionesGastos { get; set; }
        public virtual SAPC_Estados Estado { get; set; }
        public virtual SAPC_EndPoint EndPoint { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SAPC_Adelantos> Adelantos { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SAPC_RendicionComp> RendicionesComprobantes { get; set; }
    }
}
