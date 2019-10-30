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
		style="background-image: url(images/banner_play.jpg);margin-top: 30px;height:300px">
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
						<li class="presentation" role="presentation"><a
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

	<!--start site's main content area-->
	<section class="content-wrap">
	<div class="container">
		<div class="row">
			<!--start main left content-->
			<div class="col-md-12 main-content">
				<article class="post">
				<div class="post-head">
					<h1 class="post-title">
						<s:property value="#session.video.title" />
					</h1>
					<div class="post-meta">
						<span class="author">作者：<a href=""><s:property
									value="#session.video.username" /></a></span>·
						<time class="post-date"
							datetime="<s:property value="#session.video.uploadtime"/>"
							title="<s:property value="#session.video.uploadtime"/>"> <s:property
							value="#session.video.uploadtime" /> </time>
						<span class="author">播放量：<s:property
								value="#session.video.click" /></span>· <span class="author">收藏量：<s:property
								value="#session.video.collection" /></span>·
						<div style="float:right;display:inline;" id="isCollectioned">
						</div>
					</div>
					
				</div>
				<div class="featured-media">
					<div class="embed-responsive embed-responsive-16by9">
						<iframe class="embed-responsive-item"
							src="videos/<s:property value="#session.video.url" />"
							allowfullscreen frameborder="0"></iframe>
					</div>
					<div class="post-content">
						<p>
							<s:property value="#session.video.introduce"></s:property>
						</p>
					</div>
					<hr>
					<div class="page-header">
						<h4>全部评论</h4>
					</div>
					<form class="form-horizontal" action="comment_addComment"
						method="post">
						<div class="form-group" style="margin-bottom:100px">
							<div class="col-sm-1">
								<img alt="140x140" style="height:45;width:45"
									src="face/<s:property value="#session.userInfo.headshow"/>"
									class="img-circle" />
							</div>
							<div class="col-sm-9">
								<textarea class="form-control" id="inputResume" type="textarea"
									rows=“2” name="comment.comment" autocomplete="off"
									validateevent="true" style="resize:none;"></textarea>
							</div>
							<div class="col-sm-2">
								<button type="submit" class="btn btn-primary"
									style="width:71px;height:71px;right:10px;margin-right:100px">发表</button>
							</div>
						</div>
					</form>
					<table id="example" class="display" cellspacing="0" width="100%">
						<thead>
							<tr>
								<td width="10">用户</td>
								<td>评论</td>
							</tr>
						</thead>
						<tbody>
							<s:iterator id="c" value="#session.comments">
								<tr>
									<td width="10" style="text-align: right;vertical-align:top;">
									<img alt="140x140" style="height:80;width:80"
									src="face/<s:property value="#c.commenterurl"/>"
									class="img-circle" />
									</td>
									<td>
									<p><s:property value="#c.commentername"/>&nbsp;&nbsp;&nbsp;&nbsp;<s:property value="#c.time"/></p>
									<p>&nbsp;&nbsp;&nbsp;&nbsp;<s:property value="#c.comment" /></p>
									</td>
								</tr>
							</s:iterator>
						</tbody>
					</table>
				</div>
				</article>
			</div>
		</div>
	</div>
	</section>
	<script>
	window.onload = function(){
        // 1.创建异步交互对象
		var xhr = createXmlHttp();
		// 2.设置监听
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4){
				if(xhr.status == 200){
				    var str = xhr.responseText;
				    if( str.includes("已收藏") )
				    {
						$("#isCollectioned").html('<i class="icon ion-ios-heart" onclick="changeCollect()"></i>');
					}else{	
						$("#isCollectioned").html('<i class="icon ion-ios-heart-outline" onclick="changeCollect()"></i>');
					}
				}
			}
		}
		// 3.打开连接
		xhr.open("GET","collection_findCollection?vid=${video.id}",true);
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
	function changeCollect(){
		var xhr = createXmlHttp();
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4){
				if(xhr.status == 200){
				    var str = xhr.responseText;
				    window.location.reload();
				}
			}
		}
		// 3.打开连接
		xhr.open("GET","collection_changeCollection?vid=${video.id}",true);
		// 4.发送
		xhr.send(null);
	};
	</script>
</body>
</html>
