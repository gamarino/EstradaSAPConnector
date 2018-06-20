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
    
    public partial class SAPC_Proveedores
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public SAPC_Proveedores()
        {
            this.FacturasProveedor = new HashSet<SAPC_FacturaProveedor>();
        }
    
        public int Id { get; set; }
        public string Nombre { get; set; }
        public string CUIT { get; set; }
        public string CtaContable { get; set; }
        public string SAPId { get; set; }
        public string Calle { get; set; }
        public string CPostal { get; set; }
        public bool Flag { get; set; }
        public string Telefono { get; set; }
        public System.DateTime UltimaActualizacion { get; set; }
        public string Mail { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SAPC_FacturaProveedor> FacturasProveedor { get; set; }
        public virtual SAPC_Poblaciones Poblacion { get; set; }
    }
}
