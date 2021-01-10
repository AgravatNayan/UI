<!-- Auther By : Agravat Nayan  -->
<!-- Detail    : baseCRM     -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="Utility.*"%>
<%@page import="org.json.JSONObject"%>
<%
 JSONObject jmenu=new JSONObject();
 String username="",user_img="";
 try {
     GetSession.setServletRequest(request);
     GetSession.sessionValidation(response);
     jmenu =(JSONObject) request.getSession().getAttribute("MENU");
     username = request.getSession().getAttribute("USER_ID").toString();
     user_img = request.getSession().getAttribute("USER_PHOTO").toString();
 } catch (Exception e) {
     response.getWriter().println("<script>window.location.href='"+ApplicationConfig.LoginPage+";</script>");
 }
 %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>CRM - Advance Biofuel</title>

<!-- Favicon -->
<link rel="shortcut icon" href="assets/images/logo/fi.png">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Data Table -->
 <link href="assets/vendors/datatables/dataTables.bootstrap.min.css" rel="stylesheet">
<!-- page css -->

<!-- Core css -->
<link href="assets/css/app.min.css" rel="stylesheet">
<link href="assets/css/jquery-confirm.css" rel="stylesheet">
<link rel="stylesheet" href="assets/css/loader.css">
<style type="text/css">
.error{color : red; }
#inputPancard
    {
        text-transform: uppercase;
    }
.inputloader {
  position: relative;
  height: 20px;
  width: 20px;
  display: inline-block;
  animation: around 5.4s infinite;
}
.icon-container {
  position: absolute;
  right: 25px;
  top: calc(50% - 8px);
}
@keyframes around {
  0% {
    transform: rotate(0deg)
  }
  100% {
    transform: rotate(360deg)
  }
}
.inputloader::after, .inputloader::before {
  content: "";
  background: white;
  position: absolute;
  display: inline-block;
  width: 100%;
  height: 100%;
  border-width: 2px;
  border-color: #333 #333 transparent transparent;
  border-style: solid;
  border-radius: 20px;
  box-sizing: border-box;
  top: 0;
  left: 0;
  animation: around 0.7s ease-in-out infinite;
}

.inputloader::after {
  animation: around 0.7s ease-in-out 0.1s infinite;
  background: transparent;
}
</style>
</head>

