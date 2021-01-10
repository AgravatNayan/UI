package baseCRM;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import Utility.APICall;
import Utility.ApplicationConfig;
import Utility.GetMenu;

/**
 * Servlet implementation class emp_mst
 */
@WebServlet("/branch_master")
public class branch_mst extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public branch_mst() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try { 
			HttpSession session = null;
			String username="";
			String result="";
			String comp_cd="";
			JSONObject jmenu=null;
			boolean lb_continue=true;
			 try {
				 session = request.getSession();
			     session.setMaxInactiveInterval(ApplicationConfig.GetMaxInactiveInterval());
			     if (session.getAttribute("logon").toString() != "true") {
			            session.invalidate();
			            response.getWriter().println(ApplicationConfig.SessionExpire);
			            lb_continue = false;
			        }	
			     username = session.getAttribute("USER_ID").toString();
			     comp_cd =  session.getAttribute("COMP_CD").toString();
			     jmenu =(JSONObject) request.getSession().getAttribute("MENU");	
			} catch (Exception e) {
				System.out.println("Session Check Error "+e);
				response.getWriter().println(ApplicationConfig.SessionExpire);
				lb_continue = false;
			}
			if(lb_continue)
			{
				String action_id = request.getParameter("action_id");
				JSONObject jRES=new JSONObject();
				JSONObject jout=new JSONObject();
				jout.put("USERNAME",username);
				jout.put("COMP_CD",comp_cd);
				jout.put("REQUEST_IP",ApplicationConfig.getClientIpAddr(request));
				if("EDIT".equalsIgnoreCase(action_id))
				{
					String id = request.getParameter("branch_id");
					session.setAttribute("EDIT_BRANCH_ID",id);
					session.setAttribute("BRANCH_UPD_REQ","Y");
					jRES.put("STATUS_CD","0");
					jRES.put("ACTION", "E");
					jRES.put("BRANCH_CD", id);
					
				}else if("DELETE".equalsIgnoreCase(action_id))
				{
					String emp_id = request.getParameter("branch_id");
					jout.put("DELETE_FLAG", GetMenu.GetSubDetailsMenuDelete(jmenu,"HRMS","COMP_PROF","BRANCH_MST") );
					jout.put("BRANCH_CD",emp_id);
					try {
						result=APICall.CallAPI("DELETEBRANCH",jout.toString());	
						jRES=new JSONObject(result);
					} catch (Exception e) {
						System.out.println("Delete Branch : "+result);
						result=ApplicationConfig.ErrorResponse.replace("$ERROR_MSG$","Error Calling");
					}
					jRES=new JSONObject(result);
					if(!jRES.has("BRANCH_CD"))
					{
						jRES.put("BRANCH_CD",emp_id);
					}
					jRES.put("ACTION",action_id);
				}else if("NEW".equalsIgnoreCase(action_id) || "UPDATE".equalsIgnoreCase(action_id))
				{
					if("NEW".equalsIgnoreCase(action_id) )
						jout.put("CREATE_FLAG", GetMenu.GetSubDetailsMenuCreate(jmenu,"HRMS","COMP_PROF","BRANCH_MST") );
					else
						jout.put("UPDATE_FLAG", GetMenu.GetSubDetailsMenuUpdate(jmenu,"HRMS","COMP_PROF","BRANCH_MST") );
					JSONObject jEMP=new JSONObject();
					jEMP.put("COMP_CD",comp_cd);
					jEMP.put("BRANCH_CD",ApplicationConfig.nvl(request.getParameter("branchId")));
					jEMP.put("BRANCH_NM", ApplicationConfig.nvl(request.getParameter("branchName")));
					jEMP.put("BRANCH_OPENING_DT", ApplicationConfig.nvl(request.getParameter("openingDate")));//
					jEMP.put("BRANCH_MANAGER", ApplicationConfig.nvl(request.getParameter("branchManagerName")));
					jEMP.put("ADDRESS_1", ApplicationConfig.nvl(request.getParameter("ADD_1")));
					jEMP.put("ADDRESS_2", ApplicationConfig.nvl(request.getParameter("ADD_2")));
					jEMP.put("ADDRESS_3", ApplicationConfig.nvl(request.getParameter("ADD_3")));
					jEMP.put("CONTRAY_CD", ApplicationConfig.nvl(request.getParameter("inputCountry")));
					jEMP.put("STATE_CD", ApplicationConfig.nvl(request.getParameter("inputState")));
					jEMP.put("CITY_CD", ApplicationConfig.nvl(request.getParameter("inputCity")));
					jEMP.put("PIN_CODE", ApplicationConfig.nvl(request.getParameter("inputPincode")));
					jEMP.put("ACTIVE_STATUS", ApplicationConfig.nvl(request.getParameter("inputStatus")));
					jEMP.put("INACTIVE_DT", ApplicationConfig.nvl(request.getParameter("inceptionDate")));
					jEMP.put("INCEPTION_DT", ApplicationConfig.nvl(request.getParameter("inceptionDate")));
					jEMP.put("INACTIVE_DATE", ApplicationConfig.nvl(request.getParameter("inputInactiveDt")));
					jEMP.put("LANDLINE_NO", ApplicationConfig.nvl(request.getParameter("banchContact")));
					jEMP.put("CONTACT_PERSON", ApplicationConfig.nvl(request.getParameter("contactperson")));
					jEMP.put("BRANCH_CONTACT", ApplicationConfig.nvl(request.getParameter("banchContact")));
					jEMP.put("BRANCH_EMAIL", ApplicationConfig.nvl(request.getParameter("branchEmail")));
					
					////
					jEMP.put("ENTERED_BY", username);
					jEMP.put("LAST_ENTERED_BY", username);
					jEMP.put("LAST_MODIFIED_BY", username);
					jEMP.put("ENTERED_DATE", ApplicationConfig.getTodayDate());
					jEMP.put("LAST_MODIFIED_DT", ApplicationConfig.getTodayDate());
					jEMP.put("LAST_ENTERED_DATE", ApplicationConfig.getTodayDate());
					jEMP.put("ENTERED_IP", request.getRemoteAddr());
					jEMP.put("LAST_MODOFIED_IP", request.getRemoteAddr());
					jEMP.put("LAST_ENTERED_IP", request.getRemoteAddr());
					
					
					jout.put("REQUEST_DATA", jEMP);
					if("UPDATE".equalsIgnoreCase(action_id)) {
						jout.put("BRANCH_CD", ApplicationConfig.nvl(request.getParameter("branchId")));
						result=APICall.CallAPI("UPDATEBRANCH",jout.toString());
					}else {
						result=APICall.CallAPI("CREATEBRANCH",jout.toString());	
					}

					jRES=new JSONObject(result);
					jRES.put("ACTION",action_id);
				}
				
				
				System.out.println("Branch Master("+action_id+") Request :"+jout.toString()+" Response : "+jRES.toString());
				response.getWriter().println(jRES.toString());
			}
		}
		catch(Exception e) {
			response.sendError(500,"Page Calling Error : "+e.getMessage());
		}
	}
	public String GetTimeWithSecound(String ls_time) {
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
