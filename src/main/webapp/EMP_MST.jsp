<%@page import="Utility.*"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%
JSONArray jempArray=new JSONArray();
JSONObject jemp_mst=new JSONObject();
boolean lb_new = true;
String ls_hidden="NEW";
 try {
     GetSession.setServletRequest(request);
     GetSession.sessionValidation(response);
     try{
    	 String ls_edit=request.getSession().getAttribute("EMP_UPD_REQ").toString();
    	 if("Y".equalsIgnoreCase(ls_edit)){
    		 lb_new=false;
    		 session.setAttribute("EMP_UPD_REQ","N");
    		 ls_hidden="UPDATE";
    	 }else{lb_new=true;}
     }
     catch(Exception e){lb_new=true;}
     
    // jemp_mst =(JSONObject) request.getSession().getAttribute("MENU");
 } catch (Exception e) {
     response.getWriter().println("<script>window.location.href='"+ApplicationConfig.LoginPage+"';</script>");
 }
 %>
<!-- Page Container START -->
<div id="loaderEmp"></div>
<div class="page-container" style="padding-left: 0px;">
   <!-- Content Wrapper START -->
   <div class="main-content">
      <div class="page-header">
         <h2 class="header-title">HRMS</h2>
         <div class="header-sub-title">
            <nav class="breadcrumb breadcrumb-dash">
               <a href="#" class="breadcrumb-item"><i class="anticon anticon-home m-r-5"></i>Home</a>
               <a class="breadcrumb-item" href="#">HRMS</a>
               <a class="breadcrumb-item" href="#">Emp. Management</a>
               <span class="breadcrumb-item active">Employee</span>
            </nav>
         </div>
      </div>
      <div class="card">
         <div class="card-body">
            <h4>Employee Management</h4>
            <p>Enter your Employee details and company related details adde in companny details table and rights assing tab using assign rights.</p>
            <div class="m-t-25">
               <ul class="nav nav-tabs nav-justified" id="myTabJustified" role="tablist">
                  <li class="nav-item">
                     <a class="nav-link active" id="home-tab-justified" data-toggle="tab" href="#General-justified" role="tab" aria-controls="General-justified" aria-selected="true"><b><h4>General Information</h4></b></a>
                  </li>
                  <li class="nav-item">
                     <a class="nav-link" id="profile-tab-justified" data-toggle="tab" href="#Company-justified" role="tab" aria-controls="Company-justified" aria-selected="false"><b><h4>Address Information</h4></b></a>
                  </li>
                  <li class="nav-item">
                     <a class="nav-link" id="contact-tab-justified" data-toggle="tab" href="#Application-dtl" role="tab" aria-controls="Application-dtl" aria-selected="false"><b><h4>Company Details</h4></b></a>
                  </li> 
                  <li class="nav-item">
                     <a class="nav-link" id="Insurancr-tab-justified" data-toggle="tab" href="#Insurance-dtl" role="tab" aria-controls="Insurance-dtl" aria-selected="false"><b><h4>Insurance Details</h4></b></a>
                  </li>                  
                 <!--  <li class="nav-item">
                     <a class="nav-link" id="contact-tab-justified" data-toggle="tab" href="#Application-justified" role="tab" aria-controls="Application-justified" aria-selected="false">Application Rights Detail</a>
                  </li> -->
               </ul>
               <div class="tab-content m-t-15" id="myTabContentJustified">               	  
                  <div class="tab-pane fade show active" id="General-justified" name="General-justified" role="tabpanel" aria-labelledby="home-tab-justified">
                     <p>
                     <form action="#" method="post" name="emp_registartion" id="emp_registartion" onsubmit="return false;">
                          <input type="hidden" id="action_id" name="action_id" value="<%=ls_hidden%>">
                          <div class="row">
                           <div class="col">
                              <b><label for="inputEmpid">Employee Id</label></b>
                              <input type="text" class="form-control" name="inputEmpid" id="inputEmpid" placeholder="Employee Id" maxLength="15" onkeypress="javascript:return isNumeric(event);">
                              <div class="icon-container">
								  <i id="inputEmpid_ldr"></i>
							  </div>
                              <label id="inputEmpid-error" class="error" for="inputEmpid"></label>
                            </div>
                           <div class="col">
                              <b><label for="inputentrydt">Entry Date</label></b>
                              <input type="date" class="form-control" placeholder="Entry Date" id="inputentrydt" name="inputentrydt" readonly="readonly">
                           </div>
                           <div class="col">
                              <b><label for="inputActiveStatus">Active Status</label></b>
                              <select id="inputActiveStatus" name="inputActiveStatus" class="form-control" onchange="of_set_value(this)">
                                 <option value='Y' selected>Active</option>
                                 <option value='N'>Inactive</option>
                              </select>
                           </div>  
                        </div>
                        </br>
                        <div class="row">
                           <div class="col">
                              <b><label for="firstname">First Name</label></b>
                              <input type="text" class="form-control" placeholder="First name" id="firstname" name="firstname" maxLength="40" onkeypress="javascript:return isAlphaNumeric(event);">
                           </div>
                           <div class="col">
                              <b><label for="middelname">Middel Name</label></b>
                              <input type="text" class="form-control" placeholder="Middel name" id="middelname" name="middelname" maxLength="40" onkeypress="javascript:return isAlphaNumeric(event);">
                           </div>
                           <div class="col">
                              <b><label for="lastname">Last Name</label></b>
                              <input type="text" class="form-control" placeholder="Last name" id="lastname" name="lastname" maxLength="40" onkeypress="javascript:return isAlphaNumeric(event);">
                           </div>
                        </div>
                        </br>
                        <div class="row">
                           <div class="form-group col-md-6">
                              <b><label for="email">Email Address</label></b>     
                              <input type="email" class="form-control" placeholder="Email" id="email" name="email" maxLength="100">
                           </div>
                           <div class="col">
                              <b><label for="birthdt">Birth Date</label></b>
                              <input type="date" class="form-control" placeholder="Birth Date" id="birthdt" name="birthdt">
                           </div>
                           <div class="col">
                              <div id="inactivedtdiv">
                              <b><label for="inactivedt">Inactive Date</label></b>
                              <input type="date" class="form-control" placeholder="Inactive Date" id="inactivedt" name="inactivedt" readonly="readonly">
                              </div>
                           </div>
                        </div>
                        </br>
                        <div class="row">
                           <div class="col">
                              <b><label for="inputReligion">Religion</label></b>
                              <select id="inputReligion" name="inputReligion" class="form-control">
                                 <option value='' selected>Please select Religion...</option>
                              </select>
                           </div>
                           <div class="col">
                              <b><label for="inputGender">Gender</label></b>
                              <select id="inputGender" name="inputGender" class="form-control">
                                 <option value='' selected>Please select gender...</option>
                                 <option value="M">Male</option>
                                 <option value="F">Female</option>
                                 <option value="O">Other</option>
                              </select>
                           </div>
                           <div class="col">
                              <b><label for="inputBloodgroup">Blood Group</label></b>
                              <select id="inputBloodgroup" name="inputBloodgroup" class="form-control">
                                 <option value='' selected>Please Select Blood group...</option>
                                 <option value="AP">A Positive</option>
							     <option value="BP">B Positive</option>
							     <option value="ABP">AB Positive</option>
							     <option value="OP">O Positive</option>
							     <option value="AN">A Negative</option>
							     <option value="BN">B Negative</option>
							     <option value="ABN">AB Negative</option>
							     <option value="ON">O Negative</option>
							     <option value="AU">A Unknown</option>
							     <option value="BU">B Unknown</option>
							     <option value="ABU">AB Unknown</option>
							     <option value="OU">O Unknown</option>
							     <option value="U">Unknown</option>
                              </select>
                           </div>
                           <div class="col">
                              <b><label for="inputMaritalStatus">Marital Status</label></b>
                              <select id="inputMaritalStatus" name="inputMaritalStatus" class="form-control">
                                 <option value='' selected>Please Select Marital Status...</option>
                                 <option value="M">Married</option>
                                 <option value="U">Unmarried</option>
                              </select>
                           </div>
                        </div>
                        </br>
                        <div class="row">
                           <div class="col">
                              <b><label for="inputEducation">Highest Eduction</label></b>
                              <input type="text" class="form-control" name="inputEducation" id="inputEducation" placeholder="Highest Eduction" maxLength="100">
                           </div>
                        </div>                       
                        </br>
                        <div class="row">                           
                           <div class="col">
                              <b><label for="inputAadhar">Aadhar Card</label></b>
                              <input type="text" class="form-control" name="inputAadhar" id="inputAadhar" placeholder="Aadhar Card" maxLength="12" onkeypress="javascript:return isNumeric(event);">
                           </div>
                           <div class="col">
                              <b><label for="inputPancard">Pan Card</label></b>
                              <input type="text" class="form-control" name="inputPancard" id="inputPancard" placeholder="Pan Card" maxLength="10" onkeypress="javascript:return isAlphaNumeric(event);">
                              <label id="inputPancard-error" class="error" for="inputPancard"></label>
                           </div>
                        </div>
                        </br>
                        <div class="row">                           
                            <div class="col">
                              <b><label for="inputRefEmpid">Ref. Employee Id</label></b>
                              <input type="text" class="form-control" name="inputRefEmpid" id="inputRefEmpid" placeholder="Ref. Employee Id" maxLength="15" onkeypress="javascript:return isNumeric(event);">
                           </div>
                           <div class="col">
                              <b><label for="inputRefRemarks">Ref. Remarks</label></b>
                              <input type="text" class="form-control" name="inputRefRemarks" id="inputRefRemarks" placeholder="Ref. Remarks" maxLength="100" onkeypress="javascript:return isAlphaNumeric(event);">
                           </div>                                                    
                        </div>                        
                        </br>
                        <div class="row">
                          <div class="col">
                              <b><label for="inputempRemarks">Remarks</label></b>
                              <input type="text" class="form-control" name="inputempRemarks" id="inputempRemarks" placeholder="Remarks" maxLength="100" onkeypress="javascript:return isAlphaNumeric(event);">
                           </div> 
                        </div>
                        </br>
                        <div class="row">
                           <div class="col">
                              <b><label for="inputPrimaryContact">Primary Contact No.</label></b>
                              <input type="text" class="form-control" name="inputPrimaryContact" id="inputPrimaryContact" placeholder="Primary Contact No." maxLength="10" onkeypress="javascript:return isNumeric(event);">
                           </div>
                           <div class="col">
                              <b><label for="inputSecondaryContact">Secondary Contact No.</label></b>
                              <input type="text" class="form-control" name="inputSecondaryContact" id="inputSecondaryContact" placeholder="Secondary Contact No." maxLength="10" onkeypress="javascript:return isNumeric(event);">
                           </div>
                        </div>                        
                        </br>
                        <div class="row">
                           <div class="custom-file">
                              <b><input type="file" onchange="readFile(this,'inputResumeBase64')" class="custom-file-input" id="inputResume" accept=".pdf,.doc"></b>
                              <label class="custom-file-label" for="inputResume">Resume</label>
                              <input type="hidden" name="inputResumeBase64" id="inputResumeBase64" >
                           </div>
                        </div>
                            </br>
                            <input type="reset" id="reset_emp_1" style="Display : none">
					 </form>
                     </p>
                  </div>
                  <div class="tab-pane fade" id="Company-justified" role="tabpanel" aria-labelledby="profile-tab-justified">
                     <p>
                     	<form action="#" method="post" name="emp_registartion2" id="emp_registartion2" onsubmit="return false;">
                     	<h2><label for="inputAddress">Permanent Address</label></h2>
						 <div class="row">
                           <div class="col">
                              <b><label for="inputPerAddress1">Address Line 1</label></b>
                              <input type="text" class="form-control" name="inputPerAddress1" id="inputPerAddress1" placeholder="Address Line 1" maxLength="100">
                           </div>
                        </div>
                        </br>
                        <div class="row">
                           <div class="col">
                              <b><label for="inputPerAddress2">Address Line 2</label></b>
                              <input type="text" class="form-control" placeholder="Address Line 2" maxLength="100" id="inputPerAddress2" name="inputPerAddress2">
                           </div>
                        </div>
                        </br>
                        <div class="row">
                           <div class="col">
                              <b><label for="inputPerAddress3">Address Line 3</label></b>
                              <input type="text" class="form-control" placeholder="Address Line 3" maxLength="100" id="inputPerAddress3" name="inputPerAddress3">
                           </div>
                        </div>
                        </br>
                        <div class="row">
                           <div class="col">
                              <b><label for="inputPerCountry">Country</label></b>
                              <select id="inputPerCountry" name="inputPerCountry" class="form-control">
                                 <option value='' selected>Please select country...</option>
                              </select>
                           </div>
                           <div class="col">
                              <b><label for="inputPerState">State</label></b>
                              <select id="inputPerState" name="inputPerState" class="form-control">
                                 <option value='' selected>Please select state...</option>
                              </select>
                           </div>                           
                        </div>
                        </br>
                        <div class="row">
                        	<div class="col">
                              <b><label for="inputPerCity">City</label></b>
                              <select id="inputPerCity" name="inputPerCity" class="form-control">
                                 <option value='' selected>Please select city...</option>
                              </select>
                           </div>
                           <div class="col">
                              <b><label for="inputPerPincode">Pin code</label></b>
                              <input type="text" class="form-control" name="inputPerPincode" id="inputPerPincode" placeholder="Pin code" maxLength="6" onkeypress="javascript:return isNumeric(event);">
                            </div>
                          </div>
                          </br></br>
                         <h2><label for="inputTempAddress">Temporary Address</label></h2>
                         <div class="row">
                         	<div class="col">
                           			<label>Permanent Address Same As Temporary Address &nbsp;</label>
                           				<div class="switch m-r-10">
                              				<input type="checkbox" id="inputSameAddress" name="inputSameAddress" onchange="SameAddress(this)" >
                              				<label for="inputSameAddress"></label>
                           				</div>
                           		</div>  
                         </div>
						 <div class="row">
                           <div class="col">
                              <b><label for="inputTempAddress1">Address Line 1</label></b>
                              <input type="text" class="form-control" name="inputTempAddress1" id="inputTempAddress1" placeholder="Address Line 1" maxLength="100" onchange="copyAddress()">
                           </div>
                        </div>
                        </br>
                        <div class="row">
                           <div class="col">
                              <b><label for="inputTempAddress2">Address Line 2</label></b>
                              <input type="text" class="form-control" name="inputTempAddress2" id="inputTempAddress2" placeholder="Address Line 2" maxLength="100" onchange="copyAddress()">
                           </div>
                        </div>
                        </br>
                        <div class="row">
                           <div class="col">
                              <b><label for="inputTempAddress3">Address Line 3</label></b>
                              <input type="text" class="form-control" name="inputTempAddress3" id="inputTempAddress3" placeholder="Address Line 3" maxLength="100" onchange="copyAddress()">
                           </div>
                        </div>
                        </br>
                        <div class="row">
                           <div class="col">
                              <b><label for="inputTempCountry">Country</label></b>
                              <select id="inputTempCountry" name="inputTempCountry" class="form-control">
                                 <option value='' selected>Please select Country...</option>
                              </select>
                           </div>
                           <div class="col">
                              <b><label for="inputTempState">State</label></b>
                              <select id="inputTempState" name="inputTempState" class="form-control">
                                 <option value='' selected>Please select state...</option>
                              </select>
                           </div>                           
                        </div>
                        </br>
                        <div class="row">
                        	<div class="col">
                              <b><label for="inputTempCity">City</label></b>
                              <select id="inputTempCity" name="inputTempCity" class="form-control" onchange="copyAddress()">
                                 <option value='' selected>Please Select City...</option>
                              </select>
                           </div>
                           <div class="col">
                              <b><label for="inputTempPincode">Pin code</label></b>
                              <input type="text" class="form-control" name="inputTempPincode" id="inputTempPincode" placeholder="Pin code" maxLength="6" onkeypress="javascript:return isNumeric(event);" onchange="copyAddress()">
                           </div>
                          </div>
                          </br>
