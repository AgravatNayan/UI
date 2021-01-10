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

/**
 * Servlet implementation class getDataList
 */
@WebServlet("/getdatalist")
public class getDataList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getDataList() {
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
			String comp_cd = "";
			String activity_cd = "";
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
			     activity_cd =  session.getAttribute("ACTIVITY_CD").toString();
			} catch (Exception e) {
				System.out.println("Session Check Error "+e);
				response.getWriter().println(ApplicationConfig.SessionExpire);
				lb_continue = false;
				
			}
			if(lb_continue) {
			
					JSONObject jinput=new JSONObject();
					jinput.put("USERNAME",username);
					jinput.put("COMP_CD",comp_cd);
					String ipAddress = ApplicationConfig.getClientIpAddr(request);
					jinput.put("REQUEST_IP",ipAddress);
					jinput.put("ACTIVITY_CD",activity_cd);
					
					String Action_ID=request.getParameter("action");
					String action_data = request.getParameter("action_data");
					
					if(Action_ID.equalsIgnoreCase("GetReligion"))
					{
						result=APICall.CallAPI("GETRELIGIONLIST",jinput.toString());
					}
					else if(Action_ID.equalsIgnoreCase("GetDepartment")) 
					{
						result=APICall.CallAPI("GETDEPARTMENTLIST",jinput.toString());
					}
					else if(Action_ID.equalsIgnoreCase("GetDesignation")) 
					{
						jinput.put("DEPART_ID",action_data);
						result=APICall.CallAPI("GETDESIGNATIONLIST",jinput.toString());
					}
					else if(Action_ID.equalsIgnoreCase("GETEMPID")) 
					{
						result=APICall.CallAPI("GETMAXEMPID",jinput.toString());
					}
					else if(Action_ID.equalsIgnoreCase("GETEMPDTL") || Action_ID.equalsIgnoreCase("GETEMPDTLEDIT")) 
					{
						String emp_id="";
						if(Action_ID.equalsIgnoreCase("GETEMPDTLEDIT")) {
							emp_id=session.getAttribute("EDIT_EMP_ID").toString();
						}
						else {
							emp_id=request.getParameter("emp_id");
						}
							
						try {
							int eid=Integer.parseInt(emp_id);
							jinput.put("EMP_ID",emp_id);
							jinput.put("VIEW_FLAG","G");//Default Set G Because Check All Employee Registered
							result=APICall.CallAPI("GETEMPLOYEEDTL",jinput.toString());
						}catch (Exception e) {
							result="{\"STATUS_CD\":\"99\",\"MESSAGE\":\"invalid Employee ID\" \"RESPONSE\":[{\"EMP_ID\":\"\"}]}";
						}
					}
					else if(Action_ID.equalsIgnoreCase("GetCountry")) 
					{
						   result=APICall.CallAPI("GETCOUNTRYLIST",jinput.toString());
					}
					else if(Action_ID.equalsIgnoreCase("GetState")) 
					{
						   jinput.put("COUNTRY_ID",action_data);
						   result=APICall.CallAPI("GETSTATELIST",jinput.toString());
					}
					else if(Action_ID.equalsIgnoreCase("GetCity")) 
					{
						   jinput.put("STATE_ID",action_data);
						   result=APICall.CallAPI("GETCITYLIST",jinput.toString());
					}
					else if(Action_ID.equalsIgnoreCase("GetWorkingBranch")) 
					{
						   result=APICall.CallAPI("GETBRANCHLIST",jinput.toString());
					}
					else if(Action_ID.equalsIgnoreCase("GetGrade")) 
					{
						   result=APICall.CallAPI("GETGRADELIST",jinput.toString());
					}
					else if(Action_ID.equalsIgnoreCase("GETMAXGRADE")) 
					{
						   result=APICall.CallAPI("GETMAXGRADE",jinput.toString());
					}//
					else if(Action_ID.equalsIgnoreCase("GetGradeId") || Action_ID.equalsIgnoreCase("GetGradeIdDtl")) 
					{
						   String id="";
						   if(Action_ID.equalsIgnoreCase("GetGradeIdDtl")) {
							   id=session.getAttribute("EDIT_GRADE_ID").toString();
						   }else {
							   id=request.getParameter("grade_id"); 
						   }
						   jinput.put("VIEW_FLAG","G");
						   jinput.put("GRADE_ID",id);
						   result=APICall.CallAPI("GETGRADEID",jinput.toString());
					}//
					else if(Action_ID.equalsIgnoreCase("GetMaxDepartmentid")) 
					{
						   result=APICall.CallAPI("GETMAXDEPART",jinput.toString());
					}//
					else if(Action_ID.equalsIgnoreCase("getDepartmentID") || Action_ID.equalsIgnoreCase("getDepartmentIDDtl")) 
					{
						   String id="";
						   if(Action_ID.equalsIgnoreCase("getDepartmentIDDtl")) {
							   id=session.getAttribute("EDIT_DEPARTMENT_ID").toString();
						   }else {
							   id=request.getParameter("department_id"); 
						   }
						   jinput.put("VIEW_FLAG","G");
						   jinput.put("DEPART_ID",id);
						   result=APICall.CallAPI("GETDEPARTID",jinput.toString());
					}//
					else if(Action_ID.equalsIgnoreCase("GetContraType")) 
					{
						   jinput.put("VIEW_FLAG","G");
						   result=APICall.CallAPI("GETCONTRACTLIST",jinput.toString());
					}////
					else if(Action_ID.equalsIgnoreCase("GETCONTRACTTYPEID") || Action_ID.equalsIgnoreCase("GETCONTRACTTYPEIDDTL")) //
					{
						   String contract_id="";
						   if(Action_ID.equalsIgnoreCase("GETCONTRACTTYPEIDDTL"))
						   {
							   contract_id=session.getAttribute("EDIT_CONTRA_TYPE_ID").toString();
						   }else {
							   contract_id=request.getParameter("contract_id");
						   }
							   
						   jinput.put("CONTRACT_ID",contract_id);
						   jinput.put("VIEW_FLAG","G");
						   result=APICall.CallAPI("GETCONTRACTID",jinput.toString());
					}
					else if(Action_ID.equalsIgnoreCase("GETCONTACTMAXID")) 
					{
						   result=APICall.CallAPI("GETMAXCONTRATCID",jinput.toString());
					}//
					else if(Action_ID.equalsIgnoreCase("GetInsuList")) 
					{
						   jinput.put("VIEW_FLAG","G");
						   result=APICall.CallAPI("GETINSULIST",jinput.toString());
					}
					else if(Action_ID.equalsIgnoreCase("GETINSUMAXID")) 
					{
						   jinput.put("VIEW_FLAG","G");
						   result=APICall.CallAPI("GETMAXINSUID",jinput.toString());
					}
					else if(Action_ID.equalsIgnoreCase("GetIsuranceId") || Action_ID.equalsIgnoreCase("GetIsuranceIdDtl")) 
					{
						   String insurance_id="";
						   if( Action_ID.equalsIgnoreCase("GetIsuranceIdDtl"))
							   insurance_id=session.getAttribute("EDIT_INSU_ID").toString();
						   else
							   insurance_id=request.getParameter("insurance_id");
						   jinput.put("INSURANCE_ID",insurance_id);
						   jinput.put("VIEW_FLAG","G");
						   result=APICall.CallAPI("GETINSUID",jinput.toString());
					}//GetIsuranceId
					else if(Action_ID.equalsIgnoreCase("GetSwiftList")) 
					{
						   jinput.put("BRANCH_CD",action_data);
						   result=APICall.CallAPI("GETSHIFTCONFIG",jinput.toString());
					}
					else if(Action_ID.equalsIgnoreCase("GETMAXSHIFTID")) 
					{
						   jinput.put("VIEW_FLAG","G");
						   result=APICall.CallAPI("GETMAXSHIFTID",jinput.toString());
					}
					else if(Action_ID.equalsIgnoreCase("GetShiftId")||Action_ID.equalsIgnoreCase("GetShiftIdDtl")) 
					{
						String ls_shift_id="";
						   if(Action_ID.equalsIgnoreCase("GetShiftIdDtl"))
							   ls_shift_id = session.getAttribute("EDIT_SHIFT_ID").toString();
						   else
							   ls_shift_id = request.getParameter("shift_id");
						   jinput.put("SHIFT_ID",ls_shift_id);
						   jinput.put("VIEW_FLAG","G");
						   result=APICall.CallAPI("GETSHIFTID",jinput.toString());
					}//GetShiftId
					else if(Action_ID.equalsIgnoreCase("GETUSERDTL") || Action_ID.equalsIgnoreCase("GETUSERDTLEDIT") ) 
					{
						String user_id="";
						if(Action_ID.equalsIgnoreCase("GETUSERDTLEDIT")) {
							user_id=session.getAttribute("EDIT_USER_ID").toString();
							jinput.put("USER_ID",user_id);
						}
						else {
							jinput.put("USER_ID",action_data);
						}
						   
						   jinput.put("VIEW_FLAG","G");
						   result=APICall.CallAPI("GETUSERID",jinput.toString());
					}//GET_P_MISC_MST
					else if(Action_ID.equalsIgnoreCase("GETMAXDESIG")) 
					{
						   jinput.put("VIEW_FLAG","G");
						   result=APICall.CallAPI("GETMAXDESIG",jinput.toString());
					}
					else if(Action_ID.equalsIgnoreCase("GetDesignationId") || Action_ID.equalsIgnoreCase("GetDesignationIdDtl")) 
					{
						String id="";
							if(Action_ID.equalsIgnoreCase("GetDesignationIdDtl")) {
								id=session.getAttribute("EDIT_DESIGNATION_ID").toString();
							}else {
							   id = request.getParameter("desig_id");
							}
						   jinput.put("DESIG_ID",id);
						   jinput.put("VIEW_FLAG","G");
						   result=APICall.CallAPI("GETDESIGID",jinput.toString());
					}//GetMaxBranchID
					else if(Action_ID.equalsIgnoreCase("GetMaxBranchID")) 
					{
						   jinput.put("VIEW_FLAG","G");
						   result=APICall.CallAPI("GETMAXBRANCHID",jinput.toString());
					}
					else if(Action_ID.equalsIgnoreCase("getBranchID") || Action_ID.equalsIgnoreCase("getBranchIDDtl")) 
					{
						String id="";
							if(Action_ID.equalsIgnoreCase("getBranchIDDtl")) {
								id=session.getAttribute("EDIT_BRANCH_ID").toString();
							}else {
							   id = request.getParameter("branch_id");
							}
						   jinput.put("BRANCH_CD",id);
						   jinput.put("VIEW_FLAG","G");
						   result=APICall.CallAPI("GETBRANCHID",jinput.toString());
					}
					else if(Action_ID.equalsIgnoreCase("GET_P_MISC_MST")) 
					{
						   String actiion_value=request.getParameter("action_value");
						   jinput.put("CATEGORY_CD",actiion_value);
						   result=APICall.CallAPI("GET_P_MISC_MST",jinput.toString());
					}
					else if(Action_ID.equalsIgnoreCase("LOGOUT")) 
					{
						   jinput.put("LOGIN_TYPE","O");
						   jinput.put("USER_ID",username);
						   //jinput.put("LOG_IN_OUT_DT",ApplicationConfig.getTodayDate());
						   result=APICall.CallAPI("LOGOUTUSER",jinput.toString());
						   session.invalidate();
					}
					else if(Action_ID.equalsIgnoreCase("TESTING")) 
					{
						String tt="";
						tt=request.getParameter("action_value");
						System.out.println("Action Value => "+tt);
						result = "TESTING";
					}
					else 
					{
						result=ApplicationConfig.AuthFailed;
					}
					
					System.out.println("Request "+Action_ID+" : "+jinput.toString());
					System.out.println("Response  "+Action_ID+" : "+result);
					response.getWriter().print(result);
			}	
		}
		catch(Exception e) {
			response.sendError(500,"Page Calling Error : "+e.getMessage());
		}

	}

}
