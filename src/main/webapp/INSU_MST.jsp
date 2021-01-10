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
    	 String ls_edit=request.getSession().getAttribute("INSU_UPD_REQ").toString();
    	 if("Y".equalsIgnoreCase(ls_edit)){
    		 lb_new=false;
    		 session.setAttribute("INSU_UPD_REQ","N");
    		 ls_hidden="UPDATE";
    	 }else{lb_new=true;}
     }
     catch(Exception e){lb_new=true;}
     
    // jemp_mst =(JSONObject) request.getSession().getAttribute("MENU");
 } catch (Exception e) {
     response.getWriter().println("<script>window.location.href='"+ApplicationConfig.LoginPage+"';</script>");
 }
 %>
 <div id="loaderInsurance"></div>
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
               <span class="breadcrumb-item active">Insurance Master</span>
            </nav>
         </div>
      </div>
      <div class="card">
         <div class="card-body">
            <h4>Insurance Master</h4>
            <p></p>
            <div class="m-t-25">           
               <div class="tab-content m-t-15" id="myTabContentJustified">
                  <div class="tab-pane fade show active" id="General-justified" role="tabpanel" aria-labelledby="home-tab-justified">
                     <p>
                     <form id="insuMasterForm" name="insuMasterForm" onsubmit="return false;">
                      <input type="hidden" id="action_id" name="action_id" value="<%=ls_hidden%>">                     	
                     	<div class="row">
                        	<div class="col">
                              <b><label for="InsuranceId">Insurance Id</label></b>
                              <input type="text" class="form-control" placeholder="Please enter Insurance Id" id="InsuranceId" name="InsuranceId" maxLength="15" onkeypress="javascript:return isNumeric(event);">
                           </div>  
                           <div class="col">
                              <b><label for="InsuranceType">Insurance Type</label></b>
                              <select id="InsuranceType" name="InsuranceType" class="form-control">
                                 <option value="" selected>Please select insurance Type..</option>
                              </select>
                           </div>                           
                        </div>
                        </br>
                        <div class="row">
                        	<div class="col">
                              <b><label for="InsuranceName">Insurance Name</label></b>
                              <input type="text" class="form-control" placeholder="Insurance name" id="InsuranceName" name="InsuranceName" maxLength="40" onkeypress="javascript:return isAlphaNumeric(event);">
                           </div>                           
                        </div>
                        </br>
                        <div class="row">
                        	<div class="col">
                              <b><label for="inputStartDt">Start Date</label></b>
                              <input type="date" class="form-control" placeholder="Start Date" id="inputStartDt" name="inputStartDt"> 
                           </div>   
                           <div class="col">
                              <b><label for="inputEnddate">End Date</label></b>
                              <input type="date" class="form-control" placeholder="End Date" id="inputEnddate" name="inputEnddate">
                           </div>                           
                        </div>                                               
                       	</br>
                        <div class="row">
                           <div class="col">
                              <b><label for="inputInsuranceStatus">Insurance Status</label></b>
                              <select id="inputInsuranceStatus" name="inputInsuranceStatus" class="form-control" onchange="of_set_Active_status(this)">
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
                        <div class="row">
                        	<div class="col">
                              <b><label for="InsuranceAgency">Insurance Agency</label></b>
                              <input type="text" class="form-control" placeholder="Insurance Agency" id="InsuranceAgency" name="InsuranceAgency" maxLength="40" onkeypress="javascript:return isAlphaNumeric(event);">
                           </div>  
                           <div class="col">
                              <b><label for="InsuranceAgencyId">Insurance Agency Id</label></b>
                              <input type="text" class="form-control" placeholder="Insurance Agency Id" id="InsuranceAgencyId" name=InsuranceAgencyId maxLength="40" onkeypress="javascript:return isAlphaNumeric(event);">
                           </div>   
                        </div>
                        </br>
                        <div class="row">
                        	<div class="col">
                              <b><label for="InsurancePre">Insurance Premium</label></b>
                              <input type="text" class="form-control" placeholder="Insurance Premium" id="InsurancePre" name=InsurancePre maxLength="12" onkeypress="javascript:return isNumeric(event);">
                           </div> 
                           <div class="col">
                              <b><label for="InsuranceCustNo">Insurance Customer No</label></b>
                              <input type="text" class="form-control" placeholder="Insurance Customer No" id="InsuranceCustNo" name=InsuranceCustNo maxLength="40" onkeypress="javascript:return isAlphaNumeric(event);">
                           </div> 
                        </div>   
                        </br>
                        <div class="row">
                        	 <div class="custom-file">
                              <b><input type="file" onchange="readFile(this,'inputPolicyBase64')" class="custom-file-input" id="inputPolicy" accept=".pdf,.doc"></b>
                              <label class="custom-file-label" for="inputPolicy">Insurance policy</label>
                              <input type="hidden" name="inputPolicyBase64" id="inputPolicyBase64" >
                           </div>
                        </div>
                        </br>