<!-- 						<button id="emp_reg_sub2" onClick="Emp_Registartion()" class="btn btn-primary">Submit</button>							                           -->
                         </form>
                     </p>
                  </div>
                    <div class="tab-pane fade" id="Application-dtl" name="Application-dtl" role="tabpanel" aria-labelledby="contact-tab-justified">
                  	<p>
                  		<form action="#" method="post" name="emp_registartion3" id="emp_registartion3" onsubmit="return false;">
                  			<div class="row">
                  				<div class="col">
  									<b><label for="inputConfirmDate">Confirmation Date</label></b>
  									<input type="date" class="form-control" name="inputConfirmDate" id="inputConfirmDate" placeholder="Confirmation Date">
								</div>
								<div class="col">
								  <b><label for="inputJoinDate">Joining Date</label></b>
								  <input type="date" class="form-control" name="inputJoinDate" id="inputJoinDate" placeholder="Joining Date">
								</div> 
								<div class="col">
								    <b><label for="inputRetirementdate">Status</label></b>
									<select id="inputActive" name="inputActive" class="form-control">
    									<option value="Y" selected>Active</option>
    									<option value="N">Deactivate</option>
    								</select>
								</div>
                  			</div>
                  			</br>
                  			<div class="row">
								<div class="col">
								  <b><label for="inputRetirementdate">Retirement Date</label></b>
								  <input type="date" class="form-control" id="inputRetirementdate" name="inputRetirementdate" placeholder="Retirement Date">
								</div>
								<div class="col">
								  <b><label for="inputLeavingDate">Leaving Date</label></b>
								  <input type="date" class="form-control" id="inputLeavingDate" name="inputLeavingDate" placeholder="Confirmation Date">
								</div>
								<div class="col">
								  <b><label for="inputGrade">Grade</label></b>
								  <select id="inputGrade" name="inputGrade" class="form-control">
									 <option value="" selected>Please select Grade</option>	 
								  </select>
								</div>  								                  		
                  			</div>
                  			</br>
							<div class="row">                       
								<div class="col">
										<b><label for="inputDepartment">Department</label></b>
										<select id="inputDepartment" name="inputDepartment" class="form-control">
											<option value='' selected>Please select Department...</option>
										</select>
								</div>
								<div class="col">
										<b><label for="inputDesignation">Designation</label></b>
										<select id="inputDesignation" name="inputDesignation" class="form-control">
											<option value='' selected>Please select Designation...</option>
										</select>
								</div>   
								<div class="col">
                              		<b><label for="inputSalaryAmount">Salary Amount</label></b>
                              		<input type="text" class="form-control" name="inputSalaryAmount" id="inputSalaryAmount" placeholder=" Salary Amount" maxlength="14" onkeypress="javascript:return isAmount(event);" oninput="limitDecimalPlaces(event, 2)">
                           		</div>
							</div>                    	
							</br>
							<div class="row">
								<div class="col">
								  <b><label for="inputBranch">Work Branch</label></b>
								  <select id="inputBranch" name="inputBranch" class="form-control">
									 <option value="" selected>Please select working branch..</option>	 
								  </select>
								</div>
								<div class="col">
								  <b><label for="inputSwift">Work Swift</label></b>
								  <select id="inputSwift" name="inputSwift" class="form-control">
									 <option value="" selected>Please select swift..</option>	 
								  </select>
								</div> 
							</div>
							</br>
							<div class="row">
								<div class="col">
                              		<b><label for="inputReasonRemarks">Leaving Reason</label></b>
                              		<input type="text" class="form-control" name="inputReasonRemarks" id="inputReasonRemarks" placeholder="Leaving Reason" maxLength="100" onkeypress="javascript:return isAlphaNumeric(event);">
                           		</div> 
							</div>
							</br>
							<div class="row">
								<div class="col">
                              		<b><label for="inputRemarks">Remarks</label></b>
                              		<input type="text" class="form-control" name="inputRemarks" id="inputRemarks" placeholder="Remarks" maxLength="100" onkeypress="javascript:return isAlphaNumeric(event);">
                           		</div> 
							</div>
							</br>
							<div class="row">
								<div class="col">
								  <b><label for="inputContract">Contract Applicable</label></b>
								  <select id="inputContract" name="inputContract" class="form-control">
									 <option value="" selected>Please select Contract Applicable..</option>
									 <option value="Y">Yes</option>
									 <option value="N">No</option>	 
								  </select>
								</div> 
								<div class="col" id="inputContactTypeDiv">
								  <b><label for="inputContactType">Contact Type</label></b>
								  <select id="inputContactType" name="inputContactType" class="form-control">
									 <option vaule="" selected>Please select Contact Type</option>	 
								  </select>
								</div> 
								<div class="col" id="inputContactSignDateDiv">
								  <b><label for="inputContactSignDate">Contact Signed Date</label></b>
								  <input type="date" class="form-control" placeholder="Contact Signed Date" id="inputContactSignDate" name="inputContactSignDate">
								</div>
							</div>
							</br>
