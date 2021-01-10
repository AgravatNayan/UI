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
    	 String ls_edit=request.getSession().getAttribute("CONTRA_TYPE_UPD_REQ").toString();
    	 if("Y".equalsIgnoreCase(ls_edit)){
    		 lb_new=false;
    		 session.setAttribute("CONTRA_TYPE_UPD_REQ","N");
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
<div id="loaderContranct"></div>
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
               <span class="breadcrumb-item active">Contract Type Master</span>
            </nav>
         </div>
      </div>
      <div class="card">
         <div class="card-body">
            <h4>Contract Type Master</h4>
            <p></p>
            <div class="m-t-25">           
               <div class="tab-content m-t-15" id="myTabContentJustified">
                  <div class="tab-pane fade show active" id="General-justified" role="tabpanel" aria-labelledby="home-tab-justified">
                     <p>
                     <form id="contratypemst" name="contratypemst" onsubmit="return false;">
                     <input type="hidden" id="action_id" name="action_id" value="<%=ls_hidden%>">
                        <div class="row">
                        	<div class="col">
                              <b><label for="inputContraTypeId">Contract ID</label></b>
                              <input type="text" class="form-control" placeholder="Contract ID" id="inputContraTypeId" name="inputContraTypeId" maxLength="12" onkeypress="javascript:return isNumeric(event);">
                           </div>
                        	<div class="col">
                              <b><label for="inputContractName">Contract Name</label></b>
                              <input type="text" class="form-control" placeholder="Contract name" id="inputContractName" name="inputContractName" maxLength="40" onkeypress="javascript:return isAlphaNumeric(event);">
                           </div>                           
                        </div>
                        <br>
                        <div class="row">
                        	<div class="col">
                              <b><label for="inputStartDt">Start Date</label></b>
                              <input type="date" class="form-control" placeholder="Start Date" id="inputStartDt" name="inputStartDt">
                           </div>   
                           <div class="col">
                              <b><label for="inputEndDt">End Date</label></b>
                              <input type="date" class="form-control" placeholder="End Date" id="inputEndDt" name="inputEndDt">
                           </div>                           
                        </div>
                        <br>
                        
                        <div class="row">
                           <div class="col">
                              <b><label for="inputSalaryTemp">Salary Template</label></b>
                              <select id="inputSalaryTemp" class="form-control" name="inputSalaryTemp">
                                 <option value="" selected>Please select salary Template..</option>
                                 <option value="Y">Active</option>
                                 <option value="N">Inactive</option>
                              </select>
                           </div>     
                           <div class="col">
                              <b><label for="inputContractStatus">Contract Status</label></b>
                              <select id="inputContractStatus" name="inputContractStatus" class="form-control" onchange="of_set_value_Active(this)">
                                 <option value="Y" selected>Active</option>
                                 <option value="N">Inactive</option>
                              </select>
                           </div>  
                           <div class="col">
                              <div id="inputInactiveDtdiv">
                              <b><label for="inputInactiveDt">Inactive Date</label></b>
                              <input type="date" class="form-control" placeholder="Inactive Date" id="inputInactiveDt" name="inputInactiveDt">
                              </div>
                           </div>                        
                        </div>
                        <br>   
                        <br>
                     </form>
                     
                  </div>                   
               </div>
            </div>
         </div>
         <br>
         <div class="card-footer" align="right"><button class="btn btn-white" id="user_mst_back_btn" onClick="onloadpage('CONTRA_TYPE_LIST')">Back</button>&nbsp;&nbsp;<button class="btn btn-primary" id="user_mst_btn" onClick="ContractSubmit()">submit</button></div>
      </div>
   </div>
</div>
</div>
<!-- Page Container END -->
<script>
var ls_contra_id=[];
$("#inputInactiveDt").attr("readonly",true);
<% 
	if(lb_new){
%>
		showLoaderOwnPage(true,"loaderContranct");
		$("#inputContractStatus").val("Y");
		$("#inputContractStatus").attr("disabled",true);
        of_set_value_Active(document.getElementById("inputContractStatus"));
        CallAPI("getdatalist",{"action":"GETCONTACTMAXID","contract_id":""},onSuccessGetMaxID,onErrorResponse);
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
		        	 setTimeout(function(){ showLoaderPage(false); onloadpage('CONTRA_TYPE_LIST'); }, 3000);
			     }
		         else if (res.STATUS_CD == "0") {
		        	 if(res.RESPONSE.length > 0)
		        	   {
		        		 $("#inputContraTypeId").val(res.RESPONSE[0].CONTRACT_ID)
		        		 showLoaderPage(false); 
		        		 showLoaderOwnPage(false,"loaderContranct");
		        	   }
		        	 
		         }else{
				       var MSG = res.MESSAGE;
		         		  console.log(MSG);
				         		 MessageBox("Error", MSG, 'red', 'fa fa-warning');
					  }
				}

		}
       $("#inputContraTypeId").change(function() {
       	if(this.value != "")
       	{
       		CallAPI("getdatalist",{"action":"GETCONTRACTTYPEID","contract_id":this.value},onSuccessGetContraID,onErrorResponse);
       	}
       });
       function onSuccessGetContraID(data, textStatus, jqXHR)
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
		        		 ls_contra_id.push(res.RESPONSE[0].CONTRACT_ID);
		            	 addEMPMethod(ls_contra_id);
		        	   }
		          }else{
				       var MSG = res.MESSAGE;
		         		  console.log(MSG);
				          MessageBox("Error", MSG, 'red', 'fa fa-warning');
					  }
				}
				setTimeout(function(){ showLoaderPage(false); showLoaderOwnPage(false,"loaderContranct"); }, 5000);
		 }
       setTimeout(function(){ showLoaderPage(false); showLoaderOwnPage(false,"loaderContranct"); }, 7000);
