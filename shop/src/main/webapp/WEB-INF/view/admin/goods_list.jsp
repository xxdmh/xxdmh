<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			<div class="headbar">
				<div class="searchbar">
					<form action="goods" method="get" id="form1"'>
						<input type="hidden" name="opr" value="list" />
						<input type="hidden" name="p" id="page" value="1" />
						<select class="auto" name="categoryId" id="category">
						<option value="">选择分类</option>
							<c:forEach items="${categories}" var="category">
								<option value="${category.id}">${category.name}</option>
							</c:forEach>
						</select> 商品名： <input class="small" name="name" id="name" type="text" value="${name}">
						销售价:<input class="small" name="goods.name" id="name" type="text" value="">至<input class="small" name="goods.name" id="name" type="text" value="">
						<button class="btn" type="submit">
							<span class="sel">筛 选</span>
						</button>
					</form>
				</div>

				<div class="field">
					<table class="list_table">
						<col width="40px" />
						<col width="400px" />
						<col width="120px" />
						<col width="70px" />
						<col width="70px" />
						<col width="70px" />
						<thead>
							<tr>
								<th>选择</th>
								<th>商品名称</th>
								<th>分类</th>
								<th>销售价</th>
								<th>库存</th>
								<th>操作</th>
							</tr>
						</thead>
					</table>
				</div>
			</div>
			<form action="" method="post" name="orderForm">
				<div class="content">
					<table class="list_table">
						<col width="40px" />
						<col width="400px" />
						<col width="120px" />
						<col width="70px" />
						<col width="70px" />
						<col width="70px" />
						<tbody>
							<c:forEach items="${page.list}" var="goods">
								<tr>
									<td><input name="" type="checkbox" value="1" /></td>
									<td><a href="" target="_blank" title="${goods.name}">${goods.name}</a></td>
									<td>${goods.cate.name}</td>
									<td>${goods.salePrice}</td>
									<td>${goods.stock}</td>
									<td><a href="<c:url value='/goods/edit.action/${goods.id}' />"><img
											class="operator" src="<c:url value='/images/admin/icon_edit.gif' />" alt="编辑" /></a>
										<a href="<c:url value='/goods/delete.action/${goods.id}' />" onclick="return window.confirm('暂时不能删除')"><img
											class="operator" src="<c:url value='/images/admin/icon_del.gif' />" alt="删除" /></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</form>
			<div class='pages_bar'>
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
		</div>
		<div id="separator"></div>
	</div>
</body>
</html>