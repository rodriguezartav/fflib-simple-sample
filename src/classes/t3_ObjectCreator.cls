public  class t3_ObjectCreator {
	
	public static Product__c createProduct(){
		Product__c product = new Product__c();
		product.Name = String.valueOf( Math.random() * 100);
		product.Inventory__c = 100;
		return product;
	}

	public static List<Product__c> createProducts(Integer numberOfProducts){
		List<Product__c> products = new List<Product__c>();
		while( numberOfProducts > 0 ){
			products.add( createProduct() );
			numberOfProducts--;
		}
		return products;
	}

	public static Invoice__c createInvoice( Id productoId ){
		Invoice__c invoice = new Invoice__c();
		invoice.Active__c=false;
		invoice.Amount__c = 1;
		invoice.ProductLine__c = productoId;
		return invoice;
	}


	public static List<Invoice__c> createInvoices( List<Product__c> products ){
		List<Invoice__c> invoices = new List<Invoice__c>();
		for( Product__c product : products ){
			Invoice__c invoice = new Invoice__c();
			invoice.Active__c=false;
			invoice.Amount__c = 1;
			invoice.ProductLine__c = product.Id;
			invoices.add( invoice );
		}
		return invoices;
	}


	public static void mockId( sobject obj ){
		SobjectType objType = obj.getSObjectType();
		obj.put('Id', fflib_IDGenerator.generate(objType) );
	}

	public static void mockId( List<sobject> objs ){
		for( SObject obj: objs ){
			SobjectType objType = obj.getSObjectType();
			obj.put('Id', fflib_IDGenerator.generate(objType) );
		}
	}

}