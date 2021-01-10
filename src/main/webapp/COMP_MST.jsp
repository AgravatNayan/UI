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
     lb_new=false;
     ls_hidden="UPDATE";
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
               <span class="breadcrumb-item active">Company Profile Master</span>
            </nav>
         </div>
      </div>
      <div class="card">
         <div class="card-body">
            <h4>Company Profile Master</h4>
            <p></p>
            <div class="m-t-25">
               <div class="tab-content m-t-15" id="myTabContentJustified">
                  <div class="tab-pane fade show active" id="General-justified" role="tabpanel" aria-labelledby="home-tab-justified">
                     <p>
                     <form id="inputMasterForm" name="inputMasterForm" onsubmit="return false;">
                        <div class="row">
                           <div class="col">
                              <b><label for="compId">Company Id</label></b>
                              <input type="text" class="form-control" placeholder="Company Id" id="compId" name="compId" maxLength="5" onkeypress="javascript:return isNumeric(event);">
                           </div>
                           <div class="col">
                              <b><label for="compName">Company Name</label></b>
                              <input type="text" class="form-control" placeholder="Company Name" id="compName" name="compName" maxLength="100" onkeypress="javascript:return isAlphaNumeric(event);">
                           </div>
                        </div>
                        </br>
                        <div class="row">
                           <div class="col">
                              <b><label for="tradingName">Trading Name</label></b>
                              <input type="text" class="form-control" placeholder="Trading Name" id="tradingName" name="tradingName" maxLength="50" onkeypress="javascript:return isAlphaNumeric(event);">
                           </div>
                           <div class="col">
                              <b><label for="typeOfbusiness">Type Of Business</label></b>
                              <select id="typeOfbusiness" name="typeOfbusiness" class="form-control">
                                 <option value='' selected>Please select Business Type...</option>
                              </select>
                           </div>
                        </div>
                        </br>
                        <div class="row">
                           <div class="col">
                              <b><label for="gstin">GSTIN</label></b>
                              <input type="text" class="form-control" placeholder="GSTIN No." id="gstin" name="gstin" maxLength="18" onkeypress="javascript:return isAlphaNumeric(event);">
                           </div>
                           <div class="col">
                              <b><label for="inputpan">PAN</label></b>
                              <input type="text" class="form-control" placeholder="Pan No." id="inputpan" name="inputpan" maxLength="10" onkeypress="javascript:return isAlphaNumeric(event);">
                           </div>
                        </div>
                        </br>
                        <div class="row">
                           <div class="col">
                              <b><label for="ADD_1">Contract Reason</label></b>
                              <input type="text" class="form-control" placeholder="Address Line 1" id="ADD_1" name="ADD_1" maxLength="40" onkeypress="javascript:return isAlphaNumeric(event);">
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
                                 <option value='' selected>Please select country...</option>
                              </select>
                           </div>
                           <div class="col">
                              <b><label for="inputState">State</label></b>
                              <select id="inputState" name="inputState" class="form-control">
                                 <option value='' selected>Please select state...</option>
                              </select>
                           </div>
                           <div class="col">
                              <b><label for="inputCity">City</label></b>
                              <select id="inputCity" name="inputCity" class="form-control">
                                 <option value='' selected>Please select city...</option>
                              </select>
                           </div>
                        </div>
                        </br>
                        <div class="row">
                           <div class="col">
                              <b><label for="inputPincode">Pin code</label></b>
                              <input type="number" class="form-control" name="inputPincode" id="inputPincode" placeholder="Pin code" maxLength="6" onkeypress="javascript:return isNumeric(event);">
                           </div>
                           <div class="col">
                              <b><label for="inceptionDate">Inception Date</label></b>
                              <input type="date" class="form-control" placeholder="inception Date" id="inceptionDate" name="inceptionDate">
                           </div>
                        </div>
                        </br>                                 
                        <div class="row">
                           <div class="col">
                              <b><label for="emailId">Email</label></b>
                              <input type="email" class="form-control" placeholder="Email" id="emailId" name="emailId" maxLength="50">
                           </div>
                        </div>
                        </br>
                        <div class="row">
                           <div class="col">
                              <b><label for="contactNo">Contact No.</label></b>
                              <input type="number" class="form-control" placeholder="Contact No." id="contactNo" name="contactNo" maxLength="40" onkeypress="javascript:return isAlphaNumeric(event);">
                           </div>
                           <div class="col">
                              <b><label for="landlineNo">Landline No.</label></b>
                              <input type="number" class="form-control" placeholder="landline No." id="landlineNo" name="landlineNo" maxLength="40" onkeypress="javascript:return isAlphaNumeric(event);">
                           </div>
                        </div>
                        </br>
                        <div class="row">
                           <div class="col">
                              <b><label for="gstin">Tax Deduction No.</label></b>
                              <input type="number" class="form-control" placeholder="GSTIN No." id="gstin" name="gstin" maxLength="40" onkeypress="javascript:return isAlphaNumeric(event);">
                           </div>
                           <div class="col">
                              <b><label for="inputwebsite">Website</label></b>
                              <input type=""number"" class="form-control" placeholder="Pan No." id="inputwebsite" name="inputwebsite" maxLength="100">
                           </div>
                        </div>
                        </br>
                        <div class="row">
                           <div class="col">
                              <b><label for="per_add">Permanent Address</label></b>
                              <input type="text" class="form-control" placeholder="Parmanet Address" id="per_add" name="per_add" maxLength="50" onkeypress="javascript:return isAlphaNumeric(event);">
                           </div>
                        </div>
                        </br>
                        <div class="row">
                           <div class="custom-file">
                              <b><input type="file" onchange="readFile(this,'inputResumeBase64')" class="custom-file-input" id="inputResume" accept=".pdf,.doc"></b>
                              <label class="custom-file-label" for="inputResume">Company Logo</label>
                              <input type="hidden" name="inputResumeBase64" id="inputResumeBase64" >
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
         <div class="card-footer" align="right"><button class="btn btn-primary" id="master_submit" onClick="MasterSubmit()">submit</button></div>
      </div>
   </div>
</div>
</div>
<!-- Page Container END -->