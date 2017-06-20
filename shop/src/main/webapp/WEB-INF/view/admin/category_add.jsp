<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html >
<html>
<head>
<base href="${base}/" />
<title>后台管理</title>
<meta charset="utf-8" />
<link rel="stylesheet" href="<c:url value='/css/admin.css' />" />
<script type="text/javascript" src="<c:url value='/js/jquery-3.2.1.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/jquery-3.2.1.min.js' />"></script>
<script type="text/javascript">
	$(document).ready(function () {
	var o= null;
	$("#name").bind("input propertychange",function () {
	var a  = $("#name").val();
	if (a.length==0) {
	$("#namemsg").html("");
	return o = null;
	}
	if ((a.length<3)||(a.length>20)){
	$("#namemsg").html("长度错误,3-20").css({"color":"red"});
	return o = false;
	}
	else {
	$.post("<c:url value='/cate/isCate.action' />","name="+a,function (res) {
	if (res=="true") {
	$("#namemsg").html("分类名已存在").css({"color":"red"});
	return o =false;
	}
	else {
	$("#namemsg").html("");
	return o = true;
	}
	});
	}; 
	});
	$("#btn").click (function () {
	if (o==null) {
	$("#namemsg").html("分类名不能为空哦").css({"color":"red"});
	}
	if (o) {
	$("#btn").disabled="disabled";
	$("#form1").submit();
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
					<form action="<c:url value='/cate/addCate.action' />" method="post" id="form1">
					<input type="hidden" value="${tok}" name="tok" />
						<table class="form_table" cellpadding="0" cellspacing="0">
							<col width="150px" />
							<col />
							<tr>
								<th>分类名称：</th>
								<td><input class="normal" name="name" id="name" type="text"
									value=""><label id="namemsg">* 必选项</label></td>
							</tr>
							<tr>
								<td></td>
								<td><button class="submit" type="button" id="btn">
										<span>确 定</span>
									</button></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
		<div id="separator"></div>
	</div>
</body>
</html>
