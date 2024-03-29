<%@page import="com.liaojl.shop.servlet.admin.config.IndexInfo"%>
<%@page import="com.liaojl.shop.log.LogConfig"%>
<%@page import="com.liaojl.shop.url.UrlEnum"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String basePath = "http://" +  LogConfig.homeurl ;
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="viewport"
	content="width=320.1,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no,minimal-ui" />
<meta name="apple-mobile-web-app-title" content="yeziyuan" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta content="telephone=no" name="format-detection" />
<meta name="full-screen" content="yes" />
<meta name="x5-fullscreen" content="true" />
<meta name="keywords" content="daikuang,dk,贷款,贷款超市,daichao,贷超">
<meta name="description" content="<%=session.getAttribute("sysname") %>提供小额贷款平台，贷款超市,daikuang,贷超">
<title><%=session.getAttribute("sysname") %></title>

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
<script src="<%=basePath%>/js/url.js"></script>
<script src="<%=basePath%>/js/amazeui.min.js"></script>
<style>
.activity .info {
	margin-top: 5px;
	text-align: center;
	color: #999;
}

p {
	height: 14px;
	line-height: 14px;
	word-break: break-all;
	overflow: hidden;
	color: #999;
}

.news {
	width: 100%;
	text-align: center;
	color: red;
	font-size: 1.2rem;
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
	color: #FF0033;
	left: 15%;
	top: 13%;
}

.activity .icon-sale {
	position: absolute;
	width: 0;
	height: 0;
	/* 	border-top: 20px solid #0087e5;
	border-right: 30px solid transparent; */
	border-top: 0 solid #0087e5;
	border-right: 0 solid transparent;
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
					<li class="banner${status.index+1}"
						onclick="doUrl('<%=basePath%>/index/DoLog?top=true','${item. GOODS_URL}','${item. GOODS_ID}')"><a><img
							src="<%=basePath%>/upload/${item. GOODS_IMG}" /></a></li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<div class="clear"></div>
	<div class="shopNav">
		<div class="slideall"></div>
	</div>
	<div class="shopMainbg">

		<div class="shopMain" id="shopmain">
			<div>
				<div class='news am-icon-fire'>温馨提示</div>
				<div class='show-content'>
					<ul id="box">
						<!-- <li style="font-size: 14px;color: red">任何需要收费的项目都不要购买！！！</li>
						<li style="font-size: 14px; display: none;color: red">最新贷款平台每天实时更新，广大客户放心使用</li>
						<li style="font-size: 14px; display: none;color: red">任何需要收费的项目都不要购买！！！</li>
						<li style="font-size: 14px; display: none;color: red">最新贷款平台每天实时更新，广大客户放心使用</li> -->
						<%
						
						for(int i=0;i<IndexInfo.infos.size();i++){
							if(i==0){
								out.print("<li style='font-size: 14px;color: red'>"+IndexInfo.infos.get(i)+"</li>");
							}else{
								out.print("<li style='font-size: 14px;display: none;color: red'>"+IndexInfo.infos.get(i)+"</li>");
							}
						}
						%>
					</ul>
				</div>
			</div>
			<!--热门活动 -->

			<div class="am-container activity ">
				<!-- <div class="shopTitle ">
					<h4>您身边的贷款便利</h4>
				</div> -->
				<div class="am-g am-g-fixed ">
					<c:forEach items="${goods}" var="item" varStatus="status">

						<div class="am-u-sm-4 "
							onclick="doUrl('<%=basePath%>/index/DoLog','${item. GOODS_URL}','${item. GOODS_ID}')">
							<div class="icon-sale C${staus.index%2} "></div>
<%-- 							<h4>${item. TYPE_NAME}</h4>
 --%>							<div class="activityMain ">
								<img src="<%=basePath%>/upload/${item. GOODS_IMG}"></img>
							</div>
							<div class="info ">
								<p style="font-size: 12px;color: #5b9df1;">${item. GOODS_NAME}</p>
								<p style="font-size: 10px; color: #ff9f03">${item. GOODS_MIN_PRICE}-${item. GOODS_MAX_PRICE}</p>
								<p>
									<span style="font-size: 8px;color: #e02431">${item. GOODS_SEE}</span>人申请
								</p>
										<p>放款率：
									<span style="font-size: 8px;color: #FF6600">${item. GOODS_BFB}%</span>
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
	<!-- 	<script>
		window.jQuery
				|| document
						.write('<script src="basic/js/jquery.min.js "><\/script>');
	</script> -->
	<script type="text/javascript "
		src="<%=basePath%>/basic/js/quick_links.js "></script>
	<script type="text/javascript">
		
	</script>
</body>

</html>