<!-- 							<button class="btn btn-primary" id="emp_reg_sub3" onClick="Emp_Registartion()">submit</button> -->
                  		</form>
                  	</p>
                  </div>
                  <div class="tab-pane fade" id="Insurance-dtl" name="Insurance-dtl" role="tabpanel" aria-labelledby="contact-tab-justified">
                  	<p>
                  		<form action="#" method="post" name="emp_registartion4" id="emp_registartion4" onsubmit="return false;">
                  		  <p align="right"><button class="btn btn-primary" onclick="AddNewRow()">
									<i class="anticon anticon-plus"></i>
									<span class="m-l-5">New Row</span>
						  </button></p>
                  		 </form>
                  	</p>
                  </div>	
               </div>
            </div>
            
            
            
         </div>
         <br>
         <div class="card-footer" align="right"><button class="btn btn-white" id="user_mst_back_btn" onClick="onloadpage('EMP_LIST')">Back</button>&nbsp;&nbsp;<button class="btn btn-primary" id="emp_reg_sub" onClick="Emp_Registartion()">submit</button></div>
         <!--<button class="btn btn-primary" id="emp_reg_sub" onClick="Emp_Registartion()">Submit</button-->
      </div>
   </div>
</div>
</div>
<script>
var TotalRow=0;
var Srcd = 0;
var lb_focus = false;
var ls_emp_id=[];
<% 
	if(lb_new){
%>
ofGetListData("GetReligion","","inputReligion","");
ofGetListData("GetDepartment","","inputDepartment","");
ofGetListData("GetWorkingBranch","","inputBranch","");
ofGetListData("GetGrade","","inputGrade","");
ofGetListData("GetCountry","","inputPerCountry","");
ofGetListData("GetCountry","","inputTempCountry","");
ofGetListData("GetSwiftList","","inputSwift","");
of_set_value(document.getElementById("inputActiveStatus"));
var objConf=document.getElementById("inputJoinDate");
func_set_today_date(objConf);
objConf=document.getElementById("inputentrydt");
func_set_today_date(objConf);
$("#inputActiveStatus").attr("disabled",true);
$("#inputActive").attr("disable",true);
$("#inputContactSignDateDiv").attr("style","display :none");
$("#inputContactTypeDiv").attr("style","display :none");
CallAPI("getdatalist",{"action":"GETEMPID"},onSuccessGetEmpID,onErrorResponseGetEmpID);
$(document).keydown(function(e) { 
    if(e.ctrlKey && e.keyCode==71 && document.activeElement.id == "inputEmpid")
	{
      if($("#inputEmpid-error").text() == "" && $("#inputEmpid").val() != ""){return false;}
      $("#inputEmpid_ldr").addClass("inputloader");
      CallAPI("getdatalist",{"action":"GETEMPID"},onSuccessGetEmpID,onErrorResponseGetEmpID);
      $("#inputEmpid-error").text("");
      return false;
	}else if (document.activeElement.id == "inputEmpid" && lb_focus )
	{
		$("#inputEmpid-error").text("");
	}
});
$("#inputEmpid").focusin(function() {
	if(this.value=="")
	{
		$("#inputEmpid-error").text("Press CTRL+G for get new employee id.");
		lb_focus=true;
	}
	});	
$("#inputEmpid").focusout(function() {
	if(lb_focus)
	{
		if(this.value==""){
			$("#inputEmpid-error").text("This field is required.");	
		}else{
			$("#inputEmpid-error").text("");
		}
		lb_focus = false;
	}
});
$("#inputEmpid").change(function() {
	if(this.value != "")
	{
		$("#inputEmpid_ldr").addClass("inputloader");
		CallAPI("getdatalist",{"action":"GETEMPDTL","emp_id":this.value},onSuccessGetEmpDTL,onErrorResponseGetEmpID);
	}
});
AddNewRow();
<%
	}else{
%>
$("#inputEmpid").attr("readonly",true);
showLoaderPage(true);
showLoaderOwnPage(true,"loaderEmp");
CallAPI("getdatalist",{"action":"GETEMPDTLEDIT","emp_id":""},onSuccessGetEmployeeDetails,onErrorResponseGetEmpID);
function onSuccessGetEmployeeDetails(data, textStatus, jqXHR)
{   
	
	if (data != "") 
	{
         var res = JSON.parse(data);
         if (res.STATUS_CD == "999") {
        	    var MSG = res.MESSAGE;
         		console.log(MSG);
         		MessageBox("Error", MSG, 'red', 'fa fa-warning');
         }else if (res.STATUS_CD == "99") {
        	    var MSG = res.MESSAGE;
        	    console.log(MSG);
        	    MessageBox("Error", MSG, 'red', 'fa fa-warning');
         }else if (res.STATUS_CD == "9") { ///Session Expire
        	 MessageBox("Expire", res.MESSAGE, 'red', 'fa fa-warning');
        	 SessionExpire();
	     }else if (res.STATUS_CD == "1") { ///Session Expire
        	 MessageBox("No Found", res.MESSAGE, 'red', 'fa fa-warning');
        	 setTimeout(function(){ showLoaderPage(true); onloadpage('EMP_LIST'); }, 3000);
	     }
         else if (res.STATUS_CD == "0") {
        	 if(res.RESPONSE.length > 0)
        	   {
        		 showLoaderPage(true);
				 ofGetListData("GetReligion","","inputReligion",res.RESPONSE[0].RELIGION_CD);
        		 ofGetListData("GetDepartment","","inputDepartment",res.RESPONSE[0].DEPARTMENT_ID);
        		 ofGetListData("GetWorkingBranch","","inputBranch",res.RESPONSE[0].BRANCH_CD);
        		 ofGetListData("GetGrade","","inputGrade",res.RESPONSE[0].GRADE_CD);
        		 ofGetListData("GetCountry","","inputPerCountry",res.RESPONSE[0].PER_COUNTRY_CD);
        		 ofGetListData("GetCountry","","inputTempCountry",res.RESPONSE[0].TEMP_COUNTRY_CD);
        		 ofGetListData("GetSwiftList","","inputSwift",res.RESPONSE[0].SHIFT_ID);
        		 SetEmployeeData(res);
        		 func_Get_EmpList(res);
        		 AddUpdateRow(res.RESPONSE[0].INSU_DTL);
        	   }else{
        		   MessageBox("No Data Found", res.MESSAGE, 'red', 'fa fa-warning');
        	   }
        	 
         }
         else{
		       var MSG = res.MESSAGE;
         		  console.log(MSG);
		}	
}
setTimeout(function(){ showLoaderPage(false); showLoaderOwnPage(false,"loaderEmp"); }, 5000);
}
function func_Get_EmpList(res)
{
	showLoaderPage(true);
	of_set_value(document.getElementById("inputActiveStatus"));
	ofGetListData("GetDesignation",res.RESPONSE[0].DEPARTMENT_ID,"inputDesignation",res.RESPONSE[0].DESIGNATION_ID);
	ofGetListData("GetState",res.RESPONSE[0].PER_COUNTRY_CD,"inputPerState",res.RESPONSE[0].PER_STATE_CD);
	ofGetListData("GetState",res.RESPONSE[0].TEMP_COUNTRY_CD,"inputTempState",res.RESPONSE[0].TEMP_STATE_CD);
	ofGetListData("GetCity",res.RESPONSE[0].PER_STATE_CD,"inputPerCity",res.RESPONSE[0].PER_CITY_CD);
	ofGetListData("GetCity",res.RESPONSE[0].TEMP_STATE_CD,"inputTempCity",res.RESPONSE[0].TEMP_CITY_CD);

	if($("#inputContract").val() == "Y")
	{
		$("#inputContactSignDateDiv").attr("style","");
		$("#inputContactTypeDiv").attr("style","");
		ofGetListData("GetContraType","","inputContactType",res.RESPONSE[0].CONTRACT_TYPE);
	}
	else
	{
		$("#inputContactSignDateDiv").attr("style","display :none");
		$("#inputContactTypeDiv").attr("style","display :none");
		$("#inputContactType").val("");
	}
	SetEmployeeListData(res);
	setTimeout(function(){ showLoaderPage(false); showLoaderOwnPage(false,"loaderEmp"); }, 3000);
}
<%
	}
