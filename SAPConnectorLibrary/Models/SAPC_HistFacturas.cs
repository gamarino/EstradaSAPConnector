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
    
    public partial class SAPC_HistFacturas
    {
        public int ID { get; set; }
        public string Referencia { get; set; }
        public string CUIT { get; set; }
        public Nullable<int> FacturaID { get; set; }
    
        public virtual SAPC_Facturas SAPC_Facturas { get; set; }
    }
}
