public interface t3_iProducts_Selector {
	
	List<Product__c> selectById(Set<Id> ids);

	List<Product__c> selectFromInvoices( List<Invoice__c> invoices );

}