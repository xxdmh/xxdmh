<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<base href="${base}/" />
<meta charset="utf-8" />
<title>${webName }</title>
<link type="image/x-icon" href="favicon.ico" rel="icon" />
<jsp:include page="../base.jsp"></jsp:include>
</head>
<body class="index">
	<div class="container">
		<jsp:include page="../header.jsp"></jsp:include>
		<jsp:include page="../navbar.jsp"></jsp:include>
		<jsp:include page="../search.jsp"></jsp:include>
		<div class="position">
			<span>您当前的位置：</span> <a href="">首页</a> » <a href="">${webName }</a>
		</div>
		<div class="wrapper clearfix container_2">
			<div class="sidebar f_l">
				<!--销售排行-->
				<div class="box m_10">
					<div class="title">销售排行榜</div>
					<div class="content">
						<ul class="ranklist" id='ranklist'>
							<c:forEach items="${saleGoods}" var="goods" varStatus="s">
								<li><span>${s.count}</span> <a href=""><img src="" width="60"
										height="60" alt="" /></a> <a
									title="苹果（Apple）iPhone 6 (A1586) 64GB" class="p_name" href="">
									${goods.name}
									</a><b>￥${goods.salePrice}</b></li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<!--销售排行-->

			</div>

			<div class="main f_r">
				<!--商品列表展示-->
				<div class="display_title">
					<span class="l"></span> <span class="r"></span> <span class="f_l">排序：</span>
					<ul>
						<li class=""><span class="l"></span><span class="r"></span> <a
							href="">销量<span class="">&nbsp;</span></a></li>
						<li class=""><span class="l"></span><span class="r"></span> <a
							href="">评分<span class="">&nbsp;</span></a></li>
						<li class=""><span class="l"></span><span class="r"></span> <a
							href="">价格<span class="">&nbsp;</span></a></li>
						<li class="current"><span class="l"></span><span class="r"></span>
							<a href="">最新上架<span class="">&nbsp;</span></a></li>
					</ul>
				</div>

				<ul class="display_list clearfix m_10">
					<c:forEach items="${page.list}" var="goods">
						<li class="clearfix win">
							<div class="pic">
								<a title="${goods.name}" href="goods_view?goods.id=${goods.id}"><img
									src="<c:url value='/goodsImg${goods.image}' />" width="200"
									height="200" alt="${goods.name}" title="${goods.name}" /></a>
							</div>
							<h3 class="title">
								<a title="${goods.name}" class="p_name"
									href="goods_view?goods.id=${goods.id}">${goods.name}</a><span>总销量：${goods.total}<a
									class="blue" href="">( ${goods.commentNums }人评论 )</a></span><span
									class='grade'><i style='width:0px'></i></span>
							</h3>
							<div class="handle">
								<label class="btn_gray_m"><img
									src="images/front/ucenter/shopping.gif" width="15" height="15" /><input
									type="button" value="加入购物车" onclick="joinCart_list(1);"></label>
								<div class="msgbox" style="width:350px;display:none">
									<div class="msg_t">
										<a class="close f_r"
											onclick="$(this).parents('.msgbox').hide();">关闭</a>请选择规格
									</div>
									<div class="msg_c" id='product_box_1'></div>
								</div>
							</div>
							<div class="price">
								￥${goods.salePrice}<s>￥${goods.marketPrice}</s>
							</div>
						</li>
					</c:forEach>
				</ul>
				<div class='pages_bar'>
					<a
						href="${pageContext.request.contextPath }/agoods/${pageaction}?id=${id }&pageNum=${page.firstPage}&name=${webName }">首页</a>
					<c:choose>
						<c:when test="${page.hasPreviousPage == false}">
							<span style="color:gray;">上一页</span>
						</c:when>
						<c:otherwise>
							<a
								href="${pageContext.request.contextPath }/agoods/${pageaction}?id=${id}&pageNum=${page.prePage }&name=${webName }">上一页</a>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${page.hasNextPage == false}">
							<span style="color:gray;">下一页</span>
						</c:when>
						<c:otherwise>
							<a
								href="${pageContext.request.contextPath }/agoods/${pageaction}?id=${id}&pageNum=${page.nextPage }&name=${webName }">下一页</a>
						</c:otherwise>
					</c:choose>
					<a
						href="${pageContext.request.contextPath }/agoods/${pageaction}?id=${id }&pageNum=${page.lastPage }&name=${webName }">尾页</a>
					<span>当前第${page.pageNum}页/共${page.pages}页</span>
				</div>
				<!--商品列表展示-->

			</div>
		</div>
		<jsp:include page="../help.jsp"></jsp:include>
		<jsp:include page="../footer.jsp"></jsp:include>
	</div>
</body>
</html>
