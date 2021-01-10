package baseCRM;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import Utility.APICall;
import Utility.ApplicationConfig;
import Utility.GetMenu;

/**
 * Servlet implementation class emp_mst
 */
@WebServlet("/emp_master")
public class emp_mst extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public emp_mst() {
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
					String emp_id = request.getParameter("emp_id");
					session.setAttribute("EDIT_EMP_ID",emp_id);
					session.setAttribute("EMP_UPD_REQ","Y");
					jRES.put("STATUS_CD","0");
					jRES.put("ACTION", "E");
					jRES.put("EMP_ID", emp_id);
					
				}else if("DELETE".equalsIgnoreCase(action_id))
				{
					String emp_id = request.getParameter("emp_id");
					jout.put("DELETE_FLAG", GetMenu.GetDetailsMenuDelete(jmenu, "HRMS", "EMP_MANGE") );
					jout.put("EMP_ID",emp_id);
					try {
						result=APICall.CallAPI("DELETEEMP",jout.toString());	
						jRES=new JSONObject(result);
					} catch (Exception e) {
						System.out.println("Delete Employee : "+result);
						result=ApplicationConfig.ErrorResponse.replace("$ERROR_MSG$","Error Calling");
					}
					jRES=new JSONObject(result);
					if(!jRES.has("EMP_ID"))
					{
						jRES.put("EMP_ID",emp_id);
					}
					jRES.put("ACTION",action_id);
				}else if("NEW".equalsIgnoreCase(action_id) || "UPDATE".equalsIgnoreCase(action_id))
				{
					if("NEW".equalsIgnoreCase(action_id) )
						jout.put("CREATE_FLAG", GetMenu.GetDetailsMenuCreate(jmenu, "HRMS", "EMP_MANGE") );
					else
						jout.put("UPDATE_FLAG", GetMenu.GetDetailsMenuUpdate(jmenu, "HRMS", "EMP_MANGE") );
					JSONObject jEMP=new JSONObject();
					jEMP.put("COMP_CD",comp_cd);
					jEMP.put("BRANCH_CD",ApplicationConfig.nvl(request.getParameter("inputBranch")));
					jEMP.put("EMP_ID", ApplicationConfig.nvl(request.getParameter("inputEmpid")));
					jEMP.put("ENTRY_DT", ApplicationConfig.nvl(request.getParameter("inputentrydt")));//
					jEMP.put("ACTIVE_STATUS", ApplicationConfig.nvl(request.getParameter("inputActiveStatus")));
					jEMP.put("INACTIVE_DT", ApplicationConfig.nvl(request.getParameter("inactivedt")));
					jEMP.put("FIRST_NM", ApplicationConfig.nvl(request.getParameter("firstname")));
					jEMP.put("MIDDEL_NM", ApplicationConfig.nvl(request.getParameter("middelname")));
					jEMP.put("LAST_NM", ApplicationConfig.nvl(request.getParameter("lastname")));
					jEMP.put("PROFILE_IMG", "");
					jEMP.put("EMAIL_ID", ApplicationConfig.nvl(request.getParameter("email")));
					jEMP.put("BIRTH_DT", ApplicationConfig.nvl(request.getParameter("birthdt")));
					jEMP.put("RELIGION_CD", ApplicationConfig.nvl(request.getParameter("inputReligion")));
					jEMP.put("GENDER", ApplicationConfig.nvl(request.getParameter("inputGender")));
					jEMP.put("BLOOD_GROUP", ApplicationConfig.nvl(request.getParameter("inputBloodgroup")));
					jEMP.put("BLOOD_GRP", ApplicationConfig.nvl(request.getParameter("inputBloodgroup")));
					jEMP.put("MARRITAL_STATUS", ApplicationConfig.nvl(request.getParameter("inputMaritalStatus")));
					jEMP.put("HIGHEST_EDU", ApplicationConfig.nvl(request.getParameter("inputEducation")));
					jEMP.put("UNIQUE_ID", ApplicationConfig.nvl(request.getParameter("inputAadhar")));
					jEMP.put("PAN_NO", ApplicationConfig.nvl(request.getParameter("inputPancard")));
					jEMP.put("REF_EMP_ID", ApplicationConfig.nvl(request.getParameter("inputRefEmpid")));
					jEMP.put("REF_REMARKS", ApplicationConfig.nvl(request.getParameter("inputRefRemarks")));
					jEMP.put("REMARKS", ApplicationConfig.nvl(request.getParameter("inputempRemarks")));
					jEMP.put("PRIMARY_CONTACT", ApplicationConfig.nvl(request.getParameter("inputPrimaryContact")));
					jEMP.put("SECONDARY_CONTACT", ApplicationConfig.nvl(request.getParameter("inputSecondaryContact")));
					jEMP.put("RESUME", ApplicationConfig.nvl(request.getParameter("inputResumeBase64")));
					jEMP.put("CONFIRMATION_DT", ApplicationConfig.nvl(request.getParameter("inputConfirmDate")));
					jEMP.put("JOINIG_DT", ApplicationConfig.nvl(request.getParameter("inputJoinDate")));
					jEMP.put("ACTIVE", ApplicationConfig.nvl(request.getParameter("inputActive")));
					jEMP.put("RETIREMENT_DT", ApplicationConfig.nvl(request.getParameter("inputRetirementdate")));
					jEMP.put("LEAVING_DT", ApplicationConfig.nvl(request.getParameter("inputLeavingDate")));
					jEMP.put("GRADE_CD", ApplicationConfig.nvl(request.getParameter("inputGrade")));
					jEMP.put("DEPARTMENT_ID", ApplicationConfig.nvl(request.getParameter("inputDepartment")));
					jEMP.put("DESIGNATION_ID", ApplicationConfig.nvl(request.getParameter("inputDesignation")));
					jEMP.put("SALARY_AMOUNT", ApplicationConfig.nvl(request.getParameter("inputSalaryAmount")));
					jEMP.put("LEAVING_REASON", ApplicationConfig.nvl(request.getParameter("inputReasonRemarks")));
					jEMP.put("COMP_REMARKS", ApplicationConfig.nvl(request.getParameter("inputRemarks")));
					jEMP.put("CONTRACT_APPLICABLE", ApplicationConfig.nvl(request.getParameter("inputContract")));
					jEMP.put("CONTRACT_TYPE", ApplicationConfig.nvl(request.getParameter("inputContactType")));
					jEMP.put("CONTRACT_SIGNED_DATE", ApplicationConfig.nvl(request.getParameter("inputContactSignDate")));
					jEMP.put("PER_ADD_LINE_1", ApplicationConfig.nvl(request.getParameter("inputPerAddress1")));
					jEMP.put("PER_ADD_LINE_2", ApplicationConfig.nvl(request.getParameter("inputPerAddress2")));
					jEMP.put("PER_ADD_LINE_3", ApplicationConfig.nvl(request.getParameter("inputPerAddress3")));
					jEMP.put("PER_COUNTRY_CD", ApplicationConfig.nvl(request.getParameter("inputPerCountry")));
					jEMP.put("PER_STATE_CD", ApplicationConfig.nvl(request.getParameter("inputPerState")));
					jEMP.put("PER_CITY_CD", ApplicationConfig.nvl(request.getParameter("inputPerCity")));
					jEMP.put("PER_PIN_CODE", ApplicationConfig.nvl(request.getParameter("inputPerPincode")));
					jEMP.put("TEMP_ADD_LINE_1", ApplicationConfig.nvl(request.getParameter("inputTempAddress1")));
					jEMP.put("TEMP_ADD_LINE_2", ApplicationConfig.nvl(request.getParameter("inputTempAddress2")));
					jEMP.put("TEMP_ADD_LINE_3", ApplicationConfig.nvl(request.getParameter("inputTempAddress3")));
					jEMP.put("TEMP_ADD_LIINE_1", ApplicationConfig.nvl(request.getParameter("inputTempAddress1")));
					jEMP.put("TEMP_ADD_LIINE_2", ApplicationConfig.nvl(request.getParameter("inputTempAddress2")));
					jEMP.put("TEMP_ADD_LIINE_3", ApplicationConfig.nvl(request.getParameter("inputTempAddress3")));
					jEMP.put("TEMP_COUNTRY_CD", ApplicationConfig.nvl(request.getParameter("inputTempCountry")));
					jEMP.put("TEMP_STATE_CD", ApplicationConfig.nvl(request.getParameter("inputTempState")));
					jEMP.put("TEMP_CITY_CD", ApplicationConfig.nvl(request.getParameter("inputTempCity")));
					jEMP.put("TEMP_PIN_CODE", ApplicationConfig.nvl(request.getParameter("inputTempPincode")));
					jEMP.put("SHIFT_ID", ApplicationConfig.nvl(request.getParameter("inputSwift")));
					//SHIFT_ID
					String InsuranceDtlList=request.getParameter("InsuranceDtlList");
					
					jEMP.put("INSURANCELISTDELETE", GetInsuranceList(InsuranceDtlList,"D"));
					jEMP.put("INSURANCELISTUPDATE", GetInsuranceList(InsuranceDtlList,"U"));
					jEMP.put("INSURANCELISTINSERT", GetInsuranceList(InsuranceDtlList,"I"));
					
					jEMP.put("ENTERED_BY", username);
					jEMP.put("LAST_MODIFIED_BY", username);
					jEMP.put("ENTERED_DATE", ApplicationConfig.getTodayDate());
					jEMP.put("LAST_MODIFIED_DT", ApplicationConfig.getTodayDate());
					jEMP.put("ENTERED_IP", request.getRemoteAddr());
					jEMP.put("LAST_MODOFIED_IP", request.getRemoteAddr());
					
					jout.put("REQUEST_DATA", jEMP);
					if("UPDATE".equalsIgnoreCase(action_id)) {
						jout.put("EMP_ID", ApplicationConfig.nvl(request.getParameter("inputEmpid")));
						result=APICall.CallAPI("UPDATEEMPLOYEEID",jout.toString());
					}else {
						result=APICall.CallAPI("CREATEEMPLOYEE",jout.toString());	
					}

					jRES=new JSONObject(result);
					jRES.put("ACTION",action_id);
				}else if("UPDATE".equalsIgnoreCase(action_id))
				{
					jRES.put("STATUS_CD","99");
					jRES.put("MESSAGE",ApplicationConfig.ErrorMsg);
				}
				
