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
    
    public partial class SAPC_InputacionesComprobantes
    {
        public int Id { get; set; }
        public string ClaveCT { get; set; }
        public string CtaContable { get; set; }
        public decimal Importe { get; set; }
        public string Textos { get; set; }
        public string IndImp { get; set; }
        public string Texto { get; set; }
    
        public virtual SAPC_Comprobante Comprobante { get; set; }
        public virtual SAPC_CECO CECO { get; set; }
    }
}
