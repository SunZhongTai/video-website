<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@page import="java.util.ArrayList"%>



<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'test.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css"
	href="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="http://cdn.datatables.net/plug-ins/28e7751dbec/integration/bootstrap/3/dataTables.bootstrap.css" />
<script src="http://cdn.gbtags.com/datatables/1.10.5/js/jquery.js"></script>
<script
	src="http://cdn.gbtags.com/datatables/1.10.5/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" language="javascript"
	src="http://cdn.datatables.net/plug-ins/28e7751dbec/integration/bootstrap/3/dataTables.bootstrap.js"></script>

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
<link href='https://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
<style>

th {
	text-align: center; /** 设置水平方向居中 */
	vertical-align: middle /** 设置垂直方向居中 */
}

td {
	text-align: center; /** 设置水平方向居中 */
	vertical-align: middle /** 设置垂直方向居中 */
}
</style>
</head>

<body width="200">
	<div id="wrapper">
		<nav class="navbar navbar-default top-navbar" role="navigation">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".sidebar-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
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
				<li><a href="/PIMS_struts2_hibernate/page/admin/notice.jsp"><i
						class="fa fa-qrcode"></i> 发布公告</a></li>
				<li><a
					href="/PIMS_struts2_hibernate/page/admin/videoDelete.jsp"><i
						class="fa fa-edit"></i> 视频删除 </a></li>
				<li><a href="/PIMS_struts2_hibernate/page/admin/videoManage.jsp"><i class="fa fa-sitemap"></i>
						视频审核<span class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<li><a
							href="/PIMS_struts2_hibernate/page/admin/videoManage.jsp"><i
								></i>未审核</a></li>
						<li><a
							href="/PIMS_struts2_hibernate/page/admin/videoManage2.jsp" class="active-menu">审核通过</a></li>
						<li><a
							href="/PIMS_struts2_hibernate/page/admin/videoManage3.jsp">审核未通过</a></li>
					</ul></li>
				<li><a href="/PIMS_struts2_hibernate/page/admin/infoManage.jsp"><i
						class="glyphicon glyphicon-info-sign"></i> 信息管理</a></li>
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
							审核通过<small></small>
						</h1>
					</div>
				</div>
				<!-- /. ROW  -->

				<div class="row">
					<div class="col-md-12">
						<!-- Advanced Tables -->
						<div class="panel panel-default">
							<div class="panel-body">
								<div class="table-responsive">
									<s:form action="deleteFriAction" method="post">
										<table class="table table-striped table-bordered table-hover"
											align="center" name="example" id="example">
											<thead>
												<tr>
													<th>视频名称</th>
													<th>投稿区</th>
													<th>用户名称</th>
													<th>上传时间</th>
													<th>操作</th>
												</tr>
											</thead>
											<tbody>
												<s:iterator value="#session.videos" var="ff">
												<div>
													<s:if test='#ff.status=="1"'>
														<tr>
															<td><s:property value="#ff.title" /></td>
															<s:if test='#ff.classify=="1"'>
																<td>游戏区</td>
															</s:if>
															<s:elseif test='#ff.classify=="2"'>
																<td>生活区</td>
															</s:elseif>
															<s:else>
																<td>影视区</td>
															</s:else>
															<td><s:property value="#ff.username" /></td>
															<td><s:property value="#ff.uploadtime" /></td>
															<td align="center">
															<a class="btn btn-primary"  target="_blank" href="videoInfo!videoinfo?infoid=<s:property value="#ff.id"/>">详细信息</a></td>
														</tr>
													</s:if>
												</div>
												</s:iterator>
											</tbody>
										</table>
									</s:form>
								</div>
							</div>
						</div>
						<!--End Advanced Tables -->
					</div>
				</div>
				<!-- /. ROW  -->
				
			</div>
			<footer>
				<p>
					Copyright &copy; 版权所有 | 软件工程1501 | 刘敬业 20152203257 | 孙中太 20152203179<a href="#" target="_blank"></a>
				</p>
				</footer>
		</div>
		<s:debug />
		<script>
   	$(document).ready(function() {
   		$('#example').DataTable();
   	});
   
   	$('#example').DataTable({
   		language : {
   			"sProcessing" : "处理中...",
   			"sLengthMenu" : "显示 _MENU_ 项结果",
   			"sZeroRecords" : "没有匹配结果",
   			"sInfo" : "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
   			"sInfoEmpty" : "显示第 0 至 0 项结果，共 0 项",
   			"sInfoFiltered" : "(由 _MAX_ 项结果过滤)",
   			"sInfoPostFix" : "",
   			"sSearch" : "搜索:",
   			"sUrl" : "",
   			"sEmptyTable" : "表中数据为空",
   			"sLoadingRecords" : "载入中...",
   			"sInfoThousands" : ",",
   			"oPaginate" : {
   				"sFirst" : "首页",
   				"sPrevious" : "上页",
   				"sNext" : "下页",
   				"sLast" : "末页"
   			},
   			"oAria" : {
   				"sSortAscending" : ": 以升序排列此列",
   				"sSortDescending" : ": 以降序排列此列"
   			}
   		}
   	});
   </script>

		<!-- jQuery Js -->
		<script src="assets1/js/jquery-1.10.2.js"></script>
		<!-- Bootstrap Js -->
		<script src="assets1/js/bootstrap.min.js"></script>
		<!-- Metis Menu Js -->
		<script src="assets1/js/jquery.metisMenu.js"></script>
		<!-- DATA TABLE SCRIPTS -->

		<script>
     	$(document).ready(function() {
     		$('#dataTables-example').dataTable();
     	});
     </script>
		<!-- Custom Js -->
		<script src="assets1/js/custom-scripts.js"></script>
</body>
</html>