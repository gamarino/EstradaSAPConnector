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
    
    public partial class SAPC_CECO
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public SAPC_CECO()
        {
            this.SAPC_FacturaProveedor = new HashSet<SAPC_FacturaProveedor>();
            this.SAPC_Comprobante = new HashSet<SAPC_Comprobante>();
        }
    
        public int Id { get; set; }
        public string Nombre { get; set; }
        public string CodCECO { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SAPC_FacturaProveedor> SAPC_FacturaProveedor { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SAPC_Comprobante> SAPC_Comprobante { get; set; }
    }
}
