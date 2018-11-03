<%@page import="com.liaojl.shop.url.UrlEnum"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String basePath = "http://" + request.getLocalName() + ":" + request.getLocalPort()
			+ request.getContextPath();
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">

<title>Starter Template for Bootstrap</title>

<!-- Bootstrap core CSS -->
<link href="<%=basePath%>/css/bootstrap.min.css" rel="stylesheet">

<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<link href="<%=basePath%>/css/ie10-viewport-bug-workaround.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="<%=basePath%>/css/starter-template.css" rel="stylesheet">
<link href="<%=basePath%>/css/dashboard.css" rel="stylesheet">
<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="<%=basePath%>/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script src="<%=basePath%>/js/ie-emulation-modes-warning.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="<%=basePath%>/html5shiv.min.js"></script>
      <script src="<%=basePath%>/js/respond.min.js"></script>
    <![endif]-->
<style type="text/css">
.navbar-inverse {
	background-color: #f5f5f5;
	border-color: #080808;
}

.navbar-inverse .navbar-nav>.active>a, .navbar-inverse .navbar-nav>.active>a:focus,
	.navbar-inverse .navbar-nav>.active>a:hover {
	color: #fff;
	background-color: #428bca;
}
</style>
</head>
<!-- Bootstrap core JavaScript
    ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="<%=basePath%>/js/jquery.min.js"></script>

<script src="<%=basePath%>/js/bootstrap.min.js"></script>
<!-- Just to make our placeholder images work. Don't actually copy the next line! -->
<script src="<%=basePath%>/js/holder.min.js"></script>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="<%=basePath%>/js/ie10-viewport-bug-workaround.js"></script>
<link href="<%=basePath%>/css/fileinput.css" media="all"
	rel="stylesheet" type="text/css" />
<link href="<%=basePath%>/themes/explorer-fa/theme.css" media="all"
	rel="stylesheet" type="text/css" />
<script src="<%=basePath%>/js/plugins/sortable.js"
	type="text/javascript"></script>
<script src="<%=basePath%>/js/fileinput.js" type="text/javascript"></script>
<script src="<%=basePath%>/js/locales/fr.js" type="text/javascript"></script>
<script src="<%=basePath%>/js/locales/es.js" type="text/javascript"></script>
<script src="<%=basePath%>/themes/explorer-fa/theme.js"
	type="text/javascript"></script>
<script src="<%=basePath%>/themes/fa/theme.js" type="text/javascript"></script>
<script src="<%=basePath%>/js/InputSpinner.js" type="text/javascript"></script>
<script type="text/javascript"
	src="<%=basePath%>/js/jquery-ui-1.10.4.custom.min.js"></script>
<link rel="stylesheet"
	href="<%=basePath%>/css/jquery-ui-1.10.4.custom.min.css" />

<body>

	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand"
					href="<%=basePath + UrlEnum.ADMINMAIN.getDesc()%>">贷款超市后台</a>
			</div>
			<div id="navbar" class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a
						href="<%=basePath + UrlEnum.ADMINMAIN.getDesc()%>">业务管理</a></li>
					<li><a href="#contact">系统设置</a></li>
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</nav>
</html>
