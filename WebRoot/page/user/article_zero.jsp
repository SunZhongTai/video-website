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

<title>My JSP 'home.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css" media="screen"
	href="https://cdn.bootcss.com/ionicons/2.0.1/css/ionicons.min.css">
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/font-awesome.css" type="text/css">
<link rel="stylesheet" href="css/screen.css" type="text/css">
<link rel="stylesheet" href="css/main.css" type="text/css">
<link rel="stylesheet" href="css/home.css" type="text/css">
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.js"></script>
</head>

<body>
	<!--start header-->
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<nav class="navbar navbar-default navbar-fixed-top"
					role="navigation">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span><span
							class="icon-bar"></span><span class="icon-bar"></span><span
							class="icon-bar"></span>
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
		style="background-image: url(images/home_banner.jpg);margin-top: 50px;height:100px">
	<div class="container">
		<div class="row"></div>
	</div>
	</header>
	<!--end header-->
	<div class="container" style="margin-top: 50px;">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="row clearfix">
					<div class="col-md-2 column">
						<div class="panel-group" id="panel-325640">
							<div class="panel panel-default">
								<div class="panel-heading">
									<a class="panel-title" data-toggle="collapse"
										data-parent="#panel-325640" href="#panel-element-000001">个人中心</a>
								</div>
								<div id="panel-element-000001" class="panel-collapse collapse">
									<div class="panel-body">
										<a href="user_home">我的信息</a>
									</div>
									<div class="panel-body">
										<a href="user_headshow">我的头像</a>
									</div>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<a class="panel-title" data-toggle="collapse"
										data-parent="#panel-325640" href="#panel-element-126683">个人空间</a>
								</div>
								<div id="panel-element-126683" class="panel-collapse collapse">
									<div class="panel-body">
										<a href="collection_index">我的收藏夹</a>
									</div>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<a class="panel-title" data-toggle="collapse"
										data-parent="#panel-325640" href="#panel-element-000002">投稿管理</a>
								</div>
								<div id="panel-element-000002"
									class="panel-collapse collapse in">
									<div class="panel-body">
										<a href="video_upload">投稿</a>
									</div>
									<div class="panel-body">
										<a href="video_article">内容管理</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-10 column" style="background-color:white;">
						<div class="col-md-12 column" style="margin-bottom:50px;">
							<div class="row clearfix">
								<div class="col-md-12 column">
									<ul class="breadcrumb">
										<li><a href="video_article">投稿管理</a></li>
										<li class="active">内容管理</li>
										<li class="active"><s:property
												value="#session.videozero.title" /></li>
									</ul>
								</div>
								<div class="col-md-12 column">
									<article class="post">
									<div class="post-head">
										<h1 class="post-title">
											<s:property value="#session.videozero.title" />
										</h1>
										<div class="post-meta" style="background-color:">
											<span class="author">作者：<s:property
													value="#session.videozero.username" /></span>·
											<time class="post-date"
												datetime="<s:property value="#session.videozero.uploadtime" />"
												title="<s:property value="#session.videozero.uploadtime" />">
											<s:property value="#session.videozero.uploadtime" /> </time>
										</div>
									</div>
									<div class="featured-media">
										<div class="embed-responsive embed-responsive-16by9">
											<iframe class="embed-responsive-item" src="videos/<s:property value="#session.videozero.url"/>"
												allowfullscreen frameborder="0"></iframe>
										</div>
										<div class="post-content">
											<p>
												<s:property value="#session.videozero.introduce"></s:property>
											</p>
										</div>
									</div>
									<hr>
									</article>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
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
