<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html >
<html>
<head>
<base href="${base}/" />
<title>后台管理</title>
<meta charset="utf-8" />
<link rel="stylesheet" href="<c:url value='/css/admin.css' />" />
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
			<div class="headbar">
				<div class="field">
					<table class="list_table">
						<colgroup>
							<col width="30px">
							<col width="150px">
							<col width="150px">
							<col width="80px">
							<col width="135px">
							<col width="100px">
						</colgroup>
						<thead>
							<tr>
								<th>序号</th>
								<th>用户名</th>
								<th>Email</th>
								<th>余额</th>
								<th>注册日期</th>
								<th>操作</th>
							</tr>
						</thead>
					</table>
				</div>
			</div>

			<form method="post" name="member_list">
				<div class="content">
					<table id="list_table" class="list_table">
						<colgroup>
							<col width="30px">
							<col width="150px">
							<col width="150px">
							<col width="80px">
							<col width="135px">
							<col width="100px">
						</colgroup>
						<tbody>
							<c:forEach items="${page.list}" var="user" varStatus="s">
								<tr>
									<td>${s.count}</td>
									<td title="${user.name}">${user.name}</td>
									<td title="${user.email}">${user.email}</td>
									<td title="${user.balance}">${user.balance}</td>
									<td title="<fmt:formatDate value='${user.regTime}' pattern='yyyy-MM-dd' /> <fmt:formatDate value='${user.regTime}' pattern='hh-mm-ss' />">
                                    <fmt:formatDate value='${user.regTime}' pattern='yyyy-MM-dd' /> <fmt:formatDate value='${user.regTime}' pattern='hh-mm-ss' />
									<td><a href=""><img class="operator"
											src="<c:url value='/images/admin/icon_edit.gif' />" alt="修改" /></a> <a
										href="javascript:void(0)" onclick=""><img class="operator"
											src="<c:url value='/images/admin/icon_del.gif' />" alt="删除" /></a></td>
								</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="pages_bar">
						<a
			href="${pageContext.request.contextPath }/goods/${pageaction}?pageNum=${page.firstPage}">首页</a>
		<c:choose>
			<c:when test="${page.hasPreviousPage == false}">
          <span style="color:gray;"><a>上一页</a></span>
  </c:when>
			<c:otherwise>
				<a
					href="${pageContext.request.contextPath }/goods/${pageaction}?pageNum=${page.prePage }">上一页</a>
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${page.hasNextPage == false}">
          <span style="color:gray;"><a>下一页</a></span>
  </c:when>
			<c:otherwise>
				<a
					href="${pageContext.request.contextPath }/goods/${pageaction}?pageNum=${page.nextPage }">下一页</a>
			</c:otherwise>
		</c:choose>
		<a
			href="${pageContext.request.contextPath }/goods/${pageaction}?pageNum=${page.lastPage }">尾页</a>
            <span>当前第${page.pageNum}页/共${page.pages}页</span>	
				</div>
			</form>

		</div>
		<div id="separator"></div>
	</div>

	<div
		style="display: none; position: fixed; left: 0px; top: 0px; width: 100%; height: 100%; cursor: move; opacity: 0; background: rgb(255, 255, 255);"></div>
</body>
</html>