%>
function onErrorResponseGetEmpID(request, type, errorThrown)
{
	showLoaderPage(false);
	showLoaderOwnPage(false,"loaderEmp");
	//setTimeout(function(){ showLoaderPage(false); }, 2000);
	$("#inputEmpid_ldr").removeClass("inputloader");
	var message = "There was an error with the request.\n";
switch (type) {
    case 'timeout':
        message += "The request timed out.";
        break;
    case 'notmodified':
        message += "The request was not modified but was not retrieved from the cache.";
        break;
    case 'parsererror':
        message += "XML/Json format is bad.";
        break;
    default:
        message += errorThrown;
}
//alert(message);
MessageBox('Error', message, 'red', 'fa fa-warning');
$('#error_msg').html(GetErrorMessage(message));


}
function onSuccessGetEmpDTL(data, textStatus, jqXHR)
{   
   $("#inputEmpid_ldr").removeClass("inputloader");
   if (data != "") 
	{
         var res = JSON.parse(data);
         if (res.STATUS_CD == "999") {
        	    var MSG = res.MESSAGE;
         		console.log(MSG);
         }else if (res.STATUS_CD == "99") {
        	    var MSG = res.MESSAGE;
        	    console.log(MSG);
        	    $("#inputEmpid-error").text(MSG);
         }else if (res.STATUS_CD == "9") { ///Session Expire
        	 MessageBox("Expire", res.MESSAGE, 'red', 'fa fa-warning');
        	 SessionExpire();
	     }else if (res.STATUS_CD == "0") {
        	 $("#inputEmpid-error").attr("style","");
        	 $("inputEmpid").attr("aria-invalid","true");
        	 $("#inputEmpid").addClass("error");
        	 $("#inputEmpid-error").text("Employee ID already registred.");
        	 ls_emp_id.push($("#inputEmpid").val());
        	 addEMPMethod(ls_emp_id);
         }else if (res.STATUS_CD == "1") {
        	 $("#inputEmpid-error").text("");
        	 $("inputEmpid").attr("aria-invalid","false");
        	 $("#inputEmpid").removeClass("error");
         }
         else{
		       var MSG = res.MESSAGE;
         		  console.log(MSG);
		}
	
	}
}
function onSuccessGetEmpID(data, textStatus, jqXHR)
	{   
	$("#inputEmpid_ldr").removeClass("inputloader");
		if (data != "") 
		{
	         var res = JSON.parse(data);
	         if (res.STATUS_CD == "999") {
	        	    var MSG = res.MESSAGE;
	         		console.log(MSG);
	         }else if (res.STATUS_CD == "99") {
	        	    var MSG = res.MESSAGE;
	        	    console.log(MSG);
	         }else if (res.STATUS_CD == "9") { ///Session Expire
	        	 MessageBox("Expire", res.MESSAGE, 'red', 'fa fa-warning');
	        	 SessionExpire();
    	     }
	         else if (res.STATUS_CD == "0") {
	        	 if(res.RESPONSE.length > 0)
	        	   {
	        		 $("#inputEmpid").val(res.RESPONSE[0].EMP_ID);
	        	   } 
	         }
	         else{
			       var MSG = res.MESSAGE;
	         		  console.log(MSG);
			}
		
	}
}
$("#inputDepartment").change(function() {
	if(this.value != "")
	{
		ofGetListData("GetDesignation",this.value,"inputDesignation","");
	}else
	{$('#inputDesignation').children('option:not(:first)').remove();}
});
$("#inputPerCountry").change(function() {
	if(this.value != "")
	{
		ofGetListData("GetState",this.value,"inputPerState","");
	}else
	{$('#inputPerState').children('option:not(:first)').remove();}
	copyAddress();
});
$("#inputTempCountry").change(function() {
	if(this.value != "")
	{
		ofGetListData("GetState",this.value,"inputTempState","");
	}else
	{$('#inputTempState').children('option:not(:first)').remove();}
});
$("#inputPerState").change(function() {
	if(this.value != "")
	{
		ofGetListData("GetCity",this.value,"inputPerCity","");
	}else
	{$('#inputPerCity').children('option:not(:first)').remove();}
	copyAddress();
});
$("#inputTempState").change(function() {
	if(this.value != "")
	{
		ofGetListData("GetCity",this.value,"inputTempCity","");
	}else
	{$('#inputTempCity').children('option:not(:first)').remove();}
});

