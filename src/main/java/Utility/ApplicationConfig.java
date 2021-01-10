package Utility;

import java.io.InputStream;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;

public class ApplicationConfig {

	public static String ErrorResponse="{\"STATUS_CD\":\"999\",\"MESSAGE\":\"We're sorry for the inconvenience, Please try after sometime.  \",\"ERRRO_MSG\":\"$ERROR_MSG$\",\"RESPONSE\":[]}";
	public static String AuthFailed="{\"STATUS_CD\":\"999\",\"MESSAGE\":\"Something went to wrong , Please contact to Administrator.\",\"ERRRO_MSG\":\"$ERROR_MSG$\",\"RESPONSE\":[]}";
	public static String SessionExpire="{\"STATUS_CD\":\"9\",\"MESSAGE\":\"Session Expire.\"}";
	public static String TestingRes="{\"MESSAGE\":\"SUCESS\",\"RESPONSE\":[{\"COMP_CD\":\"001\",\"USER_ID\":\"VISHVESH.VYAS\",\"MENU\":{\"CUSTOMER_MANGE\": {\"SUBMENU\": {\"CUST_CALLS\": {\"SUBMENU\": {},\"NAME\": \"Calls\",\"VISIBLE\": \"Y\"}},\"NAME\": \"Customer Management\",\"VISIBLE\": \"Y\"},\"HRMS\": {\"SUBMENU\": {\"COMP_PROF\": {\"SUBMENU\": {\"BRANCH_MST\": {\"NAME\": \"Branch Master\",\"VISIBLE\": \"Y\"},\"COMP_MST\": {\"NAME\": \"Company Master\",\"VISIBLE\": \"Y\"}},\"NAME\": \"Company Profile\",\"VISIBLE\": \"Y\"},\"DASHBOARD\": {\"SUBMENU\": {},\"NAME\": \"Dashboard\",\"VISIBLE\": \"Y\"},\"EMP_MANGE\": {\"SUBMENU\": {\"EMP_UPDATE\": {\"NAME\": \"Update Employee\",\"VISIBLE\": \"Y\",\"DELETE\":\"Y\",\"UPDATE\":\"Y\"},\"EMP_NEW\": {\"NAME\": \"New Employee\",\"VISIBLE\": \"Y\"}},\"NAME\": \"Employee Management\",\"VISIBLE\": \"Y\"},\"REPORTS\": {\"SUBMENU\": {},\"NAME\": \"Reports\",\"VISIBLE\": \"Y\"},\"HR_MANGE\": {\"SUBMENU\": {\"GRADE_MST\": {\"NAME\": \"Grade Master\",\"VISIBLE\": \"Y\"},\"DEPRT_MST\": {\"NAME\": \"Department Master\",\"VISIBLE\": \"Y\"},\"SHIFT_MST\": {\"NAME\": \"Shift Master\",\"VISIBLE\": \"Y\"},\"DESDIG_MST\": {\"NAME\": \"Designation Type Master\",\"VISIBLE\": \"Y\"},\"CONTRA_TYPE_MST\": {\"NAME\": \"Contract Type Master\",\"VISIBLE\": \"Y\"},\"INSU_MST\": {\"NAME\": \"Insurance Master\",\"VISIBLE\": \"Y\"}},\"NAME\": \"HR Management\",\"VISIBLE\": \"Y\"},\"SALARY_MANGE\": {\"SUBMENU\": {\"ALLOW_MST\": {\"NAME\": \"Allowance Master\",\"VISIBLE\": \"Y\"},\"SALARY_HED_MST\": {\"NAME\": \"Salary Head Master\",\"VISIBLE\": \"Y\"},\"LEAVE_MST\": {\"NAME\": \"leave master\",\"VISIBLE\": \"Y\"},\"SALARY_MST\": {\"NAME\": \"Salary Master\",\"VISIBLE\": \"Y\"},\"SALARY_PROC\": {\"NAME\": \"Salary Process\",\"VISIBLE\": \"Y\"},\"ATTEN_MST\": {\"NAME\": \"attendence master\",\"VISIBLE\": \"Y\"}},\"NAME\": \"Salary Management\",\"VISIBLE\": \"Y\"},\"USER_MANGE\": {\"SUBMENU\": {\"USER_LIST\": {\"NAME\": \"User List\",\"VISIBLE\": \"Y\"},\"USER_NEW\": {\"NAME\": \"New User\",\"VISIBLE\": \"Y\"}},\"NAME\": \"User Management\",\"VISIBLE\": \"Y\"}},\"NAME\": \"HRMS\",\"VISIBLE\": \"Y\"},\"DASHBOARD\": {\"SUBMENU\": {},\"NAME\": \"Dashboard\",\"VISIBLE\": \"Y\"},\"ORDER_MANGE\": {\"SUBMENU\": {},\"NAME\": \"Order Management\",\"VISIBLE\": \"Y\"},\"TASK_MANGE\": {\"SUBMENU\": {\"TASK_TASKS\": {\"SUBMENU\": {},\"NAME\": \"Tasks\",\"VISIBLE\": \"Y\"}},\"NAME\": \"Task Management\",\"VISIBLE\": \"Y\"},\"SETTING\": {\"SUBMENU\": {\"SETT_FINANCE\": {\"SUBMENU\": {\"PAY_MODES\": {\"NAME\": \"Payment Modes\",\"VISIBLE\": \"Y\"},\"TAX_RATE_MST\": {\"NAME\": \"Tax Rate Master\",\"VISIBLE\": \"Y\"},\"EXPENSE_CATE\": {\"NAME\": \"Expense Categories\",\"VISIBLE\": \"Y\"},\"CURRENCY_MST\": {\"NAME\": \"Currency Master\",\"VISIBLE\": \"Y\"}},\"NAME\": \"Finance\",\"VISIBLE\": \"Y\"},\"SETT_TEMP\": {\"SUBMENU\": {},\"NAME\": \"Template Management\",\"VISIBLE\": \"Y\"},\"SETT_MANGE\": {\"SUBMENU\": {\"PRODUCT_MST\": {\"NAME\": \"Product Master\",\"VISIBLE\": \"Y\"},\"DEALER_MANGE\": {\"NAME\": \"Dealers Management\",\"VISIBLE\": \"Y\"},\"PROJECT_MST\": {\"NAME\": \"Project Master\",\"VISIBLE\": \"Y\"}},\"NAME\": \"Manage Projects\",\"VISIBLE\": \"Y\"},\"SETT_API\": {\"SUBMENU\": {},\"NAME\": \"API Settings\",\"VISIBLE\": \"Y\"},\"SETT_OTHER\": {\"SUBMENU\": {\"LEAD_SETTING\": {\"NAME\": \"Lead Settings\",\"VISIBLE\": \"Y\"},\"PDF\": {\"NAME\": \"PDF\",\"VISIBLE\": \"Y\"},\"SETT_FINANCE\": {\"NAME\": \"Finance\",\"VISIBLE\": \"Y\"},\"CRON_JOB\": {\"NAME\": \"Cron Jobs\",\"VISIBLE\": \"Y\"},\"E_SIGN\": {\"NAME\": \"E-Signature\",\"VISIBLE\": \"Y\"},\"E_MAIL\": {\"NAME\": \"E-Mail\",\"VISIBLE\": \"Y\"},\"PAY_GATE\": {\"NAME\": \"Payment Gateways\",\"VISIBLE\": \"Y\"},\"TASK_SETTINGS\": {\"NAME\": \"Tasks Settings\",\"VISIBLE\": \"Y\"},\"SMS_SETT\": {\"NAME\": \"SMS Settings\",\"VISIBLE\": \"Y\"},\"SUBSCRIP\": {\"NAME\": \"Subscriptions\",\"VISIBLE\": \"Y\"},\"CALENDER\": {\"NAME\": \"Calender\",\"VISIBLE\": \"Y\"}},\"NAME\": \"Other Settings\",\"VISIBLE\": \"Y\"}},\"NAME\": \"Settings\",\"VISIBLE\": \"Y\"},\"KNOW_ANN\": {\"SUBMENU\": {\"ANNOUCE\": {\"SUBMENU\": {},\"NAME\": \"Annoucements\",\"VISIBLE\": \"Y\"},\"KNOW_BASE\": {\"SUBMENU\": {},\"NAME\": \"Knowledge Base\",\"VISIBLE\": \"Y\"},\"KNOW_NEWS\": {\"SUBMENU\": {},\"NAME\": \"News\",\"VISIBLE\": \"Y\"}},\"NAME\": \"Knowledge & Annoucements\",\"VISIBLE\": \"Y\"},\"LEAD_MANGE\": {\"SUBMENU\": {\"LEAD_REPORTS\": {\"SUBMENU\": {},\"NAME\": \"Reports\",\"VISIBLE\": \"Y\"},\"NEW_LEAD\": {\"SUBMENU\": {},\"NAME\": \"New Lead\",\"VISIBLE\": \"Y\"},\"IMPORT_LEAD\": {\"SUBMENU\": {},\"NAME\": \"Import Leads\",\"VISIBLE\": \"Y\"}},\"NAME\": \"Lead Management\",\"VISIBLE\": \"Y\"},\"SALES_MANGE\": {\"SUBMENU\": {\"SALES_NOTES\": {\"SUBMENU\": {},\"NAME\": \"Credit Notes\",\"VISIBLE\": \"Y\"},\"SALES_ESTI\": {\"SUBMENU\": {},\"NAME\": \"Estimates\",\"VISIBLE\": \"Y\"},\"SALES_PAY\": {\"SUBMENU\": {},\"NAME\": \"Payments\",\"VISIBLE\": \"Y\"},\"SALES_PRICE\": {\"SUBMENU\": {},\"NAME\": \"Price Book\",\"VISIBLE\": \"Y\"},\"SALES_INV\": {\"SUBMENU\": {},\"NAME\": \"Sales Invoice\",\"VISIBLE\": \"Y\"},\"SALES_BUSINESS\": {\"SUBMENU\": {},\"NAME\": \"Business Proposals\",\"VISIBLE\": \"Y\"}},\"NAME\": \"Sales Management\",\"VISIBLE\": \"Y\"},\"TICKET_MANGE\": {\"SUBMENU\": {},\"NAME\": \"Ticket Management\",\"VISIBLE\": \"Y\"},\"CONTACT_MANGE\": {\"SUBMENU\": {\"CON_MEETING\": {\"SUBMENU\": {},\"NAME\": \"Meetings\",\"VISIBLE\": \"Y\"}},\"NAME\": \"Contact Management\",\"VISIBLE\": \"Y\"}}}],\"STATUS_CD\":\"0\"}";
	public static String ListErrorMsg = "Something went to wrong , Please contact to Administrator.";
	public static String ErrorMsg = "Something went to wrong , Please try again.";
	public static String SessionExpireJs = "<script>window.location.href='Login';</script>";
	public static String ApiConnect = "Y";
	public static String LoginPage = "Login";
	
