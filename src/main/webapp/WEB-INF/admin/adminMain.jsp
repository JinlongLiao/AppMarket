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
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description"
	content="Bootstrap - 简洁、直观、强悍、移动设备优先的前端开发框架，让web开发更迅速、简单�?>
<meta name="keywords" content="HTML, CSS, JS, JavaScript, framework, bootstrap, front-end, frontend, web development">
<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="author" content="译者：王赛 <wangsai@bootcss.com>">

<title>Bootstrap 中文文档 &middot; Bootstrap
	是世界上最流行的、移动设备优先的、响应式前端开发框架�?</title>

<!-- Bootstrap core CSS -->

<link href="<%=basePath%>/css/bootstrap.min.css" rel="stylesheet">



<!-- Documentation extras -->

<link href="<%=basePath%>/css/docs.min.css" rel="stylesheet">

<link href="<%=basePath%>/css/patch.css" rel="stylesheet">
<!--[if lt IE 9]><script src="<%=basePath%>/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script src="<%=basePath%>/js/ie-emulation-modes-warning.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
  <script src="../cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="../cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->

<!-- Favicons -->
<link rel="apple-touch-icon" href="apple-touch-icon.png">
<link rel="icon" href="favicon.ico">

<!-- Analytics
================================================== -->
<script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "https://hm.baidu.com/hm.js?bdb993b828cbe079a7fbc1a951f44726";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>