<!--                         <button type="submit" id="insu_mst" onClick="" class="btn btn-primary">Submit</button>                                                                                                      -->
                     </form>
                     </p>
                  </div>                   
               </div>
            </div>
         </div>
         <br>
         <div class="card-footer" align="right"><button class="btn btn-white" id="insu_mst_back" onClick="onloadpage('INSU_LIST')">Back</button>&nbsp;&nbsp;<button class="btn btn-primary" id="insu_mst_submit" onClick="InsuranceSubmit()">submit</button></div>
      </div>
   </div>
</div>
</div>
<!-- Page Container END -->
<script>
var ls_insu_id=[];
<% 	
	if(lb_new){
%>
		showLoaderPage(true);
		showLoaderOwnPage(true,"loaderInsurance");
		$("#inputInsuranceStatus").val("Y");
		$("#inputInsuranceStatus").attr("disabled",true);
		ofGetListData("GetInsuList","","InsuranceType","");
		CallAPI("getdatalist",{"action":"GETINSUMAXID","contract_id":""},onSuccessGetMaxID,onErrorResponse);
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
		        	 setTimeout(function(){ showLoaderPage(false); showLoaderOwnPage(false,"loaderInsurance"); onloadpage('INSU_LIST'); }, 3000);
			     }
		         else if (res.STATUS_CD == "0") {
		        	 if(res.RESPONSE.length > 0)
		        	   {
		        		 $("#InsuranceId").val(res.RESPONSE[0].CONTRACT_ID)
		        		 showLoaderPage(false); 
		        		 showLoaderOwnPage(false,"loaderInsurance");
		        	   }
		        	 
		         }else{
				       var MSG = res.MESSAGE;
		         		  console.log(MSG);
				         	MessageBox("Error", MSG, 'red', 'fa fa-warning');
					  }
				}

		}
        $("#InsuranceId").change(function() {
           	if(this.value != "")
           	{
           		CallAPI("getdatalist",{"action":"GetIsuranceId","insurance_id":this.value},onSuccessGetInsuID,onErrorResponse);
           	}
           });
        function onSuccessGetInsuID(data, textStatus, jqXHR)
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
		        		 ls_insu_id.push(res.RESPONSE[0].INSU_ID);
		        		 addInsuranceMethod(ls_insu_id);
		        	   }
		          }else{
				       var MSG = res.MESSAGE;
		         		  console.log(MSG);
				          MessageBox("Error", MSG, 'red', 'fa fa-warning');
					  }
				}
				setTimeout(function(){ showLoaderPage(false); showLoaderOwnPage(false,"loaderInsurance"); }, 5000);
		 }
        setTimeout(function(){ showLoaderPage(false); showLoaderOwnPage(false,"loaderInsurance"); }, 5000);
