<%@page import="com.liaojl.shop.log.LogConfig"%>
<%@page import="com.liaojl.shop.url.UrlEnum"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String basePath = "http://" + LogConfig.homeurl;
%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="keywords" content="daikuang,dk,贷款,贷款超市,daichao,贷超">
<meta name="description" content="聚睿钱包提供小额贷款平台，贷款超市,daikuang,贷超">
<title>聚睿钱包明星产品</title>

<link href="<%=basePath%>/css/amazeui.css" rel="stylesheet"
	type="text/css" />
<link href="<%=basePath%>/basic/css/demo.css" rel="stylesheet"
	type="text/css" />
<link href="<%=basePath%>/css/cartstyle.css" rel="stylesheet"
	type="text/css" />
<link href="<%=basePath%>/css/optstyle.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript" src="<%=basePath%>/js/jquery.js"></script>

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
		<!-- 
		<div class="search-bar pr">
			<a name="index_none_header_sysc" href="#"></a>
			<form>
				<input id="searchInput" name="index_none_header_sysc" type="text"
					placeholder="搜索" autocomplete="off"> <input
					id="ai-topsearch" class="submit am-btn" value="搜索" index="1"
					type="submit">
			</form>
		</div> -->
	</div>

	<div class="clear"></div>
	</div>
	<div class="clear"></div>

	<!--购物车 -->
	<div class="concent">

		<div class="clear"></div>

		<tr class="item-list">
			<div class="bundle  bundle-last ">
				<div class="bundle-hd">
					<div class="bd-promos">
						<div class="bd-has-promo">
							已享优惠:<span class="bd-has-promo-content">省￥19.50</span>&nbsp;&nbsp;
						</div>
						<div class="act-promo">
							<a href="#" target="_blank">第二支半价，第三支免费<span class="gt">&gt;&gt;</span></a>
						</div>
						<span class="list-change theme-login">编辑</span>
					</div>
				</div>
				<div class="clear"></div>
				<div class="bundle-main">
					<ul class="item-content clearfix">

						<li class="td td-item">
							<div class="item-pic">
								<a href="#" target="_blank"
									data-title="美康粉黛醉美东方唇膏口红正品 持久保湿滋润防水不掉色护唇彩妆" class="J_MakePoint"
									data-point="tbcart.8.12"> <img
									src="<%=basePath%>/images/kouhong.jpg_80x80.jpg"
									class="itempic J_ItemImg"></a>
							</div>
							<div class="item-info">
								<div class="item-basic-info">
									<a href="#" target="_blank" title="美康粉黛醉美唇膏 持久保湿滋润防水不掉色"
										class="item-title J_MakePoint" data-point="tbcart.8.11">美康粉黛醉美唇膏
										持久保湿滋润防水不掉色</a>
								</div>
							</div>
						</li>
						<li class="td td-info">
							<div class="item-props item-props-can">
								<span class="sku-line">颜色：12#川南玛瑙</span> <span class="sku-line">包装：裸装</span>
								<span tabindex="0" class="btn-edit-sku theme-login">修改</span> <i
									class="theme-login am-icon-sort-desc"></i>
							</div>
						</li>
						<li class="td td-price">
							<div class="item-price price-promo-promo">
								<div class="price-content">
									<div class="price-line">
										<em class="price-original">78.00</em>
									</div>
									<div class="price-line">
										<em class="J_Price price-now" tabindex="0">39.00</em>
									</div>
								</div>
							</div>
						</li>
						<li class="td td-amount">
							<div class="amount-wrapper ">
								<div class="item-amount ">
									<div class="sl">
										<input class="min am-btn" name="" type="button" value="-" />
										<input class="text_box" name="" type="text" value="3"
											style="width: 30px;" /> <input class="add am-btn" name=""
											type="button" value="+" />
									</div>
								</div>
							</div>
						</li>
						<li class="td td-sum">
							<div class="td-inner">
								<em tabindex="0" class="J_ItemSum number">117.00</em>
							</div>
						</li>

					</ul>




					<ul class="item-content clearfix">

						<li class="td td-item">
							<div class="item-pic">
								<a href="#" target="_blank"
									data-title="美康粉黛醉美东方唇膏口红正品 持久保湿滋润防水不掉色护唇彩妆" class="J_MakePoint"
									data-point="tbcart.8.12"> <img
									src="<%=basePath%>/images/kouhong.jpg_80x80.jpg"
									class="itempic J_ItemImg"></a>
							</div>
							<div class="item-info">
								<div class="item-basic-info">
									<a href="#" target="_blank" title="美康粉黛醉美唇膏 持久保湿滋润防水不掉色"
										class="item-title J_MakePoint" data-point="tbcart.8.11">美康粉黛醉美唇膏
										持久保湿滋润防水不掉色</a>
								</div>
							</div>
						</li>
						<li class="td td-info">
							<div class="item-props item-props-can">
								<span class="sku-line">颜色：12#川南玛瑙</span> <span class="sku-line">包装：裸装</span>
								<span tabindex="0" class="btn-edit-sku theme-login">修改</span> <i
									class="theme-login am-icon-sort-desc"></i>
							</div>
						</li>
						<li class="td td-price">
							<div class="item-price price-promo-promo">
								<div class="price-content">
									<div class="price-line">
										<em class="price-original">78.00</em>
									</div>
									<div class="price-line">
										<em class="J_Price price-now" tabindex="0">39.00</em>
									</div>
								</div>
							</div>
						</li>
						<li class="td td-amount">
							<div class="amount-wrapper ">
								<div class="item-amount ">
									<div class="sl">
										<input class="min am-btn" name="" type="button" value="-" />
										<input class="text_box" name="" type="text" value="3"
											style="width: 30px;" /> <input class="add am-btn" name=""
											type="button" value="+" />
									</div>
								</div>
							</div>
						</li>
						<li class="td td-sum">
							<div class="td-inner">
								<em tabindex="0" class="J_ItemSum number">117.00</em>
							</div>
						</li>

					</ul>




				</div>
			</div>
		</tr>
		<div class="clear"></div>

		<tr class="item-list">
			<div class="bundle  bundle-last ">
				<div class="bundle-hd">
					<div class="bd-promos">
						<div class="bd-has-promo">
							已享优惠:<span class="bd-has-promo-content">省￥19.50</span>&nbsp;&nbsp;
						</div>
						<div class="act-promo">
							<a href="#" target="_blank">第二支半价，第三支免费<span class="gt">&gt;&gt;</span></a>
						</div>
						<span class="list-change theme-login">编辑</span>
					</div>
				</div>
				<div class="clear"></div>
				<div class="bundle-main">
					<ul class="item-content clearfix">

						<li class="td td-item">
							<div class="item-pic">
								<a href="#" target="_blank"
									data-title="美康粉黛醉美东方唇膏口红正品 持久保湿滋润防水不掉色护唇彩妆" class="J_MakePoint"
									data-point="tbcart.8.12"> <img
									src="<%=basePath%>/images/kouhong.jpg_80x80.jpg"
									class="itempic J_ItemImg"></a>
							</div>
							<div class="item-info">
								<div class="item-basic-info">
									<a href="#" target="_blank" title="美康粉黛醉美唇膏 持久保湿滋润防水不掉色"
										class="item-title J_MakePoint" data-point="tbcart.8.11">美康粉黛醉美唇膏
										持久保湿滋润防水不掉色</a>
								</div>
							</div>
						</li>
						<li class="td td-info">
							<div class="item-props item-props-can">
								<span class="sku-line">颜色：10#蜜橘色</span> <span class="sku-line">包装：两支手袋装（送彩带）</span>
								<span tabindex="0" class="btn-edit-sku theme-login">修改</span> <i
									class="theme-login am-icon-sort-desc"></i>
							</div>
						</li>
						<li class="td td-price">
							<div class="item-price price-promo-promo">
								<div class="price-content">
									<div class="price-line">
										<em class="price-original">78.00</em>
									</div>
									<div class="price-line">
										<em class="J_Price price-now" tabindex="0">39.00</em>
									</div>
								</div>
							</div>
						</li>
						<li class="td td-amount">
							<div class="amount-wrapper ">
								<div class="item-amount ">
									<div class="sl">
										<input class="min am-btn" name="" type="button" value="-" />
										<input class="text_box" name="" type="text" value="3"
											style="width: 30px;" /> <input class="add am-btn" name=""
											type="button" value="+" />
									</div>
								</div>
							</div>
						</li>
						<li class="td td-sum">
							<div class="td-inner">
								<em tabindex="0" class="J_ItemSum number">117.00</em>
							</div>
						</li>

					</ul>
				</div>
			</div>
		</tr>
	</div>
	<div class="clear"></div>

	<div class="footer">
		<div class="footer-hd">
			<p>
				<a href="#">恒望科技</a> <b>|</b> <a href="#">商城首页</a> <b>|</b> <a
					href="#">支付宝</a> <b>|</b> <a href="#">物流</a>
			</p>
		</div>
		<div class="footer-bd">
			<p>
				<a href="#">关于恒望</a> <a href="#">合作伙伴</a> <a href="#">联系我们</a> <a
					href="#">网站地图</a> <em>© 2015-2025 Hengwang.com 版权所有</em>
			</p>
		</div>
	</div>

	</div>

	<!--操作页面-->

	<div class="theme-popover-mask"></div>

	<div class="theme-popover">
		<div class="theme-span"></div>
		<div class="theme-poptit h-title">
			<a href="javascript:;" title="关闭" class="close">×</a>
		</div>
		<div class="theme-popbod dform">
			<form class="theme-signin" name="loginform" action="" method="post">

				<div class="theme-signin-left">

					<li class="theme-options">
						<div class="cart-title">颜色：</div>
						<ul>
							<li class="sku-line selected">12#川南玛瑙<i></i></li>
							<li class="sku-line">10#蜜橘色+17#樱花粉<i></i></li>
						</ul>
					</li>
					<li class="theme-options">
						<div class="cart-title">包装：</div>
						<ul>
							<li class="sku-line selected">包装：裸装<i></i></li>
							<li class="sku-line">两支手袋装（送彩带）<i></i></li>
						</ul>
					</li>
					<div class="theme-options">
						<div class="cart-title number">数量</div>
						<dd>
							<input class="min am-btn am-btn-default" name="" type="button"
								value="-" /> <input class="text_box" name="" type="text"
								value="1" style="width: 30px;" /> <input
								class="add am-btn am-btn-default" name="" type="button"
								value="+" /> <span class="tb-hidden">库存<span
								class="stock">1000</span>件
							</span>
						</dd>

					</div>
					<div class="clear"></div>
					<div class="btn-op">
						<div class="btn am-btn am-btn-warning">确认</div>
						<div class="btn close am-btn am-btn-warning">取消</div>
					</div>

				</div>
				<div class="theme-signin-right">
					<div class="img-info">
						<img src="<%=basePath%>/images/kouhong.jpg_80x80.jpg" />
					</div>
					<div class="text-info">
						<span class="J_Price price-now">¥39.00</span> <span id="Stock"
							class="tb-hidden">库存<span class="stock">1000</span>件
						</span>
					</div>
				</div>

			</form>
		</div>
	</div>
	<!--引导 -->
	<div class="navCir">
		<li><a href="<%=basePath%>"><i class="am-icon-bank "></i>我要借款
		</a></li>
		<li><a href="<%=basePath%>/<%=UrlEnum.TYPE.getDesc()%>"><i
				class="am-icon-star"></i>明星产品</a></li>

		<li class="active"><a
			href="<%=basePath%>/<%=UrlEnum.ARTICLE.getDesc()%>"><i
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
				<div id="shopCart " class="item "
					onclick="window.location.href='<%=basePath%>/<%=UrlEnum.ARTICLE.getDesc()%>';">
					<a> <span class="message "></span>
					</a>
					<p class='am-icon-money'>理财资讯</p>
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