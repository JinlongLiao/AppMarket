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
				<li><a href="<%=basePath + UrlEnum.ADMINMAIN.getDesc()%>">浏览</a></li>
				<li class="active"><a
					href="<%=basePath + UrlEnum.PPTCONFIG.getDesc()%>">主页换灯片设置 <span
						class="sr-only">(current)</span></a></li>
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
			<div>
				<h1 class="page-header">
					主页换灯片展示
					<button class="btn btn-primary btn-lg"
						style="text-align: right; float: right; margin-right: 0.7 rem"
						onclick="trancate()" id='mtitle'>显示</button>
				</h1>

			</div>
			<div class="row placeholders" style="display: none" id='mcontent'>

				<c:forEach items="${results}" var="item">
					<div class="col-xs-6 col-sm-3 placeholder"
						onclick="javascript:window.location.href='<%=basePath %>/admin/editPro?id=${item.GOODS_ID}&top=true'">
						<img src="<%=basePath%>/upload/${item.GOODS_IMG}" width="200"
							height="200" class="img-responsive"
							alt="Generic placeholder thumbnail">
						<h4>${item.GOODS_NAME}</h4>
						<h4>产品类型：${item.TYPE_NAME}</h4>
						<p style="color: red;">${item.GOODS_MIN_PRICE}至
							${item.GOODS_MAX_PRICE}</p>
						<span class="text-muted">${item.GOODS_DESC}</span>
					</div>
				</c:forEach>
			</div>
			<h1 class="page-header">产品展示</h1>
			<div class="table-responsive">
				<p>
					<button class="btn btn-primary btn-lg" data-toggle="modal"
						data-target="#myModal"
						style="text-align: right; float: right; margin-right: 0.7 rem">
						添加</button>
				</p>
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
							<th>可选操作</th>
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
								<td><c:if test="${item.GOOS_STATU!=1}">
										<a class="btn btn-info "
											onclick='javascript:doUrl(true,"是否启用该产品","<%=basePath %>/admin/delete?top=true&edit=true&id=${item.GOODS_ID}&status=1")'>启用</a>&nbsp;</c:if>
									<c:if test="${item.GOOS_STATU==1}">
										<a class="btn btn-info "
											onclick='javascript:doUrl(true,"是否注销该产品","<%=basePath %>/admin/delete?top=true&edit=true&id=${item.GOODS_ID}&status=0")'>注销</a>&nbsp;</c:if><a
									href='<%=basePath %>/admin/editPro?id=${item.GOODS_ID}&top=true'
									class="btn btn-primary">编辑</a>&nbsp;<c:if
										test="${item.GOOS_STATU!=1}">
										<a class="btn btn-danger"
											onclick='javascript:doUrl(true,"是否删除该产品","<%=basePath %>/admin/delete?top=true&id=${item.GOODS_ID}&status=0")'>删除</a>&nbsp;</c:if><a
									class="btn btn-success">↑↑</a>&nbsp;<a class="btn btn-success">↓↓</a></td>
							</tr>
						</c:forEach>

					</tbody>
				</table>
			</div>
			<form class="form-horizontal" role="form" method="post"
				enctype="multipart/form-data"
				action="<%=basePath + UrlEnum.PPTIMGUPLOAD.getUrl()%>">
				<div class="form-group">
					<label for="firstname" class="col-sm-2 control-label">产品名称</label>
					<div class="col-sm-10">
						<input type="text" name="pname" class="form-control"
							id="firstname" placeholder="请输入产品名称">
					</div>
				</div>
				<div class="form-group">
					<label for="lastname" class="col-sm-2 control-label">产品链接</label>
					<div class="col-sm-10">
						<input type="text" name='purl' class="form-control" id="lastname"
							placeholder="请输入网址">
					</div>

				</div>
				<div class="form-group">
					<label for="lastname" class="col-sm-2 control-label">产品类型</label>
					<div class="col-sm-10">
						<select class="selectpicker" name="ptype">
							<c:forEach items="${types}" var="item">
								<option value="${item.TYPE_ID }">${item.TYPE_NAME }</option>
							</c:forEach>
						</select>
					</div>

				</div>
				<div class="form-group">
					<label for="desc" class="col-sm-2 control-label">描述</label>
					<div class="col-sm-offset-2 col-sm-10" id='desc'>
						<textarea name='pdesc' class="form-control" rows="3"></textarea>
					</div>
				</div>
				<div class="form-group">
					<label for="IMG" class="col-sm-2 control-label">图标</label>
					<div class="col-sm-offset-2 col-sm-10" id='IMG'>
						<input id="input-b1" name="pimg" type="file" class="file"
							data-browse-on-zone-click="true">

					</div>
				</div>
				<div class="form-group">
					<label for="min" class="col-sm-2 control-label">发款最小值：</label>
					<div class="col-sm-offset-2 col-sm-5">
						<input type="number" name='pmin' class="form-control" id='min' />
					</div>
				</div>
				<div class="form-group">
					<label for="min" class="col-sm-2 control-label">发款最大值：</label>
					<div class="col-sm-offset-2 col-sm-5">
						<input type="number" name='pmax' class="form-control" id='max' />
					</div>
				</div>

				<div class="form-group">
					<div class="col-sm-offset-5 col-sm-5">
						<button type="submit" class="btn btn-info">登录</button>
						<button type="reset" class="btn btn-danger">重置</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
</body>
<script>
	var flag = true;
	function trancate() {
		if (flag) {
			$('#mtitle').text("隐藏");
			$('#mcontent').css('display', 'block');
			flag = false;
		} else {
			$('#mtitle').text("显示");
			$('#mcontent').css('display', 'none');
			flag = true;
		}
	}
</script>