a<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<base href="${base}/" />
<title>后台管理</title>
<meta charset="utf-8" />
<link rel="stylesheet" href="<c:url value='/css/admin.css' />" />
<script type="text/javascript"
	src="<c:url value='/js/jquery-3.2.1.js' />"></script>
<script type="text/javascript"
	src="<c:url value='/js/jquery-3.2.1.min.js' />"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var r = true;
		http: //marketplace.eclipse.org/marketplace-client-intro?mpc_install=3274405
		$("#name").bind("input propertychange", function() {
			var a = $("#name").val().length;
			if (a == 0) {
				$("#namemsg").html("");
				r = null;
			} else {
				$("#namemsg").html("");
				return r = true;
			}
		});
		var s = true;
		$("#cate").bind("change", function() {
			if ($("#cate").val() != "0") {
				$("#catemsg").html("");
				return s = true;
			}
		});
		var t = true;
		$("#stock").bind("input propertychange", function() {
			if ($("#stock").val() != "") {
				$("#stockmsg").html("");
				return t = true;
			}
		});
		var u = true;
		$("#price2").bind("input propertychange", function() {
			if ($("#price2").val() != "") {
				$("#price2msg").html("");
				return u = true;
			}
		});
		var m = true;
		$("#file").bind("change", function() {
			var filer = $("#file").val();
			var a = filer.lastIndexOf(".");
			var b = filer.substring(a + 1).toUpperCase();
			if (b == "JPG" || b == "PNG" || b == "JPEG") {
				$("#filemsg").html("");
				return m = true;
			} else {
				$("#filemsg").html("文件格式错误！！").css("color", "red");
				return m = false;
			}
		});
		$("#file2").bind("change", function() {
			var filer = $("#file2").val();
			var a = filer.lastIndexOf(".");
			var b = filer.substring(a + 1).toUpperCase();
			if (b == "JPG" || b == "PNG" || b == "JPEG") {
				$("#filemsg").html("");
				return m = true;
			} else {
				$("#filemsg").html("文件格式错误！！").css("color", "red");
				return m = false;
			}
		});
		var q = true;
		$("#btn").click(function() {
			if ($("#name").val() == "") {
				$("#namemsg").html("商品名不能为空").css({
					"color" : "red"
				});
				r=false;
			}
			if ($("#cate").val() == "") {
				$("#catemsg").html("还没选择分类哦").css({
					"color" : "red"
				});
				s=false;
			}
			if ($("#stock").val() == "") {
				$("#stockmsg").html("还没有库存哦").css({
					"color" : "red"
				});
				t=false;
			}
			if ($("#price2").val() == "") {
				$("#price2msg").html("还没有价格哦").css({
					"color" : "red"
				});
				u=false;
			}
			if ($("#file").val() == "") {
				$("#filemsg").html("还没选择商品图片哦").css({
					"color" : "red"
				});
				m=false;
			}
			if (q && r && s && t && u && m) {
				$("#form1").submit();
				q = false;
			}
		});
	});
</script>
</head>
<body>
	<div class="container">
		<div id="header">
			<jsp:include page="header.jsp"></jsp:include>
		</div>
		<div id="admin_left">
			<ul class="submenu">
				<jsp:include page="left.jsp"></jsp:include>
			</ul>
			<div id="copyright"></div>
		</div>

		<div id="admin_right">
			<div class="content_box">
				<div class="content form_content">
					<form action="<c:url value='/goods/${action}' />" id="form1"
						method="post" enctype="multipart/form-data">
						<input type="hidden" name="tok" value="${tok}" />
						<input type="hidden" name="id" value="${goods.id }">
						<div id="table_box_1">
							<table class="form_table">
								<colgroup>
									<col width="150px">
									<col>
								</colgroup>
								<tbody>
									<tr>
										<th>商品名称：</th>
										<td><input class="normal" name="name" type="text"
											id="name" value="${goods.name}"><label id="namemsg">*</label></td>
									</tr>
									<tr>
										<th>所属分类：</th>
										<td><select name="categoryId" id="cate">
												<c:choose>
													<c:when test="${not empty goods}">
														<option value="${goods.cate.id}" selected="selected">${goods.cate.name}</option>
													</c:when>
													<c:otherwise>
														<option value="0" selected="selected">请选择分类</option>
													</c:otherwise>
												</c:choose>
												<c:forEach items="${categories}" var="category">
													<option value="${category.id}">${category.name}</option>
												</c:forEach>
										</select><label id="catemsg">*</label></td>
									</tr>
									<tr>
										<th>基本数据：</th>
										<td>
											<div class="con">
												<table class="border_table">
													<thead id="goodsBaseHead">
														<tr>
															<th>商品货号</th>
															<th>库存</th>
															<th>市场价格</th>
															<th>销售价格</th>
														</tr>
													</thead>
													<tbody id="goodsBaseBody">
														<tr class="td_c">
															<c:choose>
																<c:when test="${not empty goods.num }">
																	<td><input class="small" name="num" type="text"
																		 value="${goods.num}" /></td>
																</c:when>
																<c:otherwise>
																	<td><input class="small" name="num" type="text"
																		 value="${goodsNo}" /></td>
																</c:otherwise>
															</c:choose>
															<td><input class="tiny" name="stock" id="stock"
																value="${goods.stock}" type="text"><label
																id="stockmsg">*</label></td>
															<td><input class="tiny" name="marketPrice"
																value="${goods.marketPrice}" type="text"></td>
															<td><input class="tiny" name="salePrice" id="price2"
																value="${goods.salePrice}" type="text"><label
																id="price2msg">*</label></td>
														</tr>
													</tbody>
												</table>
											</div>
										</td>
									</tr>
									<tr>
										<th>缩略图：</th>
										<c:choose>
										<c:when test="${not empty goods.image}">
										<td>
										<img style="height: 100px;width: 100px;" src="<c:url value='/goodsImg${goods.image }' />" />
										<input type="file" name="file" id="file2"><label
											id="filemsg">*</label>
										<input type="hidden" name="image" value="${goods.image}">
										</td>
										</c:when>
										<c:otherwise>
										<td><input type="file" name="file" id="file"  /><label
											id="filemsg">*</label></td>
										</c:otherwise>
										</c:choose>
										
									</tr>
									<tr>
										<th>产品描述：</th>
										<td><textarea rows="5" cols="5" name="description"
												id="description">${goods.description}</textarea></td>
									</tr>
								</tbody>
							</table>
						</div>
						<table class="form_table">
							<colgroup>
								<col width="150px">
								<col>
							</colgroup>
							<tbody>
								<tr>
									<td></td>
									<td><button class="submit" type="button" id="btn">
											<span>发布商品</span>
										</button></td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
			</div>
		</div>
		<div id="separator"></div>
	</div>
</body>
</html>