<%@page import="Utility.GetSession"%>
<%@page import="org.json.JSONObject"%>
<%
 JSONObject jmenu=new JSONObject();
 String username="";
 try {
     GetSession.setServletRequest(request);
     GetSession.sessionValidation(response);
 } catch (Exception e) {
     response.getWriter().println("<script>window.location.href='index.jsp';</script>");
 }
 %>
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
               <a class="breadcrumb-item" href="#">Emp. Management</a>
               <span class="breadcrumb-item active">Update Employee</span>
            </nav>
         </div>
      </div>
      <div class="card">
         <div class="card-body">
            <h4>Update Employee Management</h4>
            <p>Enter your Employee details and company related details adde in companny details table and rights assing tab using assign rights.</p>
            <div class="m-t-25">
               <ul class="nav nav-tabs nav-justified" id="myTabJustified" role="tablist">
                  <li class="nav-item">
                     <a class="nav-link active" id="home-tab-justified" data-toggle="tab" href="#General-justified" role="tab" aria-controls="General-justified" aria-selected="true"><b><h4>General Information</h4></b></a>
                  </li>
                  <li class="nav-item">
                     <a class="nav-link" id="profile-tab-justified" data-toggle="tab" href="#Company-justified" role="tab" aria-controls="Company-justified" aria-selected="false"><b><h4>Address Information</h4></b></a>
                  </li>
                 <!--  <li class="nav-item">
                     <a class="nav-link" id="contact-tab-justified" data-toggle="tab" href="#Application-dtl" role="tab" aria-controls="#Application-dtl" aria-selected="false">Application Detail</a>
                  </li>
                  <li class="nav-item">
                     <a class="nav-link" id="contact-tab-justified" data-toggle="tab" href="#Application-justified" role="tab" aria-controls="Application-justified" aria-selected="false">Application Rights Detail</a>
                  </li> -->
               </ul>
               <div class="tab-content m-t-15" id="myTabContentJustified">
                  <div class="tab-pane fade show active" id="General-justified" role="tabpanel" aria-labelledby="home-tab-justified">
                     <p>
                     <form>
                     	<div class="row">
                     		<div class="col">
                              <b><label for="inputState">Employee Id</label></b>
                              <input type="text" class="form-control" placeholder="Employee Id">
                           	</div>                                 	                  
                     	</div>
                     	</br>
                     	<button type="submit" class="btn btn-primary">Retrieve</button>
                     	</br>	
                     	</br>
                        <div class="row">
                           <div class="col">
                             <b><label for="inputState">First Name</label></b>
                              <input type="text" class="form-control" placeholder="First name" required="required">
                           </div>
                           <div class="col">
                              <b><label for="inputState">Middel Name</label></b>
                              <input type="text" class="form-control" placeholder="Middel name" required="required">
                           </div>
                           <div class="col">
                              <b><label for="inputState">Last Name</label></b>
                              <input type="text" class="form-control" placeholder="Last name">
                           </div>
                        </div>
                        </br>
                        <div class="row">
                           <div class="form-group col-md-6">
                              <b><label for="inputState">Email Address</label></b>     
                              <input type="email" class="form-control" id="inputEmail4" placeholder="Email">
                           </div>
                           <div class="col">
                              <b><label for="inputState">Joining Date</label></b>
                              <input type="date" class="form-control" placeholder="Joining Date">
                           </div>
                           <div class="col">
                              <b><label for="inputState">Birth Date</label></b>
                              <input type="date" class="form-control" placeholder="Birth Date">
                           </div>
                        </div>
                        </br>
                        <div class="row">
                           <div class="col">
                              <b><label for="inputState">Religion</label></b>
                              <select id="inputState" class="form-control">
                                 <option selected>Choose...</option>
                                 <option>Hindu</option>
                              </select>
                           </div>
                           <div class="col">
                              <b><label for="inputState">Gender</label></b>
                              <select id="inputState" class="form-control">
                                 <option selected>Choose...</option>
                                 <option>Male</option>
                                 <option>Female</option>
                              </select>
                           </div>
                           <div class="col">
                              <b><label for="inputState">Blood Group</label></b>
                              <select id="inputState" class="form-control">
                                 <option selected>Choose...</option>
                                 <option>O Positive</option>
                                 <option>A Positive</option>
                                 <option>B Positive</option>
                              </select>
                           </div>
                           <div class="col">
                              <b><label for="inputState">Marital Status</label></b>
                              <select id="inputState" class="form-control">
                                 <option selected>Choose...</option>
                                 <option>Married</option>
                                 <option>Unmarried</option>
                              </select>
                           </div>
                        </div>
                        </br>
                        <div class="row">
                           <div class="col">
                              <b><label for="inputState">Highest Eduction</label></b>
                              <input type="text" class="form-control" placeholder="Highest Eduction">
                           </div>
                        </div>                        
                        </br>
                        <div class="row">
                        	<div class="col">
                              <b><label for="inputState">Active Status</label></b>
                              <select id="inputState" class="form-control">
                                 <option selected>Choose...</option>
                                 <option>Active</option>
                                 <option>Inactive</option>
                              </select>
                           </div>   
                           <div class="col">
                              <b><label for="inputState">Aadhar Card</label></b>
                              <input type="text" class="form-control" placeholder="Aadhar Card">
                           </div>
                           <div class="col">
                              <b><label for="inputState">Pan Card</label></b>
                              <input type="text" class="form-control" placeholder="Pan Card">
                           </div>
                        </div>
                        </br>
                        <div class="row">                           
                           <div class="col">
                              <b><label for="inputState">Ref. Employee Id</label></b>
                              <input type="text" class="form-control" placeholder="Ref. Employee Id">
                           </div>
                           <div class="col">
                              <b><label for="inputState">Confirmation Date</label></b>
                              <input type="date" class="form-control" placeholder="Confirmation Date">
                           </div>                         
                        </div>
                        </br>
                        <div class="row">
                           <div class="col">
                              <b><label for="inputState">Ref. Remarks</label></b>
                              <input type="text" class="form-control" placeholder="Ref. Remarks">
                           </div>
                        </div>
                        </br>
                        <div class="row">
                           <div class="col">
                              <b><label for="inputState">Primary Contact No.</label></b>
                              <input type="number" class="form-control" placeholder="Ref. Remarks">
                           </div>
                           <div class="col">
                              <b><label for="inputState">Sec. Contact No.</label></b>
                              <input type="number" class="form-control" placeholder="Ref. Remarks">
                           </div>
                        </div>
                        </br>
                        <div class="row">
                           <div class="col">
                              <b><label for="inputState">Leaving Date</label></b>
                              <input type="date" class="form-control" placeholder="Confirmation Date">
                           </div>
                           <div class="col">
                              <b><label for="inputState">Retirement Date</label></b>
                              <input type="date" class="form-control" placeholder="Retirement Date">
                           </div>
                           <div class="col">
                              <b><label for="inputState">Leaving Reason</label></b>
                              <input type="text" class="form-control" placeholder="Leaving Reason">
                           </div>
                        </div>
                        </br>
                        <div class="row">
                        	<div class="col">
                              <b><label for="inputState">Remarks</label></b>
                              <input type="text" class="form-control" placeholder="Remarks">
                           </div>
                        </div>
                        </br>
                        <div class="row">
                           <div class="custom-file">
                              <b><input type="file" class="custom-file-input" id="customFile"></b>
                              <label class="custom-file-label" for="customFile">Resume</label>
                           </div>
                        </div>
                        <input type="submit">
                     </form>
                     </p>
                  </div>
                   <div class="tab-pane fade" id="Company-justified" role="tabpanel" aria-labelledby="profile-tab-justified">
                     <p>
                     	<form>
                     	<h2><label for="inputState">Permanent Address</label></h2>
						 <div class="row">
                           <div class="col">
                              <b><label for="inputState">Address Line 1</label></b>
                              <input type="text" class="form-control" placeholder="Address Line 1">
                           </div>
                        </div>
                        </br>
                        <div class="row">
                           <div class="col">
                              <b><label for="inputState">Address Line 2</label></b>
                              <input type="text" class="form-control" placeholder="Address Line 2">
                           </div>
                        </div>
                        </br>
                        <div class="row">
                           <div class="col">
                              <b><label for="inputState">Address Line 3</label></b>
                              <input type="text" class="form-control" placeholder="Address Line 3">
                           </div>
                        </div>
                        </br>
                        <div class="row">
                           <div class="col">
                              <b><label for="inputState">Country</label></b>
                              <select id="inputState" class="form-control">
                                 <option selected>Choose...</option>
                                 <option>India</option>
                                 <option>Nepal</option>
                                 <option>US</option>
                              </select>
                           </div>
                           <div class="col">
                              <b><label for="inputState">State</label></b>
                              <select id="inputState" class="form-control">
                                 <option selected>Choose...</option>
                                 <option>Gujrat</option>
                                 <option>Maharastra</option>
                                 <option>Rajesthan</option>
                              </select>
                           </div>                           
                        </div>
                        </br>
                        <div class="row">
                        	<div class="col">
                              <b><label for="inputState">City</label></b>
                              <select id="inputState" class="form-control">
                                 <option selected>Choose...</option>
                                 <option>Ahmedabad</option>
                                 <option>Surat</option>
                                 <option>Rajkot</option>
                              </select>
                           </div>
                           <div class="col">
                              <b><label for="inputState">Pin code</label></b>
                              <select id="inputState" class="form-control">
                                 <option selected>Choose...</option>
                                 <option>361350</option>
                                 <option>380013</option>
                                 <option>380007</option>
                              </select>
                           </div>
                          </div>
                          </br></br>
                         <h2><label for="inputState">Temporary Address</label></h2>
                         <div class="row">
                         	<div class="col">
                           			<label>Permanent Address Same As Temporary Address &nbsp;</label>
                           				<div class="switch m-r-10">
                              				<input type="checkbox" id="switch-1" checked="">
                              				<label for="switch-1"></label>
                           				</div>
                           		</div>  
                         </div>
						 <div class="row">
                           <div class="col">
                              <b><label for="inputState">Address Line 1</label></b>
                              <input type="text" class="form-control" placeholder="Address Line 1">
                           </div>
                        </div>
                        </br>
                        <div class="row">
                           <div class="col">
                              <b><label for="inputState">Address Line 2</label></b>
                              <input type="text" class="form-control" placeholder="Address Line 2">
                           </div>
                        </div>
                        </br>
                        <div class="row">
                           <div class="col">
                              <b><label for="inputState">Address Line 3</label></b>
                              <input type="text" class="form-control" placeholder="Address Line 3">
                           </div>
                        </div>
                        </br>
                        <div class="row">
                           <div class="col">
                              <b><label for="inputState">Country</label></b>
                              <select id="inputState" class="form-control">
                                 <option selected>Choose...</option>
                                 <option>India</option>
                                 <option>Nepal</option>
                                 <option>US</option>
                              </select>
                           </div>
                           <div class="col">
                              <b><label for="inputState">State</label></b>
                              <select id="inputState" class="form-control">
                                 <option selected>Choose...</option>
                                 <option>Gujrat</option>
                                 <option>Maharastra</option>
                                 <option>Rajesthan</option>
                              </select>
                           </div>                           
                        </div>
                        </br>
                        <div class="row">
                        	<div class="col">
                              <b><label for="inputState">City</label></b>
                              <select id="inputState" class="form-control">
                                 <option selected>Choose...</option>
                                 <option>Ahmedabad</option>
                                 <option>Surat</option>
                                 <option>Rajkot</option>
                              </select>
                           </div>
                           <div class="col">
                              <b><label for="inputState">Pin code</label></b>
                              <select id="inputState" class="form-control">
                                 <option selected>Choose...</option>
                                 <option>361350</option>
                                 <option>380013</option>
                                 <option>380007</option>
                              </select>
                           </div>
                          </div>
                          </form>
                     </p>
                  </div>
                  <div class="tab-pane fade" id="Application-justified" role="tabpanel" aria-labelledby="contact-tab-justified">
                     <p>
                     	<form>
                           	<div class="row">
                           		<div class="col">
                           			<label>Dashboard</label>
                           				<div class="switch m-r-10">
                              				<input type="checkbox" id="switch-1" checked="">
                              				<label for="switch-1"></label>
                           				</div>
                           		</div>
                           		<div class="col">
                           			<label>HRMS</label>
                           				<div class="switch m-r-10">
                              				<input type="checkbox" id="switch-2" checked="">
                              				<label for="switch-2"></label>
                           				</div>
                           		</div>
                           	</div>
                           	</br>
                           	<div class="row">
                           		<div class="col">
                           			<label>Lead Management</label>
                           				<div class="switch m-r-10">
                              				<input type="checkbox" id="switch-3" checked="">
                              				<label for="switch-3"></label>
                           				</div>
                           		</div>
                           		<div class="col">
                           			<label>Order Management</label>
                           				<div class="switch m-r-10">
                              				<input type="checkbox" id="switch-4" checked="">
                              				<label for="switch-4"></label>
                           				</div>
                           		</div>                                    	
                           	</div>
                           	</br>
                           	<div class="row">
                           		<div class="col">
                           			<label>Sale Management</label>
                           				<div class="switch m-r-10">
                              				<input type="checkbox" id="switch-5" checked="">
                              				<label for="switch-5"></label>
                           				</div>
                           		</div>
                           		<div class="col">
                           			<label>Knowle & Annoc</label>
                           				<div class="switch m-r-10">
                              				<input type="checkbox" id="switch-6" checked="">
                              				<label for="switch-6"></label>
                           				</div>
                           		</div>                                    	
                           	</div>
                           	</br>
                           	<div class="row">
                           		<div class="col">
                           			<label>Task Management</label>
                           				<div class="switch m-r-10">
                              				<input type="checkbox" id="switch-7" checked="">
                              				<label for="switch-7"></label>
                           				</div>
                           		</div>
                           		<div class="col">
                           			<label>Contact Management</label>
                           				<div class="switch m-r-10">
                              				<input type="checkbox" id="switch-8" checked="">
                              				<label for="switch-8"></label>
                           				</div>
                           		</div>                                    	
                           	</div>
                           	</br>
                           	<div class="row">
                           		<div class="col">
                           			<label>Customer Management</label>
                           				<div class="switch m-r-10">
                              				<input type="checkbox" id="switch-9" checked="">
                              				<label for="switch-9"></label>
                           				</div>
                           		</div>
                           		<div class="col">
                           			<label>Ticket Management</label>
                           				<div class="switch m-r-10">
                              				<input type="checkbox" id="switch-10" checked="">
                              				<label for="switch-10"></label>
                           				</div>
                           		</div> 
                           	</div>                                   	
                           	</br>
                           	<div class="row">
                           		<div class="col">
                           			<label>Customer Management</label>
                           				<div class="switch m-r-10">
                              				<input type="checkbox" id="switch-11" checked="">
                              				<label for="switch-11"></label>
                           				</div>
                           		</div>                           		                                   
                           	</div>                           	
                     	</form>
                     </p>
                  </div>
                  <div class="tab-pane fade" id="Application-dtl" role="tabpanel" aria-labelledby="contact-tab-justified">
                     <p>                                         
                     	<form>
                     		<div class="row">
                     			<div class="col">
                              		<label for="inputState">User Id</label>
                              		<input type="text" class="form-control" placeholder="User Id">
                           		</div>                     		
                     			<div class="col">
                              		<label for="inputState">User Level</label>
                              		<select id="inputState" class="form-control">
                                 		<option selected>Choose...</option>
                                 		<option>HR</option>
                                 		<option>Employee</option>
                                 		<option>Accouttant</option>
                                 		<option>Admin</option>
                              		</select>
                           		</div>
                           	</div>
                           	</br>
                           	<div class="row">
                           		<div class="col">
                              		<label for="inputState">Password</label>
                              		<input type="password" class="form-control" placeholder="Password">
                           		</div> 
                           		<div class="col">
                              		<label for="inputState">Confirm Password</label>
                              		<input type="text" class="form-control" placeholder="Confirm Password">
                           		</div> 
                           	</div>
                           	</br>
                           	<div class="row">
                           		<div class="col">
                           			<label>Generate  Password at nextr login &nbsp;</label>
                           				<div class="switch m-r-10">
                              				<input type="checkbox" id="switch-1" checked="">
                              				<label for="switch-1"></label>
                           				</div>
                           		</div>                           	
                           	</div>
                     	</form>
                     </p>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>
</div>
<!-- Page Container END -->