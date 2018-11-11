<%@page import="com.liaojl.shop.log.LogConfig"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.liaojl.shop.utils.MD5Utils"%>
<%@page import="com.liaojl.shop.utils.DatabaseHelper"%>
<%@page import="com.liaojl.shop.utils.MapCache"%>
<%@page import="com.liaojl.shop.utils.StringUtil"%>
<%@page import="com.liaojl.shop.url.UrlEnum"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String basePath = "http://" +  LogConfig.homeurl + ":" + request.getLocalPort()
			+ request.getContextPath();
%>
<!DOCTYPE html>
<html>

<head lang="en">
<meta charset="UTF-8">
<title>登录</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />

<link rel="stylesheet" href="<%=basePath%>/css/amazeui.css" />
<link href="<%=basePath%>/css/dlstyle.css" rel="stylesheet"
	type="text/css">
${msg}
</head>
<body>
	<div class="login-banner">
		<div class="login-main">
			<div class="login-banner-bg">
				<span></span><img src="<%=basePath%>/images/big.jpg" />
			</div>
			<div class="login-box">

				<h3 class="title">登录商城后台</h3>

				<div class="clear"></div>

				<div class="login-form">
					<form id='form1' action="<%=basePath%>/admin/login" method="post">
						<div class="user-name">
							<label for="user"><i class="am-icon-user"></i></label> <input
								type="text" name="name" id="user" placeholder="用户名">
						</div>
						<div class="user-pass">
							<label for="password"><i class="am-icon-lock"></i></label> <input
								type="password" name="pwd" id="password" placeholder="请输入密码">
						</div>
					</form>
				</div>

				<div class="login-links">
					<label for="remember-me"><input id="remember-me"
						type="checkbox">记住密码</label> <br />
				</div>
				<div class="am-cf">
					<input type="submit" form="form1" value="登 录"
						class="am-btn am-btn-primary am-btn-sm">
				</div>

			</div>
		</div>
	</div>


	<!-- <div class="footer ">
		<div class="footer-hd ">
			<p>
				<a href="# ">恒望科技</a> <b>|</b> <a href="# ">商城首页</a> <b>|</b> <a
					href="# ">支付宝</a> <b>|</b> <a href="# ">物流</a>
			</p>
		</div>
		<div class="footer-bd ">
			<p>
				<a href="# ">关于恒望</a> <a href="# ">合作伙伴</a> <a href="# ">联系我们</a> <a
					href="# ">网站地图</a> <em>© 2015-2025 Hengwang.com 版权所有</em>
			</p>
		</div>
	</div> -->
</body>

</html>