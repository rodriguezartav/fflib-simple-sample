@isTest
private class t3_Products_Test {
	
	@isTest static void updateInventory_test() {
		// Implement test code

		fflib_ApexMocks mocks = new fflib_ApexMocks();
		fflib_ISObjectUnitOfWork uowMock = new fflib_SObjectMocks.SObjectUnitOfWork(mocks);

		// Given
		Product__c p = t3_ObjectCreator.createProduct();

		Map<Id, Decimal> mapPs = new Map<Id, Decimal>();
		mapPs.put(p.Id, 10);

		List<Product__c> testPList = new List<Product__c> { p };
		t3_Application.UnitOfWork.setMock(uowMock);

		// When
		t3_iProducts products = 
			t3_Products.newInstance(testPList);
		
		products.updateInventory( uowMock, mapPs );

		// Then
		((fflib_ISObjectUnitOfWork) 
			mocks.verify(uowMock, 1)).registerDirty(p);
		System.assertEquals(90, p.Inventory__c);
	}	


}