//				jout.put("COMP_CD", "001");
//				jout.put("BRANCH_CD", request.getParameter("inputBranch"));
//				jout.put("EMP_ID",request.getParameter("inputEmpid"));
//				jout.put("STATUS_CD", "0");
				
				
				System.out.println("Employee Master("+action_id+") Request :"+jout.toString()+" Response : "+jRES.toString());
				response.getWriter().println(jRES.toString());
			}
		}
		catch(Exception e) {
			response.sendError(500,"Page Calling Error : "+e.getMessage());
		}
	}
	
	public JSONArray GetInsuranceList(String insurance,String ls_flag) throws Exception{
		JSONArray jInsurance = new JSONArray();
		JSONArray jIn = new JSONArray(insurance);
		for(int i=0;i<jIn.length() ; i++) {
			JSONObject jinput=jIn.getJSONObject(i);
			String ls_delete = jinput.getString("deleteflag");
			if(("D".equalsIgnoreCase(ls_flag) && "D".equalsIgnoreCase(ls_delete)) || 
			   ("I".equalsIgnoreCase(ls_flag) && "I".equalsIgnoreCase(ls_delete)) ||
			   ("U".equalsIgnoreCase(ls_flag) && "U".equalsIgnoreCase(ls_delete)) ) {
				JSONObject jInsu = new JSONObject();
				JSONObject jdata = new JSONObject();
				jdata.put("SRCD",ApplicationConfig.nvl(jinput.getString("srcd")));
				jdata.put("INSU_CD",ApplicationConfig.nvl(jinput.getString("srcd")));
				jInsu.put("SRCD",ApplicationConfig.nvl(jinput.getString("srcd")));
				jInsu.put("INSU_CD",ApplicationConfig.nvl(jinput.getString("srcd")));
				jInsu.put("INSURANCETHROUGH",ApplicationConfig.nvl(jinput.getString("insuraneThrough")));
				jInsu.put("INSURANCETYPE",ApplicationConfig.nvl(jinput.getString("insuraneType")));
				jInsu.put("INSURANCEAGENCY",ApplicationConfig.nvl(jinput.getString("insuraneAgency")));
				jInsu.put("INSURANCEREGNO",ApplicationConfig.nvl(jinput.getString("inputInsuRegno")));
				jInsu.put("INSURANCESTARTDATE",ApplicationConfig.nvl(jinput.getString("inputStartDate")));
				jInsu.put("INSURANCEENDDATE",ApplicationConfig.nvl(jinput.getString("inputEndDate")));
				jInsu.put("INSURANCEAMOUNT",ApplicationConfig.nvl(jinput.getString("InputInsuranceAmt")));
				jInsu.put("INSURANESTATUS",ApplicationConfig.nvl(jinput.getString("InputinsuraneStatus")));
				jInsu.put("INSURANCEINACTIVEDT",ApplicationConfig.nvl(jinput.getString("inputinactiveDate")));
				if("U".equalsIgnoreCase(ls_flag))
				{
					jdata.put("DATA", jInsu);
					jInsurance.put(jdata);
				}
				else
				{
					jInsurance.put(jInsu);
				}
			}
		}
		return jInsurance;
	}

}
