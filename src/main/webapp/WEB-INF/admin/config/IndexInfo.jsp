<%@page import="com.liaojl.shop.log.LogConfig"%>
<%@page import="com.liaojl.shop.url.UrlEnum"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String basePath = "http://" + LogConfig.homeurl + ":" + request.getLocalPort() + request.getContextPath();
%>
<jsp:include page="common.jsp"></jsp:include>
<div class="container-fluid">
	<div class="row">
		<div class="col-sm-3 col-md-2 sidebar">
			<ul class="nav nav-sidebar">
				<li><a
					href="<%=request.getContextPath()%>/admin/serverconfig">密码管理
						<span class="sr-only"></span>
				</a></li>
				<li class="active"><a
					href="<%=request.getContextPath()%>/admin/IndexInfo">首页消息管理 <span
						class="sr-only">(current)</span></a></li>
				<%-- 			<li><a href="<%=basePath + UrlEnum.PPTCONFIG.getDesc()%>">主页换灯片设置</a></li>
				<li><a href="<%=basePath + UrlEnum.PRODUCT.getDesc()%>">所有商品
				</a></li>
				<li><a href="<%=basePath + UrlEnum.TYPES.getDesc()%>">商品类型
				</a></li>
				<li><a href="<%=basePath + UrlEnum.SUBNET.getDesc()%>">子网划分</a></li> --%>

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
			<form method="post" action="<%=basePath%>/admin/IndexInfo?edit=true">
				<div class="form-group">
					<label for="name">首页消息配置：</label>
					<textarea class="form-control " id="info" rows="16" cols="16"
						name="info" required="required" placeholder="首页消息">
					${result}
					</textarea>
				</div>

				<button class="btn btn-primary">提交</button>
			</form>
		</div>
	</div>
	</body>
	<script type="text/javascript">
		$(function() {
			$('#info').text($('#info').text().trim());
		})
	</script>