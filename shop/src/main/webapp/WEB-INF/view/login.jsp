<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<base href="${base}/" />
<meta charset="utf-8" />
<title>用户登录_嗨购商城</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/index.css' />" />
<script type="text/javascript" src="<c:url value='/js/jquery-3.2.1.min.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/jquery-3.2.1.js' />"></script>
<script type="text/javascript">
   $(document).ready(function () {
   var p = false;
   $("#btn").click(function () {
   $.post("<c:url value='/user/isNamePass.action' />","name="+$("#name").val()+"&password="+$("#password").val(),function (res) {
   if (res!="") {
   $("#msg").html(res).css({"color":"red"});
   }
   else {
   if (p==false) {
    $("#form1").submit();
     p = true;
   }
   else {
   alert("不要慌啊")
   }
   }
   });
   });
   });
   
</script>
</head>

<body class="second">
	<div class="brand_list container_2">
		<jsp:include page="header.jsp"></jsp:include>
		<span id="msg"></span>

		<div class="wrapper clearfix">
			<div class="wrap_box">
				<h3 class="notice">已注册用户，请登录</h3>
				<p class="tips">欢迎来到我们的网站，如果您已是本站会员请登录</p>
				<div class="box login_box clearfix">
					<form action='<c:url value='/user/log.action' />' method="post" id="form1">
						<table width="515" class="form_table f_l">
							<col width="120px" />
							<col />
							<tr>
								<th>用户名：</th>
								<td><input class="gray" type="text" name="name"
									id="name" placeholder="请输入用户名" /><span id="namemsg"></span></td>
							</tr>
							<tr>
								<th>密码：</th>
								<td><input class="gray" type="password" id="password"
									name="password" placeholder="请输入6-20位长度的密码" /><span
									id="pwdmsg"></span></td>
							</tr>
							<tr>
								<td></td>
								<td><input class="submit_login" type="button" id="btn" value="登录" /></td>
							</tr>
						</table>
					</form>

					<!--正常登录时-->
					<table width="360px" class="form_table prompt_3 f_l">
						<col width="75px" />
						<col />
						<tr>
							<th></th>
							<td>
								<p class="mt_10">
									<strong class="f14">您还不是<span class="orange">嗨购商城</span>用户
									</strong>
								</p>
								<p>
									现在免费注册成为嗨购商城用户，便能立即享受便宜又放心的购物乐趣。<a class="blue" href="<c:url value='/user/index.action' />">网站首页>></a>
								</p>
								<p class="mt_10">
									<a class="reg_btn" href="<c:url value='/user/register.action' />">注册新用户</a>
								</p>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>