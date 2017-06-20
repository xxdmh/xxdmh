<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html >
<html>
<head>
<base href="${base}/" />
<title>后台管理</title>
<meta charset="utf-8" />
<link rel="stylesheet" href="<c:url value='/css/admin.css' />" />
<script type="text/javascript" src="<c:url value='/js/jquery-2.0.3.js' />"></script>
<script type="text/javascript">

	$(function(){
		$(".del").on("click",function(){
			if(confirm("您确认删除该记录吗")){
				location.href="<c:url value='/cate/delete.action/' />"+$(this).attr("data-id");
			}
		});
	});

	/*
	function del(id){
		if(confirm("您确认删除该记录吗")){
			location.href="category?opr=del&id="+id;
		}
	}*/
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
				<div class="field">
					<table class="list_table">
						<col width="50px" />
						<col width="100px" />
						<col width="100px"/>
						<col width="100px"/>
						<thead>
							<tr>
								<th>序号</th>
								<th>分类名称</th>
								<th>商品数量</th>
								<th>操作</th>
							</tr>
						</thead>
					</table>
				</div>
			</div>

			<div class="content">
				<table id="list_table" class="list_table">
						<col width="50px" />
						<col width="100px" />
						<col width="100px"/>
						<col width="100px"/>
					<tbody>
					<c:forEach items="${page.list}" var="category" varStatus="s">
						<tr>
						    <td>${s.count}</td>
							<td>${category.name}</td>
							<td>${category.goodsNums}</td>
							<td><a href="<c:url value='/cate/edit.action/${category.id}' />"><img class="operator"
									src="<c:url value='/images/admin/icon_edit.gif' />" alt="修改" title="修改" /></a> <a
								href="javascript:void(0)" class="del" data-id="${category.id}"><img class="operator"
									src="<c:url value='/images/admin/icon_del.gif' />" alt="删除" title="删除" /></a></td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
				<a
			href="${pageContext.request.contextPath }/cate/findAll.action?pageNum=${page.firstPage}">首页</a>
		<c:choose>
			<c:when test="${page.hasPreviousPage == false}">
          <span style="color:gray;">上一页</span>
  </c:when>
			<c:otherwise>
				<a
					href="${pageContext.request.contextPath }/cate/findAll.action?pageNum=${page.prePage }">上一页</a>
			</c:otherwise>
		</c:choose>
		<c:forEach items="${page.navigatepageNums }" var="gg">
		<c:choose>
		<c:when test="${page.pageNum == gg }">
		<span style="color:gray;">第${gg}頁</span>
		</c:when>
		<c:otherwise>
		<a href="${pageContext.request.contextPath }/cate/findAll.action?pageNum=${gg }">第${gg}頁</a>
		</c:otherwise>
		</c:choose>
		</c:forEach>

		<c:choose>
			<c:when test="${page.hasNextPage == false}">
          <span style="color:gray;">下一页</span>
  </c:when>
			<c:otherwise>
				<a
					href="${pageContext.request.contextPath }/cate/findAll.action?pageNum=${page.nextPage }">下一页</a>
			</c:otherwise>
		</c:choose>
		<a
			href="${pageContext.request.contextPath }/cate/findAll.action?pageNum=${page.lastPage }">尾页</a>
			</div>

		</div>
		<div id="separator"></div>
	</div>
</body>
</html>
