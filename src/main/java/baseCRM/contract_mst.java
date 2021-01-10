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
@WebServlet("/contract_master")
public class contract_mst extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public contract_mst() {
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
					String emp_id = request.getParameter("contra_id");
					session.setAttribute("EDIT_CONTRA_TYPE_ID",emp_id);
					session.setAttribute("CONTRA_TYPE_UPD_REQ","Y");
					jRES.put("STATUS_CD","0");
					jRES.put("ACTION", "E");
					jRES.put("CONTRA_ID", emp_id);
					
				}else if("DELETE".equalsIgnoreCase(action_id))
				{
					String emp_id = request.getParameter("contra_id");
					jout.put("DELETE_FLAG", GetMenu.GetSubDetailsMenuDelete(jmenu,"HRMS","HR_MANGE","CONTRA_TYPE_MST") );
					jout.put("CONTRACT_ID",emp_id);
					try {
						result=APICall.CallAPI("DELETECONTRACTID",jout.toString());	
						jRES=new JSONObject(result);
					} catch (Exception e) {
						System.out.println("Delete Contract Type : "+result);
						result=ApplicationConfig.ErrorResponse.replace("$ERROR_MSG$","Error Calling");
					}
					jRES=new JSONObject(result);
					if(!jRES.has("CONTRA_ID"))
					{
						jRES.put("CONTRA_ID",emp_id);
					}
					jRES.put("ACTION",action_id);
				}else if("NEW".equalsIgnoreCase(action_id) || "UPDATE".equalsIgnoreCase(action_id))
				{
					if("NEW".equalsIgnoreCase(action_id) )
						jout.put("CREATE_FLAG", GetMenu.GetSubDetailsMenuCreate(jmenu,"HRMS","HR_MANGE","CONTRA_TYPE_MST") );
					else
						jout.put("UPDATE_FLAG", GetMenu.GetSubDetailsMenuUpdate(jmenu,"HRMS","HR_MANGE","CONTRA_TYPE_MST") );
					JSONObject jEMP=new JSONObject();
					jEMP.put("COMP_CD",comp_cd);
					jEMP.put("CONTRACT_ID",ApplicationConfig.nvl(request.getParameter("inputContraTypeId")));
					jEMP.put("CONTRACT_NM", ApplicationConfig.nvl(request.getParameter("inputContractName")));
					jEMP.put("CON_START_DT", ApplicationConfig.nvl(request.getParameter("inputStartDt")));//
					jEMP.put("CON_END_DT", ApplicationConfig.nvl(request.getParameter("inputEndDt")));
					jEMP.put("SALARY_TEMP_CD", ApplicationConfig.nvl(request.getParameter("inputSalaryTemp")));
					jEMP.put("CONTRACT_STATUS", ApplicationConfig.nvl(request.getParameter("inputContractStatus")));
					jEMP.put("CONTRACT_INACTIVE_DT", ApplicationConfig.nvl(request.getParameter("inputInactiveDt")));
					////
					jEMP.put("ENTERED_BY", username);
					jEMP.put("LAST_MODIFIED_BY", username);
					jEMP.put("ENTERED_DATE", ApplicationConfig.getTodayDate());
					jEMP.put("LAST_MODIFIED_DT", ApplicationConfig.getTodayDate());
					jEMP.put("ENTERED_IP", request.getRemoteAddr());
					jEMP.put("LAST_MODOFIED_IP", request.getRemoteAddr());
					
					jout.put("REQUEST_DATA", jEMP);
					if("UPDATE".equalsIgnoreCase(action_id)) {
						jout.put("CONTRACT_ID", ApplicationConfig.nvl(request.getParameter("inputContraTypeId")));
						result=APICall.CallAPI("UPDATECONTRACT",jout.toString());
					}else {
						result=APICall.CallAPI("CREATECONTRACT",jout.toString());	
					}

					jRES=new JSONObject(result);
					jRES.put("ACTION",action_id);
				}
				
				
				System.out.println("Contranct Master("+action_id+") Request :"+jout.toString()+" Response : "+jRES.toString());
				response.getWriter().println(jRES.toString());
			}
		}
		catch(Exception e) {
			response.sendError(500,"Page Calling Error : "+e.getMessage());
		}
	}

}
