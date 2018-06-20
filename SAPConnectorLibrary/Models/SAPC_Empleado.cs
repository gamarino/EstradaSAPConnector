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
    
    public partial class SAPC_Empleado
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public SAPC_Empleado()
        {
            this.FacturasProveedor = new HashSet<SAPC_FacturaProveedor>();
            this.RendicionesABC = new HashSet<SAPC_RendicionABC>();
            this.Adelantos = new HashSet<SAPC_Adelantos>();
        }
    
        public int Id { get; set; }
        public string Nombre { get; set; }
        public string DNI { get; set; }
        public string CtaContable { get; set; }
        public string NroEmpleado { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SAPC_FacturaProveedor> FacturasProveedor { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SAPC_RendicionABC> RendicionesABC { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SAPC_Adelantos> Adelantos { get; set; }
        public virtual SAPC_EndPoint SAPEndPoint { get; set; }
    }
}
