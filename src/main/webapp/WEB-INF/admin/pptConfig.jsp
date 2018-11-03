<%@page import="com.liaojl.shop.url.UrlEnum"%>
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
			<h1 class="page-header">主页换灯片展示</h1>

			<div class="row placeholders">
				<div class="col-xs-6 col-sm-3 placeholder">
					<img
						src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw=="
						width="200" height="200" class="img-responsive"
						alt="Generic placeholder thumbnail">
					<h4>Label</h4>
					<span class="text-muted">Something else</span>
				</div>
				<div class="col-xs-6 col-sm-3 placeholder">
					<img
						src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw=="
						width="200" height="200" class="img-responsive"
						alt="Generic placeholder thumbnail">
					<h4>Label</h4>
					<span class="text-muted">Something else</span>
				</div>
				<div class="col-xs-6 col-sm-3 placeholder">
					<img
						src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw=="
						width="200" height="200" class="img-responsive"
						alt="Generic placeholder thumbnail">
					<h4>Label</h4>
					<span class="text-muted">Something else</span>
				</div>
				<div class="col-xs-6 col-sm-3 placeholder">
					<img
						src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw=="
						width="200" height="200" class="img-responsive"
						alt="Generic placeholder thumbnail">
					<h4>Label</h4>
					<span class="text-muted">Something else</span>
				</div>
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
