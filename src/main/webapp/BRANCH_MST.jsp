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
    	 String ls_edit=request.getSession().getAttribute("BRANCH_UPD_REQ").toString();
    	 if("Y".equalsIgnoreCase(ls_edit)){
    		 lb_new=false;
    		 session.setAttribute("BRANCH_UPD_REQ","N");
    		 ls_hidden="UPDATE";
    	 }else{lb_new=true;}
     }
     catch(Exception e){lb_new=true;}
     
    // jemp_mst =(JSONObject) request.getSession().getAttribute("MENU");
 } catch (Exception e) {
     response.getWriter().println("<script>window.location.href='"+ApplicationConfig.LoginPage+"';</script>");
 }
 %>
<div id="loadersubpage"></div>
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
               <a class="breadcrumb-item" href="#">HR Management</a>
               <span class="breadcrumb-item active">Branch Master</span>
            </nav>
         </div>
      </div>
      <div class="card">
         <div class="card-body">
            <h4>Branch Master</h4>
            <p></p>
            <div class="m-t-25">
               <div class="tab-content m-t-15" id="myTabContentJustified">
                  <div class="tab-pane fade show active" id="General-justified" role="tabpanel" aria-labelledby="home-tab-justified">
                     <p>
                     <form id="inputMasterForm" name="inputMasterForm" onsubmit="return false;">
                        <input type="hidden" id="action_id" name="action_id" value="<%=ls_hidden%>">
                        <div class="row">
                           <div class="col">
                              <b><label for="branchId">Branch Id</label></b>
                              <input type="text" class="form-control" placeholder="Branch Id" id="branchId" name="branchId" maxLength="4" onkeypress="javascript:return isNumeric(event);">
                           </div>
                           <div class="col">
                              <b><label for="branchName">Branch Name</label></b>
                              <input type="text" class="form-control" placeholder="Branch Name" id="branchName" name="branchName" maxLength="40" onkeypress="javascript:return isAlphaNumeric(event);">
                           </div>
                        </div>
                        </br>
                        <div class="row">
                           <div class="col">
                              <b><label for="openingDate">Opening Date</label></b>
                              <input type="date" class="form-control" name="openingDate" id="openingDate" placeholder="Opening Date">
                           </div>
                           <div class="col">
                              <b><label for="branchManagerName">Branch Manager Name</label></b>
                              <input type="text" class="form-control" placeholder="Branch Manager Name" id="branchManagerName" name="branchManagerName" maxLength="40" onkeypress="javascript:return isAlphaNumeric(event);">
                           </div>
                        </div>
                        </br>
                        <div class="row">
                           <div class="col">
                              <b><label for="banchContact">Branch Contact</label></b>
                              <input type="tel" class="form-control" name="banchContact" id="banchContact" placeholder="Branch Contact" maxLength="15" onkeypress="javascript:return isNumeric(event);">
                           </div>
                           <div class="col">
                              <b><label for="branchEmail">Branch Email</label></b>
                              <input type="text" class="form-control" placeholder="Branch Email" id="branchEmail" name="branchEmail" maxLength="50">
                           </div>
                        	<div class="col">
                              <b><label for="contactperson">Contact Person</label></b>
                              <input type="text" class="form-control" placeholder="Contact Person" id="contactperson" name="contactperson" maxLength="50" onkeypress="javascript:return isAlphaNumeric(event);">
                           </div>
                          </div>
                        </br>
                        <div class="row">
                           <div class="col">
                              <b><label for="ADD_1">Address Line 1</label></b>
                              <input type="text" class="form-control" placeholder="Address Line 1" id="ADD_1" name="ADD_1" maxLength="40" onkeypress="javascript:return isAlphaNumeric(event);">
                           </div>
                        </div>
                        <div class="row">
                           <div class="col">
                              <b><label for="ADD_2">Address Line 2</label></b>
                              <input type="text" class="form-control" placeholder="Address Line 2" id="ADD_2" name="ADD_2" maxLength="40" onkeypress="javascript:return isAlphaNumeric(event);">
                           </div>
                        </div>
                        <div class="row">
                           <div class="col">
                              <b><label for="ADD_3">Address Line 3</label></b>
                              <input type="text" class="form-control" placeholder="Address Line 3" id="ADD_3" name="ADD_3" maxLength="40" onkeypress="javascript:return isAlphaNumeric(event);">
                           </div>
                        </div>
                        </br>                                       
                        <div class="row">
                           <div class="col">
                              <b><label for="inputCountry">Country</label></b>
                              <select id="inputCountry" name="inputCountry" class="form-control">
                                 <option value="" selected>Please select country...</option>
                              </select>
                           </div>
                           <div class="col">
                              <b><label for="inputState">State</label></b>
                              <select id="inputState" name="inputState" class="form-control">
                                 <option value="" selected>Please select state...</option>
                              </select>
                           </div>
                           <div class="col">
                              <b><label for="inputCity">City</label></b>
                              <select id="inputCity" name="inputCity" class="form-control">
                                 <option value="" selected>Please select city...</option>
                              </select>
                           </div>
                        </div>
                        </br>
                        <div class="row">
                           <div class="col">
                              <b><label for="inputPincode">Pin code</label></b>
                              <input type="text" class="form-control" name="inputPincode" id="inputPincode" placeholder="Pin code" maxLength="6" onkeypress="javascript:return isNumeric(event);">
                           </div>
                           <div class="col">
                              <b><label for="inceptionDate">Inception Date</label></b>
                              <input type="date" class="form-control" placeholder="inception Date" id="inceptionDate" name="inceptionDate">
                           </div>
                        </div>
                        </br>                                                                       
                        <div class="row">
	                       	<div class="col">
	                             <b><label for="inputStatus">Branch Status</label></b>
	                             <select id="inputStatus" name="inputStatus" class="form-control" onchange="of_set_Active_status(this)">
	                                <option value="Y" selected>Active</option>
	                                <option value="N">Inactive</option>
	                             </select>
	                          </div>   
	                          <div class="col">
	                             <div id="inputInactiveDtdiv">
	                             <b><label for="inputInactiveDt">Inactive Date</label></b>
	                             <input type="date" class="form-control" placeholder="Inactive Date" name="inputInactiveDt" id="inputInactiveDt">
	                            </div>
	                          </div>                           
	                       </div> 
                        </br>
