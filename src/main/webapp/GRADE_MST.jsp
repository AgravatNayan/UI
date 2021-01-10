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
    	 String ls_edit=request.getSession().getAttribute("GRADE_UPD_REQ").toString();
    	 if("Y".equalsIgnoreCase(ls_edit)){
    		 lb_new=false;
    		 session.setAttribute("GRADE_UPD_REQ","N");
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
               <span class="breadcrumb-item active">Grade Master</span>
            </nav>
         </div>
      </div>
      <div class="card">
         <div class="card-body">
            <h4>Grade Master</h4>
            <p></p>
            <div class="m-t-25">           
               <div class="tab-content m-t-15" id="myTabContentJustified">
                  <div class="tab-pane fade show active" id="General-justified" role="tabpanel" aria-labelledby="home-tab-justified">
                     <p>
                     <form id="inputMasterForm" name="inputMasterForm" onsubmit="return false;">
                     <input type="hidden" id="action_id" name="action_id" value="<%=ls_hidden%>">                     	
                     	<div class="row">
                        	<div class="col">
                              <b><label for="gradeId">Grade Id</label></b>
                              <input type="text" class="form-control" placeholder="Grade Id" id="gradeId" name="gradeId" maxLength="12" onkeypress="javascript:return isNumeric(event);">
                           </div>  
                           <div class="col">
                              <b><label for="gradeName">Grade Name</label></b>
                              <input type="text" class="form-control" placeholder="Grade Name" id="gradeName" name="gradeName" maxLength="40" onkeypress="javascript:return isAlphaNumeric(event);">
                           </div>                          
                        </div>
                        </br>                        
                        <div class="row">
                        	<div class="col">
                              <b><label for="inputStatus">Grade Status</label></b>
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
                        
                          <!-- <div class="row">                                
                           <div class="col">
                              <b><label for="remarks">Remarks</label></b>
                              <input type="text" class="form-control" placeholder="Remarks" id="remarks" name="remarks" maxLength="40" onkeypress="javascript:return isAlphaNumeric(event);">
                           </div>                       
                        </div>  -->                       
                        </br>
<!--                         <button type="submit" id="emp_reg_sub2" onClick="" class="btn btn-primary">Submit</button>                                                                                                      -->
                     </form>
                     </p>
                  </div>                   
               </div>
            </div>
         </div>
         <br>
         <div class="card-footer" align="right"><button class="btn btn-white" id="grade_mst_back" onClick="onloadpage('GRADE_LIST')">Back</button>&nbsp;&nbsp;<button class="btn btn-primary" id="grade_mst_submit" onClick="gradeSubmit()">submit</button></div>
      </div>
   </div>
</div>
<!-- Page Container END -->
<script>
var ls_duplicate_id=[];
var ls_list_page="GRADE_LIST";
<% 	
	if(lb_new){
%>
		showLoaderPage(true);
		showLoaderOwnPage(true,"loadersubpage");
		$("#inputStatus").val("Y");
		$("#inputStatus").attr("disabled",true);
		CallAPI("getdatalist",{"action":"GETMAXGRADE","desig_id":""},onSuccessGetMaxID,onErrorResponse);
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
		        		 $("#gradeId").val(res.RESPONSE[0].GRADE_ID)
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
        $("#gradeId").change(function() {
           	if(this.value != "")
           	{
           		CallAPI("getdatalist",{"action":"GetGradeIdDtl","grade_id":this.value},onSuccessGetInsuID,onErrorResponse);
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
		        		 ls_duplicate_id.push(res.RESPONSE[0].DESIG_ID);
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
        //setTimeout(function(){ showLoaderPage(false); showLoaderOwnPage(false,"loaderShift"); }, 5000);
<% 
	}else{
%>
	$("#gradeId").attr("readonly",true);
	showLoaderPage(true);
	showLoaderOwnPage(true,"loadersubpage");
	CallAPI("getdatalist",{"action":"GetGradeIdDtl","grade_id":""},onSuccessGetIDDetails,onErrorResponse);
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
					 SetGradeData(res);
	        		 of_set_Active_status(document.getElementById("inputStatus"));
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
<%
	}
%>
of_set_Active_status(document.getElementById("inputStatus"));
$("#inputInactiveDt").attr("readonly",true);
function gradeSubmit()
{
	var myform = $('#inputMasterForm');
	$("form[name='inputMasterForm']").validate({
		rules: {
			gradeId : {
				required : true,
				number : true,
				checkduplicateid : true
			},
			gradeName : {
				required : true
			},
			inputStatus : {
				required : true
			}/* ,
			remarks : {
				required : true
			} */		
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
		CallAPI("grade_master",form_1,onSuccessOwnMaster,onErrorResponse);
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
	}, "Grade ID already registred ..");
	}
addMethod(ls_duplicate_id);
</script>