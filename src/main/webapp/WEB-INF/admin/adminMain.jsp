<%@page import="com.liaojl.shop.url.UrlEnum"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String basePath = "http://" + request.getLocalAddr() + ":" + request.getLocalPort()
			+ request.getContextPath();
%>
<jsp:include page="common.jsp"></jsp:include>
<div class="container-fluid">
	<div class="row">
		<div class="col-sm-3 col-md-2 sidebar">
			<ul class="nav nav-sidebar">
				<li class="active"><a
					href="<%=basePath + UrlEnum.ADMINMAIN.getDesc()%>">浏览 <span
						class="sr-only">(current)</span></a></li>
				<li><a href="<%=basePath + UrlEnum.PPTCONFIG.getDesc()%>">主页换灯片设置</a></li>
				<li><a href="<%=basePath + UrlEnum.PRODUCT.getDesc()%>">所有商品
				</a></li>
				<li><a href="<%=basePath + UrlEnum.TYPES.getDesc()%>">商品类型
				</a></li>
			</ul>
			<%-- 				<ul class="nav nav-sidebar">
					<li><a href="">Nav item</a></li>
					<li><a href="">Nav item again</a></li>
					<li><a href="">One more nav</a></li>
					<li><a href="">Another nav item</a></li>
					<li><a href="">More navigation</a></li>
				</ul>
				<ul class="nav nav-sidebar">
					<li><a href="">Nav item again</a></li>
					<li><a href="">One more nav</a></li>
					<li><a href="">Another nav item</a></li>
				</ul> --%>
		</div>
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<h1 class="page-header">主页换灯片展示</h1>

			<div class="row placeholders">
				<c:forEach items="${types}" var="item">
					<div class="col-xs-6 col-sm-3 placeholder">
						<img src="<%=basePath%>/upload/${item.GOODS_IMG}" width="200"
							height="200" class="img-responsive"
							alt="Generic placeholder thumbnail">
						<h4>名称：${item.GOODS_NAME}</h4>
						<h4>产品类型：${item.TYPE_NAME}</h4>
						<h4 style="color: red;">放款区间：${item.GOODS_MIN_PRICE}至
							${item.GOODS_MAX_PRICE}</h4>
						<span class="text-muted">产品描述：${item.GOODS_DESC}</span>
					</div>
				</c:forEach>
			</div>

			<h2 class="sub-header">产品展示</h2>
			<div class="table-responsive">
				<table class="table table-striped">
					<thead>
						<tr>
							<th>序号</th>
							<th>名称</th>
							<th>类型</th>
							<th>链接地址</th>
							<th>放款区间</th>
							<th>描述</th>
							<th>状态</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${results}" var="item" varStatus="status">
							<tr>
								<td>${status.index+1}</td>
								<td>${item.GOODS_NAME}</td>
								<td>${item.TYPE_NAME}</td>
								<td>${item.GOODS_URL}</td>
								<td>${item.GOODS_MIN_PRICE}至${item.GOODS_MAX_PRICE}</td>
								<td>${item.GOODS_DESC}</td>
								<td><c:choose>
										<c:when test="${item.GOOS_STATU==1}">正常  </c:when>
										<c:otherwise>失效   </c:otherwise>
									</c:choose></td>
							</tr>
						</c:forEach>

					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
</body>