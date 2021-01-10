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
@WebServlet("/department_master")
public class department_mst extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public department_mst() {
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
					String id = request.getParameter("department_id");
					session.setAttribute("EDIT_DEPARTMENT_ID",id);
					session.setAttribute("DEPARTMENT_UPD_REQ","Y");
					jRES.put("STATUS_CD","0");
					jRES.put("ACTION", "E");
					jRES.put("DEPARTMENT_ID", id);
					
				}else if("DELETE".equalsIgnoreCase(action_id))
				{
					String id = request.getParameter("department_id");
					jout.put("DELETE_FLAG", GetMenu.GetSubDetailsMenuDelete(jmenu,"HRMS","HR_MANGE","DEPRT_MST") );
					jout.put("DEPART_ID",id);
					try {
						result=APICall.CallAPI("DELETEDEPART",jout.toString());	
						jRES=new JSONObject(result);
					} catch (Exception e) {
						System.out.println("Delete Department : "+result);
						result=ApplicationConfig.ErrorResponse.replace("$ERROR_MSG$","Error Calling");
					}
					jRES=new JSONObject(result);
					if(!jRES.has("DEPARTMENT_ID"))
					{
						jRES.put("DEPARTMENT_ID",id);
					}
					jRES.put("ACTION",action_id);
				}else if("NEW".equalsIgnoreCase(action_id) || "UPDATE".equalsIgnoreCase(action_id))
				{
					if("NEW".equalsIgnoreCase(action_id) )
						jout.put("CREATE_FLAG", GetMenu.GetSubDetailsMenuCreate(jmenu,"HRMS","HR_MANGE","DEPRT_MST") );
					else
						jout.put("UPDATE_FLAG", GetMenu.GetSubDetailsMenuUpdate(jmenu,"HRMS","HR_MANGE","DEPRT_MST") );
					JSONObject jEMP=new JSONObject();
					jEMP.put("COMP_CD",comp_cd);
					jEMP.put("DEPART_ID",ApplicationConfig.nvl(request.getParameter("departmentId")));
					jEMP.put("NAME", ApplicationConfig.nvl(request.getParameter("departmentName")));//
					jEMP.put("DEPT_INACTIVE_DT", ApplicationConfig.nvl(request.getParameter("inputInactiveDt")));
					jEMP.put("ACTIVE_STATUS", ApplicationConfig.nvl(request.getParameter("inputStatus")));
					////
					jEMP.put("ENTERED_BY", username);
					jEMP.put("LAST_MODIFIED_BY", username);
					jEMP.put("ENTERED_DATE", ApplicationConfig.getTodayDate());
					jEMP.put("LAST_MODIFIED_DT", ApplicationConfig.getTodayDate());
					jEMP.put("ENTERED_IP", request.getRemoteAddr());
					jEMP.put("LAST_MODOFIED_IP", request.getRemoteAddr());
					
					jout.put("REQUEST_DATA", jEMP);
					if("UPDATE".equalsIgnoreCase(action_id)) {
						jout.put("DEPART_ID", ApplicationConfig.nvl(request.getParameter("departmentId")));
						result=APICall.CallAPI("UPDATEDEPART",jout.toString());
					}else {
						result=APICall.CallAPI("CREATEDEPART",jout.toString());	
					}

					jRES=new JSONObject(result);
					jRES.put("ACTION",action_id);
				}
				
				
				System.out.println("Department Master("+action_id+") Request :"+jout.toString()+" Response : "+jRES.toString());
				response.getWriter().println(jRES.toString());
			}
		}
		catch(Exception e) {
			response.sendError(500,"Page Calling Error : "+e.getMessage());
		}
	}
}
