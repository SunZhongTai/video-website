<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page import="java.util.ArrayList"%>

  

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" /> 
  <link rel="stylesheet" type="text/css" href="http://cdn.datatables.net/plug-ins/28e7751dbec/integration/bootstrap/3/dataTables.bootstrap.css" /> 
  <script src="http://cdn.gbtags.com/datatables/1.10.5/js/jquery.js"></script> 
  <script src="http://cdn.gbtags.com/datatables/1.10.5/js/jquery.dataTables.min.js"></script> 
  <script type="text/javascript" language="javascript" src="http://cdn.datatables.net/plug-ins/28e7751dbec/integration/bootstrap/3/dataTables.bootstrap.js"></script>

	<!--////////-->
	
	<!-- Bootstrap Styles-->
    <link href="assets1/css/bootstrap.css" rel="stylesheet" />
     <!-- FontAwesome Styles-->
    <link href="assets1/css/font-awesome.css" rel="stylesheet" />
    <!-- Morris Chart Styles-->
    <link href="assets1/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
        <!-- Custom Styles-->
    <link href="assets1/css/custom-styles.css" rel="stylesheet" />
     <!-- Google Fonts-->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
	  <script src="js/echarts.min.js"></script>
	
  </head>
  <body>
    <div id="wrapper">
        <nav class="navbar navbar-default top-navbar" role="navigation">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">后台管理系统</a>
            </div>

            <ul class="nav navbar-top-links navbar-right">
			<li class="dropdown"><a class="dropdown-toggle"
				 href="/PIMS_struts2_hibernate/page/admin/sendEmail.jsp"> <i
					class="fa fa-envelope fa-fw"></i>
			</a>
			<!-- /.dropdown -->
			
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#" aria-expanded="false"> <i
					class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
			</a>
				<ul class="dropdown-menu dropdown-user">
					<li><a href="/PIMS_struts2_hibernate/page/admin/infoManage.jsp"><i class="fa fa-user fa-fw"></i>个人信息</a></li>
					<li class="divider"></li>
					<li><a href="page/user/login.jsp"><i class="fa fa-sign-out fa-fw"></i>
							退出</a></li>
				</ul> <!-- /.dropdown-user --></li>
			<!-- /.dropdown -->
		</ul>
        </nav>
        <!--/. NAV TOP  -->
        <nav class="navbar-default navbar-side" role="navigation">
		<div class="sidebar-collapse">
			<ul class="nav" id="main-menu">

				<li><a href="user_adminIndex"><i
						class="fa fa-dashboard"></i> 首页</a></li>
				<li><a href="/PIMS_struts2_hibernate/page/admin/notice.jsp"><i class="fa fa-qrcode"></i> 发布公告</a>
				</li>
				<li><a href="/PIMS_struts2_hibernate/page/admin/videoDelete.jsp"><i class="fa fa-edit"></i>
						视频删除 </a></li>
				<li><a href="videoManage.jsp"><i class="fa fa-sitemap"></i>
						视频审核<span class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<li><a href="/PIMS_struts2_hibernate/page/admin/videoManage.jsp"><i class="active-menu"></i>未审核</a>
						</li>
						<li><a href="/PIMS_struts2_hibernate/page/admin/videoManage2.jsp">审核通过</a></li>
						<li><a href="/PIMS_struts2_hibernate/page/admin/videoManage3.jsp">审核未通过</a></li>
					</ul></li>
				<li><a href="/PIMS_struts2_hibernate/page/admin/infoManage.jsp"  class="active-menu"><i class="glyphicon glyphicon-info-sign"></i>
						信息管理</a></li>
						<li><a href="/PIMS_struts2_hibernate/page/admin/sendEmail.jsp"><i class="glyphicon glyphicon-envelope"></i>
				发送邮件</a></li>
			</ul>
		</div>
		</nav>
		<!-- /. NAV SIDE  -->

	    <div id="page-wrapper">
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-header">
                            	管理员个人信息 <small></small>
                        </h1>
                    </div>
                </div> 
                 <!-- /. ROW  -->
				 				
			 <div class="row">
					  <div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-heading">
						 个人信息
						</div>        									 
							<div class="panel-body row"> 
								<div class="col-md-10 col-md-offset-1 ">
                                  <form role="form">
                                      <div class="form-group  row ">
                                      	  <div class="col-md-2">
                                          	<label class="control-label" for="inputSuccess">用户名</label>
                                          </div>
                                          <div class="col-md-10 form-group input-group">
                                           <span class="input-group-addon"><i class="glyphicon glyphicon-user" ></i></span>
                                          	<input readonly="readonly" type="text" class="form-control" id="inputSuccess" value="<s:property value="#session.userList.get(0).username"/>"/>
                                          	</div>
                                      </div>
                                      <div class="form-group  row ">
                                      	  <div class="col-md-2">
                                          	<label class="control-label" for="inputSuccess1">真实姓名</label>
                                          </div>
                                          <div class="col-md-10 form-group input-group">
                                           <span class="input-group-addon"><i class="glyphicon glyphicon-flash"></i></span>
                                          	<input readonly="readonly" type="text" class="form-control" id="inputSuccess1" value="<s:property value="#session.userList.get(0).name"/>"/>
                                          	</div>	
                                      </div>
                                      <div class="form-group  row ">
                                      	  <div class="col-md-2">
                                          	<label class="control-label" for="inputSuccess2">性别</label>
                                          </div>
                                          <div class="col-md-10 form-group input-group">
                                           <span class="input-group-addon"><i class="glyphicon glyphicon-bookmark" ></i></span>
                                          	<input readonly="readonly" type="text" class="form-control" id="inputSuccess2" value="<s:property value="#session.userList.get(0).sex"/>"/>
                                          	</div>	
                                      </div>
                                      <div class="form-group  row ">
                                      	  <div class="col-md-2">
                                          	<label class="control-label" for="inputSuccess3">生日</label>
                                          </div>
                                          <div class="col-md-10 form-group input-group">
                                           <span class="input-group-addon"><i class="glyphicon glyphicon-calendar" ></i></span>
                                          	<input readonly="readonly" type="text" class="form-control" id="inputSuccess3" value="<s:property value="#session.userList.get(0).birthday"/>"/>
                                          	</div>	
                                      </div>
                                      
                                       <div class="form-group  row ">
                                      	  <div class="col-md-2">
                                          	<label class="control-label" for="inputSuccess4">手机号</label>
                                          </div>
                                          <div class="col-md-10 form-group input-group">
                                           <span class="input-group-addon"><i class="glyphicon glyphicon-earphone" ></i></span>
                                          	<input readonly="readonly" type="text" class="form-control" id="inputSuccess4" value="<s:property value="#session.userList.get(0).phone"/>"/>
                                          	</div>	
                                      </div>
                                      <div class="form-group  row ">
                                      	  <div class="col-md-2">
                                          	<label class="control-label" for="inputSuccess5">邮箱</label>
                                          </div>
                                          <div class="col-md-10 form-group input-group">
                                           <span class="input-group-addon"><i class="glyphicon glyphicon-envelope" ></i></span>
                                          	<input readonly="readonly" type="text" class="form-control" id="inputSuccess5"value="<s:property value="#session.userList.get(0).email"/>"/>
                                          	</div>
                                      </div>
                                      <div class="form-group  row ">
                                      	  <div class="col-md-2">
                                          	<label class="control-label" for="inputSuccess6">地区</label>
                                          </div>
                                          <div class="col-md-10 form-group input-group">
                                           <span class="input-group-addon"><i class="glyphicon glyphicon-map-marker" ></i></span>
                                          	<input readonly="readonly" type="text" class="form-control" id="inputSuccess6"value="<s:property value="#session.userList.get(0).place"/>"/>
                                          	</div>
                                      </div>
                                  </form>
							</div>
						</div>
					</div>						
				</div>		
				</div>
            <!-- /. PAGE INNER  -->
            
        </div>
        <!-- /. PAGE WRAPPER  -->
        <footer>
				<p>
					Copyright &copy; 版权所有 | 软件工程1501 | 刘敬业 20152203257 | 孙中太 20152203179<a href="#" target="_blank"></a>
				</p>
				</footer>
	    </div>
	    
	    
    
    
    
    	</script>
		 <!-- jQuery Js -->
    <script src="assets1/js/jquery-1.10.2.js"></script>
      <!-- Bootstrap Js -->
    <script src="assets1/js/bootstrap.min.js"></script>
    <!-- Metis Menu Js -->
    <script src="assets1/js/jquery.metisMenu.js"></script>
        <!-- Morris Chart Js -->
    <script src="assets1/js/morris/raphael-2.1.0.min.js"></script>
    <script src="assets1/js/morris/morris.js"></script>
         <!-- Custom Js -->
    <script src="assets1/js/custom-scripts.js"></script>   
  </body>
</html>
