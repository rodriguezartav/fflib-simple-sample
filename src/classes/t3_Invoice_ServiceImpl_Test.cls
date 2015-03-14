@isTest
private class t3_Invoice_ServiceImpl_Test {
	
	@isTest static void testActivateInvoices_DML() {

		List<Product__c> products = t3_ObjectCreator.createProducts(5);
		insert products;

		List<Invoice__c> invoiceList = t3_ObjectCreator.createInvoices( products );
		insert invoiceList;

		Set<Id> ids = new Set<Id>();
		for( Invoice__c i : invoiceList ) 
			ids.add( i.id );

		t3_Invoice_ServiceImpl.activateInvoices( ids );

		Set<Id> pids = new Set<Id>();
		for( Product__c p : products ) 
			pids.add( p.id );


		List<Product__c> productsCheck = new t3_Products_Selector().selectById( ids );

		for( Product__c p : productsCheck ) {
			system.assertEquals( p.Inventory__c, 99 );
		}

	}

	@isTest static void testActivateInvoices_noDML() {

		//Create Data
		List<Product__c> products = t3_ObjectCreator.createProducts(5);
		//t3_ObjectCreator.mockId(products);
		insert products;
		List<Invoice__c> invoiceList = t3_ObjectCreator.createInvoices( products );
		insert invoiceList;

		// Create mocks
		fflib_ApexMocks mocks = new fflib_ApexMocks();
		fflib_ISObjectUnitOfWork uowMock = new fflib_SObjectMocks.SObjectUnitOfWork(mocks);
		
		t3_iProducts productsMock = new ProductsMock(mocks);
		t3_iInvoices invoicesMock = new InvoicesMock(mocks);

		mocks.startStubbing();
		
		Map<Id,Decimal>() dMap = new Map<Id,Decimal>();
		mocks.when(productsMock.sObjectType()).thenReturn( Product__c.SObjectType );
		mocks.when(productsMock.updateInventory()).thenReturn( null );

		//Product__c.SObjectType => t3_Products.Constructor.class,

		mocks.stopStubbing();

		t3_Application.UnitOfWork.setMock(uowMock);
		
		t3_Application.Domain.setMock(productsMock);


		Set<Id> ids = new Set<Id>();
		for( Invoice__c i : invoiceList ) 
			ids.add( i.id );

		// When
		t3_Invoice_ServiceImpl.activateInvoices( ids );

		// Then
		
		((t3_iProducts) 
			mocks.verify(productsMock)).updateInventory( uowMock, dMap );
		
		((fflib_ISObjectUnitOfWork) 
			mocks.verify(uowMock, 1)).commitWork();
	
	
	}

	public class ProductsMock extends fflib_SObjectMocks.SObjectDomain implements t3_iProducts{
		private fflib_ApexMocks mocks;

		public ProductsMock(fflib_ApexMocks mocks)
		{
			super(mocks);
			this.mocks = mocks;
		}

		public void updateInventory(fflib_ISObjectUnitOfWork uow, Map<Id,Decimal> amounts ){

				if (mocks.Verifying)
				{
					mocks.verifyMethodCall(this, 'updateInventory', new List<Object> {uow, amounts} );
				}
				else if (mocks.Stubbing){
					mocks.prepareMethodReturnValue(this, 'updateInventory', new List<Object> {uow, amounts} );
					return;
				}
				else{
					mocks.recordMethod(this, 'updateInventory', new List<Object> {uow, amounts} );
				}
				return;
		} 


	}

	public class InvoicesMock extends fflib_SObjectMocks.SObjectDomain implements t3_iInvoices{
		private fflib_ApexMocks mocks;

		public InvoicesMock(fflib_ApexMocks mocks)
		{
			super(mocks);
			this.mocks = mocks;
		}

		
		public void activate( fflib_ISObjectUnitOfWork uow ){

			
			mocks.mockVoidMethod(this, 'activate', new List<Object> {uow});


		}

		public Map<Id, Decimal> getAmountsByProducto(){
			

			return (Map<Id, Decimal>) mocks.mockNonVoidMethod(this, 'getAmountsByProducto', new List<Object> {} );

		}


	}

}