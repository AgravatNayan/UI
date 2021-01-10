package baseCRM;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
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
 * Servlet implementation class best
 */
@WebServlet("/page")
public class PageCall extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PageCall() {
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
	//	doGet(request, response);
		try { 		
				HttpSession session = null;
				String username="";
				String result="";
				String comp_cd="";
				boolean lb_continue=true;
				JSONObject jmenu=null;
				 try {
					 session = request.getSession();
				     session.setMaxInactiveInterval(ApplicationConfig.GetMaxInactiveInterval());
				     if (session.getAttribute("logon").toString() != "true") {
				            session.invalidate();
				            response.getWriter().println(ApplicationConfig.SessionExpireJs);
				            lb_continue = false;
				        }	
				     username = session.getAttribute("USER_ID").toString();
				     comp_cd =  session.getAttribute("COMP_CD").toString();
				     jmenu =(JSONObject) request.getSession().getAttribute("MENU");				     
				} catch (Exception e) {
					System.out.println("Session Check Error "+e);
					response.getWriter().println(ApplicationConfig.SessionExpireJs);
					lb_continue = false;
				}
				 JSONObject jOut=new JSONObject();
				 jOut.put("USERNAME",username);
				 jOut.put("COMP_CD",comp_cd);
				 jOut.put("REQUEST_IP",ApplicationConfig.getClientIpAddr(request));
				if(lb_continue) {
					String page_id=request.getParameter("page_id");
					if(page_id.equalsIgnoreCase("EMP_MST"))
					{
						//session.setAttribute("EMP_UPD_REQ","N");
						RequestDispatcher rs = request.getRequestDispatcher("EMP_MST.jsp");
						rs.forward(request, response);
					}else if(page_id.equalsIgnoreCase("EMP_UPD"))
					{
						RequestDispatcher rs = request.getRequestDispatcher("EMP_REG.jsp");
						rs.forward(request, response);
					}else if(page_id.equalsIgnoreCase("EMP_LIST"))
					{
						jOut.put("VIEW_FLAG", GetMenu.GetDetailsMenuView(jmenu, "HRMS", "EMP_MANGE") );
						System.out.println("Request : "+jOut.toString());
						if("N".equalsIgnoreCase(ApplicationConfig.ApiConnect))
							result="{\"STATUS_CD\":\"0\",\"RESPONSE\":[{\"EMP_ID\":\"1\",\"NAME\":\"Maulik\",\"MOBILE_NO\":\"8905456165\",\"BIRTH_DT\":\"15/02/2020\",\"GENDER\":\"Male\",\"DESIGNATION\":\"Developer\",\"STATUS\":\"Y\",\"PHOTO_PATH\":\"\"},{\"EMP_ID\":\"2\",\"NAME\":\"Maulik Patel\",\"MOBILE_NO\":\"8905456165\",\"BIRTH_DT\":\"15/02/2020\",\"GENDER\":\"Male\",\"DESIGNATION\":\"Support\",\"STATUS\":\"N\",\"PHOTO_PATH\":\"\"}]}";
						else
							result=APICall.CallAPI("GETEMPLOYEELIST",jOut.toString());
						System.out.println(result);
						session.setAttribute("EMPLOYEE_LIST",result);
						RequestDispatcher rs = request.getRequestDispatcher("EMP_LIST.jsp");
						rs.forward(request, response);
					}
					else if(page_id.equalsIgnoreCase("CONTRA_TYPE_MST"))
					{
						RequestDispatcher rs = request.getRequestDispatcher("CONTRA_TYPE_MST.jsp");
						rs.forward(request, response);
					}
					else if(page_id.equalsIgnoreCase("CONTRA_TYPE_LIST"))
					{
						jOut.put("VIEW_FLAG", GetMenu.GetSubDetailsMenuView(jmenu,"HRMS","HR_MANGE","CONTRA_TYPE_MST") );
						System.out.println("Request : "+jOut.toString());
						
						result=APICall.CallAPI("GETCONTRACTLIST",jOut.toString());
						
						System.out.println(result);
						
						session.setAttribute("CONTRA_TYPE_LIST",result);
						
						RequestDispatcher rs = request.getRequestDispatcher("CONTRA_TYPE_LIST.jsp");
						rs.forward(request, response);
					}
					else if(page_id.equalsIgnoreCase("INSU_MST"))
					{
						RequestDispatcher rs = request.getRequestDispatcher("INSU_MST.jsp");
						rs.forward(request, response);
					}
					else if(page_id.equalsIgnoreCase("INSU_LIST"))
					{
						jOut.put("VIEW_FLAG", GetMenu.GetSubDetailsMenuView(jmenu,"HRMS","HR_MANGE","INSU_MST") );
						System.out.println("Request : "+jOut.toString());
						
						result=APICall.CallAPI("GETINSULIST",jOut.toString());
						
						System.out.println(result);
						
						session.setAttribute("INSU_LIST",result);
						
						RequestDispatcher rs = request.getRequestDispatcher("INSU_LIST.jsp");
						rs.forward(request, response);
					}///INSU_LIST
					else if(page_id.equalsIgnoreCase("DEPARTMENT_MST"))
					{
						RequestDispatcher rs = request.getRequestDispatcher("DEPARTMENT_MST.jsp");
						rs.forward(request, response);
					}
					else if(page_id.equalsIgnoreCase("DEPARTMENT_LIST"))
					{
						jOut.put("VIEW_FLAG", GetMenu.GetSubDetailsMenuView(jmenu,"HRMS","HR_MANGE","DEPRT_MST") );
						System.out.println("Request : "+jOut.toString());
						
						result=APICall.CallAPI("GETDEPARTLIST",jOut.toString());
						
						System.out.println(result);
						request.setAttribute("DEPARTMENT_LIST",result);
					
						RequestDispatcher rs = request.getRequestDispatcher("DEPARTMENT_LIST.jsp");
						rs.forward(request, response);
					}
					else if(page_id.equalsIgnoreCase("DESIGNATION_MST"))
					{
						RequestDispatcher rs = request.getRequestDispatcher("DESIGNATION_MST.jsp");
						rs.forward(request, response);
					}
					else if(page_id.equalsIgnoreCase("DESIGNATION_LIST"))
					{
						jOut.put("VIEW_FLAG", GetMenu.GetSubDetailsMenuView(jmenu,"HRMS","HR_MANGE","DESDIG_MST") );
						System.out.println("Request : "+jOut.toString());
						
						result=APICall.CallAPI("GETDESIGLIST",jOut.toString());
						
						System.out.println(result);
						request.setAttribute("DESIGNATION_LIST",result);
					
						RequestDispatcher rs = request.getRequestDispatcher("DESIGNATION_LIST.jsp");
						rs.forward(request, response);
					}
					else if(page_id.equalsIgnoreCase("GRADE_MST"))
					{
						RequestDispatcher rs = request.getRequestDispatcher("GRADE_MST.jsp");
						rs.forward(request, response);
					}
					else if(page_id.equalsIgnoreCase("GRADE_LIST"))
					{
						jOut.put("VIEW_FLAG", GetMenu.GetSubDetailsMenuView(jmenu,"HRMS","HR_MANGE","GRADE_MST") );
						System.out.println("Request : "+jOut.toString());
						
						result=APICall.CallAPI("GETGRADELISTS",jOut.toString());
						
						System.out.println(result);
						request.setAttribute("GRADE_LIST",result);
						
						RequestDispatcher rs = request.getRequestDispatcher("GRADE_LIST.jsp");
						rs.forward(request, response);
					}
					else if(page_id.equalsIgnoreCase("SHIFT_LIST"))
					{ 
						jOut.put("VIEW_FLAG", GetMenu.GetSubDetailsMenuView(jmenu,"HRMS","HR_MANGE","SHIFT_MST") );
						System.out.println("Request : "+jOut.toString());
						
						result=APICall.CallAPI("GETSHIFTLIST",jOut.toString());
						
						System.out.println(result);
						request.setAttribute("SHIFT_LIST",result);
						//session.setAttribute("SHIFT_LIST",result);
						
						RequestDispatcher rs = request.getRequestDispatcher("SHIFT_LIST.jsp");
						rs.forward(request, response);
					}
					else if(page_id.equalsIgnoreCase("SHIFT_MST"))
					{
						RequestDispatcher rs = request.getRequestDispatcher("SHIFT_MST.jsp");
						rs.forward(request, response);
					}
					else if(page_id.equalsIgnoreCase("USER_LIST"))
					{
						jOut.put("VIEW_FLAG", GetMenu.GetMainMenuView(jmenu,"USER_MANGE") );
						System.out.println("Request : "+jOut.toString());
						
						result=APICall.CallAPI("GETUSERLIST",jOut.toString());
						
						System.out.println(result);
						
						session.setAttribute("USER_LIST",result);
						
						RequestDispatcher rs = request.getRequestDispatcher("USER_LIST.jsp");
						rs.forward(request, response);
					}
					else if(page_id.equalsIgnoreCase("USER_CREATION"))
					{
						RequestDispatcher rs = request.getRequestDispatcher("USER_CREATION.jsp");
						rs.forward(request, response);
					}
					else if(page_id.equalsIgnoreCase("BRANCH_MST"))
					{
						RequestDispatcher rs = request.getRequestDispatcher("BRANCH_MST.jsp");
						rs.forward(request, response);
					}
					else if(page_id.equalsIgnoreCase("BRANCH_LIST"))
					{
						jOut.put("VIEW_FLAG", GetMenu.GetSubDetailsMenuView(jmenu,"HRMS","COMP_PROF","BRANCH_MST") );
						System.out.println("Request : "+jOut.toString());
						
						result=APICall.CallAPI("GETBRANCHLIST",jOut.toString());
						
						System.out.println(result);
						request.setAttribute("BRANCH_LIST",result);
						
						RequestDispatcher rs = request.getRequestDispatcher("BRANCH_LIST.jsp");
						rs.forward(request, response);
					}
					else if(page_id.equalsIgnoreCase("COMP_MST"))
					{
						RequestDispatcher rs = request.getRequestDispatcher("COMP_MST.jsp");
						rs.forward(request, response);
					}//MainDashboard
					else if(page_id.equalsIgnoreCase("MainDashboard"))
					{
						RequestDispatcher rs = request.getRequestDispatcher("MainDashboard.jsp");
						rs.forward(request, response);
					}//MainDashboard
					else if(page_id.equalsIgnoreCase("page"))
					{
						response.getWriter().print("Testing Success.");
					}else {
						response.getWriter().print(ApplicationConfig.AuthFailed );
					}
				}
		}	
		
		catch(Exception e) {
			response.sendError(500,"Page Calling Error : "+e.getMessage());
		}
		//response.getWriter().print("Hello");
}

}
