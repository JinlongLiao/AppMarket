<%@page import="com.liaojl.shop.url.UrlEnum"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String basePath = "http://" + request.getLocalName() + ":" + request.getLocalPort()
			+ request.getContextPath();
%>
<jsp:include page="common.jsp"></jsp:include>
<div class="container-fluid">
	<div class="row">
		<div class="col-sm-3 col-md-2 sidebar">
			<ul class="nav nav-sidebar">
				<li><a href="<%=basePath + UrlEnum.ADMINMAIN.getDesc()%>">浏览</a></li>
				<li><a href="<%=basePath + UrlEnum.PPTCONFIG.getDesc()%>">主页换灯片设置
				</a></li>
				<li><a href="<%=basePath + UrlEnum.PRODUCT.getDesc()%>">所有商品
				</a></li>
				<li class="active"><a
					href="<%=basePath + UrlEnum.TYPES.getDesc()%>">商品类型 <span
						class="sr-only">(current)</span></a></li>
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
		<!-- /.modal -->
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<h1 class="page-header">产品展示</h1>
			<div class="table-responsive">
				<p>
				<div class="form-group">
					<label for="input">输入商品类型</label> <input type="text"
						class="form-control" id="input" />
					<p class="help-block">商品类型</p>
				</div>
				<button class="btn btn-primary btn-lg" data-toggle="modal"
					data-target="#myModal"
					style="text-align: right; float: right; margin-right: 0.7 rem"
					onclick="addType('<%=basePath%>/admin/addTypes','<%= basePath+UrlEnum.TYPES.getDesc() %>')">添加</button>
				<table class="table table-striped">
					<thead>
						<tr>
							<th>序号</th>
							<th>名称</th>
							<th>可选操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${results}" var="item" varStatus="status">
							<tr>
								<td>${status.index+1}</td>
								<td>${item.TYPE_NAME}</td>
								<td>
								<td><a class="btn btn-primary">编辑</a>&nbsp;<a
									class="btn btn-danger">删除</a></td>
							</tr>
						</c:forEach>

					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
</body>
<script type="text/javascript" src="<%=basePath %>/js/types.js"></script>