<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'login.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<link href="assets/css/style.css" rel="stylesheet" />
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
</head>
<body>

	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<h3 class="text-center">登录</h3>
				<hr>
				<div class="row clearfix">
					<div class="col-md-7 column">
						<img alt="140x140" src="images/login.png" class="img-rounded" />
					</div>
					<div class="col-md-5 column">
						<form class="form-horizontal" action="login" method="post">
							<div class="form-group">
								<label for="inputUsername" class="col-sm-2 control-label">用户名</label>
								<div class="col-sm-10">
									<input class="form-control" id="inputUsername" type="text"
										name="user.username" />
								</div>
							</div>
							<div class="form-group">
								<label for="inputPassword" class="col-sm-2 control-label">密码</label>
								<div class="col-sm-10">
									<input class="form-control" id="inputPassword" type="password"
										name="user.password" />
								</div>
							</div>
							<div class="form-group">
								<label style="text-align: center" for="inputLevel"
									class="col-sm-3 control-label">身份</label>
								<div class="col-sm-9">
									<select class="form-control" id="inputLevel" name="user.Level">
										<option value="0">用户</option>
										<option value="1">管理员</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<button type="submit" class="btn btn-default">登录</button>
									&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="regist.jsp" class="btn btn-default">注册账号</a>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
    
    <!-- FOOTER SECTION END-->
    <!-- JAVASCRIPT AT THE BOTTOM TO REDUCE THE LOADING TIME  -->
    <!-- CORE JQUERY SCRIPTS -->
    <script type="text/javascript" src="js/My97DatePicker/WdatePicker.js"></script>
    <script src="assets/js/jquery-1.11.1.js"></script>
    <!-- BOOTSTRAP SCRIPTS  -->
    <script src="assets/js/bootstrap.js"></script>
    <s:debug></s:debug>
</body>
</html>
