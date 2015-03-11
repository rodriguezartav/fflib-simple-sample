public class t3_Products extends fflib_SObjectDomain implements t3_iProducts{
	
	public static T3_iProducts newInstance(List<Product__c> sObjectList)
	{
		return (T3_iProducts) t3_Application.Domain.newInstance(sObjectList);
	}

	public t3_Products(List<Product__c> sObjectList)
	{
		super(sObjectList);
	}
	
	public void updateInventory(fflib_ISObjectUnitOfWork uow, Map<Id,Decimal> amounts ){

		for(Product__c product : (List<Product__c>) Records)
		{
			system.debug(product);
			system.debug(amounts.get(product.id));
			product.Inventory__c -= amounts.get(product.id);
			uow.registerDirty(product);
		}

	} 

	public class Constructor implements fflib_SObjectDomain.IConstructable
	{
		public fflib_SObjectDomain construct(List<SObject> sObjectList)
		{
			return new t3_Products(sObjectList);
		}
	}

}