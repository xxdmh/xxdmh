<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
    $(document).ready(function (){
    var p = false;
    var q = true;
    $("#name").bind("input propertychange",function () {
    var qq = $("#name").val().length;
    if (qq==0) {
    $("#namemsg").html("");
    return q=null;
    }
    if ((qq<3)||(qq>20)){
    $("#namemsg").html("长度错误,3-20").css({"color":"red"});
    return q=false;
    }else {
    $("#namemsg").html("");
    return q = true;
    }
    });
    $("#btn").click(function() {
	$.post("<c:url value='/cate/editIsCate.action' />","name="+$("#name").val()+"&id="+$("#dd").val(),function (res) {
	if (res!="") {
	$("#namemsg").html("已经有该商品类名存在了").css({"color":"red"});
	return false;
	}
	else {
	if (p==false) {
	if (q==null) {
	$("#namemsg").html("分类名不能为空哦").css({"color":"red"});
	}
	if (q) {
	$("#form1").submit();
    p = true;
	}   
	}
	else {
	alert("不要着急，网速有点慢")
	}
	}
	});
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
					<form action="<c:url value='/cate/addEdit.action' />" method="post" id="form1">
						<input type="hidden" name="tok" value="${tok}" /> <input
							type="hidden" name="id" value="${category.id}" id="dd" />
						<table class="form_table" cellpadding="0" cellspacing="0">
							<col width="150px" />
							<col />
							<tr>
								<th>分类名称：</th>
								<td><input class="normal" name="name" type="text" id="name"
									value="${category.name}"><label id="namemsg">* 必选项</label></td>
							</tr>
							<!-- <tr>
								<th>商品数量：</th>
								<td><input class="normal" name="goodsNums" type="text"
									value="${category.goodsNums}" readonly="readonly"><label>* 必选项</label></td>
							</tr> -->
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
