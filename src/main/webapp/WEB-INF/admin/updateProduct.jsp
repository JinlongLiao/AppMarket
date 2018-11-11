<%@page import="com.liaojl.shop.log.LogConfig"%>
<%@page import="com.liaojl.shop.url.UrlEnum"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String basePath = "http://" + LogConfig.homeurl + ":" + request.getLocalPort()
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
				<li class="active"><a
					href="<%=basePath + UrlEnum.PRODUCT.getDesc()%>">所有商品 <span
						class="sr-only">(current)</span></a></li>
				<li><a href="<%=basePath + UrlEnum.TYPES.getDesc()%>">商品类型</a></li>
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
		<!-- 模态框（Modal） -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">×</button>
						<h4 class="modal-title" id="myModalLabel">添加</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" role="form" method="post"
							enctype="multipart/form-data"
							action="<%=basePath + UrlEnum.PROIMGUPLOAD.getUrl()%>">
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
									<input type="text" name='purl' class="form-control"
										id="lastname" placeholder="请输入网址">
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
									<button type="submit" class="btn btn-info">提交</button>
									<button type="reset" class="btn btn-danger">重置</button>
								</div>
							</div>
						</form>

					</div>
					<!-- <div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭
						</button>
						<button type="button" class="btn btn-primary">提交更改</button>
					</div> -->
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
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
								<td>${item.GOODS_URL}</td>
								<td>${item.GOODS_MIN_PRICE}至${item.GOODS_MAX_PRICE}</td>
								<td>${item.GOODS_DESC}</td>
								<td><c:choose>
										<c:when test="${item.GOOS_STATU==1}">正常  </c:when>
										<c:otherwise>失效   </c:otherwise>
									</c:choose></td>
								<td><c:if test="${item.GOOS_STATU!=1}">
										<a class="btn btn-info ">启用</a>&nbsp;</c:if> <c:if
										test="${item.GOOS_STATU==1}">
										<a class="btn btn-warning,">注销</a>&nbsp;</c:if><a
									class="btn btn-primary">编辑</a>&nbsp;<c:if
										test="${item.GOOS_STATU!=1}">
										<a class="btn btn-danger">删除</a>&nbsp;</c:if><a
									class="btn btn-success">↑↑</a>&nbsp;<a class="btn btn-success">↓↓</a></td>
							</tr>
						</c:forEach>

					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
</body>