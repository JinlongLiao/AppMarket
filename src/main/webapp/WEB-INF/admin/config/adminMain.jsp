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
				<li class="active"><a href="">密码管理 <span class="sr-only">(current)</span></a></li>
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
			<form method="post" action="<%=basePath%>/admin/serverconfig">
				<div class="form-group">
					<label for="name">密码</label> <input name="pwd" type="password"
						class="form-control" id="name" placeholder="密码" />
				</div>
				<div class="form-group">
					<label for="inputfile">确认字段</label> <input class="form-control"
						type="password" id="rename" placeholder="确认密码" />
				</div>
				<button class="btn btn-primary" onsubmit="doupdate()">提交</button>
			</form>
		</div>
	</div>
	</body>

	<script>
		function doupdate() {
			var pass = $('#name').val();
			var rpass = $('#rename').val();
			if (pass.value == "") {
				alert("密码不能为空");
				$('#name')[0].focus();
				return false;
			} else if (pass.length<4 || pass.length>16) {
				alert("密码的长度必须在4-16个字符");
				$('#name')[0].focus();
				return false;
			} else if (rpass != pass) {
				alert("确认密码与密码输入不一致");
				$('#rename')[0].focus();
				return false;
			} else {
				return true;
			}

		}
	</script>