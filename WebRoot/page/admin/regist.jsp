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

<title>My JSP 'regist.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style>
input[type=date]::-webkit-datetime-edit-text {
	
}
</style>
</head>

<body>
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<h3 class="text-center">注册信息</h3>
				<hr>
				<div class="row clearfix">
					<div class="col-md-4 column"></div>
					<div class="col-md-4 column">
						<form class="form-horizontal" role="form" action="regist"
							method="post">
							<div class="form-group">
								<label style="text-align: center" for="inputusername"
									class="col-sm-3 control-label">用户名</label>
								<div class="col-sm-9">
									<input class="form-control" id="inputusername" type="text"
										name="user.username" required="required" />
								</div>
							</div>
							<div class="form-group">
								<label style="text-align: center" for="inputPassword"
									class="col-sm-3 control-label">密码</label>
								<div class="col-sm-9">
									<input class="form-control" id="inputPassword" type="password"
										name="user.password" required="required" />
								</div>
							</div>
							<div class="form-group">
								<label style="text-align: center" for="inputRepassword"
									class="col-sm-3 control-label">确认密码</label>
								<div class="col-sm-9">
									<input class="form-control" id="inputRepassword"
										type="password" name="user.repassword" required="required" />
								</div>
							</div>
							<div class="form-group">
								<label style="text-align: center" for="inputName"
									class="col-sm-3 control-label">真实姓名</label>
								<div class="col-sm-9">
									<input class="form-control" id="inputName" type="text"
										name="user.name" required="required" />
								</div>
							</div>
							<div class="form-group">
								<label style="text-align: center" for="inputSex"
									class="col-sm-3 control-label">性别</label>
								<div class="col-sm-9">
									<select class="form-control" id="inputSex" name="user.sex">
										<option value="男">男</option>
										<option value="女">女</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label style="text-align: center" for="inputBirthday"
									class="col-sm-3 control-label">出生日期</label>
								<div class="col-sm-9">
									<input class="form-control" id="inputBirthday" type="date"
										name="user.birthday" required="required" />
								</div>
							</div>
							<div class="form-group">
								<label style="text-align: center" for="inputNation"
									class="col-sm-3 control-label">民族</label>
								<div class="col-sm-9">
									<select class="form-control" id="inputNation"
										name="user.nation">
										<option value="汉族">汉族</option>
										<option value="蒙古族">蒙古族</option>
										<option value="回族">回族</option>
										<option value="藏族">藏族</option>
										<option value="维吾尔族">维吾尔族</option>
										<option value="苗族">苗族</option>
										<option value="彝族">彝族</option>
										<option value="壮族">壮族</option>
										<option value="布依族">布依族</option>
										<option value="朝鲜族">朝鲜族</option>
										<option value="满族">满族</option>
										<option value="侗族">侗族</option>
										<option value="瑶族">瑶族</option>
										<option value="白族">白族</option>
										<option value="土家族">土家族</option>
										<option value="哈尼族">哈尼族</option>
										<option value="哈萨克族">哈萨克族</option>
										<option value="傣族">傣族</option>
										<option value="黎族">黎族</option>
										<option value="傈僳族">傈僳族</option>
										<option value="佤族">佤族</option>
										<option value="畲族">畲族</option>
										<option value="高山族">高山族</option>
										<option value="拉祜族">拉祜族</option>
										<option value="水族">水族</option>
										<option value="东乡族">东乡族</option>
										<option value="纳西族">纳西族</option>
										<option value="景颇族">景颇族</option>
										<option value="柯尔克孜族">柯尔克孜族</option>
										<option value="土族">土族</option>
										<option value="达斡尔族">达斡尔族</option>
										<option value="仫佬族">仫佬族</option>
										<option value="羌族">羌族</option>
										<option value="布朗族">布朗族</option>
										<option value="撒拉族">撒拉族</option>
										<option value="毛南族">毛南族</option>
										<option value="仡佬族">仡佬族</option>
										<option value="锡伯族">锡伯族</option>
										<option value="阿昌族">阿昌族</option>
										<option value="普米族">普米族</option>
										<option value="塔吉克族">塔吉克族</option>
										<option value="怒族">怒族</option>
										<option value="乌孜别克族">乌孜别克族</option>
										<option value="俄罗斯族">俄罗斯族</option>
										<option value="鄂温克族">鄂温克族</option>
										<option value="德昂族">德昂族</option>
										<option value="保安族">保安族</option>
										<option value="裕固族">裕固族</option>
										<option value="京族">京族</option>
										<option value="塔塔尔族">塔塔尔族</option>
										<option value="独龙族">独龙族</option>
										<option value="鄂伦春族">鄂伦春族</option>
										<option value="赫哲族">赫哲族</option>
										<option value="门巴族">门巴族</option>
										<option value="珞巴族">珞巴族</option>
										<option value="基诺族">基诺族</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label style="text-align: center" for="inputEdu"
									class="col-sm-3 control-label">学历</label>
								<div class="col-sm-9">
									<select class="form-control" id="inputEdu" name="user.edu">
										<option value="博士">博士</option>
										<option value="硕士">硕士</option>
										<option value="本科">本科</option>
										<option value="大">大专</option>
										<option value="高中">高中</option>
										<option value="初中">初中</option>
										<option value="小学">小学</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label style="text-align: center" for="inputWork"
									class="col-sm-3 control-label">职业</label>
								<div class="col-sm-9">
									<select class="form-control" id="inputWork" name="user.work">
										<option value="学生">学生</option>
										<option value="教师">教师</option>
										<option value="其他">其他</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label style="text-align: center" for="inputPhone"
									class="col-sm-3 control-label">电话</label>
								<div class="col-sm-9">
									<input class="form-control" id="inputPhone" type="tel"
										name="user.phone" onblur="checkMobile(inputPhone.value);"
										required="required" />
								</div>
							</div>
							<div class="form-group">
								<label style="text-align: center" for="inputPlace"
									class="col-sm-3 control-label">居住地</label>
								<div class="col-sm-9">
									<input class="form-control" id="inputPlace" type="text"
										name="user.Place" required="required" />
								</div>
							</div>
							<div class="form-group">
								<label style="text-align: center" for="inputEmail"
									class="col-sm-3 control-label">E-mail</label>
								<div class="col-sm-9">
									<input class="form-control" id="inputEmail" type="email"
										name="user.Email" required="required" />
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<button type="submit" class="btn btn-default">注册</button>
									&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="login.jsp" class="btn btn-default">已有账号，返回登录</a>
								</div>
							</div>
						</form>
					</div>
					<div class="col-md-4 column"></div>
				</div>
			</div>
		</div>
	</div>
	<s:debug></s:debug>
</body>
<script language="javascript" type="text/javascript">
	function checkMobile(str) {
		var re = /^[1][3,4,5,7,8][0-9]{9}$/;
		if (!re.test(str)) {
			alert("手机号格式错误！");
		}
	}
</script>
</html>
