<%@page import="Utility.*"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%
	String username="";
	JSONObject jemp = null;
	JSONArray jResponse = new JSONArray();
	JSONObject jmenu=new JSONObject();
	try {
		GetSession.setServletRequest(request);
		GetSession.sessionValidation(response);
		username = session.getAttribute("USER_ID").toString();
		jmenu =(JSONObject) request.getSession().getAttribute("MENU");
		String emp_list = GetSession.getSessionString("USER_LIST");
		jemp = new JSONObject(emp_list);
	} catch (Exception e) {
		response.getWriter().println("<script>window.location.href='"+ApplicationConfig.LoginPage+"';</script>");
	}
%>
<div class="app">
	<div class="layout">

		<!-- Page Container START -->
		<div class="page-container" style="padding-left: 0px;">


			<!-- Content Wrapper START -->
			<div class="main-content">
				<div class="page-header">
					<h2 class="header-title">User Management</h2>
					<div class="header-sub-title">
						<nav class="breadcrumb breadcrumb-dash">
							<a href="#" class="breadcrumb-item"><i
								class="anticon anticon-home m-r-5"></i>Home</a> <span
								class="breadcrumb-item active">User Management</span>
						</nav>
					</div>
				</div>
				<div class="card">
					<div class="card-body">
						<h4>User management</h4>
						<% 
						    if("Y".equalsIgnoreCase(GetMenu.GetMainMenuCreate(jmenu,"USER_MANGE")))
							{
						%>
								<p align="right"><button class="btn btn-primary" onclick="onloadpage('USER_CREATION')">
									<i class="anticon anticon-plus"></i>
									<span class="m-l-5">New User</span>
								</button></p>
						<%   
							}else{
						%>
							<p></p>
						<%		
							}
						%>
						
						<div class="m-t-25">
							<table id="data-table" class="table">
								<thead>
									<tr>
										<th>Photo</th>
										<th>User ID</th>
										<th>Mobile No.</th>
										<th>Email ID</th>
										<th>User Type</th>
										<th>Status</th>
										<th>Action</th>

									</tr>
								</thead>
								<tbody>
									<%
										try {
											String status = jemp.getString("STATUS_CD");
											if (status.equalsIgnoreCase("0")) {
												jResponse = jemp.getJSONArray("RESPONSE");
												if (jResponse.length() == 0) {
									%>
														<tr>
															<td colspan="10">no data found..</td>
														</tr>
									<%
												} else {
													String tableData = "";
													String user_id="";
													for (int i = 0; i < jResponse.length(); i++) {
														JSONObject jobj1=jResponse.getJSONObject(i);
														user_id=jobj1.getString("USER_ID");
														tableData = "<tr>";
														if(jobj1.getString("USER_PHOTO").equalsIgnoreCase("")){
															tableData = tableData + "<td><div class='avatar avatar-image'><img src='assets/images/avatars/thumb-3.jpg' alt=''></td>";	
														}else{
															tableData = tableData + "<td><div class='avatar avatar-image'><img src='data:image/png;base64,"+jobj1.getString("USER_PHOTO")+"' alt=''></td>";
														}
														tableData = tableData + "<td>"+user_id+"</td>";
														tableData = tableData + "<td>"+jobj1.getString("CONTACT1")+"</td>";
														tableData = tableData + "<td>"+jobj1.getString("EMAIL")+"</td>";
														tableData = tableData + "<td>"+jobj1.getString("USER_LEVEL_CD")+"</td>";
														
														if(jobj1.getString("ACTIVE_STATUS").equalsIgnoreCase("Y"))
															tableData = tableData + "<td><div class=\"form-group d-flex align-items-center\"><div class=\"switch m-r-10\"><input type=\"checkbox\" id=\"switch"+user_id+"\"checked=\"\" disabled=\"disabled\"><label for=\"switch"+user_id+"\"></label></div></div></td>";
														else
															tableData = tableData + "<td><div class=\"form-group d-flex align-items-center\"><div class=\"switch m-r-10\"><input type=\"checkbox\" id=\"switch"+user_id+"\" disabled=\"disabled\"><label for=\"switch"+user_id+"\"></label></div></div></td>";
															
														tableData = tableData + "<td>";
														
														if("Y".equalsIgnoreCase(GetMenu.GetMainMenuUpdate(jmenu, "USER_MANGE")))
														{
															tableData = tableData + "<button class=\"btn btn-primary btn-xs m-r-5\" onClick=\"onconfirm('EDIT','"+user_id+"')\" id=\"edt_"+user_id+"\" name=\"edt_"+user_id+"\">Edit</button>";
														}
														if("Y".equalsIgnoreCase(GetMenu.GetMainMenuDelete(jmenu, "USER_MANGE")) && !username.equalsIgnoreCase(user_id))
														{
															tableData = tableData + "<button class=\"btn btn-danger btn-xs m-r-5\" onClick=\"of_delete_emp(this,'"+user_id+"')\" id=\"dlt_"+user_id+"\" name=\"dlt_"+user_id+"\">Delete</button>";
														}
														tableData = tableData + "</td>";
														tableData = tableData + "</tr>";
														out.println(tableData);
														
													}
												}
											} else {
												String message = jemp.getString("MESSAGE");
									%>
									<tr><td colspan="9" class="error"><%=message%></td></tr>
									<%
										}
										} catch (Exception e) {
											System.out.println("Error in Set User List : " + e);
											out.println("<tr><td colspan='9' class=\"error\">"+ApplicationConfig.ListErrorMsg + "</td></tr>");
										}
									%>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<!-- Content Wrapper END -->

		</div>
		<!-- Page Container END -->
	</div>
</div>

<script src="assets/vendors/datatables/jquery.dataTables.min.js"></script>
<script src="assets/vendors/datatables/dataTables.bootstrap.min.js"></script>
<script src="assets/js/pages/datatables.js"></script>

<script>
function of_delete_emp(thisval,user_id)
{
	//alert(JSON.stringify(thisval));
	showConfirmMessage("Delete?","Are you sure to delete this User?","DELETE",user_id);
}
function onconfirm(req_url,req_data)
{
	var data={"action_id":req_url,"user_id":req_data};
	showLoaderPage(true);
	CallAPI("user_master",data,onSuccessUserMst,onErrorResponse);	
}
function onSuccessUserMst(data, textStatus, jqXHR)
{   
	showLoaderPage(false);
	if (data != "") 
	{
         var res = JSON.parse(data);
         if (res.STATUS_CD == "0") {
        	 if(res.ACTION == "E")
             {
        		 onloadpage('USER_CREATION');
             }
        	 else{
        		 var row = $("#dlt_"+res.USER_ID).closest('tr');
        		 MessageBox("Success", res.MESSAGE, 'green', 'fa fa-green');
        		 row.remove();
             }
        	 	    	    
         }else if (res.STATUS_CD == "9") {
        	 var MSG = res.MESSAGE;
      	     MessageBox("Error", MSG, 'red', 'fa fa-red');
      	     SessionExpire();
         }else {
        	 var MSG = res.MESSAGE;
      	     MessageBox("Error", MSG, 'red', 'fa fa-red');
         }
    }
}
</script>
