﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SAPConnectorLibrary.DatosProveedores {
    
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ServiceModel.ServiceContractAttribute(Namespace="urn:sap-com:document:sap:rfc:functions", ConfigurationName="DatosProveedores.ZWS_DATOS_PROVEEDORES")]
    public interface ZWS_DATOS_PROVEEDORES {
        
        // CODEGEN: Generating message contract since the operation ZFI_RFC_DATOS_PROVEEDORES is neither RPC nor document wrapped.
        [System.ServiceModel.OperationContractAttribute(Action="", ReplyAction="*")]
        [System.ServiceModel.XmlSerializerFormatAttribute(SupportFaults=true)]
        SAPConnectorLibrary.DatosProveedores.ZFI_RFC_DATOS_PROVEEDORESResponse1 ZFI_RFC_DATOS_PROVEEDORES(SAPConnectorLibrary.DatosProveedores.ZFI_RFC_DATOS_PROVEEDORESRequest request);
        
        [System.ServiceModel.OperationContractAttribute(Action="", ReplyAction="*")]
        System.Threading.Tasks.Task<SAPConnectorLibrary.DatosProveedores.ZFI_RFC_DATOS_PROVEEDORESResponse1> ZFI_RFC_DATOS_PROVEEDORESAsync(SAPConnectorLibrary.DatosProveedores.ZFI_RFC_DATOS_PROVEEDORESRequest request);
    }
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Xml", "4.7.2612.0")]
    [System.SerializableAttribute()]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType=true, Namespace="urn:sap-com:document:sap:rfc:functions")]
    public partial class ZFI_RFC_DATOS_PROVEEDORES : object, System.ComponentModel.INotifyPropertyChanged {
        
        private System.DateTime fECHA_CREACIONField;
        
        private bool fECHA_CREACIONFieldSpecified;
        
        private ZFI_RFC_PROVEEDORES[] t_DETALLEField;
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified, DataType="date", Order=0)]
        public System.DateTime FECHA_CREACION {
            get {
                return this.fECHA_CREACIONField;
            }
            set {
                this.fECHA_CREACIONField = value;
                this.RaisePropertyChanged("FECHA_CREACION");
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlIgnoreAttribute()]
        public bool FECHA_CREACIONSpecified {
            get {
                return this.fECHA_CREACIONFieldSpecified;
            }
            set {
                this.fECHA_CREACIONFieldSpecified = value;
                this.RaisePropertyChanged("FECHA_CREACIONSpecified");
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlArrayAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified, Order=1)]
        [System.Xml.Serialization.XmlArrayItemAttribute("item", Form=System.Xml.Schema.XmlSchemaForm.Unqualified, IsNullable=false)]
        public ZFI_RFC_PROVEEDORES[] T_DETALLE {
            get {
                return this.t_DETALLEField;
            }
            set {
                this.t_DETALLEField = value;
                this.RaisePropertyChanged("T_DETALLE");
            }
        }
        
        public event System.ComponentModel.PropertyChangedEventHandler PropertyChanged;
        
        protected void RaisePropertyChanged(string propertyName) {
            System.ComponentModel.PropertyChangedEventHandler propertyChanged = this.PropertyChanged;
            if ((propertyChanged != null)) {
                propertyChanged(this, new System.ComponentModel.PropertyChangedEventArgs(propertyName));
            }
        }
    }
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Xml", "4.7.2612.0")]
    [System.SerializableAttribute()]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(Namespace="urn:sap-com:document:sap:rfc:functions")]
    public partial class ZFI_RFC_PROVEEDORES : object, System.ComponentModel.INotifyPropertyChanged {
        
        private string pROVEEDORField;
        
        private string nOMBREField;
        
        private string cUITField;
        
        private string tELEFONOField;
        
        private string mAILField;
        
        private string pOBLACIONField;
        
        private string cALLEField;
        
        private string cPOSTALField;
        
        private string pAISField;
        
        private string fLAGField;
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified, Order=0)]
        public string PROVEEDOR {
            get {
                return this.pROVEEDORField;
            }
            set {
                this.pROVEEDORField = value;
                this.RaisePropertyChanged("PROVEEDOR");
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified, Order=1)]
        public string NOMBRE {
            get {
                return this.nOMBREField;
            }
            set {
                this.nOMBREField = value;
                this.RaisePropertyChanged("NOMBRE");
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified, Order=2)]
        public string CUIT {
            get {
                return this.cUITField;
            }
            set {
                this.cUITField = value;
                this.RaisePropertyChanged("CUIT");
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified, Order=3)]
        public string TELEFONO {
            get {
                return this.tELEFONOField;
            }
            set {
                this.tELEFONOField = value;
                this.RaisePropertyChanged("TELEFONO");
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified, Order=4)]
        public string MAIL {
            get {
                return this.mAILField;
            }
            set {
                this.mAILField = value;
                this.RaisePropertyChanged("MAIL");
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified, Order=5)]
        public string POBLACION {
            get {
                return this.pOBLACIONField;
            }
            set {
                this.pOBLACIONField = value;
                this.RaisePropertyChanged("POBLACION");
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified, Order=6)]
        public string CALLE {
            get {
                return this.cALLEField;
            }
            set {
                this.cALLEField = value;
                this.RaisePropertyChanged("CALLE");
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified, Order=7)]
        public string CPOSTAL {
            get {
                return this.cPOSTALField;
            }
            set {
                this.cPOSTALField = value;
                this.RaisePropertyChanged("CPOSTAL");
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified, Order=8)]
        public string PAIS {
            get {
                return this.pAISField;
            }
            set {
                this.pAISField = value;
                this.RaisePropertyChanged("PAIS");
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified, Order=9)]
        public string FLAG {
            get {
                return this.fLAGField;
            }
            set {
                this.fLAGField = value;
                this.RaisePropertyChanged("FLAG");
            }
        }
        
        public event System.ComponentModel.PropertyChangedEventHandler PropertyChanged;
        
        protected void RaisePropertyChanged(string propertyName) {
            System.ComponentModel.PropertyChangedEventHandler propertyChanged = this.PropertyChanged;
            if ((propertyChanged != null)) {
                propertyChanged(this, new System.ComponentModel.PropertyChangedEventArgs(propertyName));
            }
        }
    }
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Xml", "4.7.2612.0")]
    [System.SerializableAttribute()]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType=true, Namespace="urn:sap-com:document:sap:rfc:functions")]
    public partial class ZFI_RFC_DATOS_PROVEEDORESResponse : object, System.ComponentModel.INotifyPropertyChanged {
        
        private string mENSAJEField;
        
        private string rESULTADOField;
        
        private ZFI_RFC_PROVEEDORES[] t_DETALLEField;
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified, Order=0)]
        public string MENSAJE {
            get {
                return this.mENSAJEField;
            }
            set {
                this.mENSAJEField = value;
                this.RaisePropertyChanged("MENSAJE");
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified, Order=1)]
        public string RESULTADO {
            get {
                return this.rESULTADOField;
            }
            set {
                this.rESULTADOField = value;
                this.RaisePropertyChanged("RESULTADO");
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlArrayAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified, Order=2)]
        [System.Xml.Serialization.XmlArrayItemAttribute("item", Form=System.Xml.Schema.XmlSchemaForm.Unqualified, IsNullable=false)]
        public ZFI_RFC_PROVEEDORES[] T_DETALLE {
            get {
                return this.t_DETALLEField;
            }
            set {
                this.t_DETALLEField = value;
                this.RaisePropertyChanged("T_DETALLE");
            }
        }
        
        public event System.ComponentModel.PropertyChangedEventHandler PropertyChanged;
        
        protected void RaisePropertyChanged(string propertyName) {
            System.ComponentModel.PropertyChangedEventHandler propertyChanged = this.PropertyChanged;
            if ((propertyChanged != null)) {
                propertyChanged(this, new System.ComponentModel.PropertyChangedEventArgs(propertyName));
            }
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.ServiceModel.MessageContractAttribute(IsWrapped=false)]
    public partial class ZFI_RFC_DATOS_PROVEEDORESRequest {
        
        [System.ServiceModel.MessageBodyMemberAttribute(Namespace="urn:sap-com:document:sap:rfc:functions", Order=0)]
        public SAPConnectorLibrary.DatosProveedores.ZFI_RFC_DATOS_PROVEEDORES ZFI_RFC_DATOS_PROVEEDORES;
        
        public ZFI_RFC_DATOS_PROVEEDORESRequest() {
        }
        
        public ZFI_RFC_DATOS_PROVEEDORESRequest(SAPConnectorLibrary.DatosProveedores.ZFI_RFC_DATOS_PROVEEDORES ZFI_RFC_DATOS_PROVEEDORES) {
            this.ZFI_RFC_DATOS_PROVEEDORES = ZFI_RFC_DATOS_PROVEEDORES;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.ServiceModel.MessageContractAttribute(IsWrapped=false)]
    public partial class ZFI_RFC_DATOS_PROVEEDORESResponse1 {
        
        [System.ServiceModel.MessageBodyMemberAttribute(Namespace="urn:sap-com:document:sap:rfc:functions", Order=0)]
        public SAPConnectorLibrary.DatosProveedores.ZFI_RFC_DATOS_PROVEEDORESResponse ZFI_RFC_DATOS_PROVEEDORESResponse;
        
        public ZFI_RFC_DATOS_PROVEEDORESResponse1() {
        }
        
        public ZFI_RFC_DATOS_PROVEEDORESResponse1(SAPConnectorLibrary.DatosProveedores.ZFI_RFC_DATOS_PROVEEDORESResponse ZFI_RFC_DATOS_PROVEEDORESResponse) {
            this.ZFI_RFC_DATOS_PROVEEDORESResponse = ZFI_RFC_DATOS_PROVEEDORESResponse;
        }
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public interface ZWS_DATOS_PROVEEDORESChannel : SAPConnectorLibrary.DatosProveedores.ZWS_DATOS_PROVEEDORES, System.ServiceModel.IClientChannel {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public partial class ZWS_DATOS_PROVEEDORESClient : System.ServiceModel.ClientBase<SAPConnectorLibrary.DatosProveedores.ZWS_DATOS_PROVEEDORES>, SAPConnectorLibrary.DatosProveedores.ZWS_DATOS_PROVEEDORES {
        
        public ZWS_DATOS_PROVEEDORESClient() {
        }
        
        public ZWS_DATOS_PROVEEDORESClient(string endpointConfigurationName) : 
                base(endpointConfigurationName) {
        }
        
        public ZWS_DATOS_PROVEEDORESClient(string endpointConfigurationName, string remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public ZWS_DATOS_PROVEEDORESClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public ZWS_DATOS_PROVEEDORESClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(binding, remoteAddress) {
        }
        
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
        SAPConnectorLibrary.DatosProveedores.ZFI_RFC_DATOS_PROVEEDORESResponse1 SAPConnectorLibrary.DatosProveedores.ZWS_DATOS_PROVEEDORES.ZFI_RFC_DATOS_PROVEEDORES(SAPConnectorLibrary.DatosProveedores.ZFI_RFC_DATOS_PROVEEDORESRequest request) {
            return base.Channel.ZFI_RFC_DATOS_PROVEEDORES(request);
        }
        
        public SAPConnectorLibrary.DatosProveedores.ZFI_RFC_DATOS_PROVEEDORESResponse ZFI_RFC_DATOS_PROVEEDORES(SAPConnectorLibrary.DatosProveedores.ZFI_RFC_DATOS_PROVEEDORES ZFI_RFC_DATOS_PROVEEDORES1) {
            SAPConnectorLibrary.DatosProveedores.ZFI_RFC_DATOS_PROVEEDORESRequest inValue = new SAPConnectorLibrary.DatosProveedores.ZFI_RFC_DATOS_PROVEEDORESRequest();
            inValue.ZFI_RFC_DATOS_PROVEEDORES = ZFI_RFC_DATOS_PROVEEDORES1;
            SAPConnectorLibrary.DatosProveedores.ZFI_RFC_DATOS_PROVEEDORESResponse1 retVal = ((SAPConnectorLibrary.DatosProveedores.ZWS_DATOS_PROVEEDORES)(this)).ZFI_RFC_DATOS_PROVEEDORES(inValue);
            return retVal.ZFI_RFC_DATOS_PROVEEDORESResponse;
        }
        
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
        System.Threading.Tasks.Task<SAPConnectorLibrary.DatosProveedores.ZFI_RFC_DATOS_PROVEEDORESResponse1> SAPConnectorLibrary.DatosProveedores.ZWS_DATOS_PROVEEDORES.ZFI_RFC_DATOS_PROVEEDORESAsync(SAPConnectorLibrary.DatosProveedores.ZFI_RFC_DATOS_PROVEEDORESRequest request) {
            return base.Channel.ZFI_RFC_DATOS_PROVEEDORESAsync(request);
        }
        
        public System.Threading.Tasks.Task<SAPConnectorLibrary.DatosProveedores.ZFI_RFC_DATOS_PROVEEDORESResponse1> ZFI_RFC_DATOS_PROVEEDORESAsync(SAPConnectorLibrary.DatosProveedores.ZFI_RFC_DATOS_PROVEEDORES ZFI_RFC_DATOS_PROVEEDORES) {
            SAPConnectorLibrary.DatosProveedores.ZFI_RFC_DATOS_PROVEEDORESRequest inValue = new SAPConnectorLibrary.DatosProveedores.ZFI_RFC_DATOS_PROVEEDORESRequest();
            inValue.ZFI_RFC_DATOS_PROVEEDORES = ZFI_RFC_DATOS_PROVEEDORES;
            return ((SAPConnectorLibrary.DatosProveedores.ZWS_DATOS_PROVEEDORES)(this)).ZFI_RFC_DATOS_PROVEEDORESAsync(inValue);
        }
    }
}