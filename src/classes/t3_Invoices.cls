
public class t3_Invoices extends Fflib_SObjectDomain implements T3_iInvoices 
{

	public static t3_iInvoices newInstance(List<Invoice__c> sObjectList)
	{
		return (t3_iInvoices) t3_Application.Domain.newInstance(sObjectList);
	}


	public t3_Invoices(List<Invoice__c> records) 
	{
		super(records);	
	}

	public void activate( fflib_ISObjectUnitOfWork uow ){

			for(Invoice__c invoice : (List<Invoice__c>) Records){
				invoice.Active__c = true;
				uow.registerDirty( invoice );
			}

	}

	public Map<Id, Decimal> getAmountsByProducto(){
		Map<Id, Decimal> amountMap = new Map<Id,Decimal>();
		for( Invoice__c invoice : (List<Invoice__c>)records ){
			Decimal amount = amountMap.get( invoice.ProductLine__c );
			if( amount == null ) amount = 0;
			amount += invoice.Amount__c;
			amountMap.put( invoice.ProductLine__c, amount );
		}
		return amountMap;
	}

	public class Constructor implements fflib_SObjectDomain.IConstructable
	{
		public fflib_SObjectDomain construct(List<SObject> sObjectList)
		{
			return new t3_Invoices(sObjectList);
		}
	}

}