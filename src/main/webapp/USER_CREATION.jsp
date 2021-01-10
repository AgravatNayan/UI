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
    	 String ls_edit=request.getSession().getAttribute("USER_UPD_REQ").toString();
    	 if("Y".equalsIgnoreCase(ls_edit)){
    		 lb_new=false;
    		 session.setAttribute("USER_UPD_REQ","N");
    		 ls_hidden="UPDATE";
    	 }else{lb_new=true;}
     }
     catch(Exception e){lb_new=true;}
     
    // jemp_mst =(JSONObject) request.getSession().getAttribute("MENU");
 } catch (Exception e) {
     response.getWriter().println("<script>window.location.href='"+ApplicationConfig.LoginPage+"';</script>");
 }
%>

<div id="loaderUser"></div>
<!-- Page Container START -->
<div class="page-container" style="padding-left: 0px;">
   <!-- Content Wrapper START -->
   <div class="main-content">
      <div class="page-header">
         <h2 class="header-title">HRMS</h2>
         <div class="header-sub-title">
            <nav class="breadcrumb breadcrumb-dash">
               <a href="#" class="breadcrumb-item"><i class="anticon anticon-home m-r-5"></i>Home</a>
               <a class="breadcrumb-item" href="#">HRMS</a>
               <a class="breadcrumb-item" href="#">User Management</a>
               <span class="breadcrumb-item active">New User</span>
            </nav>
         </div>
      </div>
      <div class="card">
         <div class="card-body">
            <h4>New User</h4>
            <p>Enter User details and rights assing tab using assign rights screen.</p>
            <div class="m-t-25">
            <ul class="nav nav-tabs nav-justified" id="myTabJustified" role="tablist">
                  <li class="nav-item">
                     <a class="nav-link active" id="home-tab-justified" data-toggle="tab" href="#General-justified" role="tab" aria-controls="General-justified" aria-selected="true"><b><h4>User Information</h4></b></a>
                  </li>
