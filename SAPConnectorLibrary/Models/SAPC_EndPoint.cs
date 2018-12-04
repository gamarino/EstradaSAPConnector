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
    
    public partial class SAPC_EndPoint
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public SAPC_EndPoint()
        {
            this.Sessions = new HashSet<SAPC_Session>();
            this.FondosFijos = new HashSet<SAPC_FondoFijo>();
            this.RPCCalls = new HashSet<SAPC_SAPRPCCall>();
            this.Empleados = new HashSet<SAPC_Empleado>();
        }
    
        public int Id { get; set; }
        public string Nombre { get; set; }
        public string URLAdelantos { get; set; }
        public Nullable<System.DateTime> LastConnectionOn { get; set; }
        public string URLRendicionABC { get; set; }
        public string URLRendicionNoABC { get; set; }
        public string LoginName { get; set; }
        public string LoginPassword { get; set; }
        public string URLProveedores { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SAPC_Session> Sessions { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SAPC_FondoFijo> FondosFijos { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SAPC_SAPRPCCall> RPCCalls { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SAPC_Empleado> Empleados { get; set; }
    }
}
