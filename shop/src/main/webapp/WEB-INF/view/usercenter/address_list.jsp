<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"></meta>
<base href="${base}/" />
<title>地址管理_嗨购商城</title>
<jsp:include page="../base.jsp" />
<script type="text/javascript" src="<c:url value='/js/jquery-3.2.1.min.js' />"></script>
<script type="text/javascript">
	$(document).ready(function () {
	var pp=true;
	var a = 0;
	$("#province").on("change",function(){
	a= $("#province").val();
	$("#areamsg").html("");
	pp=true;
	});
	var b = 0;
	$("#city").on("change",function(){
	b = $("#city").val();
	$("#areamsg").html("");
	pp=true;
	});
	var c= 0;
	$("#area").on("change",function(){
	c= $("#area").val();
	$("#areamsg").html("");
	pp=true;
	});
		var d = true;
	var e = true;
	var f = true;
	$("#uname").on("input",function(){
	$("#unamemsg").html("");
	d=true;
	});$("#street").on("input",function(){
	$("#streetmsg").html("");
	e=true;
	});$("#code").on("input",function(){
	$("#codemsg").html("");
	});var g = true;
	$("#phone").on("input",function(){
	var aa= $("#phone").val().length; 
	if (aa>11) {
	$("#phonemsg").html("長度錯誤").css("color","red");
	return g=false;
	}else{
	$("#phonemsg").html("");}
	g=true;
	});	var h = true;
	$("#cellPhone").on("input",function(){
	var hh = $("#cellPhone").val();
	var text =new RegExp("\^1[3|4|5|8][0-9]\\d{8}$");
	if (!text.test(hh)) {
	$("#cellPhonemsg").html("手機格式錯誤").css({"color":"red"});
	return h =false;
	}else {
	$("#cellPhonemsg").html("");}
	h=true;
	});
	var k=true;
	$("#btn").click(function(){
	$("#realarea").val(a+b+c);
	if ($("#uname").val()=="") {
	$("#unamemsg").html("收貨人不能為空哦").css({"color":"red"});
	d=false;
	}
	if ($("#province").val()=="0"||$("#city").val()=="0"||$("#area").val()=="0") {
	$("#areamsg").html("所在地區沒填完整哦").css({"color":"red"});
	pp=false;
	}
	if ($("#street").val()=="") {
	$("#streetmsg").html("街道地址不能為空哦").css({"color":"red"});
	e=false;
	}
	if ($("#cellPhone").val()=="") {
	$("#cellPhonemsg").html("手機號碼不能為空哦").css({"color":"red"});
	h=false;
	}
	if (d&&e&&f&&g&&h&&k&&pp) {
	$("#form1").submit();
	k=false;
	}
	});
	});

</script>
</head>
<body class="index">
	<div class="ucenter container">
		<jsp:include page="../header.jsp"></jsp:include>
		<jsp:include page="../navbar.jsp"></jsp:include>
		<jsp:include page="../search.jsp"></jsp:include>
		<div class="wrapper clearfix">
			<jsp:include page="left.jsp"></jsp:include>
			<div class="main f_r">
				<div class='tabs'>
					<div class="uc_title m_10 tabs_menu">
						<label class="current node"><span>地址管理</span></label>
					</div>
					<div class='tabs_content'>
						<div id="address_list" class="form_content m_10 node">
							<div class="uc_title2 m_10">
								<strong>已保存的有效地址</strong>
							</div>
							<table class="list_table" width="100%" cellpadding="0"
								cellspacing="0">
								<col width="120px" />
								<col width="120px" />
								<col width="120px" />
								<col width="120px" />
								<col width="120px" />
								<col />
								<thead>
									<tr>
										<th>收货人</th>
										<th>所在地区</th>
										<th>街道地址</th>
										<th>电话/手机</th>
										<th>邮编</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach items="${aList}" var="ad">
									<tr>
										<td>${ad.uname}</td>
										<td>${ad.area }</td>
										<td>${ad.street }</td> 
										<td>${ad.phone}/${ad.cellPhone }</td>
										<td>${ad.code }</td>
										<td><a class="blue" href='javascript:void(0)' onclick=''>修改</a>|
											<a class="blue" href="javascript:void(0)" onclick="">删除</a>|
											<c:choose>
											<c:when test="${ad.state=='0'}">
											<a class="red2" id="de1" href="<c:url value='/address/setDefault.action/${ad.id }' />">设为默认</a>
											</c:when>
											<c:otherwise>
											<a class="red2" id="de2" href="<c:url value='/address/cancelDefault.action/${ad.id }' />">取消默认</a>
											</c:otherwise>
											</c:choose>
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>

				<!--表单修改-->
				<div class="orange_box" id='address_form'>
					<form action="<c:url value='/address/${action}' />" method="POST" id="form1">
					<input type="hidden" name="tok" value="${tok}">
						<table class="form_table" width="100%" cellpadding="0"
							cellspacing="0">
							<col width="120px" />
							<col />
							<caption>收货地址</caption>
							<tr>
								<th><span class="red">*</span> 收货人姓名：</th>
								<td><input id="uname" name='uname' class="normal" type="text" /><label id="unamemsg">收货人真实姓名，方便快递公司联系。</label></td>
							</tr>
							<tr>
								<th><span class="red">*</span> 所在地区：</th>
								<td>
								<select  id="province" >
								<option selected="selected" value="0">請選擇</option>
								<option>sc</option>
								<option>gz</option>
								</select> 
								<select  id="city">
								<option selected="selected" value="0">請選擇</option>
								<option>aa</option>
								<option>bb</option>
								</select> 
								<select  id="area">
								<option selected="selected" value="0">請選擇</option>
								<option>cc</option>
								<option>dd</option>
								</select>
								<input type="hidden" id="realarea" name="area" value="" />
								<span id="areamsg">*</span>
								</td>
							</tr>
							<tr>
								<th><span class="red">*</span> 街道地区：</th>
								<td><input name='street' id="street" class="normal" type="text" /><label id="streetmsg">真实详细收货地址，方便快递公司联系。</label></td>
							</tr>
							<tr>
								<th>邮政编码：</th>
								<td><input name='code' id="code" class="normal" type="text" /><label id="codemsg">邮政编码,如250000。</label></td>
							</tr>
							<tr>
								<th>电话号码：</th>
								<td><input name='phone' id="phone" class="normal" type="text" /><label id="phonemsg">电话号码,如010-12345688。</label></td>
							</tr>
							<tr>
								<th>手机号码：</th>
								<td><input name='cellPhone' id="cellPhone" class="normal" type="text" /><label id="cellPhonemsg">手机号码，如：13588888888</label></td>
							</tr>
							<tr>
								<th>设为默认：</th>
								<td><label><input name='de' type='checkbox'
										value='1'></label></td>
							</tr>
							<tr>
								<th></th>
								<td><label class="btn"><input type="button" id="btn"
										value="保存" /></label> <label class="btn"><input type="reset"
										value="取消" /></label></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
		<jsp:include page="../help.jsp"></jsp:include>
		<jsp:include page="../footer.jsp"></jsp:include>
	</div>
</body>
</html>
