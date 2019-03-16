<%@page import="com.liaojl.shop.log.LogConfig"%>
<%@page import="com.liaojl.shop.url.UrlEnum"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String basePath = "http://" + LogConfig.homeurl ;
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
						<span class="sr-only">(current)</span>
				</a></li>
				<li><a href="<%=basePath + UrlEnum.TYPES.getDesc()%>">商品类型</a></li>
				<li class="active"><a
					href="<%=basePath + UrlEnum.SUBNET.getDesc()%>">子网划分</a></li>
			</ul>
		</div>

		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<h1 class="page-header">子链接划分</h1>
			<div class="form-horizontal" role="form">
				<div class="form-group">
					<label for="lastname" class="col-sm-2 control-label">选择划分产品</label>
					<div class="col-sm-8">
						<select class="selectpicker" style="width: 100%" id='goods_id' 
							onchange="dosearch()">
							<c:forEach items="${results}" var="item">
								<option value="${item.GOODS_ID }">${item.GOODS_NAME }</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label for="max" class="col-sm-2 control-label">划分子链接数目：</label>
					<div class="col-sm-8">
						<input type="number" name='pmax' class="form-control" id='max' />
					</div>
				</div>
				<div class="form-group">
					<label for="min" class="col-sm-2 control-label">子链接展示：</label>
					<div class="col-sm-8">
						<textarea class="form-control " id="deblock_udid"
							name="deblock_udid" rows="16"></textarea>
					</div>
				</div>

				<div class="form-group">
					<div class="col-sm-offset-4 col-sm-8">
						<button onclick="subnet()" class="btn btn-info">划分</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
<script>
	
	$(function() {
		dosearch();
	});
	function dosearch() {
		var id = $("#goods_id").val();
		/* alert(id); */
		$.ajax({
			url: '<%=basePath%>/<%=UrlEnum.SUBNET.getDesc()%>',
			type : 'POST',
			dataType : ' json',
			data : {
				gid : id,
				'search' : true
			},
		}).done(function(data, textStatus, xhr) {
			var urls = '';
			if(data.result){
				data.datas.forEach(function(value,index,array){
				urls += array[index].NET_URL;urls+='\n'})};
				$('#deblock_udid').val(urls);
		}).fail(function(data, textStatus, xhr) {

			console.log(textStatus);
			console.log(textStatus);
			console.log(data);
		}).always(function() {
			console.log("complete");
		});
	}
	
	function subnet() {
		var id = $("#goods_id").val();
		var num = $("#max").val();
		var reg = /^\+?[1-9][0-9]*$/;
		if (!reg.test(num)) {
		alert("请输入分割数")
		return false;
		}
		$.ajax({
			url : ' <%=basePath%>/<%=UrlEnum.SUBNET.getDesc()%>',
			type : 'POST',
			dataType : ' json',
			data : {
				"gid" : id,
				"subnet" : true,
				"num":num
			},
		}).done(function(data, textStatus, xhr) {
	var urls = '';
	if(data.result){
		if(data.result){
			data.datas.forEach(function(value,index,array){
			urls += array[index].NET_URL;urls+='\n'})};
			$('#deblock_udid').val(urls);
	}
		}).fail(function(data, textStatus, xhr) {

			console.log('fail');
			console.log(xhr);
			console.log(textStatus);
			console.log(data);
		}).always(function() {
			console.log("complete");
		});
	}
</script>