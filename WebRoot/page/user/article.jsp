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
<!-- DataTables CSS -->
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
				"decimal":",",
                "thousands":".",
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
		// Setup - add a text input to each footer cell
		$('#example tfoot th').each(function() {
			var title = $('#example thead th').eq($(this).index()).text();
			$(this).html('<input type="text" placeholder="Search ' + title + '" />');
		});

		// DataTable
		var table = $('#example').DataTable();

		// Apply the search
		table.columns().eq(0).each(function(colIdx) {
			$('input', table.column(colIdx).footer()).on('keyup change', function() {
				table
					.column(colIdx)
					.search(this.value)
					.draw();
			});
		});
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
						<li><a href="collection_index">投稿</a></li>
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
								<div id="panel-element-000001"
									class="panel-collapse collapse">
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
								<div id="panel-element-000002" class="panel-collapse collapse in">
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
									</ul>
								</div>
								<div class="col-md-12 column">
									<div class="tabbable" id="tabs-668248">
										<ul class="nav nav-tabs">
											<li class="active"><a href="#panel-683779"
												data-toggle="tab">正在审核</a></li>
											<li><a href="#panel-834594" data-toggle="tab">已通过审核</a></li>
											<li><a href="#panel-389726" data-toggle="tab">未通过审核</a></li>
										</ul>
										<div class="tab-content">
											<div class="tab-pane active" id="panel-683779">
												<br />
												<table id="" class="display" cellspacing="0" width="100%">
													<thead>
														<tr>
															<th width="10%"><a href="javascript:void(0);"
																onclick="deleteZeroWebsites();"><i
																	class="icon ion-trash-a"></i></a></th>
															<th width="30%">标题</th>
															<th width="25%">上传时间</th>
															<th width="25%">时长</th>
															<th width="10%">操作</th>
														</tr>
													</thead>
													<tbody>
														<s:iterator id="c" value="#session.zerovideos">
															<tr>
																<td><input type="checkbox" name="checkboxzero"
																	value="<s:property value="#c.id"/>"></td>
																<td><s:property value="#c.title" /></td>
																<td><s:property value="#c.uploadtime" /></td>
																<td><s:if test="#c.timelength == 0">五分钟以内</s:if> <s:elseif
																		test="#c.timelength == 5">五到十分钟</s:elseif> <s:else>十分钟以上</s:else>
																</td>
																<td><a target="_blank" href="video_articlezero?vid=<s:property value="#c.id" />"><i class="icon ion-clipboard"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;<a
																	href="video_deleteVideo?vid=<s:property value="#c.id" />" onClick="return confirm('确定删除?');"><i class="icon ion-trash-a"></i></a></td>
															</tr>
														</s:iterator>
													</tbody>
												</table>
											</div>
											<div class="tab-pane" id="panel-834594">
												<br />
												<table id="" class="display" cellspacing="0" width="100%">
													<thead>
														<tr>
															<th width="10%"><a href="javascript:void(0);"
																onclick="deleteOneWebsites();"><i
																	class="icon ion-trash-a"></i></a></th>
															<th width="30%">标题</th>
															<th width="25%">上传时间</th>
															<th width="25%">时长</th>
															<th width="10%">操作</th>
														</tr>
													</thead>
													<tbody>
														<s:iterator id="c" value="#session.onevideos">
															<tr>
																<td><input type="checkbox" name="checkboxone"
																	value="<s:property value="#c.id"/>"></td>
																<td><s:property value="#c.title" /></td>
																<td><s:property value="#c.uploadtime" /></td>
																<td><s:if test="#c.timelength == 0">五分钟以内</s:if> <s:elseif
																		test="#c.timelength == 5">五到十分钟</s:elseif> <s:else>十分钟以上</s:else>
																</td>
																<td><a target="_blank" href="video_video?vid=<s:property value="#c.id" />"><i class="icon ion-clipboard"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;<a
																	href="video_deleteVideo?vid=<s:property value="#c.id" />" onClick="return confirm('确定删除?');"><i class="icon ion-trash-a"></i></a></td>
															</tr>
														</s:iterator>
													</tbody>
												</table>
											</div>
											<div class="tab-pane" id="panel-389726">
												<br/>
												<table id="" class="display" cellspacing="0" width="100%">
													<thead>
														<tr>
															<th width="10%"><a href="javascript:void(0);"
																onclick="deleteTwoWebsites();"><i
																	class="icon ion-trash-a"></i></a></th>
															<th width="30%">标题</th>
															<th width="25%">上传时间</th>
															<th width="25%">时长</th>
															<th width="10%">操作</th>
														</tr>
													</thead>
													<tbody>
														<s:iterator id="c" value="#session.twovideos">
															<tr>
																<td><input type="checkbox" name="checkboxtwo"
																	value="<s:property value="#c.id"/>"></td>
																<td><s:property value="#c.title" /></td>
																<td><s:property value="#c.uploadtime" /></td>
																<td><s:if test="#c.timelength == 0">五分钟以内</s:if> <s:elseif
																		test="#c.timelength == 5">五到十分钟</s:elseif> <s:else>十分钟以上</s:else>
																</td>
																<td><a href="video_deleteVideo?vid=<s:property value="#c.id" />" onClick="return confirm('确定删除?');"><i class="icon ion-trash-a"></i></a></td>
															</tr>
														</s:iterator>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function deleteZeroWebsites(){
           var becheckbox = ""; 
           var length = $("input[name='checkboxzero']:checked").length;
            if (length == 0) {
                 alert("请选择删除选项!");
                 return false;
            }
            if (confirm("您确定要删除所选信息?") == true)
            {
            	$("input[name='checkboxzero']:checked").each(function() {
            		if($(this).is(":checked")) { //如果被选中
            			becheckbox += $(this).val() + ","; //获取被选中的值
            		}
             	});
            	window.location.href="video_deleteVideos?checkTnum="+becheckbox;
           }
        }
        function deleteOneWebsites(){
           var becheckbox = ""; 
           var length = $("input[name='checkboxone']:checked").length;
            if (length == 0) {
                 alert("请选择删除选项!");
                 return false;
            }
            if (confirm("您确定要删除所选信息?") == true)
            {
            	$("input[name='checkboxone']:checked").each(function() {
            		if($(this).is(":checked")) { //如果被选中
            			becheckbox += $(this).val() + ","; //获取被选中的值
            		}
             	});
            	window.location.href="video_deleteVideos?checkTnum="+becheckbox;
           }
        }
        function deleteTwoWebsites(){
           var becheckbox = ""; 
           var length = $("input[name='checkboxtwo']:checked").length;
            if (length == 0) {
                 alert("请选择删除选项!");
                 return false;
            }
            if (confirm("您确定要删除所选信息?") == true)
            {
            	$("input[name='checkboxtwo']:checked").each(function() {
            		if($(this).is(":checked")) { //如果被选中
            			becheckbox += $(this).val() + ","; //获取被选中的值
            		}
             	});
            	window.location.href="video_deleteVideos?checkTnum="+becheckbox;
           }
        }
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
