<%@page import="com.liaojl.shop.url.UrlEnum"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String basePath = "http://" + request.getLocalAddr() + ":" + request.getLocalPort()
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
<style>
#nav {
	margin-top: 0px;
}

.brand-side {
	position: relative;
	margin-top: 0px;
	border-top: 0px solid #eae9e9;
	padding-top: 0px;
}

.sort-side .dl-sort {
	float: left;
	width: 100%;
	font-size: 16px;
}

.sort-side dd {
	float: left;
	padding: 1%;
	width: 25%;
}

.sort-side dd a {
	line-height: 20px;
	padding: 10px;
	width: 100%;
	text-align: center;
	font-size: 12px;
}

.sort-side dt {
	margin-top: 5px;
	font-size: 20px;
	font-weight: bold;
	width: 100%;
	color: #db3e54;
	text-align: center;
	padding: 10px;
	-webkit-box-shadow: 0px 0px 4px 0px rgba(0, 0, 0, 0.08);
	box-shadow: 0px 0px 4px 0px rgba(0, 0, 0, 0.08);
}
</style>
</head>

<body>
	<!--主体-->

	<div id="nav" class="navfull">
		<div class="area clearfix">
			<div class="category">
				<div class="menu-item menu-in top" style="display: flex;">
					<div class="area-in">
						<div class="area-bg">
							<div class="menu-srot">
								<div class="brand-side">
									<dl class="dl-sort">
										<img src="<%=basePath%>/images/abx.png">
									</dl>
								</div>
								<div class="sort-side">
									<dl class="dl-sort">
										<dt>
											<span title="饼干">快速下款</span>
										</dt>
										<dd>
											<img src="<%=basePath%>/images/ym.png "></img> <a title="蒸蛋糕"
												href="#"><span>
													<p>有米</p>
													<p>1000-10000</p>
													<p>
														<span>133364</span>人申请
													</p>
											</span></a>
										</dd>
										<dd>
											<img src="<%=basePath%>/images/ym.png "></img> <a title="蒸蛋糕"
												href="#"><span>
													<p>有米</p>
													<p>1000-10000</p>
													<p>
														<span>133364</span>人申请
													</p>
											</span></a>
										</dd>
										<dd>
											<img src="<%=basePath%>/images/ym.png "></img> <a title="蒸蛋糕"
												href="#"><span>
													<p>有米</p>
													<p>1000-10000</p>
													<p>
														<span>133364</span>人申请
													</p>
											</span></a>
										</dd>
										<dd>
											<img src="<%=basePath%>/images/ym.png "></img> <a title="蒸蛋糕"
												href="#"><span>
													<p>有米</p>
													<p>1000-10000</p>
													<p>
														<span>133364</span>人申请
													</p>
											</span></a>
										</dd>
										<dd>
											<img src="<%=basePath%>/images/ym.png "></img> <a title="蒸蛋糕"
												href="#"><span>
													<p>有米</p>
													<p>1000-10000</p>
													<p>
														<span>133364</span>人申请
													</p>
											</span></a>
										</dd>
									</dl>
									<dl class="dl-sort">
										<dt>
											<span title="饼干">不限金额</span>
										</dt>
										<dd>
											<img src="<%=basePath%>/images/ym.png "></img> <a title="蒸蛋糕"
												href="#"><span>
													<p>有米</p>
													<p>1000-10000</p>
													<p>
														<span>133364</span>人申请
													</p>
											</span></a>
										</dd>
										<dd>
											<img src="<%=basePath%>/images/ym.png "></img> <a title="蒸蛋糕"
												href="#"><span>
													<p>有米</p>
													<p>1000-10000</p>
													<p>
														<span>133364</span>人申请
													</p>
											</span></a>
										</dd>
										<dd>
											<img src="<%=basePath%>/images/ym.png "></img> <a title="蒸蛋糕"
												href="#"><span>
													<p>有米</p>
													<p>1000-10000</p>
													<p>
														<span>133364</span>人申请
													</p>
											</span></a>
										</dd>
										<dd>
											<img src="<%=basePath%>/images/ym.png "></img> <a title="蒸蛋糕"
												href="#"><span>
													<p>有米</p>
													<p>1000-10000</p>
													<p>
														<span>133364</span>人申请
													</p>
											</span></a>
										</dd>
										<dd>
											<img src="<%=basePath%>/images/ym.png "></img> <a title="蒸蛋糕"
												href="#"><span>
													<p>有米</p>
													<p>1000-10000</p>
													<p>
														<span>133364</span>人申请
													</p>
											</span></a>
										</dd>
									</dl>
									<dl class="dl-sort">
										<dt>
											<span title="饼干">饼干</span>
										</dt>
										<dd>
											<img src="<%=basePath%>/images/ym.png "></img> <a title="蒸蛋糕"
												href="#"><span>
													<p>有米</p>
													<p>1000-10000</p>
													<p>
														<span>133364</span>人申请
													</p>
											</span></a>
										</dd>
										<dd>
											<img src="<%=basePath%>/images/ym.png "></img> <a title="蒸蛋糕"
												href="#"><span>
													<p>有米</p>
													<p>1000-10000</p>
													<p>
														<span>133364</span>人申请
													</p>
											</span></a>
										</dd>
										<dd>
											<img src="<%=basePath%>/images/ym.png "></img> <a title="蒸蛋糕"
												href="#"><span>
													<p>有米</p>
													<p>1000-10000</p>
													<p>
														<span>133364</span>人申请
													</p>
											</span></a>
										</dd>
										<dd>
											<img src="<%=basePath%>/images/ym.png "></img> <a title="蒸蛋糕"
												href="#"><span>
													<p>有米</p>
													<p>1000-10000</p>
													<p>
														<span>133364</span>人申请
													</p>
											</span></a>
										</dd>
										<dd>
											<img src="<%=basePath%>/images/ym.png "></img> <a title="蒸蛋糕"
												href="#"><span>
													<p>有米</p>
													<p>1000-10000</p>
													<p>
														<span>133364</span>人申请
													</p>
											</span></a>
										</dd>
									</dl>
								</div>

							</div>
						</div>
					</div>
				</div>
				<b class="arrow"></b>
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
		<li><a href="<%=basePath%>"><i
				class="am-icon-bank "></i>我要借款 </a></li>
		<li class="active"><a href="<%=basePath%>/<%=UrlEnum.TYPE.getDesc()%>"><i
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
					onclick="window.location.href='<%=basePath%>/<%=UrlEnum.TYPE.getDesc()%>';">
					<a> <span class="message "></span>
					</a>
					<p class='am-icon-star'>明星产品</p>
					<%--<p class="cart_num ">0</p> --%>
				</div>
				<%-- 				<div id="shopCart " class="item "
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
</body>

</html>