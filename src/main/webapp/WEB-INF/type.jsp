<%@page import="com.liaojl.shop.servlet.TypeNameAndId"%>
<%@page
	import="com.liaojl.shop.url.UrlEnum,java.util.Map,java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
	width: 33.3%;
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
									<dl class="dl-sort" id='box'>
										<c:forEach items="${tops}" var="item" varStatus="status">
											<c:if test="${status.index==0}">
												<img src="<%=basePath%>/upload/${item. GOODS_IMG}" />
											</c:if>
											<c:if test="${status.index !=0}">
												<img src="<%=basePath%>/upload/${item. GOODS_IMG}"
													style="display: none;" />
											</c:if>
										</c:forEach>

										<%-- <img src="<%=basePath%>/images/abx.png"> --%>
									</dl>
								</div>
								<div class="sort-side">
									${goodsByType}
									<%-- <dl class="dl-sort">
										<dt>
											<span title="饼干">饼干</span>
										</dt>
										<dd>
											<img  style='width: 135px;height: 135px' src="<%=basePath%>/images/ym.png "></img> <a title="蒸蛋糕"
												href="#"><span>
													<p>有米</p>
													<p>1000-10000</p>
													<p>
														<span>133364</span>人申请
													</p>
											</span></a>
										</dd>
									</dl> --%>
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
		<li><a href="<%=basePath%>"><i class="am-icon-bank "></i>我要借款
		</a></li>
		<li class="active"><a
			href="<%=basePath%>/<%=UrlEnum.TYPE.getDesc()%>"><i
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
<script type="text/javascript">
		var delay = 5000;
		var list=$('#box img');
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