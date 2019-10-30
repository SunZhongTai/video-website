<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@page import="java.util.ArrayList"%>



<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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

</head>

<body width="200">
	<div id="wrapper">
		<nav class="navbar navbar-default top-navbar" role="navigation">
		<div class="navbar-header">
			<h5 class="navbar-brand" href="index.html">后台管理系统</h5>
		</div>
		<ul class="nav navbar-top-links navbar-right">
			<li class="dropdown"><a class="dropdown-toggle"
				href="/PIMS_struts2_hibernate/page/admin/sendEmail.jsp"> <i
					class="fa fa-envelope fa-fw"></i>
			</a> <!-- /.dropdown -->
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#" aria-expanded="false"> <i
					class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
			</a>
				<ul class="dropdown-menu dropdown-user">
					<li><a
						href="/PIMS_struts2_hibernate/page/admin/infoManage.jsp"><i
							class="fa fa-user fa-fw"></i>个人信息</a></li>
					<li class="divider"></li>
					<li><a href="page/user/login.jsp"><i
							class="fa fa-sign-out fa-fw"></i> 退出</a></li>
				</ul> <!-- /.dropdown-user --></li>
			<!-- /.dropdown -->
		</ul>
		</nav>

		<nav class="navbar-default navbar-side" role="navigation">
		<div class="sidebar-collapse">
			<ul class="nav" id="main-menu">

				<li><a href="index.jsp"><i class="fa fa-dashboard"></i> 首页</a>
				</li>
				<li><a href="notice.jsp"><i class="fa fa-qrcode"></i> 发布公告</a>
				</li>
				<li><a href="videoDelete.jsp"><i class="fa fa-edit"></i>
						视频删除 </a></li>
				<li><a href="videoManage.jsp" class="active-menu"><i
						class="fa fa-sitemap"></i> 视频审核<span class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<li><a href="videoManage.jsp"><i class="active-menu"></i>未审核</a>
						</li>
						<li><a href="videoManage2.jsp">审核通过</a></li>
						<li><a href="videoManage3.jsp">审核未通过</a></li>
					</ul></li>
				<li><a href="infoManage.jsp"><i class="glyphicon glyphicon-info-sign"></i>
						信息管理</a></li>
				<li><a href="/PIMS_struts2_hibernate/page/admin/sendEmail.jsp"><i
						class="glyphicon glyphicon-envelope"></i> 发送邮件</a></li>
			</ul>

		</div>

		</nav>

		<div id="page-wrapper">
			<div class="panel-body">
				<div class="alert alert-warning">
					<h1>
						<strong>评论删除</strong>
					</h1>
				</div>
			</div>
			<div id="page-inner">
				<s:form action="comments!commentsDeleteChoose" method="post">
					<table class="table table-striped table-bordered table-hover"
						align="center" name="example" id="example">
						<thead>
							<tr>
								<th height="30">选择</th>
								<th height="30">用户id</th>
								<th height="30">用户头像</th>
								<th height="30">用户名称</th>
								<th height="30">评论</th>
								<th height="30">评论时间</th>
								<th height="30">操作</th>
							</tr>
						</thead>
						<tbody>
							<s:iterator value="#session.comm" var="co">
								<div>

									<tr>
										<td><input type="checkbox" name="check"
											value="<s:property value='#co.id'/>"></input></td>
										<td><s:property value="#co.commenterid" /></td>
										<td><s:property value="#co.url" /></td>
										<td><s:property value="#co.commentername" /></td>
										<td><s:property value="#co.comment" /></td>
										<td><s:property value="#co.time" /></td>
										<td align="center"><a class="btn btn-danger"
											onclick="javascript:window.location.href='comments!commentsDelete?commid=<s:property value="#co.id"/>'" />删除</a></td>
									</tr>
								</div>
							</s:iterator>
						</tbody>

					</table>
					<input class="btn btn-danger" value="删除所选评论" type="submit" /></input>
				</s:form>
			</div>
		</div>

	</div>
	<s:debug />

	<script>
     $(document).ready(function() {
           $('#example').DataTable();
      });
     
     
     $('#example').DataTable({
    	    language: {
    	        "sProcessing": "处理中...",
    	        "sLengthMenu": "显示 _MENU_ 项结果",
    	        "sZeroRecords": "没有匹配结果",
    	        "sInfo": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
    	        "sInfoEmpty": "显示第 0 至 0 项结果，共 0 项",
    	        "sInfoFiltered": "(由 _MAX_ 项结果过滤)",
    	        "sInfoPostFix": "",
    	        "sSearch": "搜索:",
    	        "sUrl": "",
    	        "sEmptyTable": "表中数据为空",
    	        "sLoadingRecords": "载入中...",
    	        "sInfoThousands": ",",
    	        "oPaginate": {
    	            "sFirst": "首页",
    	            "sPrevious": "上页",
    	            "sNext": "下页",
    	            "sLast": "末页"
    	        },
    	        "oAria": {
    	            "sSortAscending": ": 以升序排列此列",
    	            "sSortDescending": ": 以降序排列此列"
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
	<!-- Custom Js -->
	<script src="assets1/js/custom-scripts.js"></script>


</body>
</html>
