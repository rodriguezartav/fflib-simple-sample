@isTest
private class t3_Invoices_Test {
	
	@isTest static void getGetAmountByProducto() {
		
		List<Product__c> products = t3_ObjectCreator.createProducts(5);
		t3_ObjectCreator.mockId(products);

		List<Invoice__c> invoiceList = t3_ObjectCreator.createInvoices( products );

		t3_Invoices invoices = new t3_Invoices( invoiceList );
		Map<Id,Decimal> iMap = invoices.getAmountsByProducto();
		for( Product__c product : products ){
			system.assertEquals( iMap.get( product.Id ) , 1 );
		}

	}
	
}