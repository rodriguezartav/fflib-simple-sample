
public with sharing class t3_Products_Selector extends fflib_SObjectSelector
	implements t3_iProducts_Selector
{
	public static t3_iProducts_Selector newInstance()
	{
		return (t3_iProducts_Selector) t3_Application.Selector.newInstance(Product__c.SObjectType);
	}
	
		public List<Schema.SObjectField> getSObjectFieldList()
	{
		return new List<Schema.SObjectField> {
			Product__c.Inventory__c,
			Product__c.Name,
			Product__c.Id
		};
	}

	public Schema.SObjectType getSObjectType()
	{
		return Product__c.sObjectType;
	}

	public List<Product__c> selectById(Set<ID> idSet) 
	{
		return (List<Product__c>) selectSObjectsById(idSet);
	}

	public List<Product__c> selectFromInvoices( List<Invoice__c> invoices ){
		Set<id> ids = new Set<Id>();
		for( Invoice__c invoice : invoices ){
			ids.add(invoice.ProductLine__c);
		}
		
		String query = newQueryFactory(false)
		.assertIsAccessible()
		.selectFields( this.getSObjectFieldList() )
		.setCondition('id in :ids')
		.toSOQL();

		return Database.query( query );
			
	}


}