$("#inputContract").change(function() {
	if(this.value == "Y")
	{
		$("#inputContactSignDateDiv").attr("style","");
		$("#inputContactTypeDiv").attr("style","");
		func_set_today_date(document.getElementById("inputContactSignDate"));
		ofGetListData("GetContraType","","inputContactType","");
	}
	else
	{
		$("#inputContactSignDateDiv").attr("style","display :none");
		$("#inputContactTypeDiv").attr("style","display :none");
		$("#inputContactType").val("");
	}
});
function of_set_value(activestatus){
	if(activestatus.value == "Y")
	{
		$("#inactivedtdiv").attr("style","display :none");
		$("#inactivedt").val("");
	}else{
		$("#inactivedtdiv").attr("style","");
		func_set_today_date(document.getElementById("inactivedt"));
	}
}
function addEMPMethod(str){
	jQuery.validator.addMethod("checkempid", function(value, element) {
	    return !str.includes(value);
	}, "Employee ID already registred ..");
	}
addEMPMethod(ls_emp_id);
function of_set_Insurance_status(activestatus,i){
	if(activestatus.value == "Y")
	{
		$("#inputinactiveDatediv"+i).attr("style","display :none");
		$("#inputinactiveDate"+i).val("");
	}else{
		$("#inputinactiveDatediv"+i).attr("style","");
		func_set_today_date(document.getElementById("inputinactiveDate"+i));
	}
}
function AddNewRow(){
	var i=GetChieldCd();
	i = i+1;
	if($("#emp_registartion4").valid()){
	//var RowData='<div id="row'+i+'" style="border-style:none none solid none;"><br><div class="row"><div class="col"><b><label for="insuraneThrough'+i+'">Insurance Through</label></b><select id="insuraneThrough'+i+'" name="insuraneThrough'+i+'" class="form-control form-control-sm" onchange="of_change_insurance_througth(this,'+i+')" required><option value="" selected>Please Select insurance through..</option></select></div>	<div class="col"><b><label for="insuraneType'+i+'">Insurance Type</label></b><select id="insuraneType'+i+'" name="insuraneType'+i+'" class="form-control form-control-sm" onchange="of_change_insurance_type(this,'+i+')" required><option value="" selected>Please select Insurance type..</option></select></div><div class="col"><b><label for="insuraneAgency'+i+'">Insurance Agency</label></b><select id="insuraneAgency'+i+'" name="insuraneAgency'+i+'" class="form-control form-control-sm" required><option value="" selected>Please Select Insurance Agency..</option></select></div><div class="col"><b><label for="inputInsuRegno'+i+'">Insurance Reg. No.</label></b><input type="text" class="form-control form-control-sm" placeholder="Please enter Insurance Reg. No." id="inputInsuRegno'+i+'" name="inputInsuRegno'+i+'" maxLength="14" onkeypress="javascript:return isAlphaNumeric(event);" required></div></div><br><div class="row"><div class="col"><b><label for="inputStartDate'+i+'">Start Date</label></b><input type="date" class="form-control form-control-sm" name="inputStartDate'+i+'" id="inputStartDate'+i+'" placeholder="Start Date" required></div><div class="col"><b><label for="inputEndDate'+i+'">End Date</label></b><input type="date" class="form-control form-control-sm" name="inputEndDate'+i+'" id="inputEndDate'+i+'" placeholder="End Date" required></div> 		<div class="col"><b><label for="InputInsuranceAmt'+i+'">Insurance Premium</label></b><input type="text" class="form-control form-control-sm" placeholder="Please enter Insurance Premimum" id="InputInsuranceAmt'+i+'" name="InputInsuranceAmt'+i+'" maxLength="12" onkeypress="javascript:return isNumeric(event);" required></div><div class="col"><b><label for="InputinsuraneStatus'+i+'">Insurance Status</label></b><select id="InputinsuraneStatus'+i+'" name="InputinsuraneStatus'+i+'" class="form-control form-control-sm" onChange="of_set_Insurance_status(this,'+i+')" required><option value="Y" selected>Active</option><option value="N" selected>Inactive</option></select></div> <div class="col"><div id="inputinactiveDatediv'+i+'"><b><label for="inputinactiveDate'+i+'">Inactive Date</label></b><input type="date" class="form-control form-control-sm" name="inputinactiveDate'+i+'" id="inputinactiveDate'+i+'" placeholder="Inactive Date" readonly><input type="hidden" id="deleteflag'+i+'" name="deleteflag'+i+'"><input type="hidden" id="srcd'+i+'" name="srcd'+i+'"></div></div></div><br></div><br>';
	var RowData = GetInsuranceRowData(i);
	$("#emp_registartion4").append(RowData);
	$("#InputinsuraneStatus"+i).val("Y");
	$("#deleteflag"+i).val("I");
	$("#srcd"+i).val(Srcd + 1);
	$("#InputinsuraneStatus"+i).attr("disabled",true);
	of_set_Insurance_status(document.getElementById("InputinsuraneStatus"+i),i);
	$("#insuraneType"+i).attr("required",true);
	if(i==1){
		ofGetListDataFromMisc("INSURANCE_TH","","insuraneThrough1","");
		ofGetListDataOwn("GetInsuList","","insuraneType1","");
		ofGetListDataFromMisc("INSURANCE_AGENCY","","insuraneAgency1","");
	}else{
		$("#insuraneType"+i).html($("#insuraneType1").html());
		$("#insuraneThrough"+i).html($("#insuraneThrough1").html());
		$("#insuraneAgency"+i).html($("#insuraneAgency1").html());
	}
	TotalRow = TotalRow + 1;
	Srcd = Srcd + 1;
	}
}
function GetInsuranceRowData(i)
{
	var RowData='<div id="row'+i+'" style="border-style:none none solid none;"><br><div class="row"><div class="col"><b><label for="insuraneThrough'+i+'">Insurance Through</label></b><select id="insuraneThrough'+i+'" name="insuraneThrough'+i+'" class="form-control form-control-sm" onchange="of_change_insurance_througth(this,'+i+')" required><option value="" selected>Please Select insurance through..</option></select></div>	<div class="col"><b><label for="insuraneType'+i+'">Insurance Type</label></b><select id="insuraneType'+i+'" name="insuraneType'+i+'" class="form-control form-control-sm" onchange="of_change_insurance_type(this,'+i+')" required><option value="" selected>Please select Insurance type..</option></select></div><div class="col"><b><label for="insuraneAgency'+i+'">Insurance Agency</label></b><select id="insuraneAgency'+i+'" name="insuraneAgency'+i+'" class="form-control form-control-sm" required><option value="" selected>Please Select Insurance Agency..</option></select></div><div class="col"><b><label for="inputInsuRegno'+i+'">Insurance Reg. No.</label></b><input type="text" class="form-control form-control-sm" placeholder="Please enter Insurance Reg. No." id="inputInsuRegno'+i+'" name="inputInsuRegno'+i+'" maxLength="14" onkeypress="javascript:return isAlphaNumeric(event);" required></div></div><br><div class="row"><div class="col"><b><label for="inputStartDate'+i+'">Start Date</label></b><input type="date" class="form-control form-control-sm" name="inputStartDate'+i+'" id="inputStartDate'+i+'" placeholder="Start Date" required></div><div class="col"><b><label for="inputEndDate'+i+'">End Date</label></b><input type="date" class="form-control form-control-sm" name="inputEndDate'+i+'" id="inputEndDate'+i+'" placeholder="End Date" required></div> 		<div class="col"><b><label for="InputInsuranceAmt'+i+'">Insurance Premium</label></b><input type="text" class="form-control form-control-sm" placeholder="Please enter Insurance Premimum" id="InputInsuranceAmt'+i+'" name="InputInsuranceAmt'+i+'" maxLength="12" onkeypress="javascript:return isNumeric(event);" required></div><div class="col"><b><label for="InputinsuraneStatus'+i+'">Insurance Status</label></b><select id="InputinsuraneStatus'+i+'" name="InputinsuraneStatus'+i+'" class="form-control form-control-sm" onChange="of_set_Insurance_status(this,'+i+')" required><option value="Y" selected>Active</option><option value="N" selected>Inactive</option></select></div> <div class="col"><div id="inputinactiveDatediv'+i+'"><b><label for="inputinactiveDate'+i+'">Inactive Date</label></b><input type="date" class="form-control form-control-sm" name="inputinactiveDate'+i+'" id="inputinactiveDate'+i+'" placeholder="Inactive Date" readonly><input type="hidden" id="deleteflag'+i+'" name="deleteflag'+i+'"><input type="hidden" id="srcd'+i+'" name="srcd'+i+'"></div></div></div><br></div><br>';
	return RowData;
}
function AddUpdateRow(res){
	var i=0,z=0;
	var insu_id=0;
	var ls_insuraneThrough = [];
	var ls_insuraneType    = [];
	var ls_insuraneAgency  = [];
	var RowData;
	showLoaderOwnPage(true,"loaderEmp");
	for(i=0;i<res.length;i++)
	{
		z=i+1;
		RowData = GetInsuranceRowData(z);
		$("#emp_registartion4").append(RowData);
		$("#insuraneThrough"+z).val(res[i].INSU_THROUGH);
		$("#insuraneType"+z).val(res[i].INSU_TYPE);
		$("#insuraneAgency"+z).val(res[i].INSU_AGENCY_ID);
		$("#inputInsuRegno"+z).val(res[i].INSU_REG_NO);
		$("#inputStartDate"+z).val(res[i].INSU_START_DT);
		$("#inputEndDate"+z).val(res[i].INSU_END_DT);
		$("#InputInsuranceAmt"+z).val(res[i].INSU_PREMIUM);
		$("#InputinsuraneStatus"+z).val(res[i].INSU_STATUS);
		$("#inputinactiveDate"+z).val(res[i].INSU_INACTIVE_DT);
		$("#deleteflag"+z).val("U");
		insu_id = parseInt(res[i].INSU_ID);
		$("#srcd"+z).val(insu_id);
		of_set_Insurance_status(document.getElementById("InputinsuraneStatus"+z),z);
		if(insu_id > Srcd ){
			Srcd = insu_id;
		}
		
		TotalRow = TotalRow + 1;
		if(z==1){
			ofGetListDataFromMisc("INSURANCE_TH","","insuraneThrough1",res[i].INSU_THROUGH);
			ofGetListDataOwn("GetInsuList","","insuraneType1",res[i].INSU_TYPE);
			ofGetListDataFromMisc("INSURANCE_AGENCY","","insuraneAgency1",res[i].INSU_AGENCY_ID);
			sleep(3);
		}else{
			var e = $("#insuraneType1 option").length;
			if(e > 1) {
				$("#insuraneType"+z).html($("#insuraneType1").html());
				$("#insuraneType"+z).val(res[i].INSU_TYPE);
			}else{
				ofGetListDataOwn("GetInsuList","","insuraneType"+z,res[i].INSU_TYPE);
			}
			e = $("#insuraneThrough1 option").length;
			if(e > 1) {
				$("#insuraneThrough"+z).html($("#insuraneThrough1").html());
				$("#insuraneThrough"+z).val(res[i].INSU_THROUGH);
			}else{
				ofGetListDataFromMisc("INSURANCE_TH","","insuraneThrough"+z,res[i].INSU_THROUGH);
			}
			e = $("#insuraneAgency1 option").length;
			if(e > 1) {
				$("#insuraneAgency"+z).html($("#insuraneAgency1").html());
				$("#insuraneAgency"+z).val(res[i].INSU_AGENCY_ID);
			}else{
				ofGetListDataFromMisc("INSURANCE_AGENCY","","insuraneAgency"+z,res[i].INSU_AGENCY_ID);
			}
		}
		$("#insuraneThrough"+z).attr("required",false);
		$("#insuraneThrough"+z).attr("disabled",true);
		$("#insuraneAgency"+z).attr("required",false);
		$("#insuraneAgency"+z).attr("disabled",true);
		$("#insuraneType"+i).attr("required",false);
		$("#insuraneType"+i).attr("disabled",true);
		$("#inputInsuRegno"+z).attr("required",false);
		$("#inputInsuRegno"+z).attr("readonly",true);
	}
	showLoaderOwnPage(false,"loaderEmp");
}
function GetChieldCd(){
	return TotalRow;
}

