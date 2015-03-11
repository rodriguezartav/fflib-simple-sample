public interface t3_iProducts extends fflib_ISObjectDomain {

	void updateInventory(fflib_ISObjectUnitOfWork uow, Map<Id,Decimal> amounts );
}