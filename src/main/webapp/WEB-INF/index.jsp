<%@page import="com.liaojl.shop.url.UrlEnum"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String basePath = "http://" + request.getLocalName() + ":" + request.getLocalPort()
			+ request.getContextPath();
%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<title>首页</title>

<link href="<%=basePath%>/css/amazeui.css" rel="stylesheet"
	type="text/css" />
<link href="<%=basePath%>/css/admin.css" rel="stylesheet"
	type="text/css" />

<link href="<%=basePath%>/basic/css/demo.css" rel="stylesheet"
	type="text/css" />

<link href="<%=basePath%>/css/hmstyle.css" rel="stylesheet"
	type="text/css" />
<link href="<%=basePath%>/css/skin.css" rel="stylesheet" type="text/css" />
<script src="<%=basePath%>/js/jquery.min.js"></script>
<script src="<%=basePath%>/js/amazeui.min.js"></script>
</head>

<body>
	<div class="hmtop">
		<!--顶部导航条 -->
		<div class="am-container header">
			<ul class="message-l">
				<div class="topMessage">
					<div class="menu-hd"></div>
				</div>
			</ul>
		</div>

		<!--悬浮搜索框-->

		<div class="nav white">
			<div class="logo">
				<img src="<%=basePath%>/images/logo.png" />
			</div>
			<div class="logoBig">
				<li><img src="<%=basePath%>/images/logobig.png" /></li>
			</div>

			<div class="search-bar pr">
				<a name="index_none_header_sysc" href="#"></a>
				<form>
					<input id="searchInput" name="index_none_header_sysc" type="text"
						placeholder="搜索" autocomplete="off"> <input
						id="ai-topsearch" class="submit am-btn" value="搜索" index="1"
						type="submit">
				</form>
			</div>
		</div>

		<div class="clear"></div>
	</div>
	<div class="banner">
		<!--轮播 -->
		<div class="am-slider am-slider-default scoll" data-am-flexslider
			id="demo-slider-0">
			<ul class="am-slides">
				<li class="banner1"><a href="introduction.html"><img
						src="<%=basePath%>/images/ad1.jpg" /></a></li>
				<li class="banner2"><a><img
						src="<%=basePath%>/images/ad2.jpg" /></a></li>
				<li class="banner3"><a><img
						src="<%=basePath%>/images/ad3.jpg" /></a></li>
				<li class="banner4"><a><img
						src="<%=basePath%>/images/ad4.jpg" /></a></li>

			</ul>
		</div>
		<div class="clear"></div>
	</div>
	<div class="shopNav">
		<div class="slideall">
			<!--轮播-->

			<script type="text/javascript">
				(function() {
					$('.am-slider').flexslider();
				});
				$(document)
						.ready(
								function() {
									$("li")
											.hover(
													function() {
														$(
																".category-content .category-list li.first .menu-in")
																.css("display",
																		"none");
														$(
																".category-content .category-list li.first")
																.removeClass(
																		"hover");
														$(this).addClass(
																"hover");
														$(this)
																.children(
																		"div.menu-in")
																.css("display",
																		"block")
													},
													function() {
														$(this).removeClass(
																"hover")
														$(this).children(
																"div.menu-in")
																.css("display",
																		"none")
													});
								})
			</script>

			<script type="text/javascript">
				if ($(window).width() < 640) {
					function autoScroll(obj) {
						$(obj).find("ul").animate({
							marginTop : "-39px"
						}, 500, function() {
							$(this).css({
								marginTop : "0px"
							}).find("li:first").appendTo(this);
						})
					}
					$(function() {
						setInterval('autoScroll(".demo")', 3000);
					})
				}
			</script>
		</div>
		<div class="shopMainbg">
			<div class="shopMain" id="shopmain">

				<!--热门活动 -->

				<div class="am-container activity ">
					<div class="shopTitle ">
						<h4>您身边的贷款禅师</h4>
						<h3>带给您享不停的优惠活动</h3>
					</div>
					<div class="am-g am-g-fixed ">
						<div class="am-u-sm-6 ">
							<div class="icon-sale50 one "></div>
							<h4>小叮当钱包</h4>
							<div class="activityMain ">
								<img src="<%=basePath%>/images/activity1.jpg "></img>
							</div>
							<div class="info ">
								<h3>春节送礼优选</h3>
							</div>
						</div>

						<div class="am-u-sm-6 ">
							<div class="icon-sale50 two "></div>
							<h4>特惠</h4>
							<div class="activityMain ">
								<img src="<%=basePath%>/images/activity2.jpg "></img>
							</div>
							<div class="info ">
								<h3>春节送礼优选</h3>
							</div>
						</div>

						<div class="am-u-sm-6 ">
							<div class="icon-sale50 three "></div>
							<h4>团购</h4>
							<div class="activityMain ">
								<img src="<%=basePath%>/images/activity3.jpg "></img>
							</div>
							<div class="info ">
								<h3>春节送礼优选</h3>
							</div>
						</div>

						<div class="am-u-sm-6">
							<div class="icon-sale50 "></div>
							<h4>超值</h4>
							<div class="activityMain ">
								<img src="<%=basePath%>/images/activity.jpg "></img>
							</div>
							<div class="info ">
								<h3>春节送礼优选</h3>
							</div>
						</div>
						<div class="am-u-sm-6  ">
							<div class="icon-sale50 "></div>
							<h4>超值</h4>
							<div class="activityMain ">
								<img src="<%=basePath%>/images/activity.jpg "></img>
							</div>
							<div class="info ">
								<h3>春节送礼优选</h3>
							</div>
						</div>
						<div class="am-u-sm-6 last ">
							<div class="icon-sale50 "></div>
							<h4>超值</h4>
							<div class="activityMain ">
								<img src="<%=basePath%>/images/activity.jpg "></img>
							</div>
							<div class="info ">
								<h3>春节送礼优选</h3>
							</div>
						</div>
						<div class="am-u-sm-6  ">
							<div class="icon-sale50 "></div>
							<h4>超值</h4>
							<div class="activityMain ">
								<img src="<%=basePath%>/images/activity.jpg "></img>
							</div>
							<div class="info ">
								<h3>春节送礼优选</h3>
							</div>
						</div>
						<div class="am-u-sm-6">
							<div class="icon-sale50 "></div>
							<h4>超值</h4>
							<div class="activityMain ">
								<img src="<%=basePath%>/images/activity.jpg "></img>
							</div>
							<div class="info ">
								<h3>春节送礼优选</h3>
							</div>
						</div>

					</div>
				</div>
				<div class="clear "></div>


				<div id="f1">
					<div class="clear "></div>
				</div>



				<div class="footer ">
					<div class="footer-hd ">
						<p>
							<a href="# ">恒望科技</a> <b>|</b> <a href="# ">商城首页</a> <b>|</b> <a
								href="# ">支付宝</a> <b>|</b> <a href="# ">物流</a>
						</p>
					</div>
					<div class="footer-bd ">
						<p>
							<a href="# ">关于恒望</a> <a href="# ">合作伙伴</a> <a href="# ">联系我们</a>
							<a href="# ">网站地图</a> <em>© 2015-2025 Hengwang.com 版权所有</em>
						</p>
					</div>
				</div>

			</div>
		</div>
		<!--引导 -->
		<div class="navCir">
			<li class="active"><a href="<%=basePath%>"><i
					class="am-icon-bank "></i>我要借款 </a></li>
			<li><a href="<%=basePath%>/<%=UrlEnum.TYPE.getDesc()%>"><i
					class="am-icon-star"></i>明星产品</a></li>

			<li><a href="<%=basePath%>/<%=UrlEnum.ARTICLE.getDesc()%>"><i
					class="am-icon-money"></i>理财资讯</a></li>
		</div>

		<!--菜单 -->
		<div class=tip>
			<div id="sidebar">
				<div id="wrap">
					<div id="prof" class="item ">
						<div class="ibar_login_box status_login ">
							<i class="icon_arrow_white "></i>
						</div>

					</div>
					<div id="shopCart " class="item am-icon-bank "
						onclick="window.location.href='<%=basePath%>';">
						<a> <span class="message "></span>
						</a>
						<p>首页</p>
					</div>
					<div id="shopCart " class="item "
						onclick="window.location.href='<%=basePath%>/<%=UrlEnum.TYPE.getDesc()%>';">
						<a> <span class="message "></span>
						</a>
						<p>明星产品</p>
						<%--<p class="cart_num ">0</p> --%>
					</div>
					<div id="shopCart " class="item "
						onclick="window.location.href='<%=basePath%>/<%=UrlEnum.ARTICLE.getDesc()%>';">
						<a> <span class="message "></span>
						</a>
						<p>理财资讯</p>
					</div>

					<div class="quick_toggle ">
						<li class="qtitem "><a href="# "><span class="kfzx "></span></a>
							<div class="mp_tooltip ">
								客服中心<i class="icon_arrow_right_black "></i>
							</div></li>
						<!--二维码 -->
						<li class="qtitem "><a href="#none "><span
								class="mpbtn_qrcode "></span></a>
							<div class="mp_qrcode " style="display: none;">
								<img src="<%=basePath%>/images/weixin_code_145.png " /><i
									class="icon_arrow_white "></i>
							</div></li>
						<li class="qtitem "><a href="#top " class="return_top "><span
								class="top "></span></a></li>
					</div>

					<!--回到顶部 -->
					<div id="quick_links_pop " class="quick_links_pop hide "></div>

				</div>

			</div>
		</div>
		<script>
			window.jQuery
					|| document
							.write('<script src="basic/js/jquery.min.js "><\/script>');
		</script>
		<script type="text/javascript "
			src="<%=basePath%>/basic/js/quick_links.js "></script>
</body>

</html>