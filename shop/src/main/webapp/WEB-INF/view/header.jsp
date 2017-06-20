<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="header">
	<h1 class="logo">
		<a title="" style="background:url(<c:url value='/images/logo.png'/>);" href="">电子商务平台</a>
	</h1>
	<ul class="shortcut">
		<li class="first"><a href="<c:url value='/userback/indexcenter.action' />">我的账户</a></li>
		<li><a href="<c:url value='/userback/findAll.action' />">我的订单</a></li>
		<li class='last'><a href="">使用帮助</a></li>
	</ul>
	<p class="loginfo">
		<c:if test="${not empty sessionScope.user}">
		${user.name}您好，欢迎您来到${site}购物！[<a href="<c:url value='/user/logout.action' />" class="reg">安全退出</a>]
		<c:choose>
		<c:when test="${user.states==2}">
		[<a href="<c:url value='/sadmin/indexSadmin.action' />" class="reg">进入后台</a>]
		</c:when>
		<c:otherwise>
		</c:otherwise>
		</c:choose>
	  </c:if>
		<c:if test="${empty sessionScope.user}">
	  	[<a href="<c:url value='/user/login.action' />">登录</a>
			<a class="reg" href="<c:url value='/user/register.action' />">免费注册</a>]
	  </c:if>
	</p>
</div>