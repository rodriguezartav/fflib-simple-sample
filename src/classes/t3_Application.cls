
public class t3_Application 
{
    // Configure and create the UnitOfWorkFactory for this Application
    public static List<SobjectType> unitOfWorkTypes = new List<SObjectType> { 
        Product__c.SObjectType, 
        Invoice__c.SObjectType 
    }; 

    public static Map<SObjectType, Type> domainTypesMap = new Map<SObjectType, Type> {
        Product__c.SObjectType => t3_Products.Constructor.class,
        Invoice__c.SObjectType => t3_Invoices.Constructor.class 
    };

    public static Map<SObjectType, Type> selectorTypeMap = new Map<SObjectType, Type>{
        Product__c.SObjectType => t3_Products_Selector.class,
        Invoice__c.SObjectType => t3_Invoice_Selector.class
    };


    public static Map<Type,Type> serviceTypesMap =  new Map<Type, Type> {
        t3_iInvoice_Service.class => t3_Invoice_ServiceImpl.class 
    };

    public static  fflib_Application.UnitOfWorkFactory UnitOfWork 
        =  new fflib_Application.UnitOfWorkFactory( t3_Application.unitOfWorkTypes );

	public static  fflib_Application.SelectorFactory Selector 
        =  new fflib_Application.SelectorFactory( t3_Application.selectorTypeMap );
     
    public static  fflib_Application.DomainFactory Domain 
        =  new fflib_Application.DomainFactory( t3_Application.Selector, t3_Application.domainTypesMap );     
  
    public static  fflib_Application.ServiceFactory Service 
        =  new fflib_Application.ServiceFactory( t3_Application.serviceTypesMap );

} 