import org.json.JSONException;
import java.net.InetAddress;
import org.json.JSONObject;

import Utility.GetMenu;

public class MenuTesting {
	public static void main(String[] args) throws Exception {
/*		String req="{\"CUSTOMER_MANGE\": {\"SUBMENU\": {\"CUST_CALLS\": {\"SUBMENU\": {},\"NAME\": \"Calls\",\"VISIBLE\": \"Y\"}},\"NAME\": \"Customer Management\",\"VISIBLE\": \"Y\"},\"HRMS\": {\"SUBMENU\": {\"COMP_PROF\": {\"SUBMENU\": {\"BRANCH_MST\": {\"NAME\": \"Branch Master\",\"VISIBLE\": \"Y\"},\"COMP_MST\": {\"NAME\": \"Company Master\",\"VISIBLE\": \"Y\"}},\"NAME\": \"Company Profile\",\"VISIBLE\": \"Y\"},\"DASHBOARD\": {\"SUBMENU\": {},\"NAME\": \"Dashboard\",\"VISIBLE\": \"Y\"},\"EMP_MANGE\": {\"SUBMENU\": {\"EMP_UPDATE\": {\"NAME\": \"Update Employee\",\"VISIBLE\": \"Y\"},\"EMP_NEW\": {\"NAME\": \"New Employee\",\"VISIBLE\": \"Y\"}},\"NAME\": \"Employee Management\",\"VISIBLE\": \"Y\"},\"REPORTS\": {\"SUBMENU\": {},\"NAME\": \"Reports\",\"VISIBLE\": \"Y\"},\"HR_MANGE\": {\"SUBMENU\": {\"GRADE_MST\": {\"NAME\": \"Grade Master\",\"VISIBLE\": \"Y\"},\"DEPRT_MST\": {\"NAME\": \"Department Master\",\"VISIBLE\": \"Y\"},\"SHIFT_MST\": {\"NAME\": \"Shift Master\",\"VISIBLE\": \"Y\"},\"DESDIG_MST\": {\"NAME\": \"Designation Type Master\",\"VISIBLE\": \"Y\"},\"CONTRA_TYPE_MST\": {\"NAME\": \"Contract Type Master\",\"VISIBLE\": \"Y\"},\"INSU_MST\": {\"NAME\": \"Insurance Master\",\"VISIBLE\": \"Y\"}},\"NAME\": \"HR Management\",\"VISIBLE\": \"Y\"},\"SALARY_MANGE\": {\"SUBMENU\": {\"ALLOW_MST\": {\"NAME\": \"Allowance Master\",\"VISIBLE\": \"Y\"},\"SALARY_HED_MST\": {\"NAME\": \"Salary Head Master\",\"VISIBLE\": \"Y\"},\"LEAVE_MST\": {\"NAME\": \"leave master\",\"VISIBLE\": \"Y\"},\"SALARY_MST\": {\"NAME\": \"Salary Master\",\"VISIBLE\": \"Y\"},\"SALARY_PROC\": {\"NAME\": \"Salary Process\",\"VISIBLE\": \"Y\"},\"ATTEN_MST\": {\"NAME\": \"attendence master\",\"VISIBLE\": \"Y\"}},\"NAME\": \"Salary Management\",\"VISIBLE\": \"Y\"},\"USER_MANGE\": {\"SUBMENU\": {\"USER_LIST\": {\"NAME\": \"User List\",\"VISIBLE\": \"Y\"},\"USER_NEW\": {\"NAME\": \"New User\",\"VISIBLE\": \"Y\"}},\"NAME\": \"User Management\",\"VISIBLE\": \"Y\"}},\"NAME\": \"HRMS\",\"VISIBLE\": \"Y\"},\"DASHBOARD\": {\"SUBMENU\": {},\"NAME\": \"Dashboard\",\"VISIBLE\": \"Y\"},\"ORDER_MANGE\": {\"SUBMENU\": {},\"NAME\": \"Order Management\",\"VISIBLE\": \"Y\"},\"TASK_MANGE\": {\"SUBMENU\": {\"TASK_TASKS\": {\"SUBMENU\": {},\"NAME\": \"Tasks\",\"VISIBLE\": \"Y\"}},\"NAME\": \"Task Management\",\"VISIBLE\": \"Y\"},\"SETTING\": {\"SUBMENU\": {\"SETT_FINANCE\": {\"SUBMENU\": {\"PAY_MODES\": {\"NAME\": \"Payment Modes\",\"VISIBLE\": \"Y\"},\"TAX_RATE_MST\": {\"NAME\": \"Tax Rate Master\",\"VISIBLE\": \"Y\"},\"EXPENSE_CATE\": {\"NAME\": \"Expense Categories\",\"VISIBLE\": \"Y\"},\"CURRENCY_MST\": {\"NAME\": \"Currency Master\",\"VISIBLE\": \"Y\"}},\"NAME\": \"Finance\",\"VISIBLE\": \"Y\"},\"SETT_TEMP\": {\"SUBMENU\": {},\"NAME\": \"Template Management\",\"VISIBLE\": \"Y\"},\"SETT_MANGE\": {\"SUBMENU\": {\"PRODUCT_MST\": {\"NAME\": \"Product Master\",\"VISIBLE\": \"Y\"},\"DEALER_MANGE\": {\"NAME\": \"Dealers Management\",\"VISIBLE\": \"Y\"},\"PROJECT_MST\": {\"NAME\": \"Project Master\",\"VISIBLE\": \"Y\"}},\"NAME\": \"Manage Projects\",\"VISIBLE\": \"Y\"},\"SETT_API\": {\"SUBMENU\": {},\"NAME\": \"API Settings\",\"VISIBLE\": \"Y\"},\"SETT_OTHER\": {\"SUBMENU\": {\"LEAD_SETTING\": {\"NAME\": \"Lead Settings\",\"VISIBLE\": \"Y\"},\"PDF\": {\"NAME\": \"PDF\",\"VISIBLE\": \"Y\"},\"SETT_FINANCE\": {\"NAME\": \"Finance\",\"VISIBLE\": \"Y\"},\"CRON_JOB\": {\"NAME\": \"Cron Jobs\",\"VISIBLE\": \"Y\"},\"E_SIGN\": {\"NAME\": \"E-Signature\",\"VISIBLE\": \"Y\"},\"E_MAIL\": {\"NAME\": \"E-Mail\",\"VISIBLE\": \"Y\"},\"PAY_GATE\": {\"NAME\": \"Payment Gateways\",\"VISIBLE\": \"Y\"},\"TASK_SETTINGS\": {\"NAME\": \"Tasks Settings\",\"VISIBLE\": \"Y\"},\"SMS_SETT\": {\"NAME\": \"SMS Settings\",\"VISIBLE\": \"Y\"},\"SUBSCRIP\": {\"NAME\": \"Subscriptions\",\"VISIBLE\": \"Y\"},\"CALENDER\": {\"NAME\": \"Calender\",\"VISIBLE\": \"Y\"}},\"NAME\": \"Other Settings\",\"VISIBLE\": \"Y\"}},\"NAME\": \"Settings\",\"VISIBLE\": \"Y\"},\"KNOW_ANN\": {\"SUBMENU\": {\"ANNOUCE\": {\"SUBMENU\": {},\"NAME\": \"Annoucements\",\"VISIBLE\": \"Y\"},\"KNOW_BASE\": {\"SUBMENU\": {},\"NAME\": \"Knowledge Base\",\"VISIBLE\": \"Y\"},\"KNOW_NEWS\": {\"SUBMENU\": {},\"NAME\": \"News\",\"VISIBLE\": \"Y\"}},\"NAME\": \"Knowledge & Annoucements\",\"VISIBLE\": \"Y\"},\"LEAD_MANGE\": {\"SUBMENU\": {\"LEAD_REPORTS\": {\"SUBMENU\": {},\"NAME\": \"Reports\",\"VISIBLE\": \"Y\"},\"NEW_LEAD\": {\"SUBMENU\": {},\"NAME\": \"New Lead\",\"VISIBLE\": \"Y\"},\"IMPORT_LEAD\": {\"SUBMENU\": {},\"NAME\": \"Import Leads\",\"VISIBLE\": \"Y\"}},\"NAME\": \"Lead Management\",\"VISIBLE\": \"Y\"},\"SALES_MANGE\": {\"SUBMENU\": {\"SALES_NOTES\": {\"SUBMENU\": {},\"NAME\": \"Credit Notes\",\"VISIBLE\": \"Y\"},\"SALES_ESTI\": {\"SUBMENU\": {},\"NAME\": \"Estimates\",\"VISIBLE\": \"Y\"},\"SALES_PAY\": {\"SUBMENU\": {},\"NAME\": \"Payments\",\"VISIBLE\": \"Y\"},\"SALES_PRICE\": {\"SUBMENU\": {},\"NAME\": \"Price Book\",\"VISIBLE\": \"Y\"},\"SALES_INV\": {\"SUBMENU\": {},\"NAME\": \"Sales Invoice\",\"VISIBLE\": \"Y\"},\"SALES_BUSINESS\": {\"SUBMENU\": {},\"NAME\": \"Business Proposals\",\"VISIBLE\": \"Y\"}},\"NAME\": \"Sales Management\",\"VISIBLE\": \"Y\"},\"TICKET_MANGE\": {\"SUBMENU\": {},\"NAME\": \"Ticket Management\",\"VISIBLE\": \"Y\"},\"CONTACT_MANGE\": {\"SUBMENU\": {\"CON_MEETING\": {\"SUBMENU\": {},\"NAME\": \"Meetings\",\"VISIBLE\": \"Y\"}},\"NAME\": \"Contact Management\",\"VISIBLE\": \"Y\"}}";
		JSONObject jmenu=new JSONObject(req);
		JSONObject mainmenu;
	    JSONObject mainmenudtl;
	    JSONObject mainmenusubdtl;

	    System.out.println(GetMenu.GetDetailsMenuName(jmenu, "HRMS","COMP_PROF"));
	    InetAddress myIP=InetAddress.getLocalHost();
	    
	       public String getHostAddress(): Returns the IP 
	       * address string in textual presentation.
	       
	      System.out.println("My IP Address is:");
	      System.out.println(myIP.getHostAddress());*/
		
		System.out.println(GetTimeWithSecound(""));
		System.out.println(GetTimeWithSecound("05:00:00"));
		System.out.println(GetTimeWithSecound("05:00"));
		System.out.println(GetTimeWithSecound("5:00"));
		
	}
	public static String GetTimeWithSecound(String ls_time) {
		String ls_result=ls_time;
		if(ls_time == null) {
			return "";
		} 
		ls_result=ls_time.trim();	
	    if(ls_time.length()==5) {
	    	ls_result=ls_result+":00";
		}
		return ls_result;
	}
}
