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

<title>My JSP 'index.jsp' starting page</title>

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
<script src="js/echarts.min.js"></script>

</head>
<body>
	<%
		
		String wsh=(String)session.getAttribute("weishenhei");
		String st=(String)session.getAttribute("tongguo");
		String swt=(String)session.getAttribute("weitongguo");
		
		%>
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

				<li><a href="user_adminIndex" class="active-menu"><i
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
				<li><a href="/PIMS_struts2_hibernate/page/admin/infoManage.jsp"><i class="glyphicon glyphicon-info-sign"></i>
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
							最新数据 
						</h1>
					</div>
				</div>
				<!-- /. ROW  -->

				<div class="row">
					<div class="col-md-3 col-sm-12 col-xs-12">
						<div
							class="panel panel-primary text-center no-boder bg-color-green">
							<div class="panel-body">
								<i class="fa fa-users fa-5x"></i>
								<h3>
									<s:property value="#session.usercount" />
								</h3>
							</div>
							<div class="panel-footer back-footer-green">注册的用户</div>
						</div>
					</div>
					<div class="col-md-3 col-sm-12 col-xs-12">
						<div
							class="panel panel-primary text-center no-boder bg-color-blue">
							<div class="panel-body">
								<i class="glyphicon glyphicon-facetime-video fa-5x"></i>
								<h3>
									<s:property value="#session.videocount" />
								</h3>
							</div>
							<div class="panel-footer back-footer-blue">视频个数</div>
						</div>
					</div>
					<div class="col-md-3 col-sm-12 col-xs-12">
						<div
							class="panel panel-primary text-center no-boder bg-color-brown">
							<div class="panel-body">
								<i class="fa fa fa-comments fa-5x"></i>
								<h3>
									<s:property value="#session.commentscount" />
								</h3>
							</div>
							<div class="panel-footer back-footer-brown">评论个数</div>
						</div>
					</div>
					<div class="col-md-3 col-sm-12 col-xs-12">
						<div class="panel panel-primary text-center no-boder bg-color-red">
							<div class="panel-body">
								<i class="glyphicon glyphicon-heart fa-5x"></i>
								<h3>
									<s:property value="#session.playback" />
								</h3>
							</div>
							<div class="panel-footer back-footer-red">收藏量</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-2 col-sm-2 col-xs-2"></div>
					<div class="col-md-8 col-sm-8 col-xs-8">
						<div class="panel panel-default">
							<div class="panel-heading">Donut Chart Example</div>
							<div class="panel-body">
								<div id="main1" style="width:1030px;height:430px;"></div>
							</div>
						</div>
					</div>
					<div class="col-md-2 col-sm-2 col-xs-2"></div>
				</div>
				<!-- /. ROW  -->

				
				
			</div>
			<!-- /. PAGE INNER  -->
			<footer>
				<p>
					Copyright &copy; 版权所有 | 软件工程1501 | 刘敬业 20152203257 | 孙中太 20152203179<a href="#" target="_blank"></a>
				</p>
				</footer>
		</div>
		
		<!-- /. PAGE WRAPPER  -->
		
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

	<script type="text/javascript">

        // 基于准备好的dom，初始化echarts实例
      
        var myChart1 = echarts.init(document.getElementById('main1'));
        
        var  wsh=<%=wsh%>;
        var  st=<%=st%>;
        var  swt=<%=swt%>;
        
	    option = {
		    title : {
		        text: '视频审核',
		        subtext: '纯属虚构',
		        x:'center'
		    },
		    tooltip : {
		        trigger: 'item',
		        formatter: "{a} <br/>{b} : {c} ({d}%)"
		    },
		    legend: {
		        orient: 'vertical',
		        left: 'left',
		        data: ['未审核的视频','审核通过的视频','审核未通过的视频']
		    },
		    series : [
		        {
		            name: '访问来源',
		            type: 'pie',
		            radius : '55%',
		            center: ['50%', '60%'],
		            data:[
		                {value:wsh, name:'未审核的视频'},
		                {value:st, name:'审核通过的视频'},
		                {value:swt, name:'审核未通过的视频'}  
		            ],
		            itemStyle: {
		                emphasis: {
		                    shadowBlur: 10,
		                    shadowOffsetX: 0,
		                    shadowColor: 'rgba(0, 0, 0, 0.5)'
		                }
		            }
		        }
		    ]
		};
        myChart1.setOption(option);
</script>
</body>
</html>
