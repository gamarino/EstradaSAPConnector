
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
    
public partial class SAPC_Credentials
{

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
    public SAPC_Credentials()
    {

        this.SAPC_FondoFijo = new HashSet<SAPC_FondoFijo>();

    }


    public int Id { get; set; }

    public string Name { get; set; }

    public string SAPLoginName { get; set; }

    public string SAPLoginPassword { get; set; }



    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]

    public virtual ICollection<SAPC_FondoFijo> SAPC_FondoFijo { get; set; }

}

}