<% 
	}else{
%>
	$("#InsuranceId").attr("readonly",true);
	showLoaderPage(true);
	showLoaderOwnPage(true,"loaderInsurance");
	CallAPI("getdatalist",{"action":"GetIsuranceIdDtl","insu_id":""},onSuccessGetInsuID,onErrorResponse);
	function onSuccessGetInsuID(data, textStatus, jqXHR)
	{
		if (data != "") 
		{
			var res = JSON.parse(data);
	         if (res.STATUS_CD == "999") {
	        	 var MSG = res.MESSAGE;
	         	 console.log(MSG);
	         	 MessageBox("Error", MSG, 'red', 'fa fa-warning');
	         	setTimeout(function(){ showLoaderPage(true); onloadpage('INSU_LIST'); }, 3000);
	         }else if (res.STATUS_CD == "99") {
	        	 var MSG = res.MESSAGE;
	        	 console.log(MSG);
	        	 MessageBox("Error", MSG, 'red', 'fa fa-warning');
	        	 setTimeout(function(){ showLoaderPage(true); onloadpage('INSU_LIST'); }, 3000);
	         }else if (res.STATUS_CD == "9") { ///Session Expire
	        	 MessageBox("Expire", res.MESSAGE, 'red', 'fa fa-warning');
	        	 SessionExpire();
		     }else if (res.STATUS_CD == "1") { ///Session Expire
		    	 MessageBox("No Found", res.MESSAGE, 'red', 'fa fa-warning');
	        	 setTimeout(function(){ showLoaderPage(false); showLoaderOwnPage(false,"loaderInsurance"); onloadpage('INSU_LIST'); }, 3000);
		     }
	         else if (res.STATUS_CD == "0") {
	        	 if(res.RESPONSE.length > 0)
	        	   {
					// ofGetListDataFromMisc("USER_LEVEL","","inputUserType",res.RESPONSE[0].USER_LEVEL_CD);
	        		 SetInsuranceData(res);
	        		 ofGetListData("GetInsuList","","InsuranceType",res.RESPONSE[0].INSU_TYPE);
	        		 of_set_Active_status(document.getElementById("inputInsuranceStatus"));
	        		 showLoaderPage(false);
	        		 showLoaderOwnPage(false,"loaderInsurance");
	        	   }
	        	   else{
	        		   MessageBox("No Data Found", res.MESSAGE, 'red', 'fa fa-warning');
	        		   setTimeout(function(){ showLoaderPage(true);showLoaderOwnPage(false,"loaderInsurance"); onloadpage('INSU_LIST'); }, 3000);
	        	   }
	          }else{
			       var MSG = res.MESSAGE;
	         		  console.log(MSG);
			          MessageBox("Error", MSG, 'red', 'fa fa-warning');
				  }
			}			
	 }
	setTimeout(function(){ showLoaderPage(false); showLoaderOwnPage(false,"loaderInsurance"); }, 5000);
<%
	}
%>
of_set_Active_status(document.getElementById("inputInsuranceStatus"));
function InsuranceSubmit()
{
	var myform = $('#insuMasterForm');
	$.validator.addMethod("endDate", function(value, element) {
        var startDate = $('#inputStartDt').val();
        return Date.parse(startDate) <= Date.parse(value) || value == "";
    }, "End date must be after start date.");
	$("form[name='insuMasterForm']").validate({
		rules: {
			InsuranceId : {
				required : true,
				number : true,
				checkinsuranceid : true
			},
			InsuranceType : {
				required : true
			},
			InsuranceName : {
				required : true
			},
			inputStartDt : {
				required : true
			},
			inputEnddate : {
				required : true,
				endDate : true
			},
			inputInsuranceStatus : {
				required : true
			},
			InsuranceAgency : {
				required : true
			},
			InsuranceAgencyId : {
				required : true
			},
			InsurancePre : {
				required : true
			},
			InsuranceCustNo : {
				required : true
			}			
			
		},
		ignore: ""
	});
	if(myform.valid())
	{
		var disabled = myform.find(':input:disabled').removeAttr('disabled');
		var form_1=getFormData($("#insuMasterForm"));
		disabled.attr('disabled','disabled');
		showLoaderPage(true);
		showLoaderOwnPage(true,"loaderInsurance"); 
		CallAPI("insu_master",form_1,onSuccessInsuranceMaster,onErrorResponse);
	}
}
function onSuccessInsuranceMaster(data, textStatus, jqXHR)
{   
	showLoaderPage(false);
	showLoaderOwnPage(false,"loaderInsurance"); 
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
   	   			setTimeout(function(){ showLoaderPage(true); onloadpage('INSU_LIST'); }, 3000);
   	   		}     	 
         }
         else{
			var MSG = res.MESSAGE;
         		  console.log(MSG);
         	MessageBox("Error",MSG, 'red', 'fa fa-warning');
		}
	
	}
}
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
function addInsuranceMethod(str){
	jQuery.validator.addMethod("checkinsuranceid", function(value, element) {
	    return !str.includes(value);
	}, "Insurance ID already registred ..");
	}
addInsuranceMethod(ls_insu_id);
</script>