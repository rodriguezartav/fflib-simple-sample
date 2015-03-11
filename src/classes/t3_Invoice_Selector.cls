/**
 * See https://github.com/financialforcedev/fflib-apex-common for more info
 *
 * Install library via 
 *   https://githubsfdeploy.herokuapp.com/app/githubdeploy/financialforcedev/fflib-apex-common
 */

/**
 * Class encapsulates query logic for Invoice__c
 *
 * https://developer.salesforce.com/page/Apex_Enterprise_Patterns_-_Selector_Layer
 **/
public class t3_Invoice_Selector extends fflib_SObjectSelector implements t3_iInvoice_Selector
{
	
	public static t3_Invoice_Selector newInstance()
	{
		return (t3_Invoice_Selector) t3_Application.Selector.newInstance(Invoice__c.SObjectType);
	}

	public List<Schema.SObjectField> getSObjectFieldList()
	{
		return new List<Schema.SObjectField> {
				Invoice__c.Id,
				Invoice__c.Amount__c,
				Invoice__c.ProductLine__c,
				Invoice__c.Active__c
			};
	}

	public Schema.SObjectType getSObjectType()
	{
		return Invoice__c.sObjectType;
	}

	public List<Invoice__c> selectById(Set<ID> idSet)
	{
		return (List<Invoice__c>) selectSObjectsById(idSet);
	}	

	/*
	 * For more examples see https://github.com/financialforcedev/fflib-apex-common-samplecode
	 * 
	public List<Invoice__c> selectBySomethingElse(List<String> somethings)
	{
		assertIsAccessible();
		return (List<Invoice__c>) Database.query(
				String.format(
				'select {0}, ' +
				  'from {1} ' +
				  'where Something__c in :somethings ' + 
				  'order by {2}',
				new List<String> {
					getFieldListString(),
					getSObjectName(),
					getOrderBy() } ) );
	}
	 */
}