/**
 * See https://github.com/financialforcedev/fflib-apex-common for more info
 *
 * Install library via
 *   https://githubsfdeploy.herokuapp.com/app/githubdeploy/financialforcedev/fflib-apex-common
 */

/**
 * Encapsulates all service layer logic for a given function or module in the application
 * 
 * For more guidelines and details see 
 *   https://developer.salesforce.com/page/Apex_Enterprise_Patterns_-_Service_Layer
 *
 **/
public class t3_Invoice_Service implements t3_iInvoice_Service
{
	
	public static void activateInvoices(Set<id> ids)
	{
		service().activateInvoices(ids);
	}	

	private static t3_iInvoice_Service service()
	{
		return (t3_iInvoice_Service) t3_Application.Service.newInstance(t3_iInvoice_Service.class);
	}	

}