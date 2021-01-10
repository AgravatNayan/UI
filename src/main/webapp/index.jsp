<!-- Auther By : Agravat Nayan  -->
<!-- Detail    : Login Page     -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="Utility.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>CRM - Advance Biofuel</title>

    <!-- Favicon -->
    <link rel="shortcut icon" href="assets/images/logo/fi.png">

    <!-- page css -->

    <!-- Core css -->
    <link href="assets/css/app.min.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/loader.css">
</head>

<body style="background-color: #FFF59D;" onload="LogoutUser()">
    <div id="loader"></div>
    <div class="app">
        <div class="container-fluid">
            <div class="d-flex full-height p-v-15 flex-column justify-content-between">
                <div class="d-none d-md-flex p-h-40">
                    <img src="assets/images/logo/logo_-_Copy-removebg-preview (3) (1).png" height="80px" alt="">
                </div>
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-md-5">
                            <div class="card">
                                <div class="card-body">
                                    <h2 class="m-t-20">Sign In</h2>
                                    <p class="m-b-30">Enter your credential to get access</p>
                                    <form action="#" method="Post" onsubmit="return false">
                                        <div class="form-group">
                                            <label class="font-weight-semibold" for="userName">Username:</label>
                                            <div class="input-affix">
                                                <i class="prefix-icon anticon anticon-user"></i>
                                                <input type="text" class="form-control" name="userName" id="userName" placeholder="Username" required="required">                                                                                                
                                            </div>
                                        </div>
                                        <p style="color: red;" id="error_usd">${ERROR_USD}</p>
                                        <div class="form-group">
                                            <label class="font-weight-semibold" for="password">Password:</label>
                                            
                                            <div class="input-affix m-b-10">
                                                <i class="prefix-icon anticon anticon-lock"></i>
                                                <input type="password" class="form-control" id="password" name="password" placeholder="Password" required="required">                                                                                             
                                            </div>                                            
                                        </div>
                                        <p style="color: red;" id="error_pwd">${ERROR_PWD}</p>
                                        <a class="float-right font-size-13 text-muted" href="#">Forget Password?</a>
                                        </br>
                                        <div style="color: red;" id="error_msg"></div>                                        
                                        </br>
                                        </br>
                                        <div class="form-group">
                                            <div class="d-flex align-items-center justify-content-between">
                                                <!-- <span class="font-size-13 text-muted">
                                                    Don't have an account? 
                                                    <a class="small" href="#"> Signup</a>  -->
                                                </span>
                                                <button class="btn btn-primary" id="attantionid" onclick="LoginReq()" >Sign In</button>
                                            </div>
                                        </div>
                                        
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="offset-md-1 col-md-6 d-none d-md-block">
                            <img class="img-fluid" src="assets/images/others/login-2.svg" alt="">
                        </div>
                    </div>
                </div>
                <div class="d-none d-md-flex  p-h-40 justify-content-between">
                    <span class="">© 2020 WeTech</span>
                    <ul class="list-inline">
                        <li class="list-inline-item">
                            <a class="text-dark text-link" href="#">Legal</a>
                        </li>
                        <li class="list-inline-item">
                            <a class="text-dark text-link" href="#">Privacy</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    
    <!-- Core Vendors JS -->
    <script src="assets/js/vendors.min.js"></script>
     <script src="assets/js/jquery.min.js"></script>

    <!-- page js -->

    <!-- Core JS -->
    <script src="assets/js/app.min.js"></script>
   	<script>
   	function LoginReq()
   	{   		
   	  var username=$('#userName').val();
   	  var password=$('#password').val();
   	  	  
   	  var ib_req = true;
   	  $('#error_usd').html("");
   	  $('#error_pwd').html("");
   	  $('#error_msg').html("");
   	  if(of_isEmpty(username))
   	  {
   	  	ib_req = false;
   	  	$('#userName').focus();
   	  	$('#error_usd').html("Please Enter Username.");
   	  }
   	  
   	if(of_isEmpty(password))
 	  {
 	  	ib_req = false;
 	  	$('#userName').focus();
 	  	$('#error_pwd').html("Please Enter password.");
 	  }   	   	 
   	
   	if(ib_req){
   		var req_data={"USERNAME":username,"PASSWORD":password}; 
   		showLoaderPage(true);
   		$.ajax({
   	            type: "POST",
   	            url: "Login",
   	            timeout: 60000,
   	            data: req_data,
   	            success: onSuccessLogin,
   	            error: onErrorLogin
   	        });
   		}
   	}
   	function onErrorLogin(request, type, errorThrown)
   	{
   		showLoaderPage(false);
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
        //alert();
        $('#error_pwd').html("");
        $('#error_msg').html(message);
        //MessageBox('Error', message, 'red', 'fa fa-warning');
        
   	}
   	function onSuccessLogin(data, textStatus, jqXHR)
   	{   
   		showLoaderPage(false);
   		if (data != "") 
   		{
   	         var res = JSON.parse(data);
   	         if (res.STATUS_CD == "999") {
   	        	    $('#password').val("");
   	      	  	    $('#username').val("");
   	         		var MSG = res.MESSAGE;
   	         		$('#error_msg').html(MSG);
   	         }else if (res.STATUS_CD == "99") {
   	        	    $('#password').val("");
   	         		var MSG = res.MESSAGE;
   	         		$('#error_msg').html(MSG);
   	         }
   	         else{
				    $('#password').val("");
   	         		var MSG = res.MESSAGE;
   	                $('#error_msg').html(MSG);
				}
			
		}
	}
   	function of_isEmpty(data)
   	{
   		if (data == null || data == "")
   		{
   			return true;
   		}
   		return false;
   	}   	
   	function showLoaderPage(value) {
        if (value)
        {
            $('#loader').html('<div class="loader"><div class="status"></div></div>');
        } else
        {
            $('#loader').html('');
        }

    }
<%--    	<%
   	boolean lb_login=true;
   	try {
		GetSession.setServletRequest(request);
		if("true".equalsIgnoreCase(GetSession.getSessionString("logon")))
		{
			lb_login=true;	
		}else{lb_login=false;}
		
   		}catch(Exception e){lb_login=false;}
   		if (lb_login)
   		{
 %>
 			LogoutUser();
 <%  			
   		}
   	%>
 --%>   	function LogoutUser(){
   		$.ajax({
	            type: "POST",
	            url: "getdatalist",
	            timeout: 60000,
	            data: {"action":"LOGOUT","user_id":""},
	            success: onLogoutResponseError,
	            error: onLogoutResponseSuccess
	        });
   	}
   	function onLogoutResponseError(request, type, errorThrown){	
   	}
   	function onLogoutResponseSuccess(data, textStatus, jqXHR){	
   	}
   	</script> 	

</body>
</html>