	public static String getConfig(String argu) {
        String value;
       
        Properties prop = new Properties();
        String filename = "Application.properties";
        try {
            InputStream input = ApplicationConfig.class.getClassLoader().getResourceAsStream(filename);
            if (input == null) {
                System.out.println("Sorry, unable to find " + filename);
                //String str = value2;
                return "";
            }
            prop.load(input);
            value = prop.getProperty(argu);
            if (value == null) {
                value = "";
            }
            
            try {
            	input.close();
			} catch (Exception e) {
				// TODO: handle exception
			}
            return value;
        } catch (Exception e) {
            value = "";
            e.printStackTrace();
            return "";
        }
    }
	public static int GetMaxInactiveInterval()
	{
		return 3000;
	}
	public static String nvl(String val)
    {
        if(val != null)
            return val;
        
        return "";
    }
	public static java.sql.Date getTodayDate()
	{
		long millis=System.currentTimeMillis();  
        java.sql.Date date=new java.sql.Date(millis); 
        return date;
	}
	public static String getClientIpAddr(HttpServletRequest request) {  
	    String ip = request.getHeader("X-Forwarded-For");  
	    if (ip == null || ip.length() == 0 || ip.equalsIgnoreCase("unknown")) {  
	        ip = request.getHeader("Proxy-Client-IP");  
	    }  
	    if (ip == null || ip.length() == 0 || ip.equalsIgnoreCase("unknown")) {  
	        ip = request.getHeader("WL-Proxy-Client-IP");  
	    }  
	    if (ip == null || ip.length() == 0 || ip.equalsIgnoreCase("unknown")) {  
	        ip = request.getHeader("HTTP_X_FORWARDED_FOR");  
	    }  
	    if (ip == null || ip.length() == 0 || ip.equalsIgnoreCase("unknown")) {  
	        ip = request.getHeader("HTTP_X_FORWARDED");  
	    }  
	    if (ip == null || ip.length() == 0 || ip.equalsIgnoreCase("unknown")) {  
	        ip = request.getHeader("HTTP_X_CLUSTER_CLIENT_IP");  
	    }  
	    if (ip == null || ip.length() == 0 || ip.equalsIgnoreCase("unknown")) {  
	        ip = request.getHeader("HTTP_CLIENT_IP");  
	    }  
	    if (ip == null || ip.length() == 0 || ip.equalsIgnoreCase("unknown")) {  
	        ip = request.getHeader("HTTP_FORWARDED_FOR");  
	    }  
	    if (ip == null || ip.length() == 0 || ip.equalsIgnoreCase("unknown")) {  
	        ip = request.getHeader("HTTP_FORWARDED");  
	    }  
	    if (ip == null || ip.length() == 0 || ip.equalsIgnoreCase("unknown")) {  
	        ip = request.getHeader("HTTP_VIA");  
	    }  
	    if (ip == null || ip.length() == 0 || ip.equalsIgnoreCase("unknown")) {  
	        ip = request.getHeader("REMOTE_ADDR");  
	    }  
	    if (ip == null || ip.length() == 0 || ip.equalsIgnoreCase("unknown")) {  
	        ip = request.getRemoteAddr();  
	    }  
	    return ip;  
	}
}