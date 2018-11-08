<%@page import="com.liaojl.shop.url.UrlEnum"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String basePath = "http://" + request.getLocalAddr() + ":" + request.getLocalPort()
			+ request.getContextPath();
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<style>
.activity .info {
	margin-top: 5px;
	text-align: center;
}

.news {
	width: 100%;
	text-align: center;
	color: red;
	font-size: 1.4rem;
	font-style: initial;
	text-align: center;
	font-style: initial;
}

.show-content {
	width: 100%;
	text-align: center;
	font-size: 14px;
}

.banner {
	top: 0;
}

.banner, .bannerTwo {
	margin-top: 0px;
}

[class*="am-u-"] {
	padding: 5%;
	float: left;
}

[class*="am-u-"]+[class*="am-u-"]:last-child {
	float: left;
}

.activity .am-g h4 {
	position: absolute;
	color: #fff;
	left: 5%;
}
</style>
</head>

<body>
	<div class="banner">
		<!--轮播 -->
		<div class="am-slider am-slider-default scoll" data-am-flexslider
			id="demo-slider-0">
			<ul class="am-slides">
				<%-- <li class="banner1"><a href="introduction.html"><img
						src="<%=basePath%>/images/gao.png" /></a></li>
				<li class="banner2"><a><img
						src="<%=basePath%>/images/abx.png" /></a></li>
				<li class="banner3"><a><img
						src="<%=basePath%>/images/gao.png" /></a></li>
				<li class="banner4"><a><img
						src="<%=basePath%>/images/abx.png" /></a></li> --%>
				<c:forEach items="${tops}" var="item" varStatus="status">
					<li class="banner${status.index+1}"><a><img
							src="<%=basePath%>/upload/${item. GOODS_IMG}" /></a></li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<div class="clear"></div>
	<div class="shopNav">
		<div class="slideall"></div>
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
													$(this).addClass("hover");
													$(this).children(
															"div.menu-in").css(
															"display", "block")
												},
												function() {
													$(this)
															.removeClass(
																	"hover")
													$(this).children(
															"div.menu-in").css(
															"display", "none")
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
			<div>
				<div class='news am-icon-fire'>公告</div>
				<div class='show-content'>
					<ul id="box">
						<li style="font-size: 14px; display: none;">1任何需要收费的项目都不要购买！！！</li>
						<li style="font-size: 14px; display: none;">2最新贷款平台每天实时更新，广大客户放心使用</li>
						<li style="font-size: 14px; display: none;">3任何需要收费的项目都不要购买！！！</li>
						<li style="font-size: 14px; display: none;">4最新贷款平台每天实时更新，广大客户放心使用</li>
					</ul>
				</div>
			</div>
			<!--热门活动 -->

			<div class="am-container activity ">
				<div class="shopTitle ">
					<h4>您身边的贷款便利</h4>
					<h3>带给您享不停的优惠活动</h3>
				</div>
				<div class="am-g am-g-fixed ">
					<c:forEach items="${goods}" var="item" varStatus="status">

						<div class="am-u-sm-4 ">
							<div class="icon-sale one "></div>
							<h4>${item. GOODS_NAME}</h4>
							<div class="activityMain ">
								<img src="<%=basePath%>/upload/${item. GOODS_IMG}"></img>
							</div>
							<div class="info ">
								<p style="font-size: 10px;">${item. GOODS_NAME}</p>
								<p style="font-size: 10px;">${item. GOODS_MIN_PRICE}-${item. GOODS_MAX_PRICE}</p>
								<p>
									<span style="font-size: 8px;">${item. GOODS_SEE}</span>人申请
								</p>
							</div>
						</div>
					</c:forEach>

					<%-- 
					<div class="am-u-sm-3 ">
						<div class="icon-sale two "></div>
						<h4>折上购</h4>
						<div class="activityMain ">
							<img src="<%=basePath%>/images/zsg.png"></img>
						</div>
						<div class="info ">
							<p>折上购</p>
							<p>1000-10000</p>
							<p>
								<span>133530</span>人申请
							</p>
						</div>
					</div>

					<div class="am-u-sm-3 ">
						<div class="icon-sale three "></div>
						<h4>金速达</h4>
						<div class="activityMain ">
							<img src="<%=basePath%>/images/jsd.png"></img>
						</div>
						<div class="info ">
							<p>金速达</p>
							<p>1000-10000</p>
							<p>
								<span>144177</span>人申请
							</p>
						</div>
					</div>

					<div class="am-u-sm-3">
						<div class="icon-sale "></div>
						<h4>香蕉付</h4>
						<div class="activityMain ">
							<img src="<%=basePath%>/images/xjf.png"></img>
						</div>
						<div class="info ">
							<p>香蕉付</p>
							<p>1000-10000</p>
							<p>
								<span>126176</span>人申请
							</p>
						</div>
					</div>
					<div class="am-u-sm-3  ">
						<div class="icon-sale "></div>
						<h4>如意猪</h4>
						<div class="activityMain ">
							<img src="<%=basePath%>/images/ryz.png"></img>
						</div>
						<div class="info ">
							<p>如意猪</p>
							<p>1000-10000</p>
							<p>
								<span>133538</span>人申请
							</p>
						</div>
					</div>
					<div class="am-u-sm-3 ">
						<div class="icon-sale three "></div>
						<h4>我想贷</h4>
						<div class="activityMain ">
							<img src="<%=basePath%>/images/wxd.png"></img>
						</div>
						<div class="info ">
							<p>我想贷</p>
							<p>1000-10000</p>
							<p>
								<span>132710</span>人申请
							</p>
						</div>
					</div> --%>
				</div>
			</div>
			<div class="clear "></div>


			<div id="f1">
				<div class="clear "></div>
			</div>



			<div class="footer ">
				<div class="footer-hd ">
					<!-- 				<p>
							<a href="# ">恒望科技</a> <b>|</b> <a href="# ">商城首页</a> <b>|</b> <a
								href="# ">支付宝</a> <b>|</b> <a href="# ">物流</a>
						</p> -->
				</div>
				<div class="footer-bd ">
					<p>
						<!-- <a href="# ">关于恒望</a> <a href="# ">合作伙伴</a> <a href="# ">联系我们</a>
							<a href="# ">网站地图</a> <em>© 2015-2025 Hengwang.com 版权所有</em> -->
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

		<%-- <li><a href="<%=basePath%>/<%=UrlEnum.ARTICLE.getDesc()%>"><i
					class="am-icon-money"></i>理财资讯</a></li> --%>
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
				<div id="shopCart " class="item"
					onclick="window.location.href='<%=basePath%>';">
					<a> <span class="message "></span>
					</a>
					<p class='am-icon-bank'>首页</p>
				</div>
				<div id="shopCart " class="item "
					onclick="window.location.href='<%=basePath%><%=UrlEnum.TYPE.getDesc()%>';">
					<a> <span class="message "></span>
					</a>
					<p class='am-icon-star'>明星产品</p>
					<%--<p class="cart_num ">0</p> --%>
				</div>
				<%-- <div id="shopCart " class="item "
						onclick="window.location.href='<%=basePath%>/<%=UrlEnum.ARTICLE.getDesc()%>';">
						<a> <span class="message "></span>
						</a>
						<p class='am-icon-money'>理财资讯</p>
					</div> --%>

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
	<script type="text/javascript">
		var delay = 1000;
		var list=$('#box li');
		var index=0;
		var length=list.length;
		setInterval(() => {
			for (var i = 0; i < length; i++) {
				if(i!=index){
					$(list[i]).css('display','none');
				}else {
					$(list[i]).css('display','block');
				}
			}
			if(index==(length-1)){
				index=0;
			}else{
				index++;
			}
		}, delay);
	</script>
</body>

</html>