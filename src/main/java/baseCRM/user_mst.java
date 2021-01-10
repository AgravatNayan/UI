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
 * Servlet implementation class user_mst
 */
@WebServlet("/user_master")
public class user_mst extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public user_mst() {
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
				jout.put("REQUEST_IP",ApplicationConfig.getClientIpAddr(request) );
				if("EDIT".equalsIgnoreCase(action_id))
				{
					String emp_id = request.getParameter("user_id");
					session.setAttribute("EDIT_USER_ID",emp_id);
					session.setAttribute("USER_UPD_REQ","Y");
					jRES.put("STATUS_CD","0");
					jRES.put("ACTION", "E");
					jRES.put("USER_ID", emp_id);
					
				}else if("DELETE".equalsIgnoreCase(action_id))
				{
					String user_id = request.getParameter("user_id");
					jout.put("DELETE_FLAG", GetMenu.GetMainMenuDelete(jmenu, "USER_MANGE") );
					jout.put("USER_ID",user_id);
					try {
						result=APICall.CallAPI("DELETEUSER",jout.toString());	
						jRES=new JSONObject(result);
					} catch (Exception e) {
						System.out.println("Delete User : "+result);
						result=ApplicationConfig.ErrorResponse.replace("$ERROR_MSG$","Error Calling");
					}
					jRES=new JSONObject(result);
					if(!jRES.has("USER_ID"))
					{
						jRES.put("USER_ID",user_id);
					}
					jRES.put("ACTION",action_id);
				}else if("NEW".equalsIgnoreCase(action_id) || "UPDATE".equalsIgnoreCase(action_id))
				{
					if("NEW".equalsIgnoreCase(action_id) )
						jout.put("CREATE_FLAG", GetMenu.GetMainMenuCreate(jmenu, "USER_MANGE") );
					else
						jout.put("UPDATE_FLAG", GetMenu.GetMainMenuUpdate(jmenu, "USER_MANGE") );
					JSONObject jEMP=new JSONObject();
					jEMP.put("COMP_CD",comp_cd);
					jEMP.put("USER_ID", ApplicationConfig.nvl(request.getParameter("inputUserId")));
					jEMP.put("USER_LEVEL_CD", ApplicationConfig.nvl(request.getParameter("inputUserType")));
					jEMP.put("REF_ID", ApplicationConfig.nvl(request.getParameter("inputEmpId")));
					jEMP.put("CONTACT1", ApplicationConfig.nvl(request.getParameter("inputContact")));
					jEMP.put("EMAIL", ApplicationConfig.nvl(request.getParameter("inputEmailID")));
					jEMP.put("ACTIVE_STATUS", ApplicationConfig.nvl(request.getParameter("inputActiveStatus")));
					jEMP.put("BLOCK_STATUS", ApplicationConfig.nvl(request.getParameter("inputBlockStatus")));
					jEMP.put("INACTIVE_DATE", ApplicationConfig.nvl(request.getParameter("inputInactiveDate")));
					jEMP.put("BLOCKED_DATE", ApplicationConfig.nvl(request.getParameter("inputBlockDate")));
					//inputPasschange
					jEMP.put("FAILED_CNT","0");
					jEMP.put("USER_SIGNATURE",ApplicationConfig.nvl(request.getParameter("inputSignatureBase64")));
					jEMP.put("USER_PHOTO",ApplicationConfig.nvl(request.getParameter("inputPhotoBase64")));
					jEMP.put("PASSWORD_CHANGE_FLAG", ApplicationConfig.nvl(request.getParameter("inputPasschange")));
					jEMP.put("USER_PWD",ApplicationConfig.nvl(request.getParameter("inputPassword")));
					jEMP.put("TEMP_PWD",ApplicationConfig.nvl(request.getParameter("inputPassword")));
					jEMP.put("FAV_QUE_CD","");
					
					jEMP.put("ENTERED_BY", username);
					jEMP.put("LAST_MODIFIED_BY", username);
					jEMP.put("ENTERED_DATE", ApplicationConfig.getTodayDate());
					jEMP.put("LAST_MODIFIED_DATE", ApplicationConfig.getTodayDate());
					jEMP.put("ENTERED_IP_ADD", request.getRemoteAddr());
					jEMP.put("LAST_MODIFIED_IP_ADD", request.getRemoteAddr());
					
					
					jout.put("REQUEST_DATA", jEMP);
					if("UPDATE".equalsIgnoreCase(action_id)) {
						jout.put("USER_ID", ApplicationConfig.nvl(request.getParameter("inputUserId")));
						result=APICall.CallAPI("UPDATEUSER",jout.toString());
					}else {
						result=APICall.CallAPI("CREATEUSER",jout.toString());	
					}
					jRES=new JSONObject(result);
					jRES.put("ACTION",action_id);
				}
				System.out.println("User Master("+action_id+") Request :"+jout.toString()+" Response : "+jRES.toString());
				response.getWriter().println(jRES.toString());
			}
		}catch(Exception e) {
			response.sendError(500,"Page Calling Error : "+e.getMessage());
		}
	}

}
