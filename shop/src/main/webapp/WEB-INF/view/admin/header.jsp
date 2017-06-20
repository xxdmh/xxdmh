<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="logo">
	<a href=""><img src="<c:url value='/images/admin/logo.png' />" width="303" height="43" /></a>
</div>
<p>
	<a onclick="return window.confirm('是否退出后台管理')" href="/user/logout.action">退出管理</a> <a href="<c:url value='/user/indexAdmin.action' />">后台首页</a> <a href="<c:url value='/user/index.action' />" target='_blank'>商城首页</a>
	<span>您好 <label class='bold'>${user.name}</label>，当前身份 <label
		class='bold'>超级管理员</label></span>
</p>




