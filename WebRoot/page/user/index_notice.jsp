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
<link rel="stylesheet" type="text/css" media="screen"
	href="https://cdn.bootcss.com/ionicons/2.0.1/css/ionicons.min.css">
<link rel="icon" href="icon/favicon.ico">
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/font-awesome.css" type="text/css">
<link rel="stylesheet" href="css/screen.css" type="text/css">
<link rel="stylesheet" href="css/main.css" type="text/css">
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
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
			<div class="col-md-6">
				<div class="feature_news_carousel">
					<div id="featured-news-carousal" class="carousel slide"
						data-ride="carousel">
						<!-- Wrapper for slides -->
						<div class="carousel-inner" role="listbox">
							<div class="item active feature_news_item">
								<div class="item_wrapper">
									<div class="item_img">
										<img class="img-responsive"
											src="videoCover/<s:property value="#session.videos.get(0).cover"/>"
											alt="Chania" width="555" height="431">
									</div>
									<!--item_img-->
									<div class="item_title_date">
										<div class="news_item_title">
											<h2>
												<a target="_blank"
													href="video_video?vid=<s:property value="#session.videos.get(0).id"/>"><s:property
														value="#session.videos.get(0).title" /></a>
											</h2>
										</div>
										<div class="item_meta">
											<a href="#"><s:property
													value="#session.videos.get(0).uploadtime" /></a> by:<a href="#"><s:property
													value="#session.videos.get(0).username" /></a>
										</div>
									</div>
									<!--item_title_date-->
								</div>
								<!--item_wrapper-->
								<div class="item_content">
									<s:property value="#session.videos.get(0).introduce" />
								</div>
							</div>
							<!--feature_news_item-->
						</div>
						<!--carousel-inner-->
					</div>
					<!--carousel-->
				</div>
				<!--feature_news_carousel-->
			</div>
			<!--col-md-6-->

			<div class="col-md-6">
				<div class="feature_news_static">
					<div class="row">
						<div class="col-md-6">
							<div class="feature_news_item">
								<div class="item active">
									<div class="item_wrapper">
										<div class="item_img">
											<img class="img-responsive"
												src="videoCover/<s:property value="#session.videos.get(1).cover"/>"
												alt="Zhou">
										</div>
										<!--item_img-->
										<div class="item_title_date">
											<div class="news_item_title">
												<h2>
													<a target="_blank"
														href="video_video?vid=<s:property value="#session.videos.get(1).id"/>"><s:property
															value="#session.videos.get(1).title" /></a>
												</h2>
											</div>
											<div class="item_meta">
												<a href="#"><s:property
														value="#session.videos.get(1).uploadtime" /></a> by:<a
													href="#"><s:property
														value="#session.videos.get(1).username" /></a>
											</div>
										</div>
										<!--item_title_date-->
									</div>
									<!--item_wrapper-->
									<div class="item_content">
										<s:property value="#session.videos.get(1).introduce" />
									</div>
								</div>
								<!--item-->
							</div>
							<!--feature_news_item-->
						</div>
						<div class="col-md-6">
							<div class="feature_news_item">
								<div class="item active">
									<div class="item_wrapper">
										<div class="item_img">
											<img class="img-responsive"
												src="videoCover/<s:property value="#session.videos.get(2).cover"/>"
												alt="Zhou">
										</div>
										<!--item_img-->
										<div class="item_title_date">
											<div class="news_item_title">
												<h2>
													<a target="_blank"
														href="video_video?vid=<s:property value="#session.videos.get(2).id"/>"><s:property
															value="#session.videos.get(2).title" /></a>
												</h2>
											</div>
											<div class="item_meta">
												<a href="#"><s:property
														value="#session.videos.get(2).uploadtime" /></a> by:<a
													href="#"><s:property
														value="#session.videos.get(2).username" /></a>
											</div>
										</div>
										<!--item_title_date-->
									</div>
									<!--item_wrapper-->
									<div class="item_content">
										<s:property value="#session.videos.get(2).introduce" />
									</div>
								</div>
								<!--item-->
							</div>
							<!--feature_news_item-->
						</div>
						<!--col-xs-6-->
					</div>
					<!--row-->
				</div>
				<!--feature_news_static-->
			</div>
			<!--col-md-6-->
		</div>
		<!--row-->
	</div>
	<!--container--> </section>

	<!--start site's main content area-->
	<section class="content-wrap">
	<div class="container">
		<div class="row">
			<!--start main left content-->
			<div class="col-md-12 main-content">
				
			</div>
			<!--end main left content-->
		</div>
	</div>
	</section>
	<!--end site's main content area-->
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