<!--                         <button type="submit" id="emp_reg_sub2" onClick="" class="btn btn-primary">Submit</button>                                                                                                      -->
                     </form>
                     </p>
                  </div>
               </div>
            </div>
         </div>
         <br>
         <div class="card-footer" align="right"><button class="btn btn-white" id="master_back" onClick="onloadpage('BRANCH_LIST')">Back</button>&nbsp;&nbsp;<button class="btn btn-primary" id="master_submit" onClick="MasterSubmit()">submit</button></div>
      </div>
   </div>
</div>

<!-- Page Container END -->
<script>
var ls_duplicate_id=[];
var ls_list_page="BRANCH_LIST";
var ls_main_id = "branchId";
<% 	
	if(lb_new){
%>
		showLoaderPage(true);
		showLoaderOwnPage(true,"loadersubpage");
		$("#inputStatus").val("Y");
		$("#inputStatus").attr("disabled",true);
		ofGetListData("GetCountry","","inputCountry","");
		func_set_today_date(document.getElementById("openingDate"));
		CallAPI("getdatalist",{"action":"GetMaxBranchID","branch_id":""},onSuccessGetMaxID,onErrorResponse);
        function onSuccessGetMaxID(data, textStatus, jqXHR)
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
		        	 setTimeout(function(){ showLoaderPage(false); showLoaderOwnPage(false,"loadersubpage"); onloadpage(ls_list_page); }, 3000);
			     }
		         else if (res.STATUS_CD == "0") {
		        	 if(res.RESPONSE.length > 0)
		        	   {
		        		 $("#"+ls_main_id).val(res.RESPONSE[0].BRANCH_CD)
		        		 showLoaderPage(false); 
		        		 showLoaderOwnPage(false,"loadersubpage");
		        	   }
		        	 
		         }else{
				       var MSG = res.MESSAGE;
		         		  console.log(MSG);
				         	MessageBox("Error", MSG, 'red', 'fa fa-warning');
					  }
				}
			setTimeout(function(){ showLoaderPage(false); showLoaderOwnPage(false,"loadersubpage");}, 5000);

		}
        $("#"+ls_main_id).change(function() {
           	if(this.value != "")
           	{
           		CallAPI("getdatalist",{"action":"getBranchID","branch_id":this.value},onSuccessGetID,onErrorResponse);
           	}
           });
        function onSuccessGetID(data, textStatus, jqXHR)
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
		        	 
			     }
		         else if (res.STATUS_CD == "0") {
		        	 if(res.RESPONSE.length > 0)
		        	   {
		        		 ls_duplicate_id.push(res.RESPONSE[0].BRANCH_CD);
		        		 addMethod(ls_duplicate_id);
		        	   }
		          }else{
				       var MSG = res.MESSAGE;
		         		  console.log(MSG);
				          MessageBox("Error", MSG, 'red', 'fa fa-warning');
					  }
				}
				//setTimeout(function(){ showLoaderPage(false); showLoaderOwnPage(false,"loaderShift"); }, 5000);
		 }
        setTimeout(function(){ showLoaderPage(false); showLoaderOwnPage(false,"loaderShift"); }, 7000);
