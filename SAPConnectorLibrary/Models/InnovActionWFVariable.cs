
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
    
public partial class InnovActionWFVariable
{

    public int ValueID { get; set; }

    public Nullable<int> InstanceID { get; set; }

    public Nullable<int> HistoryID { get; set; }

    public string text { get; set; }

    public string value { get; set; }

    public Nullable<System.DateTime> timestamp { get; set; }



    public virtual InnovActionWFInst InnovActionWFInst { get; set; }

    public virtual InnovActionWFInstHist InnovActionWFInstHist { get; set; }

}

}
