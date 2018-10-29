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
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>全部分类</title>
<link href="<%=basePath%>/css/amazeui.css" rel="stylesheet"
	type="text/css" />
<link href="<%=basePath%>/basic/css/demo.css" rel="stylesheet"
	type="text/css" />
<link href="<%=basePath%>/css/sortstyle.css" rel="stylesheet"
	type="text/css" />
<script src="<%=basePath%>/js/jquery.min.js"></script>
</head>

<body>
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



	<!--主体-->

	<div id="nav" class="navfull">
		<div class="area clearfix">
			<div class="category-content" id="guide_2">
				<div class="long-title">
					<span class="all-goods">全部分类</span><span id="meauBack"><a
						href="home.html">返回</a></span>
				</div>
				<div class="category">
					<ul class="category-list" id="js_climit_li">
						<li></li>
						<li class="appliance js_toggle relative selected">
							<div class="category-info">
								<h3 class="category-name b-category-name">
									<i><img src="<%=basePath%>/images/cookies.png"></i><a
										class="ml-22" title="饼干、膨化">饼干/膨化</a>
								</h3>
								<em>&gt;</em>
							</div>
							<div class="menu-item menu-in top">
								<div class="area-in">
									<div class="area-bg">
										<div class="menu-srot">
											<div class="brand-side">
												<dl class="dl-sort">
													<dt>
														<span>为您推荐</span>
													</dt>
													<img src="<%=basePath%>/images/TJ.jpg">
												</dl>
											</div>
											<div class="sort-side">
												<dl class="dl-sort">
													<dt>
														<span title="饼干">饼干</span>
													</dt>
													<dd>
														<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
													</dd>
													<dd>
														<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
													</dd>
													<dd>
														<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
													</dd>
													<dd>
														<a title="软面包" href="#"><span>软面包</span></a>
													</dd>
													<dd>
														<a title="马卡龙" href="#"><span>马卡龙</span></a>
													</dd>
												</dl>
												<dl class="dl-sort">
													<dt>
														<span title="薯片">薯片</span>
													</dt>
													<dd>
														<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
													</dd>
													<dd>
														<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
													</dd>
													<dd>
														<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
													</dd>
													<dd>
														<a title="软面包" href="#"><span>软面包</span></a>
													</dd>
													<dd>
														<a title="马卡龙" href="#"><span>马卡龙</span></a>
													</dd>
													<dd>
														<a title="千层饼" href="#"><span>千层饼</span></a>
													</dd>
													<dd>
														<a title="甜甜圈" href="#"><span>甜甜圈</span></a>
													</dd>
													<dd>
														<a title="蒸三明治" href="#"><span>蒸三明治</span></a>
													</dd>
													<dd>
														<a title="铜锣烧" href="#"><span>铜锣烧</span></a>
													</dd>
												</dl>
												<dl class="dl-sort">
													<dt>
														<span title="蛋糕">虾条</span>
													</dt>
													<dd>
														<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
													</dd>
													<dd>
														<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
													</dd>
													<dd>
														<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
													</dd>
													<dd>
														<a title="软面包" href="#"><span>软面包</span></a>
													</dd>
													<dd>
														<a title="马卡龙" href="#"><span>马卡龙</span></a>
													</dd>
													<dd>
														<a title="千层饼" href="#"><span>千层饼</span></a>
													</dd>
													<dd>
														<a title="甜甜圈" href="#"><span>甜甜圈</span></a>
													</dd>
													<dd>
														<a title="蒸三明治" href="#"><span>蒸三明治</span></a>
													</dd>
													<dd>
														<a title="铜锣烧" href="#"><span>铜锣烧</span></a>
													</dd>
												</dl>
											</div>

										</div>
									</div>
								</div>
							</div> <b class="arrow"></b>
						</li>
					</ul>
				</div>
			</div>

		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(
				function() {
					$("li").click(
							function() {
								$(this).addClass("selected").siblings()
										.removeClass("selected");
							})
				})
	</script>
	<div class="clear"></div>
	<!--引导 -->
	<div class="navCir">
		<li><a href="<%=basePath%>"><i class="am-icon-bank "></i>我要借款
		</a></li>
		<li class="active"><a
			href="<%=basePath%>/<%=UrlEnum.TYPE.getDesc()%>"><i
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
</body>

</html>