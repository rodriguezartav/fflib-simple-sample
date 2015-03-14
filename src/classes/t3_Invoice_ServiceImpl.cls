
public class t3_Invoice_ServiceImpl implements t3_iInvoice_Service
{
	
	public static void activateInvoices(Set<id> ids)
	{

		fflib_ISObjectUnitOfWork uow = t3_Application.UnitOfWork.newInstance();

		List<Invoice__c> invoiceList = t3_Application.Selector.selectById(ids);

		t3_iInvoices invoices = (t3_iInvoices)t3_Application.Domain.newInstance(invoiceList);

		invoices.activate(uow);

		List<Product__c> productsList = ((t3_iProducts_Selector)t3_Application.Selector.newInstance(Product__c.sobjectType)).selectFromInvoices(invoiceList);

		t3_iProducts products = (t3_iProducts)t3_Application.Domain.newInstance(productsList);
		
		system.debug('*****');
		system.debug( products );

		products.updateInventory(uow, invoices.getAmountsByProducto() );

		uow.commitWork();
	}

} 