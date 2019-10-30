<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登录</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="vendor/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="vendor/linearicons/style.css">
	<link rel="stylesheet" href="css/login.css">
	<link rel="stylesheet" href="css/demo.css">
	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
	<link rel="apple-touch-icon" sizes="76x76" href="img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="img/favicon.png">
	<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.js"></script>
  </head>
  
  <body>
  <!-- WRAPPER -->
	<div id="wrapper">
		<div class="vertical-align-wrap">
			<div class="vertical-align-middle">
				<div class="auth-box ">
					<div class="left">
						<div class="content">
							<div class="header">
								<h1>Login to your account</h1>
							</div>
							<form class="form-horizontal" action="login" method="post">
								<div class="form-group">
									<label for="inputUsername" class="col-sm-2 control-label">用户名:</label>
									<div class="col-sm-10">
										<input class="form-control" id="inputUsername" type="text"
											name="user.username" />
									</div>
								</div>
								<div class="form-group">
									<label for="inputPassword" class="col-sm-2 control-label">密 码:</label>
									<div class="col-sm-10">
										<input class="form-control" id="inputPassword" type="password"
											name="user.password" />
									</div>
								</div>
								<div class="form-group">
									<label style="text-align: center" for="inputLevel"
										class="col-sm-2 control-label">身 份:</label>
									<div class="col-sm-10">
										<select class="form-control" id="inputLevel" name="user.Level">
											<option value="0">用户</option>
											<option value="1">管理员</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-offset-2 col-sm-10">
										<button type="submit" class="btn btn-primary btn-lg btn-block">登录</button>
										&nbsp;&nbsp;&nbsp;&nbsp;
										<a href="page/user/regist.jsp" class="btn btn-default  btn-lg btn-block">注册账号</a>
									</div>
								</div>
							</form>
							
						</div>
					</div>
					<div class="right">
						<div class="overlay"></div>
						<div class="content text">
							<h1 class="heading">The Video Website</h1>
							<p>Technical Otaku Save The World</p>
						</div>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
	</div>
	<!-- END WRAPPER -->
  </body>
</html>
