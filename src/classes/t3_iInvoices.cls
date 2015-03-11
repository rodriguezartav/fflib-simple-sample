public interface t3_iInvoices extends fflib_ISObjectDomain {
	
		void activate( fflib_ISObjectUnitOfWork uow ); 

		Map<Id, Decimal> getAmountsByProducto();
}