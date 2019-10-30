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

<title>My JSP 'index.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="icon" href="icon/favicon.ico">
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/font-awesome.css" type="text/css">
<link rel="stylesheet" href="css/screen.css" type="text/css">
<link rel="stylesheet" href="css/main.css" type="text/css">
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<!-- DataTables CSS -->
<link rel="stylesheet" type="text/css" media="screen"
	href="https://cdn.bootcss.com/ionicons/2.0.1/css/ionicons.min.css">
<link rel="stylesheet" type="text/css"
	href="DataTables-1.10.15/media/css/jquery.dataTables.css">
<!-- jQuery -->
<script type="text/javascript" charset="utf8"
	src="DataTables-1.10.15/media/js/jquery.js"></script>
<!-- DataTables -->
<script type="text/javascript" charset="utf8"
	src="DataTables-1.10.15/media/js/jquery.dataTables.js"></script>
<script>
	$(document).ready(function() {
		$('table.display').dataTable({
			"language" : {
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
				"decimal" : ",",
				"thousands" : ".",
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
	});

     $(document).ready(function() {
           $('#example').DataTable();
      });
</script>
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

<body class="home-template">
	<!--start header-->
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<nav class="navbar navbar-default navbar-fixed-top"
					role="navigation">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Video Player</span><span class="icon-bar"></span><span
							class="icon-bar"></span><span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="user_index">Home</a>
				</div>
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav navbar-right">
						<li><img alt="140x140" height="45" width="45"
							src="face/<s:property value="#session.userInfo.headshow"/>"
							class="img-circle" onclick="window.location.href='user_home'" /></li>
						<li><a href="https://mail.sina.com.cn/" target="_blank" onclick="cleanEmail(<s:property value="#session.userInfo.id"/>);"><i class="icon ion-email" style="font-size: 30px;"></i><span class="badge"><s:property value="#session.emailcount"/></span> </a></li>
						<li><a href="collection_index">收藏夹</a></li>
						<li><a href="video_upload">投稿</a></li>
						<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
					</ul>
				</div>
				</nav>
			</div>
		</div>
	</div>
	<header class="main-header"
		style="background-image: url(images/banner.jpg);margin-top: 50px;height:300px">
	<div class="container">
		<div class="row">
			<!--start header nav-->
			<div class="pull-right">
				<form class="navbar-form" role="search" method="post" action="video_search">
					<div class="input-group">
						<input class="form-control" placeholder="Search" name="searchinfo"
							type="text">
						<div class="input-group-btn">
							<button class="btn btn-primary" type="submit">
								<i class="fa fa-search" aria-hidden="true"></i>
							</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	</header>
	<!--end header-->

	<!--start nav-->
	<nav class="main-navigation">
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<div class="navbar-header">
					<span class="nav-toggle-button collapsed"> <span
						class="sr-only">Toggle navigation</span> <i class="fa fa-bars"></i>
					</span>
				</div>
				<div class="collapse navbar-collapse">
					<ul class="menu">
						<li class="nav-current" role="presentation"><a
							href="user_index">首页</a></li>
						<li role="presentation"><a href="user_others?classify=1"
							title="游戏区" target="_blank">游戏区</a></li>
						<li role="presentation"><a href="user_others?classify=2"
							title="生活区" target="_blank">生活区</a></li>
						<li role="presentation"><a href="user_others?classify=3"
							title="影视区" target="_blank">影视区</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	</nav>
	<!--end nav-->

	<!-- Feature Carousel Section -->
	<section id="feature_news_section"
		class="feature_news_section section_wrapper"
		style="margin-bottom: 50px">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<table id="example" class="display" cellspacing="0" width="100%">
					<thead>
						<tr>
							<td>公&nbsp;&nbsp;告</td>
							<td>发布时间</td>
						</tr>
					</thead>
					<tbody>
						<s:iterator id="c" value="#session.allnotices">
							<tr>
								<td><i class="fa fa-bullhorn" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;&nbsp;<a href="notice_article?nid=<s:property value="#c.id" />"><s:property value="#c.title" /></a></td>
								<td><s:property value="#c.ntime" /></td>
							</tr>
						</s:iterator>
					</tbody>
				</table>
			</div>
		</div>
		<!--row-->
	</div>
	<!--container--> </section>

	<!--start copyright-->
	<div class="copyright">
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<span>Copyright &copy; <a href="#">Video Player 软工1501</a></span>版权所有 | 刘敬业 20152203257<span> </span>版权所有 | 孙中太 20152203179<span></span>
				</div>
			</div>
		</div>
	</div>
	<!--end copyright-->

	<!--start ReturnTopButton-->
	<!--<a href="#" id="back-to-top"><i class="fa fa-angle-up"></i></a>-->
	<!--end ReturnTopButton-->
	<script>
	function cleanEmail(userid){
        // 1.创建异步交互对象
        var xhr = createXmlHttp();
		// 2.设置监听
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4){
				if(xhr.status == 200){
				}
			}
		}
		// 3.打开连接
		xhr.open("GET","email_cleanEmail?uid=${userInfo.id}",true);
		// 4.发送
		xhr.send(null);
    };
    function createXmlHttp(){
		var xmlHttp;
		try{ // Firefox, Opera 8.0+, Safari
			xmlHttp=new XMLHttpRequest();
		}catch (e){
			try{// Internet Explorer
				xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
			}catch (e){
				 try{
				 	xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
				}catch (e){}
			}
		}
		return xmlHttp;
	};
	</script>
</body>
</html>
