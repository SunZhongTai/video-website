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
		
		<nav class="navbar-default navbar-side" role="navigation">
		<div class="sidebar-collapse">
			 <ul class="nav" id="main-menu">
	                    <li>
	                        <a href="/PIMS_struts2_hibernate/page/admin/index.jsp"><i class="fa fa-dashboard"></i>首页</a>
	                    </li>
	                    <li>
	                        <a href="/PIMS_struts2_hibernate/page/admin/notice.jsp"><i class="fa fa-qrcode"></i> 发布公告</a>
	                    </li>
	                    <li>
	                        <a href="/PIMS_struts2_hibernate/page/admin/videoDelete.jsp"><i class="fa fa-edit"></i>  视频删除 </a>
	                    </li>	
	                    <li>
	                        <a href="/PIMS_struts2_hibernate/page/admin/videoManage.jsp" class="active-menu"><i class="fa fa-sitemap"></i> 视频审核<span class="fa arrow"></span></a>
	                        <ul class="nav nav-second-level">
	                            <li>
	                                <a href="/PIMS_struts2_hibernate/page/admin/videoManage.jsp"><i class="active-menu"></i>未审核</a>
	                            </li>
	                            <li>
	                                <a href="/PIMS_struts2_hibernate/page/admin/videoManage2.jsp">审核通过</a>
	                            </li>
	                            <li>
	                                <a href="/PIMS_struts2_hibernate/page/admin/videoManage3.jsp">审核未通过</a>	   
	                            </li>
	                        </ul>
	                    </li>
	                  	<li>
	                        <a href="/PIMS_struts2_hibernate/page/admin/infoManage.jsp"><i class="glyphicon glyphicon-info-sign"></i> 信息管理</a>
	                    </li>
	                    <li><a href="/PIMS_struts2_hibernate/page/admin/sendEmail.jsp"><i class="glyphicon glyphicon-envelope"></i>
				发送邮件</a></li>
	                </ul>
		</div>

		</nav>

		<s:iterator value="#session.videos" var="ff">
			<s:if test="#ff.id==#session.infoid">
				<div id="page-wrapper">
					<div id="page-inner">
						<div class="row">
							<div class="col-md-12">
								<h1 class="page-header">
									<s:property value="#ff.title" />
									<small><s:property value="#ff.username" /></small>
								</h1>
							</div>
						</div>
						<!-- /. ROW  -->

						<div class="row">
							<div class="col-md-12 col-sm-12 col-xs-12">
								<div class="panel panel-default">
									<div class="panel-body">
										<div id="morris-bar-chart">
											<div class="embed-responsive embed-responsive-16by9">
												<iframe class="embed-responsive-item"
													src="videos/<s:property value="#ff.url"/>" style="width:100%;height:480"
													allowfullscreen frameborder="0"></iframe>
											</div>
										</div>


									</div>
								</div>
							</div>
						</div>
						<!-- /. ROW  -->

						<div class="row">
							<div class="col-md-12">
								<div class="panel panel-default">									
									<div class="panel-body">
										<ul class="nav nav-tabs">
			                                <li class="active"><a href="#home" data-toggle="tab">视频信息</a>
			                                </li>
			                                <li class=""><a href="#profile" data-toggle="tab">评论管理</a>
			                                </li>
			                            </ul>
			                             <div class="tab-content">
			                             	<div class="tab-pane fade active in" id="home">
						                             <div class="alert alert-success">
														<strong>上传用户 </strong><s:property value="#ff.username" />
													</div>
													 <div class="alert alert-info">
														<strong>上传时间 <s:property value="#ff.uploadtime" /></strong>
														<s:property value="#ff.uploadtime" />
													</div>
													 <div class="alert alert-warning">
														<strong>简介&nbsp;&nbsp;&nbsp; </strong>
														<s:property value="#ff.introduce" />
													</div>
													 <div class="alert alert-danger">
														<strong>分类 &nbsp;&nbsp;&nbsp;</strong>
														<s:if test="#ff.classify==1">
															游戏
														</s:if>
																<s:elseif test="#ff.classify==2">
															生活
														</s:elseif>
																<s:else>
															影视
														</s:else>
													</div>
													 
			                                	</div>	
			                                <div class="tab-pane fade" id="profile">
			                                	<s:form action="comments!commentsDeleteChoose" method="post">	
			                                	<table  class="table table-striped table-bordered table-hover"  align="center" name="example" id="example">	
			                                	<s:iterator value="#session.comm"  var="co">
			                                		<s:if test="#co.videoid==#session.infoid">
					                                	<tr>
												     		<td><input type="checkbox"  name="check" value="<s:property value='#co.id'/>"></input></td>									          											          											
											          		<td><s:property value="#co.commentername"/></td>
											          		<td><s:property value="#co.comment"/></td>
											          		<td>
											          			<s:property value="#co.time"/>
											          		</td>				          		
											          		<td align="center"> <a  class="btn btn-danger" 	onclick="javascript:window.location.href='comments!commentsDelete?commid=<s:property value="#co.id"/>'" />删除</a></td>				          		
											          	</tr>
											          </s:if>
									          	</s:iterator>
									          	</table>
									          	<div style="text-align:center">
									          	<input class="btn btn-danger" value="删除所选评论" type="submit"/></input>
									          	</div>	
									          	</s:form>
			                               		                                    
			                                </div>
			                                										
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- /. PAGE INNER  -->
				</div>
			</s:if>
		</s:iterator>

	</div>
	<s:debug />

	<script>$(document).ready(function() {
			$('#example').DataTable();
		});
	</script>

	<!-- jQuery Js -->
	<script src="assets1/js/jquery-1.10.2.js"></script>
	<!-- Bootstrap Js -->
	<script src="assets1/js/bootstrap.min.js"></script>
	<!-- Metis Menu Js -->
	<script src="assets1/js/jquery.metisMenu.js"></script>
	<script>
		$(document).ready(function() {
			$('#dataTables-example').dataTable();
		});
	</script>
	<!-- Custom Js -->
	<script src="assets1/js/custom-scripts.js"></script>


</body>
</html>
