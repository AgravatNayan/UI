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
@WebServlet("/insu_master")
public class insu_mst extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insu_mst() {
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
				String Request_id=ApplicationConfig.getClientIpAddr(request);
				JSONObject jRES=new JSONObject();
				JSONObject jout=new JSONObject();
				jout.put("USERNAME",username);
				jout.put("COMP_CD",comp_cd);
				jout.put("REQUEST_IP",Request_id);
				if("EDIT".equalsIgnoreCase(action_id))
				{
					String emp_id = request.getParameter("insu_id");
					session.setAttribute("EDIT_INSU_ID",emp_id);
					session.setAttribute("INSU_UPD_REQ","Y");
					jRES.put("STATUS_CD","0");
					jRES.put("ACTION", "E");
					jRES.put("INSU_ID", emp_id);
					
				}else if("DELETE".equalsIgnoreCase(action_id))
				{
					String emp_id = request.getParameter("insu_id");
					jout.put("DELETE_FLAG", GetMenu.GetSubDetailsMenuDelete(jmenu,"HRMS","HR_MANGE","INSU_MST") );
					jout.put("INSU_ID",emp_id);
					try {
						result=APICall.CallAPI("DELETEINSU",jout.toString());	
						jRES=new JSONObject(result);
					} catch (Exception e) {
						System.out.println("Delete Insurance : "+result);
						result=ApplicationConfig.ErrorResponse.replace("$ERROR_MSG$","Error Calling");
					}
					jRES=new JSONObject(result);
					if(!jRES.has("INSU_ID"))
					{
						jRES.put("INSU_ID",emp_id);
					}
					jRES.put("ACTION",action_id);
				}else if("NEW".equalsIgnoreCase(action_id) || "UPDATE".equalsIgnoreCase(action_id))
				{
					if("NEW".equalsIgnoreCase(action_id) )
						jout.put("CREATE_FLAG", GetMenu.GetSubDetailsMenuCreate(jmenu,"HRMS","HR_MANGE","INSU_MST") );
					else
						jout.put("UPDATE_FLAG", GetMenu.GetSubDetailsMenuUpdate(jmenu,"HRMS","HR_MANGE","INSU_MST") );
					JSONObject jEMP=new JSONObject();
					jEMP.put("COMP_CD",comp_cd);
					jEMP.put("INSU_ID",ApplicationConfig.nvl(request.getParameter("InsuranceId")));
					jout.put("INSURANCE_ID", ApplicationConfig.nvl(request.getParameter("InsuranceId")));
					jEMP.put("INSU_NAME", ApplicationConfig.nvl(request.getParameter("InsuranceName")));
					jEMP.put("INSU_TYPE", ApplicationConfig.nvl(request.getParameter("InsuranceType")));//
					jEMP.put("INSU_CUST_NO", ApplicationConfig.nvl(request.getParameter("InsuranceCustNo")));
					jEMP.put("INSU_PREMIUM", ApplicationConfig.nvl(request.getParameter("InsurancePre")));
					jEMP.put("INSU_STATUS", ApplicationConfig.nvl(request.getParameter("inputInsuranceStatus")));
					jEMP.put("INSU_INACTIVE_DT", ApplicationConfig.nvl(request.getParameter("inputInactiveDt")));
					jEMP.put("INSU_START_DT", ApplicationConfig.nvl(request.getParameter("inputStartDt")));
					jEMP.put("INSU_END_DT", ApplicationConfig.nvl(request.getParameter("inputEnddate")));
					jEMP.put("INSU_AGENCY", ApplicationConfig.nvl(request.getParameter("InsuranceAgency")));
					jEMP.put("INSU_AGENCY_ID", ApplicationConfig.nvl(request.getParameter("InsuranceAgencyId")));
					jEMP.put("INSU_DOC_POLICY", ApplicationConfig.nvl(request.getParameter("inputPolicyBase64")));
					////
					jEMP.put("ENTERED_BY", username);
					jEMP.put("LAST_MODIFIED_BY", username);
					jEMP.put("ENTERED_DATE", ApplicationConfig.getTodayDate());
					jEMP.put("LAST_MODIFIED_DT", ApplicationConfig.getTodayDate());
					jEMP.put("ENTERED_IP", Request_id);
					jEMP.put("LAST_MODOFIED_IP", Request_id);
					
					jout.put("REQUEST_DATA", jEMP);
					if("UPDATE".equalsIgnoreCase(action_id)) {
						jout.put("INSU_ID", ApplicationConfig.nvl(request.getParameter("InsuranceId")));
						jout.put("INSURANCE_ID", ApplicationConfig.nvl(request.getParameter("InsuranceId")));
						result=APICall.CallAPI("UPDATEINSU",jout.toString());
					}else {
						result=APICall.CallAPI("CREATEINSU",jout.toString());	
					}

					jRES=new JSONObject(result);
					jRES.put("ACTION",action_id);
				}
				
				
				System.out.println("Insurance Master("+action_id+") Request :"+jout.toString()+" Response : "+jRES.toString());
				response.getWriter().println(jRES.toString());
			}
		}
		catch(Exception e) {
			response.sendError(500,"Page Calling Error : "+e.getMessage());
		}
	}

}