</head>
<body class="bs-docs-home">


	<a id="skippy" class="sr-only sr-only-focusable" href="#content"><div
			class="container">
			<span class="skiplink-text">Skip to main content</span>
		</div></a>

	<!-- Docs master nav -->
	<header class="navbar navbar-static-top bs-docs-nav" id="top">
		<div class="container">
			<div class="navbar-header">
				<button class="navbar-toggle collapsed" type="button"
					data-toggle="collapse" data-target="#bs-navbar"
					aria-controls="bs-navbar" aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a href="v3.bootcss.html" class="navbar-brand">Bootstrap</a>
			</div>
			<nav id="bs-navbar" class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li><a href="getting-started/getting-started.html"
						onclick="_hmt.push(['_trackEvent', 'docv3-navbar', 'click', 'V3导航-起步'])">起步</a>
					</li>
					<li><a href="css/css.html"
						onclick="_hmt.push(['_trackEvent', 'docv3-navbar', 'click', 'V3导航-全局CSS样式'])">全局
							CSS 样式</a></li>
					<li><a href="components/components.html"
						onclick="_hmt.push(['_trackEvent', 'docv3-navbar', 'click', 'V3导航-组件'])">组件</a>
					</li>
					<li><a href="javascript/javascript.html"
						onclick="_hmt.push(['_trackEvent', 'docv3-navbar', 'click', 'V3导航-JavaScript插件'])">JavaScript
							插件</a></li>
					<li><a href="customize/customize.html"
						onclick="_hmt.push(['_trackEvent', 'docv3-navbar', 'click', 'V3导航-定制'])">定制</a>
					</li>
					<li><a href="http://www.youzhan.org/"
						onclick="_hmt.push(['_trackEvent', 'docv3-navbar', 'click', 'V3导航-网站实例'])"
						target="_blank">网站实例</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<!-- <li><a href="http://mb.bootcss.com/" onclick="_hmt.push(['_trackEvent', 'docv3-navbar', 'click', 'themes'])" target="_blank">主题/模板</a></li> -->
					<li><a href="http://www.bootcss.com/"
						onclick="_hmt.push(['_trackEvent', 'docv3-navbar', 'click', 'V3导航-Bootstrap中文�?])"
						target="_blank">Bootstrap中文�?/a></li>
				</ul>
			</nav>
		</div>
	</header>


	<!-- Page content of course! -->
	<main class="bs-docs-masthead" id="content" tabindex="-1">
	<div class="container">
		<span
			class="bs-docs-booticon bs-docs-booticon-lg bs-docs-booticon-outline">B</span>
		<p class="lead">Bootstrap 是最受欢迎的 HTML、CSS �?JS
			框架，用于开发响应式布局、移动设备优先的 WEB 项目�?/p>
		<p class="lead">
			<a href="https://v3.bootcss.com/getting-started#download"
				class="btn btn-outline-inverse btn-lg"
				onclick="_hmt.push(['_trackEvent', 'docv3-navbar', 'click', 'V3首页大图-下载Bootstrap按钮'])">下载
				Bootstrap</a>
		</p>
		<p class="version">当前版本�?v3.3.7 | 文档更新于：2018-04-30</p>
		<div id="tuijian"></div>
	</div>
	</main>

	<div class="bs-docs-featurette">
		<div class="container">
			<h2 class="bs-docs-featurette-title">
				为所有开发者、所有应用场景而设计�?/h2>
				<p class="lead">Bootstrap
					让前端开发更快速、简单。所有开发者都能快速上手、所有设备都可以适配、所有项目都适用�?/p>
				<hr class="half-rule">

				<div class="row">
					<div class="col-sm-4">
						<img src="<%=basePath%>/img/sass-less.png" alt="Sass and Less support"
							class="img-responsive">
						<h3>
							预处理脚�?/h3>
							<p>
								虽然可以直接使用 Bootstrap 提供�?CSS 样式表，不要忘记 Bootstrap 的源码是基于最流行�?CSS
								预处理脚�?- <a href="https://v3.bootcss.com/css/#less">Less</a> �?<a
									href="https://v3.bootcss.com/css/#sass">Sass</a> 开发的。你可以采用预编译的
								CSS 文件快速开发，也可以从源码定制自己需要的样式�?/p>
					</div>
					<div class="col-sm-4">
						<img src="<%=basePath%>/img/devices.png" alt="Responsive across devices"
							class="img-responsive">
						<h3>
							一个框架、多种设�?/h3>
							<p>你的网站和应用能�?Bootstrap 的帮助下通过同一份代码快速、有效适配手机、平板、PC
								设备，这一切都�?CSS 媒体查询（Media Query）的功劳�?/p>
					</div>
					<div class="col-sm-4">
						<img src="<%=basePath%>/img/components.png" alt="Components"
							class="img-responsive">
						<h3>
							特性齐�?/h3>
							<p>Bootstrap 提供了全面、美观的文档。你能在这里找到关于 HTML 元素、HTML �?CSS
								组件、jQuery 插件方面的所有详细文档�?/p>
					</div>
				</div>

				<hr class="half-rule">

				<p class="lead">
					Bootstrap 是完全开源的。它的代码托管、开发、维护都依赖 GitHub 平台�?/p> <a
						href="https://github.com/twbs/bootstrap"
						class="btn btn-outline btn-lg">查看 GitHub 项目主页</a>
		</div>
	</div>

	<div class="bs-docs-featurette">
		<div class="container">
			<h2 class="bs-docs-featurette-title">
				基于 Bootstrap 构建的网�?/h2>
				<p class="lead">
					全球数以百万计的网站都是基于 Bootstrap 构建的。你可以先参观一下我们提供的<a
						href="https://v3.bootcss.com/getting-started/#examples">实例精�?/a>或者看一看我们粉丝的网站吧�?/p>

						<hr class="half-rule">

						<div class="row bs-docs-featured-sites">

							<div class="col-xs-6 col-sm-3">
								<a href="http://www.golaravel.com/" target="_blank"
									title="Laravel中文�? onclick="
									_hmt.push(['_trackEvent', 'doc-home-youzhan-img', 'click', 'Laravel中文�?])" target="_blank">
									<img
									src="https://static.bootcss.com/expo/img/3/61/34091ac7072297a889fe986b0238e.png"
									alt="Laravel中文�? class="img-responsive">
								</a>
							</div>

							<div class="col-xs-6 col-sm-3">
								<a href="http://www.ghostchina.com/" target="_blank"
									title="Ghost中国"
									onclick="_hmt.push(['_trackEvent', 'doc-home-youzhan-img', 'click', 'Ghost中国'])"
									target="_blank"> <img
									src="https://static.bootcss.com/expo/img/7/b5/f9c2f01fad1f23574156e0577a06c.jpg"
									alt="Ghost中国" class="img-responsive">
								</a>
							</div>

							<div class="col-xs-6 col-sm-3">
								<a href="http://www.gulpjs.com.cn/" target="_blank"
									title="Gulp中文�? onclick="
									_hmt.push(['_trackEvent', 'doc-home-youzhan-img', 'click', 'Gulp中文�?])" target="_blank">
									<img
									src="https://static.bootcss.com/expo/img/9/77/9aa20712a7dba02b00e73db495950.png"
									alt="Gulp中文�? class="img-responsive">
								</a>
							</div>

							<div class="col-xs-6 col-sm-3">
								<a href="http://www.gruntjs.net/" target="_blank"
									title="Gurnt中文�? onclick="
									_hmt.push(['_trackEvent', 'doc-home-youzhan-img', 'click', 'Gurnt中文�?])" target="_blank">
									<img
									src="https://static.bootcss.com/expo/img/6/56/aecc20901cc436b5cd10911302e0b.png"
									alt="Gurnt中文�? class="img-responsive">
								</a>
							</div>

						</div>

						<hr class="half-rule">

						<p class="lead">
							我们在“优站精选”里展示了许多精美的 Bootstrap 网站�?/p> <a
								href="http://www.youzhan.org/" class="btn btn-outline btn-lg">逛一逛“优站精选�?/a>
							
		</div>
	</div>


	<!-- Footer
================================================== -->
	<footer class="bs-docs-footer">
		<div class="container">
			<ul class="bs-docs-footer-links">
				<li><a href="https://github.com/twbs/bootstrap">GitHub 仓库</a></li>
				<li><a href="https://v3.bootcss.com/getting-started/#examples">实例</a></li>
				<li><a href="http://www.youzhan.org/">优站精�?/a></li>
				<li><a href="about/about.html">关于</a></li>
			</ul>

			<p>
				Designed and built with all the love in the world by <a
					href="https://twitter.com/mdo" target="_blank">@mdo</a> and <a
					href="https://twitter.com/fat" target="_blank">@fat</a>. Maintained
				by the <a href="https://github.com/orgs/twbs/people">core team</a>
				with the help of <a
					href="https://github.com/twbs/bootstrap/graphs/contributors">our
					contributors</a>.
			</p>

			<p>
				本项目源码受 <a rel="license"
					href="https://github.com/twbs/bootstrap/blob/master/LICENSE"
					target="_blank">MIT</a>开源协议保护，文档�?<a rel="license"
					href="https://creativecommons.org/licenses/by/3.0/" target="_blank">CC
					BY 3.0</a> 开源协议保护�?/p>
		</div>
	</footer>

	<!-- Bootstrap core JavaScript
================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="<%=basePath%>/js/jquery.min.js"></script>
	<script>window.jQuery || document.write('<script src="../<%=basePath%>/js/vendor/jquery.min.js"><\/script>')</script>


	<script src="<%=basePath%>/js/bootstrap.min.js"></script>



	<script src="<%=basePath%>/js/docs.min.js"></script>




	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="<%=basePath%>/js/ie10-viewport-bug-workaround.js"></script>

	<script type="text/javascript" src="<%=basePath%>/js/and.js"></script>

</body>
</html>
