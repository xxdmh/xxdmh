<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>后台管理</title>
<base href="${base}/" />
<link rel="stylesheet" href="<c:url value='/css/admin.css' />" />
</head>
<body>
	<div class="container">
		<div id="header">
			<jsp:include page="top.jsp"></jsp:include>
		</div>
		<div id="admin_left">
			<jsp:include page="left.jsp"></jsp:include>
		</div>

		<div id="admin_right">
			欢迎使用
		</div>
	</div>

</body>