<!--                   <li class="nav-item"> -->
<!--                      <a class="nav-link" id="profile-tab-justified" data-toggle="tab" href="#Company-justified" role="tab" aria-controls="Company-justified" aria-selected="false"><b><h4>Application Rights</h4></b></a> -->
<!--                   </li> -->
               </ul>
               <div class="tab-content m-t-15" id="myTabContentJustified">
                  <div class="tab-pane fade show active" id="General-justified" role="tabpanel" aria-labelledby="home-tab-justified">
                     <p>
                     <form id="userMaster" name="userMaster" onsubmit="return flase;">
                     	<input type="hidden" id="action_id" name="action_id" value="<%=ls_hidden%>">
                     	<div class="row">
                     		<div class="col">
                              <b><label for="inputUserId">User Id</label></b>
                              <input type="text" class="form-control" placeholder="Please enter User Id." id="inputUserId" name="inputUserId" maxlength="16" onkeypress="javascript:return isAlphaNumeric(event);">
                              <div class="icon-container">
								  <i id="inputUserId_ldr"></i>
							  </div>
                              <label id="inputUserId-error" class="error" for="inputUserId"></label>
                           	</div>
                           	<div class="col">
                             <b><label for="inputEmpId">Ref. Id</label></b>
                              <input type="text" class="form-control" placeholder="Please enter Ref. Id.(Employee ID)" id="inputEmpId" name="inputEmpId" maxlength="15" onkeypress="javascript:return isNumeric(event);">
                           	  <div class="icon-container">
								  <i id="inputEmpid_ldr"></i>
							  </div>
                              <label id="inputEmpid-error" class="error" for="inputEmpid"></label>
                           </div>
                           	                                                           	                 
                     	</div>                     	                     	
                     	<br>
                        <div class="row">
                        	<div class="col">
                              <b><label for="inputUserType">User Type</label></b>
                              <select id="inputUserType" name="inputUserType" class="form-control">
                                 <option value="" selected>Please select User Type..</option>
                              </select>
                           </div>
                           <div class="col">
                              <b><label for="inputContact">Contact No.</label></b>
                              <input type="text" class="form-control" id="inputContact" name="inputContact" maxlength="10" onkeypress="javascript:return isNumeric(event);" placeholder="Please enter Contact no. ">
                           </div>                         
                        </div>
                        <br>
                        <div class="row">
                           <div class="col">
                           	<b><label for="inputEmailID">Email ID.</label></b>
                              <input type="text" class="form-control" id="inputEmailID" name="inputEmailID" maxlength="100" placeholder="Please enter Email Id.">
                           </div>
                        </div>
                        <br>
                        <div class="row">
                           <div class="col">
                              <b><label for="inputActiveStatus">Active Status</label></b>
                              <select id="inputActiveStatus" name="inputActiveStatus" class="form-control" onchange="of_set_value_Active(this)">
    							 <option Value="Y" selected>Active</option>
                                 <option Value="N" >Inactive</option>
                              </select>
                           </div>     
                           <div class="col">
                              <div id="inputInactiveDatediv">
                              <b><label for="inputInactiveDate">inactive Date</label></b>
                              <input type="date" class="form-control" id="inputInactiveDate" name="inputInactiveDate" readonly="readonly">
                              </div>
                           </div>                          
                        </div>
                        </br>
                         <div class="row">
                           <div class="col">
                              <b><label for="inputBlockStatus">Block Status</label></b>
                              <select id="inputBlockStatus" name='inputBlockStatus' class="form-control" onchange="of_set_value_Block(this)">
                                 <option value="Y">Blocked</option>
                                 <option value="N" selected>Un-Blocked</option>
                              </select>
                           </div>     
                           <div class="col">
                           	 <div id="inputBlockDatediv">
                              <b><label for="inputBlockDate">Block Date</label></b>
                              <input type="date" class="form-control" name="inputBlockDate" id="inputBlockDate" readonly="readonly">
                             </div>
                           </div>                          
                        </div>
                        <br>
                        <%
							if(!lb_new)
							{
						%>
		                        <div class="row">
									<div class="col">
									   <b><label for="inputChangePassword">Change Password &nbsp;</label></b>
									   <div class="switch m-r-10">
											<input type="checkbox" id="inputChangePassword" name="inputChangePassword" onchange="OnPasswordChange(this)" >
											<label for="inputChangePassword"></label>
										</div>
									</div>
								</div>
								<br>
						<%	
							}
						%>
                        <div class="row">
                           <div class="col">
                              <b><label for="inputPassword">Password</label></b>
                              <input type="password" class="form-control" placeholder="Please enter Password" id="inputPassword" name="inputPassword" maxlength="16" autocomplete="false" placeholder="Please enter Password">
                           </div>
                           <div class="col">
                              <b><label for="inputConfirmPass">Confirm Password</label></b>
                              <input type="password" class="form-control" placeholder="Please enter Confirm Password" id="inputConfirmPass" name="inputConfirmPass" maxlength="16" autocomplete="false" placeholder="Please enter Confirm Password">
                           </div>
                        </div> 
                       <br>
                        <div class="row">
                           <div class="custom-file col">
                              <b><input type="file" onchange="readFileIMG(this,'inputSignatureBase64')" class="custom-file-input" id="inputSignature" accept=".jpg,.png,.jpeg"></b>
                              <label class="custom-file-label" for="inputSignature">User Signature</label>
                              <input type="hidden" name="inputSignatureBase64" id="inputSignatureBase64" >
                           </div>
                           <div class="custom-file col">
                              <b><input type="file" onchange="readFileIMG(this,'inputPhotoBase64')" class="custom-file-input" id="inputPhoto" accept=".jpg,.png,.jpeg"></b>
                              <label class="custom-file-label" for="inputPhoto">User Photo</label>
                              <input type="hidden" name="inputPhotoBase64" id="inputPhotoBase64" >
                           </div>
                        </div>
                        <input type="hidden" id="inputPasschange">                                                                  
                     </form>
                     </p>
                  </div>
                   <div class="tab-pane fade" id="Company-justified" role="tabpanel" aria-labelledby="profile-tab-justified">
                     <p>
                     	<form>
                     			test
                        </form>
                     </p>
                  </div>
               </div>
            </div>
         </div>
         <br>
         <div class="card-footer" align="right"><button class="btn btn-white" id="user_mst_back_btn" onClick="BackUserMast()">Back</button>&nbsp;&nbsp;<button class="btn btn-primary" id="user_mst_btn" onClick="userMstReg()">submit</button></div>
      </div>
   </div>
