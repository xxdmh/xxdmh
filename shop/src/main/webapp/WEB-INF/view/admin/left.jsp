<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<ul class="menu">
	<li><a href="<c:url value='/goods/findAll.action' />">商品列表</a></li>
	<li><a href="<c:url value='/goods/add.action' />">商品添加</a></li>
	<li><a href="<c:url value='/cate/findAll.action' />">分类列表</a></li>
	<li><a href="<c:url value='/cate/add.action' />">添加分类</a></li>
	<li><a href="<c:url value='/sadmin/findAllOrders.action' />">订单列表</a></li>
	<li><a href="<c:url value='/sadmin/findAllUsers.action' />">用户列表</a></li>
</ul>