function of_change_insurance_througth(insuthro,i)
{
	if(insuthro.value != "")
	{
		if(insuthro.value == "1")
		{
			$("#insuraneAgency"+i).attr("required",false);
			$("#insuraneAgency"+i).attr("disabled",true);
			$("#insuraneAgency"+i).val($("#insuraneAgency"+i+" option:first").val());
			
			$("#inputInsuRegno"+i).attr("required",false);
			$("#inputInsuRegno"+i).attr("readonly",true);
			$("#inputInsuRegno"+i).val("");
			
			$("#inputStartDate"+i).attr("required",false);
			$("#inputStartDate"+i).attr("readonly",true);
			$("#inputStartDate"+i).val("");
			
			$("#inputEndDate"+i).attr("required",false);
			$("#inputEndDate"+i).attr("readonly",true);
			$("#inputEndDate"+i).val("");
			
			$("#InputInsuranceAmt"+i).attr("required",false);
			$("#InputInsuranceAmt"+i).attr("readonly",true);
			$("#InputInsuranceAmt"+i).val("");
			
			$("#insuraneType"+i).attr("required",true);
			$("#insuraneType"+i).attr("disabled",false);
			$("#insuraneType"+i).val($("#insuraneType"+i+" option:first").val());			
		}
		else{
			$("#insuraneAgency"+i).attr("required",true);
			$("#insuraneAgency"+i).attr("disabled",false);
			$("#insuraneAgency"+i).val($("#insuraneAgency"+i+" option:first").val());
			
			$("#inputInsuRegno"+i).attr("required",true);
			$("#inputInsuRegno"+i).attr("readonly",false);
			$("#inputInsuRegno"+i).val("");
			
			$("#inputStartDate"+i).attr("required",true);
			$("#inputStartDate"+i).attr("readonly",false);
			$("#inputStartDate"+i).val("");
			
			$("#inputEndDate"+i).attr("required",true);
			$("#inputEndDate"+i).attr("readonly",false);
			$("#inputEndDate"+i).val("");
			
			$("#InputInsuranceAmt"+i).attr("required",true);
			$("#InputInsuranceAmt"+i).attr("readonly",false);
			$("#InputInsuranceAmt"+i).val("");
			
			$("#insuraneType"+i).attr("required",false);
			$("#insuraneType"+i).attr("disabled",true);
			$("#insuraneType"+i).val($("#insuraneType"+i+" option:first").val());	
		}
	}
}
function of_change_insurance_type(insutype,i){
	var val=insutype.value;
	var res;
	if(val != "")
	{
		res = InsuranceTypeResponse[val];
		if(res != undefined){
			$("#insuraneAgency"+i).val(res.INSU_AGENCY);
			$("#inputInsuRegno"+i).val(res.INSU_CUST_NO);
			$("#inputStartDate"+i).val(res.INSU_START_DT);
			$("#inputEndDate"+i).val(res.INSU_END_DT);
			$("#InputInsuranceAmt"+i).val(res.INSU_PREMIUM);
		}
	}
}
var InsuranceTypeResponse={};
var i_insurance=0;
function ofGetListDataOwn(action_id,v,inputID,SelValue)
{
	$.ajax({
	    url: "getdatalist",
	    method: "POST",
	    data: {"action":action_id,"action_data":v},	  	    
	     success: function(data){
	    	 	if (data != "") 
	    		{
	    	         var res = JSON.parse(data);
	    	         if (res.STATUS_CD == "999") {
    	        	    var MSG = res.MESSAGE;
    	         		console.log(MSG);
    	         		MessageBox("Expire", res.MESSAGE, 'red', 'fa fa-warning');
	    	         }else if (res.STATUS_CD == "99") {
    	        	    var MSG = res.MESSAGE;
    	         		console.log(MSG);
    	         		MessageBox("Expire", res.MESSAGE, 'red', 'fa fa-warning');
	    	         }else if (res.STATUS_CD == "9") { ///Session Expire
	    	        	 MessageBox("Expire", res.MESSAGE, 'red', 'fa fa-warning');
	    	        	 SessionExpire();
		    	      }
	    	         else if(res.STATUS_CD == "0"){
	    	        	 ofInputListData(res.RESPONSE,inputID,SelValue);
	    	        	 for(i_insurance=0;i_insurance<res.RESPONSE.length;i_insurance++){
	    	        		 InsuranceTypeResponse[res.RESPONSE[i_insurance].ID]=res.RESPONSE[i_insurance];
	    	        	 }
	    	         }
	    	         else{
 				        var MSG = res.MESSAGE;
    	         		console.log(MSG);
	 				}
	 			
	 		}
	    	 
	     },
	     error: onErrorResponse
	});
}
function sleep(seconds) 
{
  var e = new Date().getTime() + (seconds * 1000);
  while (new Date().getTime() <= e) {}
}
</script>
<!-- Page Container END -->