</div>
</div>
<!-- Page Container END -->
<script>
var ls_already_id=[];
var ls_emp_id=[];
<%
	if(lb_new)
	{
%>
		ofGetListDataFromMisc("USER_LEVEL","","inputUserType","");
		$("#inputActiveStatus").attr("disabled",true);
		$("#inputBlockStatus").attr("disabled",true);
		$("#inputBlockDate").attr("readonly",true);
		$("#inputInactiveDate").attr("readonly",true);
		of_set_value_Block(document.getElementById("inputBlockStatus"));
		of_set_value_Active(document.getElementById("inputActiveStatus"));
<% 
	}
	else{
%>
		$("#inputUserId").attr("readonly",true);
		$("#inputEmpId").attr("readonly",true);
		$("#inputPassword").attr("readonly",true);
		$("#inputConfirmPass").attr("readonly",true);
		$("#inputPasschange").val("N");
		showLoaderOwnPage(true,"loaderUser");
		showLoaderPage(true);
		CallAPI("getdatalist",{"action":"GETUSERDTLEDIT","user_id":""},onSuccessGetUserDetails,onErrorResponse);
		function onSuccessGetUserDetails(data, textStatus, jqXHR)
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
		        	 setTimeout(function(){ showLoaderPage(true); showLoaderOwnPage(false,"loaderUser"); onloadpage('USER_LIST'); }, 3000);
			     }
		         else if (res.STATUS_CD == "0") {
		        	 if(res.RESPONSE.length > 0)
		        	   {
						 ofGetListDataFromMisc("USER_LEVEL","","inputUserType",res.RESPONSE[0].USER_LEVEL_CD);
		        		 SetUserData(res);
		        		 of_set_value_Block(document.getElementById("inputBlockStatus"));
		        		 of_set_value_Active(document.getElementById("inputActiveStatus"));
		        		 showLoaderPage(false);
		        		 showLoaderOwnPage(false,"loaderUser"); 
		        	   }
		        	   else{
		        		   MessageBox("No Data Found", res.MESSAGE, 'red', 'fa fa-warning');
		        	   }
		        	 
		         }else{
				       var MSG = res.MESSAGE;
		         		  console.log(MSG);
		         		 MessageBox("Error", MSG, 'red', 'fa fa-warning');
				}
			}
			setTimeout(function(){ showLoaderPage(false);showLoaderOwnPage(false,"loaderUser"); }, 5000);
		}
<% 
	}
%>