<body>
	<div id="loader"></div>
	<div class="app">
		<div class="layout">
			<!-- Header START -->
			<div class="header">
				<div class="logo logo-dark">
					<a href="index.html"> <img
						src="assets/images/logo/logomain1.png" style="padding-left: 10px;"
						alt="Logo"> <img class="logo-fold"
						src="assets/images/logo/logo-fold.svg"
						style="height: 60px; padding-left: 10px; padding-top: 10px"
						alt="Logo">
					</a>
				</div>
				<div class="logo logo-white">
					<a href="index.html"> <img
						src="assets/images/logo/logomain1.png" alt="Logo"> <img
						class="logo-fold" src="assets/images/logo/logo-fold.svg"
						style="height: 60px; padding-left: 10px; padding-top: 10px"
						alt="Logo">
					</a>
				</div>
				<div class="nav-wrap">
					<ul class="nav-left">
						<li class="desktop-toggle"><a href="javascript:void(0);">
								<i class="anticon"></i>
						</a></li>
						<li class="mobile-toggle"><a href="javascript:void(0);">
								<i class="anticon"></i>
						</a></li>
						<li><a href="javascript:void(0);" data-toggle="modal"
							data-target="#search-drawer"> <i
								class="anticon anticon-search"></i>
						</a></li>
					</ul>
					<ul class="nav-right">
						<li class="dropdown dropdown-animated scale-left"><a
							href="javascript:void(0);" data-toggle="dropdown"> <i
								class="anticon anticon-bell notification-badge"></i>
						</a>
							<div class="dropdown-menu pop-notification">
								<div
									class="p-v-15 p-h-25 border-bottom d-flex justify-content-between align-items-center">
									<p class="text-dark font-weight-semibold m-b-0">
										<i class="anticon anticon-bell"></i> <span class="m-l-10">Notification</span>
									</p>
									<a class="btn-sm btn-default btn" href="javascript:void(0);">
										<small>View All</small>
									</a>
								</div>
								<div class="relative">
									<div class="overflow-y-auto relative scrollable"
										style="max-height: 300px">
										<a href="javascript:void(0);"
											class="dropdown-item d-block p-15 border-bottom">
											<div class="d-flex">
												<div class="avatar avatar-blue avatar-icon">
													<i class="anticon anticon-mail"></i>
												</div>
												<div class="m-l-15">
													<p class="m-b-0 text-dark">You received a new message</p>
													<p class="m-b-0">
														<small>8 min ago</small>
													</p>
												</div>
											</div>
										</a> <a href="javascript:void(0);"
											class="dropdown-item d-block p-15 border-bottom">
											<div class="d-flex">
												<div class="avatar avatar-cyan avatar-icon">
													<i class="anticon anticon-user-add"></i>
												</div>
												<div class="m-l-15">
													<p class="m-b-0 text-dark">New user registered</p>
													<p class="m-b-0">
														<small>7 hours ago</small>
													</p>
												</div>
											</div>
										</a> <a href="javascript:void(0);"
											class="dropdown-item d-block p-15 border-bottom">
											<div class="d-flex">
												<div class="avatar avatar-red avatar-icon">
													<i class="anticon anticon-user-add"></i>
												</div>
												<div class="m-l-15">
													<p class="m-b-0 text-dark">System Alert</p>
													<p class="m-b-0">
														<small>8 hours ago</small>
													</p>
												</div>
											</div>
										</a> <a href="javascript:void(0);"
											class="dropdown-item d-block p-15 ">
											<div class="d-flex">
												<div class="avatar avatar-gold avatar-icon">
													<i class="anticon anticon-user-add"></i>
												</div>
												<div class="m-l-15">
													<p class="m-b-0 text-dark">You have a new update</p>
													<p class="m-b-0">
														<small>2 days ago</small>
													</p>
												</div>
											</div>
										</a>
									</div>
								</div>
							</div></li>
						<li class="dropdown dropdown-animated scale-left">
							<div class="pointer" data-toggle="dropdown">
								<div class="avatar avatar-image  m-h-10 m-r-15">
									<img src="<%=user_img%>" alt="">
								</div>
							</div>
							<div class="p-b-15 p-t-20 dropdown-menu pop-profile">
								<div class="p-h-20 p-b-15 m-b-10 border-bottom">
									<div class="d-flex m-r-50">
										<div class="avatar avatar-lg avatar-image">
											<img src="<%=user_img%>" alt="">
										</div>
										<div class="m-l-10">
											<p class="m-b-0 text-dark font-weight-semibold"><%=username%></p>
											<p class="m-b-0 opacity-07"></p>
										</div>
									</div>
								</div>
								<a href="javascript:void(0);"
									class="dropdown-item d-block p-h-15 p-v-10">
									<div class="d-flex align-items-center justify-content-between">
										<div>
											<i class="anticon opacity-04 font-size-16 anticon-user"></i>
											<span class="m-l-10">Edit Profile</span>
										</div>
										<i class="anticon font-size-10 anticon-right"></i>
									</div>
								</a> <a href="javascript:void(0);"
									class="dropdown-item d-block p-h-15 p-v-10">
									<div class="d-flex align-items-center justify-content-between">
										<div>
											<i class="anticon opacity-04 font-size-16 anticon-lock"></i>
											<span class="m-l-10">Account Setting</span>
										</div>
										<i class="anticon font-size-10 anticon-right"></i>
									</div>
								</a> <a href="javascript:void(0);"
									class="dropdown-item d-block p-h-15 p-v-10">
									<div class="d-flex align-items-center justify-content-between">
										<div>
											<i class="anticon opacity-04 font-size-16 anticon-project"></i>
											<span class="m-l-10">Projects</span>
										</div>
										<i class="anticon font-size-10 anticon-right"></i>
									</div>
								</a> <a href="javascript:void(0);"
									class="dropdown-item d-block p-h-15 p-v-10" onclick="LogoutUser()">
									<div class="d-flex align-items-center justify-content-between">
										<div>
											<i class="anticon opacity-04 font-size-16 anticon-logout"></i>
											<span class="m-l-10">Logout</span>
										</div>
										<i class="anticon font-size-10 anticon-right"></i>
									</div>
								</a>
							</div>
						</li>
						<li><a href="javascript:void(0);" data-toggle="modal"
							data-target="#quick-view"> <i
								class="anticon anticon-appstore"></i>
						</a></li>
					</ul>
				</div>
			</div>
			<!-- Header END -->

			<!-- Side Nav START -->
			<div class="side-nav">
				<div class="side-nav-inner">
					<ul class="side-nav-menu scrollable">
						<%
						   JSONObject mainmenu;
						   JSONObject submenudtl;
						   JSONObject mainmenudtl;
						   JSONObject dtlmenudtl;
						   JSONObject mainmenusubdtl;
						   JSONObject submenusubdtl;
                    	 try{
                    		 mainmenu= (JSONObject) jmenu.get("DASHBOARD");
                    		if(mainmenu.getString("VISIBLE").equalsIgnoreCase("Y"))
                    		{
                    	%>
								<li class="nav-item" onclick="onloadpage('MainDashboard')"><a class="dropdown-toggle"
									href="javascript:void(0);"> <span class="icon-holder">
											<i class="anticon anticon-dashboard"></i>
									</span> <span class="title" onclick="onloadpage('page')"> <%=mainmenu.getString("NAME")%>
									</span> <span class="arrow"> <i class="arrow-icon"></i>
									</span>
								</a></li>
						<%
                    		}
                    	 	}catch(Exception e){}
                   	      
                    	try{
                    		 mainmenu= (JSONObject) jmenu.get("HRMS");
                   			if(mainmenu.getString("VISIBLE").equalsIgnoreCase("Y"))
                   			{
                   
                        %>
								<li class="nav-item dropdown"><a class="dropdown-toggle"
									href="javascript:void(0);"> <span class="icon-holder">
											<i class="anticon anticon-appstore"></i>
									</span> <span class="title"><%=mainmenu.getString("NAME")%></span> <span
										class="arrow"> <i class="arrow-icon"></i>
									</span>
								</a>
									<ul class="dropdown-menu">
								<%
                                	try{
                                		submenudtl =  (JSONObject) mainmenu.get("SUBMENU");
                                		try{
                                			mainmenudtl = (JSONObject) submenudtl.get("DASHBOARD");
                                			if(mainmenudtl.getString("VISIBLE").equalsIgnoreCase("Y"))
                                			{
                                %>
											  <li><a href="app-chat.html"><%=mainmenudtl.getString("NAME")%></a></li>
								<% 	
				                            }
				                            }catch(Exception e){} 
				                         try{
				                        	 mainmenudtl = (JSONObject) submenudtl.get("EMP_MANGE");
				                             if(mainmenudtl.getString("VISIBLE").equalsIgnoreCase("Y"))
				                              {                                	
				                %>
													<li class="nav-item" onclick="onloadpage('EMP_LIST')">
														<a href="javascript:void(0);">
					                                        <span><%=mainmenudtl.getString("NAME")%></span>
					                                    </a>
							    					</li>
								<% 
												}
					                          }catch(Exception e){}
				                         	try{
				                        	  mainmenudtl = (JSONObject) submenudtl.get("SALARY_MANGE");
				                              if(mainmenudtl.getString("VISIBLE").equalsIgnoreCase("Y"))
				                               {
					            %>
													<li class="nav-item dropdown"><a href="javascript:void(0);">
															<span><%=mainmenudtl.getString("NAME")%></span> <span class="arrow"> <i
																class="arrow-icon"></i>
														</span>
													</a>
														<ul class="dropdown-menu">
						 		<%
						 							try{
                                						 submenusubdtl = (JSONObject) mainmenudtl.get("SUBMENU");
                                						  try{
                                							  mainmenusubdtl = (JSONObject) submenusubdtl.get("SALARY_MST");
							                         	     if(mainmenusubdtl.getString("VISIBLE").equalsIgnoreCase("Y"))
									                         {
						 		%>							
															<li><a href="app-project-list.html"><%=mainmenusubdtl.getString("NAME")%></a></li>
							    <%
									                         }
                                						  }catch(Exception e){}
                                						  try{
                                							  mainmenusubdtl = (JSONObject) submenusubdtl.get("SALARY_PROC");
							                         	     if(mainmenusubdtl.getString("VISIBLE").equalsIgnoreCase("Y"))
									                         {
							    %>								
															<li><a href="app-project-details.html"><%=mainmenusubdtl.getString("NAME")%></a>
															</li>
								<%
									                         }
                                						  }catch(Exception e){}
                                						  try{
                                							  mainmenusubdtl = (JSONObject) submenusubdtl.get("ALLOW_MST");
							                         	     if(mainmenusubdtl.getString("VISIBLE").equalsIgnoreCase("Y"))
									                         {
								%>
															<li><a href="app-project-details.html"><%=mainmenusubdtl.getString("NAME")%></a></li>
								<%
									                         }
                                						  }catch(Exception e){}
                                						  try{
                                							  mainmenusubdtl = (JSONObject) submenusubdtl.get("ATTEN_MST");
							                         	     if(mainmenusubdtl.getString("VISIBLE").equalsIgnoreCase("Y"))
									                         {
								%>
															<li><a href="app-project-details.html"><%=mainmenusubdtl.getString("NAME")%></a></li>
                                <%
									                         }
                                						  }catch(Exception e){}
                                						  try{
                                							  mainmenusubdtl = (JSONObject) submenusubdtl.get("SALARY_HED_MST");
							                         	     if(mainmenusubdtl.getString("VISIBLE").equalsIgnoreCase("Y"))
									                         {
								%>																	
															<li><a href="app-project-details.html"><%=mainmenusubdtl.getString("NAME")%></a></li>
								<%
									                         }
                                						  }catch(Exception e){}
						 							}catch(Exception e){}
								%>
														</ul></li>
								<%
				                               }
				                         	}catch(Exception e){}
				                         	try{
					                        	  mainmenudtl = (JSONObject) submenudtl.get("HR_MANGE");
					                              if(mainmenudtl.getString("VISIBLE").equalsIgnoreCase("Y"))
					                               {
								%>
														<li class="nav-item dropdown"><a href="javascript:void(0);">
																<span><%=mainmenudtl.getString("NAME")%></span> <span class="arrow"> <i
																	class="arrow-icon"></i>
															</span>
														</a>
															<ul class="dropdown-menu">
								<%
						 							    try{
                                						      submenusubdtl = (JSONObject) mainmenudtl.get("SUBMENU");
                                						      try{
                                							     mainmenusubdtl = (JSONObject) submenusubdtl.get("CONTRA_TYPE_MST");
							                         	         if(mainmenusubdtl.getString("VISIBLE").equalsIgnoreCase("Y"))
									                             {
						 		%>
																			<li onclick="onloadpage('CONTRA_TYPE_LIST')"><a href="javascript:void(0);"><%=mainmenusubdtl.getString("NAME")%></a></li>
                               <%
										                         }
                                								  }catch(Exception e){}
                                							  try{
                                								  mainmenusubdtl = (JSONObject) submenusubdtl.get("INSU_MST");
							                         		     if(mainmenusubdtl.getString("VISIBLE").equalsIgnoreCase("Y"))
									                        	 {
								%>																					
																			<li onclick="onloadpage('INSU_LIST')"><a href="javascript:void(0);"><%=mainmenusubdtl.getString("NAME")%></a></li>
								<%
										                         }
                                								  }catch(Exception e){}
                                							  try{
                                								  mainmenusubdtl = (JSONObject) submenusubdtl.get("SHIFT_MST");
							                         		     if(mainmenusubdtl.getString("VISIBLE").equalsIgnoreCase("Y"))
									                        	 {
								%>													
																			<li onclick="onloadpage('SHIFT_LIST')"><a href="javascript:void(0);"><%=mainmenusubdtl.getString("NAME")%></a></li>
								<%
										                         }
                                								  }catch(Exception e){}
                                							  try{
                                								  mainmenusubdtl = (JSONObject) submenusubdtl.get("DESDIG_MST");
							                         		     if(mainmenusubdtl.getString("VISIBLE").equalsIgnoreCase("Y"))
									                        	 {
								%>
																			<li onclick="onloadpage('DESIGNATION_LIST')"><a href="javascript:void(0);"><%=mainmenusubdtl.getString("NAME")%></a></li>
								<%
										                         }
                                								  }catch(Exception e){}
                                							  try{
                                								  mainmenusubdtl = (JSONObject) submenusubdtl.get("GRADE_MST");
							                         		     if(mainmenusubdtl.getString("VISIBLE").equalsIgnoreCase("Y"))
									                        	 {
								%>
																			<li onclick="onloadpage('GRADE_LIST')"><a href="javascript:void(0);"><%=mainmenusubdtl.getString("NAME")%></a></li>
								<%
										                         }
                                								  }catch(Exception e){}
                                							  try{
                                								  mainmenusubdtl = (JSONObject) submenusubdtl.get("DEPRT_MST");
							                         		     if(mainmenusubdtl.getString("VISIBLE").equalsIgnoreCase("Y"))
									                        	 {
								%>
																			<li onclick="onloadpage('DEPARTMENT_LIST')"><a href="javascript:void(0);"><%=mainmenusubdtl.getString("NAME")%></a></li>
								<%
									                             }
                                							  	}catch(Exception e){}  
                                						      }catch(Exception e){}
								%>
															</ul></li>
								<%
				                               }
				                         	}catch(Exception e){}
				                         	try{
					                        	  mainmenudtl = (JSONObject) submenudtl.get("COMP_PROF");
					                              if(mainmenudtl.getString("VISIBLE").equalsIgnoreCase("Y"))
					                               {
				                 %>
														<li class="nav-item dropdown"><a href="javascript:void(0);">
																<span><%=mainmenudtl.getString("NAME")%></span> <span class="arrow"> <i
																	class="arrow-icon"></i>
															</span>
														</a>
															<ul class="dropdown-menu">
								<%
						 							      try{
                                						      submenusubdtl = (JSONObject) mainmenudtl.get("SUBMENU");
                                						      try{
                                							     mainmenusubdtl = (JSONObject) submenusubdtl.get("COMP_MST");
							                         	         if(mainmenusubdtl.getString("VISIBLE").equalsIgnoreCase("Y"))
									                             {
						 		%>
																<li onclick="onloadpage('COMP_MST')"><a href="javascript:void(0);"><%=mainmenusubdtl.getString("NAME")%></a></li>
								<%
										                         }
                                								  }catch(Exception e){}
                                							  try{
                                								  mainmenusubdtl = (JSONObject) submenusubdtl.get("BRANCH_MST");
							                         		     if(mainmenusubdtl.getString("VISIBLE").equalsIgnoreCase("Y"))
									                        	 {
								%>
																<li onclick="onloadpage('BRANCH_LIST')"> <a href="javascript:void(0);"><%=mainmenusubdtl.getString("NAME")%></a>
																</li>
								<%
									                          	  }
                                							  }catch(Exception e){}
						 							     }catch(Exception e){}
								%>
															</ul></li>
								<%
					                               }
				                         	}catch(Exception e){}
				                         	try{
					                        	  mainmenudtl = (JSONObject) submenudtl.get("REPORTS");
					                              if(mainmenudtl.getString("VISIBLE").equalsIgnoreCase("Y"))
					                               {
								%>
														<li><a href="app-mail.html"><%=mainmenudtl.getString("NAME")%></a></li>
							    <%
					                               }
				                         	}catch(Exception e){}
							    %>
							</ul>
							<%
                    		
                    	 }catch(Exception e){}
                   	     %>
							</li>
						<%
                    		}
                    	 }catch(Exception e){}
                    	 // Start ====== LEAD MANAGEMENT ======
                    	 try{
                    		   mainmenu= (JSONObject) jmenu.get("LEAD_MANGE");
                    			if(mainmenu.getString("VISIBLE").equalsIgnoreCase("Y"))
                    			{
                   	     %>
									<li class="nav-item dropdown"><a class="dropdown-toggle"
										href="javascript:void(0);"> <span class="icon-holder">
												<i class="anticon anticon-build"></i>
										</span> <span class="title"><%=mainmenu.getString("NAME")%></span> <span class="arrow">
												<i class="arrow-icon"></i>
										</span>
									</a>
										<ul class="dropdown-menu">
						<%
                                	try{
                                		submenudtl =  (JSONObject) mainmenu.get("SUBMENU");
                                		try{
                                			mainmenudtl = (JSONObject) submenudtl.get("NEW_LEAD");
                                			if(mainmenudtl.getString("VISIBLE").equalsIgnoreCase("Y"))
                                			{
                        %>
											<li><a href="avatar.html"><%=mainmenudtl.getString("NAME")%></a></li>
						<%
                                			}
                                		}catch(Exception e){}
                                		try{
                                			mainmenudtl = (JSONObject) submenudtl.get("IMPORT_LEAD");
                                			if(mainmenudtl.getString("VISIBLE").equalsIgnoreCase("Y"))
                                			{
						%>
											<li><a href="alert.html"><%=mainmenudtl.getString("NAME")%></a></li>
						<%
                                			}
                                		}catch(Exception e){}
                                		try{
                                			mainmenudtl = (JSONObject) submenudtl.get("LEAD_REPORTS");
                                			if(mainmenudtl.getString("VISIBLE").equalsIgnoreCase("Y"))
                                			{
						%>
											<li><a href="badge.html"><%=mainmenudtl.getString("NAME")%></a></li>
						<%
                                			}
                                		}catch(Exception e){}
						%>
										</ul></li>
						<%
                                	}catch(Exception e){}
                    			}
                    	 }catch(Exception e){}
                    	 // ====== Lead Management ==== END
                    	 // ====== Order Management ====== START
                    	try{
                    		   mainmenu= (JSONObject) jmenu.get("ORDER_MANGE");
                    			if(mainmenu.getString("VISIBLE").equalsIgnoreCase("Y"))
                    			{
						%>
									<li class="nav-item dropdown"><a class="dropdown-toggle"
										href="javascript:void(0);"> <span class="icon-holder">
												<i class="anticon anticon-hdd"></i>
										</span> <span class="title"><%=mainmenu.getString("NAME")%></span> <span class="arrow">
												<i class="arrow-icon"></i>
										</span>
									</a> </li>
						<%	     }
                    	  }catch(Exception e){}
                    	// ====== Order Management ====== END
                    	// ====== SALE MANAGEMENT ======= START
                    	try{
                    		   mainmenu= (JSONObject) jmenu.get("SALES_MANGE");
                    			if(mainmenu.getString("VISIBLE").equalsIgnoreCase("Y"))
                    			{
						%>
									<li class="nav-item dropdown"><a class="dropdown-toggle"
										href="javascript:void(0);"> <span class="icon-holder">
												<i class="anticon anticon-form"></i>
										</span> <span class="title"><%=mainmenu.getString("NAME")%></span> <span class="arrow">
												<i class="arrow-icon"></i>
										</span>
									</a>
										<ul class="dropdown-menu">
						<%
                                	try{
                                		submenudtl =  (JSONObject) mainmenu.get("SUBMENU");
                                		try{
                                			mainmenudtl = (JSONObject) submenudtl.get("SALES_BUSINESS");
                                			if(mainmenudtl.getString("VISIBLE").equalsIgnoreCase("Y"))
                                			{
                        %>
											<li><a href="form-elements.html"><%=mainmenudtl.getString("NAME")%></a></li>
						<%
                                			}
                                		   }catch(Exception e){}
                                		try{
                                			mainmenudtl = (JSONObject) submenudtl.get("SALES_INV");
                                			if(mainmenudtl.getString("VISIBLE").equalsIgnoreCase("Y"))
                                			{
						%>					
											<li><a href="form-layouts.html"><%=mainmenudtl.getString("NAME")%></a></li>
						<%
                                			}
                                		}catch(Exception e){}
                                		try{
                                			mainmenudtl = (JSONObject) submenudtl.get("SALES_PAY");
                                			if(mainmenudtl.getString("VISIBLE").equalsIgnoreCase("Y"))
                                			{
						%>					
											<li><a href="form-validation.html"><%=mainmenudtl.getString("NAME")%></a></li>
						<%
                                			}
                                		}catch(Exception e){}
                                		try{
                                			mainmenudtl = (JSONObject) submenudtl.get("SALES_NOTES");
                                			if(mainmenudtl.getString("VISIBLE").equalsIgnoreCase("Y"))
                                			{
						%>
											<li><a href="form-validation.html"><%=mainmenudtl.getString("NAME")%></a></li>
						<%
                                			}
                                		}catch(Exception e){}
                                		try{
                                			mainmenudtl = (JSONObject) submenudtl.get("SALES_ESTI");
                                			if(mainmenudtl.getString("VISIBLE").equalsIgnoreCase("Y"))
                                			{
						%>
											<li><a href="form-validation.html"><%=mainmenudtl.getString("NAME")%></a></li>
						<%
                                			}
                                		}catch(Exception e){}
                                		try{
                                			mainmenudtl = (JSONObject) submenudtl.get("SALES_PRICE");
                                			if(mainmenudtl.getString("VISIBLE").equalsIgnoreCase("Y"))
                                			{
						%>
											<li><a href="form-validation.html"><%=mainmenudtl.getString("NAME")%></a></li>
						<%
                                			}
                                		}catch(Exception e){}
                                	}catch(Exception e){}                                		
						%>
										</ul></li>
						<%	     }
                    	  }catch(Exception e){}
                    	// ====== SALE MANAGEMENT ======= END
                        // ====== KNOW && Anno ======= START
                    	try{
                    		   mainmenu= (JSONObject) jmenu.get("KNOW_ANN");
                    			if(mainmenu.getString("VISIBLE").equalsIgnoreCase("Y"))
                    			{
                    	%>
									<li class="nav-item dropdown"><a class="dropdown-toggle"
										href="javascript:void(0);"> <span class="icon-holder">
												<i class="anticon anticon-table"></i>
										</span> <span class="title"><%=mainmenu.getString("NAME")%></span> <span class="arrow">
												<i class="arrow-icon"></i>
										</span>
									</a>
										<ul class="dropdown-menu">
						<%
                                	try{
                                		submenudtl =  (JSONObject) mainmenu.get("SUBMENU");
                                		try{
                                			mainmenudtl = (JSONObject) submenudtl.get("KNOW_BASE");
                                			if(mainmenudtl.getString("VISIBLE").equalsIgnoreCase("Y"))
                                			{
                        %>
											<li><a href="basic-table.html"><%=mainmenudtl.getString("NAME")%></a></li>
						<%
                                			}
                                		}catch(Exception e){}
                                		try{
                                			mainmenudtl = (JSONObject) submenudtl.get("ANNOUCE");
                                			if(mainmenudtl.getString("VISIBLE").equalsIgnoreCase("Y"))
                                			{
						%>
											<li><a href="data-table.html"><%=mainmenudtl.getString("NAME")%></a></li>
					   <%
                                			}
                                		}catch(Exception e){}
                                		try{
                                			mainmenudtl = (JSONObject) submenudtl.get("KNOW_NEWS");
                                			if(mainmenudtl.getString("VISIBLE").equalsIgnoreCase("Y"))
                                			{
						%>
											<li><a href="data-table.html"><%=mainmenudtl.getString("NAME")%></a></li>
						<%
                                			}
                                		}catch(Exception e){}
                                	}catch(Exception e){}
                        %>
										</ul></li>
						<%	     }
                   	  		}catch(Exception e){}
                   			// ====== KNOW && Anno ======= end
                   			// ====== TASK MANAGEMENT ====== START
                   			try{
                   		   		mainmenu= (JSONObject) jmenu.get("TASK_MANGE");
                   				if(mainmenu.getString("VISIBLE").equalsIgnoreCase("Y"))
                   				{
                   		%>
									<li class="nav-item dropdown"><a class="dropdown-toggle"
										href="javascript:void(0);"> <span class="icon-holder">
												<i class="anticon anticon-file"></i>
										</span> <span class="title"><%=mainmenu.getString("NAME")%></span> <span class="arrow">
												<i class="arrow-icon"></i>
										</span>
									</a>
										<ul class="dropdown-menu">
						<%
                                	try{
                                		submenudtl =  (JSONObject) mainmenu.get("SUBMENU");
                                		try{
                                			mainmenudtl = (JSONObject) submenudtl.get("TASK_TASKS");
                                			if(mainmenudtl.getString("VISIBLE").equalsIgnoreCase("Y"))
                                			{
                        %>				
											<li><a href="profile.html"><%=mainmenudtl.getString("NAME")%></a></li>
						<%
                                			}
                                		}catch(Exception e){}
                                	}catch(Exception e){}
                        %>
										</ul></li>
						<%	     }
                   	  		}catch(Exception e){}
                   			// ====== TASK MANAGEMENT ====== END
                   			// ====== Contact Management ===== START
                   			try{
                   		   		mainmenu= (JSONObject) jmenu.get("CONTACT_MANGE");
                   				if(mainmenu.getString("VISIBLE").equalsIgnoreCase("Y"))
                   				{
                   		%>
									<li class="nav-item dropdown"><a class="dropdown-toggle"
										href="javascript:void(0);"> <span class="icon-holder">
												<i class="anticon anticon-file"></i>
										</span> <span class="title"><%=mainmenu.getString("NAME")%></span> <span
											class="arrow"> <i class="arrow-icon"></i>
										</span>
									</a>
										<ul class="dropdown-menu">
					    <%
                                	try{
                                		submenudtl =  (JSONObject) mainmenu.get("SUBMENU");
                                		try{
                                			mainmenudtl = (JSONObject) submenudtl.get("CON_MEETING");
                                			if(mainmenudtl.getString("VISIBLE").equalsIgnoreCase("Y"))
                                			{
                        %>				
											<li><a href="profile.html"><%=mainmenudtl.getString("NAME")%></a></li>
						<%
                                			}
                                		}catch(Exception e){}
                                	}catch(Exception e){}
                        %>
										</ul></li>
					   <%	     }
                   	  		}catch(Exception e){}
                   			// ====== Contact Management ===== END
                   			// ====== CUSTOMER MANAGEMENT ===== START
                   			try{
                   		   		mainmenu= (JSONObject) jmenu.get("CUSTOMER_MANGE");
                   				if(mainmenu.getString("VISIBLE").equalsIgnoreCase("Y"))
                   				{
                   		%>	
									<li class="nav-item dropdown"><a class="dropdown-toggle"
										href="javascript:void(0);"> <span class="icon-holder">
												<i class="anticon anticon-file"></i>
										</span> <span class="title"><%=mainmenu.getString("NAME")%></span> <span
											class="arrow"> <i class="arrow-icon"></i>
										</span>
									</a>
										<ul class="dropdown-menu">
						<%
                                	try{
                                		submenudtl =  (JSONObject) mainmenu.get("SUBMENU");
                                		try{
                                			mainmenudtl = (JSONObject) submenudtl.get("CUST_CALLS");
                                			if(mainmenudtl.getString("VISIBLE").equalsIgnoreCase("Y"))
                                			{
                        %>				
											<li><a href="profile.html"><%=mainmenudtl.getString("NAME")%></a></li>
						<%
                                			}
                                		}catch(Exception e){}
                                	}catch(Exception e){}
                        %>	
										</ul></li>
						<%	     
						     }
                   	  		}catch(Exception e){}
                   			// ====== CUSTOMER MANAGEMENT ===== END
                   		    // ====== TICKET MANAGEMENT ==== START
                   			try{
                   		   		mainmenu= (JSONObject) jmenu.get("TICKET_MANGE");
                   				if(mainmenu.getString("VISIBLE").equalsIgnoreCase("Y"))
                   				{
                   		%>
									<li class="nav-item dropdown"><a class="dropdown-toggle"
										href="javascript:void(0);"> <span class="icon-holder">
												<i class="anticon anticon-lock"></i>
										</span> <span class="title"><%=mainmenu.getString("NAME")%></span> <span class="arrow">
												<i class="arrow-icon"></i>
										</span>
									</a></li>
						<%	     }
                   	  		}catch(Exception e){}
                   			// ====== TICKET MANAGEMENT ==== END
                   		    
                   			// ====== USER MASTER ====== START
                   			
                   			String visible_user = "";
                   			visible_user = GetMenu.GetMainMenuVisible(jmenu,"USER_MANGE");
                   			if(visible_user.equalsIgnoreCase("Y"))
                   			{
                   		%>
                   		       <li class="nav-item"  onclick="onloadpage('USER_LIST')"><a href="javascript:void(0);"> 
                   		       <span class="icon-holder"><i class="fa fa-user"></i></span>
                   					<span class="title"><%=GetMenu.GetMainMenuName(jmenu,"USER_MANGE")%></span></a>                   					
                   			   </li>
					    <%		
                   			}
                   			// ====== USER MASTER ====== END
                   					
                   			// ====== SETTING ==== START
                   			try{
                   		   		mainmenu= (JSONObject) jmenu.get("SETTING");
                   				if(mainmenu.getString("VISIBLE").equalsIgnoreCase("Y"))
                   				{
                   		%>
									<li class="nav-item dropdown"><a class="dropdown-toggle"
										href="javascript:void(0);"> <span class="icon-holder">
												<i class="anticon anticon-lock"></i>
										</span> <span class="title"><%=mainmenu.getString("NAME")%></span> <span class="arrow">
												<i class="arrow-icon"></i>
										</span>
									</a>
										<ul class="dropdown-menu">
										
						<%
                                	try{
                                		submenudtl =  (JSONObject) mainmenu.get("SUBMENU");
                                		try{
                                			mainmenudtl = (JSONObject) submenudtl.get("SETT_API");
                                			if(mainmenudtl.getString("VISIBLE").equalsIgnoreCase("Y"))
                                			{
                        %>
											<li><a href="login-1.html"><%=mainmenudtl.getString("NAME")%></a></li>
						<%
                                			}
                                		}catch(Exception e){}
                                		try{
                                			mainmenudtl = (JSONObject) submenudtl.get("SETT_MANGE");
                                			if(mainmenudtl.getString("VISIBLE").equalsIgnoreCase("Y"))
                                			{
						%>					
											<li class="nav-item dropdown"><a href="javascript:void(0);">
													<span><%=mainmenudtl.getString("NAME")%></span> <span class="arrow"> <i
														class="arrow-icon"></i>
												</span>
											</a>
												<ul class="dropdown-menu">
						<%
			 							    try{
                             					 submenusubdtl = (JSONObject) mainmenudtl.get("SUBMENU");
                             					try{
                             						 mainmenusubdtl = (JSONObject) submenusubdtl.get("PROJECT_MST");
				                         	         if(mainmenusubdtl.getString("VISIBLE").equalsIgnoreCase("Y"))
						                             {
						%>
															<li><a href="blog-grid.html"><%=mainmenusubdtl.getString("NAME")%></a></li>
						<%
						                             }
                             					   }catch(Exception e){}
                             					try{
                            						 mainmenusubdtl = (JSONObject) submenusubdtl.get("PRODUCT_MST");
				                         	         if(mainmenusubdtl.getString("VISIBLE").equalsIgnoreCase("Y"))
						                             {
						%>
															<li><a href="blog-list.html"><%=mainmenusubdtl.getString("NAME")%></a></li>
						<%
						                             }
                             					   }catch(Exception e){}
                             					try{
                            						 mainmenusubdtl = (JSONObject) submenusubdtl.get("DEALER_MANGE");
				                         	         if(mainmenusubdtl.getString("VISIBLE").equalsIgnoreCase("Y"))
						                             {
						%>
															<li><a href="blog-post.html"><%=mainmenusubdtl.getString("NAME")%></a></li>
						<%
						                             }
                             					}catch(Exception e){}
			 							   }catch(Exception e){}
						%>
												</ul></li>
						<%
                                			}
                                		}catch(Exception e){}
                                		try{
                                			mainmenudtl = (JSONObject) submenudtl.get("SETT_FINANCE");
                                			if(mainmenudtl.getString("VISIBLE").equalsIgnoreCase("Y"))
                                			{
						%>						
											<li class="nav-item dropdown"><a href="javascript:void(0);">
													<span><%=mainmenudtl.getString("NAME")%></span> <span class="arrow"> <i
														class="arrow-icon"></i>
												</span>
											</a>
												<ul class="dropdown-menu">
						<%
			 							    try{
                             					 submenusubdtl = (JSONObject) mainmenudtl.get("SUBMENU");
                             					try{
                             						 mainmenusubdtl = (JSONObject) submenusubdtl.get("TAX_RATE_MST");
				                         	         if(mainmenusubdtl.getString("VISIBLE").equalsIgnoreCase("Y"))
						                             {
						%>
														<li><a href="blog-grid.html"><%=mainmenusubdtl.getString("NAME")%></a></li>
						<%
						                             }
                             					   }catch(Exception e){}
                             					try{
                            						 mainmenusubdtl = (JSONObject) submenusubdtl.get("CURRENCY_MST");
				                         	         if(mainmenusubdtl.getString("VISIBLE").equalsIgnoreCase("Y"))
						                             {
						%>
														<li><a href="blog-list.html"><%=mainmenusubdtl.getString("NAME")%></a></li>
						<%
						                             }
                             					   }catch(Exception e){}
                             					try{
                            						 mainmenusubdtl = (JSONObject) submenusubdtl.get("PAY_MODES");
				                         	         if(mainmenusubdtl.getString("VISIBLE").equalsIgnoreCase("Y"))
						                             {
						%>
														<li><a href="blog-post.html"><%=mainmenusubdtl.getString("NAME")%></a></li>
						<%
						                             }
                             					   }catch(Exception e){}
                             					try{
                            						 mainmenusubdtl = (JSONObject) submenusubdtl.get("EXPENSE_CATE");
				                         	         if(mainmenusubdtl.getString("VISIBLE").equalsIgnoreCase("Y"))
						                             {
						%>
														<li><a href="blog-post.html"><%=mainmenusubdtl.getString("NAME")%></a></li>
						<%
						                             }
                             					   }catch(Exception e){}
			 							   }catch(Exception e){}	
						%>
												</ul></li>
						<%
                                			}
                                		}catch(Exception e){}
                                		try{
                                			mainmenudtl = (JSONObject) submenudtl.get("SETT_TEMP");
                                			if(mainmenudtl.getString("VISIBLE").equalsIgnoreCase("Y"))
                                			{
						%>					
											<li><a href="login-1.html"><%=mainmenudtl.getString("NAME")%></a></li>
											
						<%
                                			}
                                		}catch(Exception e){}
                                		try{
                                			mainmenudtl = (JSONObject) submenudtl.get("SETT_OTHER");
                                			if(mainmenudtl.getString("VISIBLE").equalsIgnoreCase("Y"))
                                			{
						%>					<li class="nav-item dropdown"><a href="javascript:void(0);">
													<span><%=mainmenudtl.getString("NAME")%></span> <span class="arrow"> <i
														class="arrow-icon"></i>
												</span>
											</a>
												<ul class="dropdown-menu">
						<%
			 							    try{
                             					 submenusubdtl = (JSONObject) mainmenudtl.get("SUBMENU");
                             					try{
                             						 mainmenusubdtl = (JSONObject) submenusubdtl.get("E_MAIL");
				                         	         if(mainmenusubdtl.getString("VISIBLE").equalsIgnoreCase("Y"))
						                             {
						%>
															<li><a href="blog-grid.html"><%=mainmenusubdtl.getString("NAME")%></a></li>
						<%
						                             }
                             					   }catch(Exception e){}
                             					try{
                            						 mainmenusubdtl = (JSONObject) submenusubdtl.get("SETT_FINANCE");
				                         	         if(mainmenusubdtl.getString("VISIBLE").equalsIgnoreCase("Y"))
						                             {
						%>
															<li><a href="blog-list.html"><%=mainmenusubdtl.getString("NAME")%></a></li>
						<%
						                             }
                             					   }catch(Exception e){}
                             					try{
                            						 mainmenusubdtl = (JSONObject) submenusubdtl.get("SUBSCRIP");
				                         	         if(mainmenusubdtl.getString("VISIBLE").equalsIgnoreCase("Y"))
						                             {
						%>
															<li><a href="blog-post.html"><%=mainmenusubdtl.getString("NAME")%></a></li>
						<%
						                             }
                             					   }catch(Exception e){}
                             					try{
                            						 mainmenusubdtl = (JSONObject) submenusubdtl.get("PAY_GATE");
				                         	         if(mainmenusubdtl.getString("VISIBLE").equalsIgnoreCase("Y"))
						                             {
						%>
															<li><a href="blog-post.html"><%=mainmenusubdtl.getString("NAME")%></a></li>
						<%
						                             }
                             					   }catch(Exception e){}
                             					try{
                            						 mainmenusubdtl = (JSONObject) submenusubdtl.get("SMS_SETT");
				                         	         if(mainmenusubdtl.getString("VISIBLE").equalsIgnoreCase("Y"))
						                             {
						%>
															<li><a href="blog-post.html"><%=mainmenusubdtl.getString("NAME")%></a></li>
						<%
						                             }
                             					   }catch(Exception e){}
                             					try{
                            						 mainmenusubdtl = (JSONObject) submenusubdtl.get("CALENDER");
				                         	         if(mainmenusubdtl.getString("VISIBLE").equalsIgnoreCase("Y"))
						                             {
						%>
															<li><a href="blog-post.html"><%=mainmenusubdtl.getString("NAME")%></a></li>
						<%
						                             }
                             					   }catch(Exception e){}
                             					try{
                            						 mainmenusubdtl = (JSONObject) submenusubdtl.get("PDF");
				                         	         if(mainmenusubdtl.getString("VISIBLE").equalsIgnoreCase("Y"))
						                             {
						%>
															<li><a href="blog-post.html"><%=mainmenusubdtl.getString("NAME")%></a></li>
						<%
						                             }
                             					   }catch(Exception e){}
                             					try{
                            						 mainmenusubdtl = (JSONObject) submenusubdtl.get("E_SIGN");
				                         	         if(mainmenusubdtl.getString("VISIBLE").equalsIgnoreCase("Y"))
						                             {
						%>
															<li><a href="blog-post.html"><%=mainmenusubdtl.getString("NAME")%></a></li>
						<%
						                             }
                             					   }catch(Exception e){}
                             					try{
                            						 mainmenusubdtl = (JSONObject) submenusubdtl.get("CRON_JOB");
				                         	         if(mainmenusubdtl.getString("VISIBLE").equalsIgnoreCase("Y"))
						                             {
						%>
															<li><a href="blog-post.html"><%=mainmenusubdtl.getString("NAME")%></a></li>
						<%
						                             }
                             					   }catch(Exception e){}
                             					try{
                            						 mainmenusubdtl = (JSONObject) submenusubdtl.get("TASK_SETTINGS");
				                         	         if(mainmenusubdtl.getString("VISIBLE").equalsIgnoreCase("Y"))
						                             {
						%>
															<li><a href="blog-post.html"><%=mainmenusubdtl.getString("NAME")%></a></li>
						<%
						                             }
                             					   }catch(Exception e){}
                             					try{
                            						 mainmenusubdtl = (JSONObject) submenusubdtl.get("LEAD_SETTING");
				                         	         if(mainmenusubdtl.getString("VISIBLE").equalsIgnoreCase("Y"))
						                             {
						%>
															<li><a href="blog-post.html"><%=mainmenusubdtl.getString("NAME")%></a></li>
						<%
						                             }
                             					   }catch(Exception e){}
			 							   }catch(Exception e){}
						%>
												</ul></li>
						<%
                                		}
                                		    }catch(Exception e){}
                                	}catch(Exception e){}
						%>
										</ul></li>
						<%	     }
                   	  		}catch(Exception e){}
                   			// ====== SETTING ==== END
                   		%>
					</ul>
				</div>
			</div>
			<!-- Side Nav END -->
			<!-- Page Container START -->
			<div class="page-container" id="main">				
				<!-- Footer START -->
				<footer class="footer">
					<div class="footer-content">
						<p class="m-b-0">Copyright © 2020 WeTechs. All rights
							reserved.</p>
						<span> <a href="#" class="text-gray m-r-15">Term &amp;
								Conditions</a> <a href="#" class="text-gray">Privacy &amp;
								Policy</a>
						</span>
					</div>
				</footer>
				<!-- Footer END -->
				
			</div>
			<!-- Page Container END -->

			<!-- Search Start-->
			<div class="modal modal-left fade search" id="search-drawer">
				<div class="modal-dialog">
					<div class="modal-content">
						<div
							class="modal-header justify-content-between align-items-center">
							<h5 class="modal-title">Search</h5>
							<button type="button" class="close" data-dismiss="modal">
								<i class="anticon anticon-close"></i>
							</button>
						</div>
						<div class="modal-body scrollable">
							<div class="input-affix">
								<i class="prefix-icon anticon anticon-search"></i> <input
									type="text" class="form-control" placeholder="Search">
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Search End-->

			<!-- Quick View START -->
			<div class="modal modal-right fade quick-view" id="quick-view">
				<div class="modal-dialog">
					<div class="modal-content">
						<div
							class="modal-header justify-content-between align-items-center">
							<h5 class="modal-title">Theme Config</h5>
						</div>
						<div class="modal-body scrollable">
							<div class="m-b-30">
								<h5 class="m-b-0">Header Color</h5>
								<p>Config header background color</p>
								<div class="theme-configurator d-flex m-t-10">
									<div class="radio">
										<input id="header-default" name="header-theme" type="radio"
											checked value="default"> <label for="header-default"></label>
									</div>
									<div class="radio">
										<input id="header-primary" name="header-theme" type="radio"
											value="primary"> <label for="header-primary"></label>
									</div>
									<div class="radio">
										<input id="header-success" name="header-theme" type="radio"
											value="success"> <label for="header-success"></label>
									</div>
									<div class="radio">
										<input id="header-secondary" name="header-theme" type="radio"
											value="secondary"> <label for="header-secondary"></label>
									</div>
									<div class="radio">
										<input id="header-danger" name="header-theme" type="radio"
											value="danger"> <label for="header-danger"></label>
									</div>
								</div>
							</div>
							<hr>
							<div>
								<h5 class="m-b-0">Side Nav Dark</h5>
								<p>Change Side Nav to dark</p>
								<div class="switch d-inline">
									<input type="checkbox" name="side-nav-theme-toogle"
										id="side-nav-theme-toogle"> <label
										for="side-nav-theme-toogle"></label>
								</div>
							</div>
							<hr>
							<div>
								<h5 class="m-b-0">Folded Menu</h5>
								<p>Toggle Folded Menu</p>
								<div class="switch d-inline">
									<input type="checkbox" name="side-nav-fold-toogle"
										id="side-nav-fold-toogle"> <label
										for="side-nav-fold-toogle"></label>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Quick View END -->
		</div>
	</div>


	<!-- Core Vendors JS -->
	<script src="assets/js/vendors.min.js"></script>

	<!-- page js -->
	<script src="assets/vendors/chartjs/Chart.min.js"></script>
	<script src="assets/js/pages/dashboard-default.js"></script>

	<!-- Core JS -->
	<script src="assets/js/app.min.js"></script>

	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/pageRender.js"></script>
	<script src="assets/js/app.js"></script>
	<script src="assets/js/jquery.validate.min.js"></script>
	<script src="assets/js/jquery-confirm.js"></script>
	<script src="assets/js/Custom_message.js"></script>
	<script src="assets/js/formdataset.js"></script>
<script>
onloadpage('MainDashboard');
</script>
</body>


</html>