<% 
	}else{
%>
		$("#inputContraTypeId").attr("readonly",true);
		showLoaderPage(true);
		showLoaderOwnPage(true,"loaderContranct");
		CallAPI("getdatalist",{"action":"GETCONTRACTTYPEIDDTL","contract_id":""},onSuccessGetUserDetails,onErrorResponse);
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
		        	 setTimeout(function(){ showLoaderPage(true); onloadpage('CONTRA_TYPE_LIST'); }, 3000);
			     }
		         else if (res.STATUS_CD == "0") {
		        	 if(res.RESPONSE.length > 0)
		        	   {
						// ofGetListDataFromMisc("USER_LEVEL","","inputUserType",res.RESPONSE[0].USER_LEVEL_CD);
		        		 SetContractData(res);
		        		 of_set_value_Active(document.getElementById("inputContractStatus"));
		        		 showLoaderPage(false);
		        		 showLoaderOwnPage(false,"loaderContranct");
		        	   }
		        	   else{
		        		   MessageBox("No Data Found", res.MESSAGE, 'red', 'fa fa-warning');
		        		   setTimeout(function(){ showLoaderPage(true); onloadpage('CONTRA_TYPE_LIST'); }, 3000);
		        	   }
		        	 
		         }else{
				       var MSG = res.MESSAGE;
		         		  console.log(MSG);
				         		 MessageBox("Error", MSG, 'red', 'fa fa-warning');
					  }
				}
					setTimeout(function(){ showLoaderPage(false); showLoaderOwnPage(false,"loaderContranct"); }, 5000);
		}
<% 
	}
%>

function ContractSubmit()
{
	var myform = $('#contratypemst');
	$.validator.addMethod("endDate", function(value, element) {
        var startDate = $('#inputStartDt').val();
        return Date.parse(startDate) <= Date.parse(value) || value == "";
    }, "End date must be after start date.");
	$("form[name='contratypemst']").validate({
		rules: {
			inputContraTypeId : {
				required : true,
				number : true,
				checkcontractid : true
			},
			inputContractName : {
				required : true
			},
			inputStartDt : {
				required : true
			},
			inputEndDt : {
				required : true,
				endDate : true
			},
			inputSalaryTemp : {
				required : true
			},
			inputContractStatus : {
				required : true
			}
		},
		ignore: ""
	});
	if(myform.valid())
	{
		var disabled = myform.find(':input:disabled').removeAttr('disabled');
		var form_1=getFormData($("#contratypemst"));
		disabled.attr('disabled','disabled');
		showLoaderPage(true);
		CallAPI("contract_master",form_1,onSuccessContractMaster,onErrorResponse);
	}
}
function onSuccessContractMaster(data, textStatus, jqXHR)
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
   	   			setTimeout(function(){ showLoaderPage(true); onloadpage('CONTRA_TYPE_LIST'); }, 3000);
   	   		}     	 
         }
         else{
			var MSG = res.MESSAGE;
         		  console.log(MSG);
         	MessageBox("Error",MSG, 'red', 'fa fa-warning');
		}
	
	}
}
function of_set_value_Active(activestatus){
	if(activestatus.value == "Y")
	{
		$("#inputInactiveDtdiv").attr("style","display :none");
		$("#inputInactiveDt").val("");
	}else{
		$("#inputInactiveDtdiv").attr("style","");
		func_set_today_date(document.getElementById("inputInactiveDt"));
	}
}
function addEMPMethod(str){
	jQuery.validator.addMethod("checkcontractid", function(value, element) {
	    return !str.includes(value);
	}, "Contact ID already registred ..");
	}
addEMPMethod(ls_contra_id);

</script>