function userMstReg()
{
	var myform = $('#userMaster');
	jQuery.validator.addMethod("confirmpass", function(value, element) {
		var pass=$("#inputPassword").val();
		var conf_pass=$("#inputConfirmPass").val();
		return pass == conf_pass;
	}, "Passwords does not match!");
	$.validator.addMethod("passwordFormatCheck", function(value, element) {
	    return this.optional(element) || /^(?=.*\d)(?=.*[A-Z])(?=.*\W).*$/i.test(value);
	}, 'Password must contain one capital letter,one numerical and one special character');
	$("form[name='userMaster']").validate({
		rules: {
			inputUserId : {
				required : true,
				minlength: 5,
				checkuserid : true
			},
			inputEmpId : {
				number : true
			},
			inputUserType : {
				required : true
			},
			inputContact : {
				required : true,
				number : true,
				minlength: 10
			},
			inputEmailID : {
				required : true,
				email: true,
				checkEmpid : true
			},
			inputPassword : {
				required : true,
				minlength : 8,
				passwordFormatCheck : true
			},
			inputConfirmPass : {
				required : true,
				confirmpass : true
			}
		},
		ignore: "",
		messages : {
			inputContact : {
				number : "Please enter valid Contact no.",
				minlength : "Please enter valid Contact no."
			},
			inputPassword : {
				minlength : "Password should be 8 digit or more."
			}
		}
	});
	if(myform.valid())
	{
		var disabled = myform.find(':input:disabled').removeAttr('disabled');
		var form_1=getFormData($("#userMaster"));
		disabled.attr('disabled','disabled');
		showLoaderPage(true);
		CallAPI("user_master",form_1,onSuccessUserMaster,onErrorResponse);
	}
}
function onSuccessUserMaster(data, textStatus, jqXHR)
{   
	showLoaderPage(false);
   if (data != "") 
	{
         var res = JSON.parse(data);
         if (res.STATUS_CD == "999") {
        	    var MSG = res.MESSAGE;
         		console.log(MSG);
         		MessageBox("Error",MSG, 'red', 'fa fa-warning');
         }else if (res.STATUS_CD == "99") {
        	    var MSG = res.MESSAGE;
        	    console.log(MSG);
        	    MessageBox("Error",MSG, 'red', 'fa fa-warning');
         }else if (res.STATUS_CD == "9") { ///Session Expire
        	 MessageBox("Expire", res.MESSAGE, 'red', 'fa fa-warning');
        	 SessionExpire();
	     }else if (res.STATUS_CD == "0") {
	    	MessageBox("Success", res.MESSAGE, 'green', 'fa fa-success');
   	   		if(res.ACTION == "NEW")
   	   		{
   	   			setTimeout(function(){ showLoaderPage(true); onloadpage('USER_LIST'); }, 3000);
   	   		}     	 
         }
         else{
			var MSG = res.MESSAGE;
         		  console.log(MSG);
         	MessageBox("Error",MSG, 'red', 'fa fa-warning');
		}
	
	}
}
$("#inputEmpId").change(function() {
	if(this.value != "")
	{
		$("#inputEmpid_ldr").addClass("inputloader");
		CallAPI("getdatalist",{"action":"GETEMPDTL","emp_id":this.value},onSuccessGetEmpDTL,onErrorResponse);
	}
});
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
        	 $("#inputEmpid-error").text("");
        	 $("inputEmpid").attr("aria-invalid","false");
        	 $("#inputEmpid").removeClass("error"); 
        	 if(res.RESPONSE.length > 0)
       		 {
       		 	 $("#inputContact").val(res.RESPONSE[0].PRIMARY_CONTACT);
	       		 $("#inputEmailID").val(res.RESPONSE[0].EMIAL_ID);
       		 }
         }else if (res.STATUS_CD == "1") {
        	 $("#inputEmpid-error").attr("style","");
        	 $("inputEmpid").attr("aria-invalid","true");
        	 $("#inputEmpid").addClass("error");
        	 $("#inputEmpid-error").text("Employee ID not registred.");
        	 ls_emp_id.push($("#inputEmpid").val());
        	 addEMPMethod(ls_emp_id);
         }
         else{
		       var MSG = res.MESSAGE;
         		  console.log(MSG);
		}
	
	}
}
$("#inputUserId").change(function() {
	if(this.value != "")
	{
		$("#inputUserId_ldr").addClass("inputloader");
		CallAPI("getdatalist",{"action":"GETUSERDTL","action_data":this.value},onSuccessGetUserDTL,onErrorResponse);
	}
});
function onSuccessGetUserDTL(data, textStatus, jqXHR)
{   
   $("#inputUserId_ldr").removeClass("inputloader");
   if (data != "") 
	{
         var res = JSON.parse(data);
         if (res.STATUS_CD == "999") {
        	    var MSG = res.MESSAGE;
         		console.log(MSG);
         		MessageBox("Error",MSG, 'red', 'fa fa-warning');
         }else if (res.STATUS_CD == "99") {
        	    var MSG = res.MESSAGE;
        	    console.log(MSG);
        	    $("#inputUserId-error").text(MSG);
         }else if (res.STATUS_CD == "9") { ///Session Expire
        	 MessageBox("Expire", res.MESSAGE, 'red', 'fa fa-warning');
        	 SessionExpire();
	     }else if (res.STATUS_CD == "0") {
	    	 $("#inputUserId-error").attr("style","");
        	 $("#inputUserId").attr("aria-invalid","true");
        	 $("#inputUserId").addClass("error");
        	 $("#inputUserId-error").text("User ID already registred.");
        	 ls_already_id.push($("#inputUserId").val());
        	 addUserMethod(ls_already_id);        	 
         }else if (res.STATUS_CD == "1") {
        	 $("#inputUserId-error").text("");
        	 $("#inputUserId").attr("aria-invalid","false");
        	 $("#inputUserId").removeClass("error");
         }
         else{
		       var MSG = res.MESSAGE;
         		  console.log(MSG);
		}
	
	}
}
function of_set_value_Block(activestatus){
	if(activestatus.value == "N")
	{
		$("#inputBlockDatediv").attr("style","display :none");
		$("#inputBlockDate").val("");
	}else{
		$("#inputBlockDatediv").attr("style","");
		func_set_today_date(document.getElementById("inputBlockDate"));
	}
}
function of_set_value_Active(activestatus){
	if(activestatus.value == "Y")
	{
		$("#inputInactiveDatediv").attr("style","display :none");
		$("#inputInactiveDate").val("");
	}else{
		$("#inputInactiveDatediv").attr("style","");
		func_set_today_date(document.getElementById("inputInactiveDate"));
	}
}
function BackUserMast()
{onloadpage('USER_LIST');}
function addUserMethod(str){
	jQuery.validator.addMethod("checkuserid", function(value, element) {
	    return !str.includes(value);
	}, "User ID already registred ..");
}
function addEMPMethod(str){
	jQuery.validator.addMethod("checkEmpid", function(value, element) {
	    return !str.includes(value);
	}, "Employee ID not registred ..");
}
addUserMethod(ls_already_id);
addEMPMethod(ls_emp_id);
function OnPasswordChange(psch)
{
	if(psch.checked)
	{
		$("#inputPassword").attr("readonly",false);
		$("#inputConfirmPass").attr("readonly",false);
		$("#inputPassword").val("");
		$("#inputConfirmPass").val("");
		$("#inputPasschange").val("Y");
	}
	else{
		$("#inputPassword").attr("readonly",true);
		$("#inputConfirmPass").attr("readonly",true);
		$("#inputPassword").val("H%24m@Mh");
		$("#inputConfirmPass").val("H%24m@Mh");
		$("#inputPasschange").val("N");
	}
}
</script>