<% 
	}else{
%>
	$("#"+ls_main_id).attr("readonly",true);
	showLoaderPage(true);
	showLoaderOwnPage(true,"loadersubpage");
	CallAPI("getdatalist",{"action":"getBranchIDDtl","branch_id":""},onSuccessGetIDDetails,onErrorResponse);
	function onSuccessGetIDDetails(data, textStatus, jqXHR)
	{
		if (data != "") 
		{
			var res = JSON.parse(data);
	         if (res.STATUS_CD == "999") {
	        	 var MSG = res.MESSAGE;
	         	 console.log(MSG);
	         	 MessageBox("Error", MSG, 'red', 'fa fa-warning');
	         	setTimeout(function(){ showLoaderPage(true); onloadpage(ls_list_page); }, 3000);
	         }else if (res.STATUS_CD == "99") {
	        	 var MSG = res.MESSAGE;
	        	 console.log(MSG);
	        	 MessageBox("Error", MSG, 'red', 'fa fa-warning');
	        	 setTimeout(function(){ showLoaderPage(true); onloadpage(ls_list_page); }, 3000);
	         }else if (res.STATUS_CD == "9") { ///Session Expire
	        	 MessageBox("Expire", res.MESSAGE, 'red', 'fa fa-warning');
	        	 SessionExpire();
		     }else if (res.STATUS_CD == "1") { ///Session Expire
		    	 MessageBox("No Found", res.MESSAGE, 'red', 'fa fa-warning');
	        	 setTimeout(function(){ showLoaderPage(false); showLoaderOwnPage(false,"loadersubpage"); onloadpage(ls_list_page); }, 3000);
		     }
	         else if (res.STATUS_CD == "0") {
	        	 if(res.RESPONSE.length > 0)
	        	   {
	        		 SetBranchData(res);
	        		 of_set_Active_status(document.getElementById("inputStatus"));
					 ofGetListData("GetCountry","","inputCountry",res.RESPONSE[0].CONTRAY_CD);
	        		 ofGetListData("GetState",res.RESPONSE[0].CONTRAY_CD,"inputState",res.RESPONSE[0].STATE_CD);
	        		 ofGetListData("GetCity",res.RESPONSE[0].STATE_CD,"inputCity",res.RESPONSE[0].CITY_CD);
	        		 showLoaderPage(false);
	        		 showLoaderOwnPage(false,"loadersubpage");
	        	   }
	        	   else{
	        		   MessageBox("No Data Found", res.MESSAGE, 'red', 'fa fa-warning');
	        		   setTimeout(function(){ showLoaderPage(true);showLoaderOwnPage(false,"loadersubpage"); onloadpage(ls_list_page); }, 3000);
	        	   }
	          }else{
			       var MSG = res.MESSAGE;
	         		  console.log(MSG);
			          MessageBox("Error", MSG, 'red', 'fa fa-warning');
				  }
			}			
	 }
	setTimeout(function(){ showLoaderPage(false); showLoaderOwnPage(false,"loadersubpage"); }, 5000);
	setTimeout(function(){ showLoaderPage(false); showLoaderOwnPage(false,"loaderShift"); }, 7000);
<%
	}
%>
of_set_Active_status(document.getElementById("inputStatus"));
$("#inputInactiveDt").attr("readonly",true);
function MasterSubmit()
{
	var myform = $('#inputMasterForm');
	$("form[name='inputMasterForm']").validate({
		rules: {
			branchId : {
				required : true,
				number : true,
				checkduplicateid : true
			},
			branchName : {
				required : true
			},
			openingDate : {
				required : true
			},
			branchManagerName : {
				required : true
			},
			branchEmail : {
				email : true
			},
			banchContact : {
				minlength : 10,
				number : true
			},
			ADD_1 : {
				required : true
			},
			inputCountry : {
				required : true
			},
			inputState : {
				required : true
			},
			inputCity : {
				required : true
			},
			inputPincode : {
				required : true,
				minlength : 6,
				number : true
			},
			inputStatus : {
				required : true
			}
			
			
		},
		ignore: ""
	});
	if(myform.valid())
	{
		var disabled = myform.find(':input:disabled').removeAttr('disabled');
		var form_1=getFormData($("#inputMasterForm"));
		disabled.attr('disabled','disabled');
		showLoaderPage(true);
		showLoaderOwnPage(true,"loadersubpage"); 
		CallAPI("branch_master",form_1,onSuccessOwnMaster,onErrorResponse);
	}
}
function onSuccessOwnMaster(data, textStatus, jqXHR)
{   
	showLoaderPage(false);
	showLoaderOwnPage(false,"loadersubpage"); 
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
   	   			setTimeout(function(){ showLoaderPage(true); onloadpage(ls_list_page); }, 3000);
   	   		}     	 
         }
         else{
			var MSG = res.MESSAGE;
         		  console.log(MSG);
         	MessageBox("Error",MSG, 'red', 'fa fa-warning');
		}
	
	}
}
$("#inputCountry").change(function() {
	$('#inputState').children('option:not(:first)').remove();
	if(this.value != "")
	{
		ofGetListData("GetState",this.value,"inputState","");
	}
});
$("#inputState").change(function() {
	$('#inputCity').children('option:not(:first)').remove();
	if(this.value != "")
	{
		ofGetListData("GetCity",this.value,"inputCity","");
	}
});
function of_set_Active_status(activestatus){
	if(activestatus.value == "Y")
	{
		$("#inputInactiveDtdiv").attr("style","display :none");
		$("#inputInactiveDt").val("");
	}else{
		$("#inputInactiveDtdiv").attr("style","");
		func_set_today_date(document.getElementById("inputInactiveDt"));
	}
}
function addMethod(str){
	jQuery.validator.addMethod("checkduplicateid", function(value, element) {
	    return !str.includes(value);
	}, "Branch ID already registred ..");
	}
addMethod(ls_duplicate_id);
</script>