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
    
    public partial class SAPC_Adelanto_Empleado
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public SAPC_Adelanto_Empleado()
        {
            this.Estado = new HashSet<SAPC_Estados>();
        }
    
        public int Id { get; set; }
        public System.DateTime Fecha { get; set; }
        public System.DateTime FechaVto { get; set; }
        public decimal Importe { get; set; }
        public string Referencia { get; set; }
        public string SAPNroDoc { get; set; }
    
        public virtual SAPC_Empleado Empleado { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SAPC_Estados> Estado { get; set; }
    }
}
