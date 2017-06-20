<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"></meta>
<base href="${base}/" />
<title>个人中心_${site}</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0"> 
<link rel="stylesheet" type="text/css" href="<c:url value='/css/index.css' />" />
<script type="text/javascript" src="<c:url value='/js/jquery-3.2.1.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/jquery-3.2.1.min.js' />"></script>
<script type="text/javascript">
	//用于用户中心左边菜单栏的选择项的样式
	function setSelectedClass(url){
		 $('div.cont ul.list li a[href~="'+url+'"]').parent().addClass("current");
	}
</script>
</head>
<body class="index">
	<div class="ucenter container">
		<jsp:include page="../header.jsp" />
		<jsp:include page="../navbar.jsp" />
		<jsp:include page="../search.jsp" />
		<div class="position">
			您当前的位置： <a href="<c:url value='/userback/indexcenter.action' />">首页</a> » <a href="<c:url value='/userback/indexcenter.action' />">我的账户</a>
		</div>
		<div class="wrapper clearfix">
			<jsp:include page="left.jsp" />
			<div class="main f_r">

				<div class="userinfo_bar">
					<b class="f14">您好，${sessionScope.user.name} 欢迎回来!</b>
				</div>
				<div class="box clearfix">
					<h3>用户信息</h3>
					<dl class="userinfo_box">
						<dt>
							<a class="ico"><img id="user_ico_img" src="<c:url value='/userImg${sessionScope.user.avatar}' />" width="100"
								height="100" alt="" /></a> <a
								class="blue" href="<c:url value='/userback/edit.action' />">修改用户信息</a>
						</dt>
						<dd>
							<table width="100%" cellpadding="0" cellspacing="0">
								<col width="350px" />
								<tr>
									<td>你的订单交易总数量：<b class="red2">${user.orderNums} 笔</b>&nbsp;&nbsp;&nbsp;<a
										class="blue" href="<c:url value='/order/findAll.action' />">进入订单列表</a></td>
								</tr>
								<tr>
									<td>总消费额：<b class="red2">￥${user.total}</b></td>
									
								</tr>
								<tr>
									<td>预存款余额：<b class="red2">￥${user.balance}</b></td>
								</tr>
							</table>

							<div class="stat">
							<c:choose>
							<c:when test="${user.evaluateNums==null or user.evaluateNums=='0'}">
							<span>待评价商品</span>
							</c:when>
							<c:otherwise>
								<span>待评价商品：<label>(<b class="red2">${user.evaluateNums}</b>)</label></span>							
							</c:otherwise>
							</c:choose>
							<c:choose>
							<c:when test="${user.payNums==null or user.payNums=='0' }">
							<span>待付款订：</span>
							</c:when>
							<c:otherwise>
							<span>待付款订单：<label>(<b class="red2"><a href="">${user.payNums}</a></b>)
								</label></span>
							</c:otherwise>
							</c:choose>
							<c:choose>
							<c:when test="${user.receiptNums==null or user.receiptNums=='0'}">
							<span>待确认收货</span>
							</c:when>
							<c:otherwise>
							<span>待确认收货：<label>(<b class="red2"><a href="">${user.receiptNums}</a></b>)</label></span>							
							</c:otherwise>
							</c:choose>

							</div>
						</dd>
					</dl>
				</div>
				<h3 class="bg">我的订单</h3>
				<div class="box m_10">
					<table class="list_table" width="100%" cellpadding="0"
						cellspacing="0">
						<col width="140px" />
						<tr>
							<th>订单编号</th>
							<th>下单日期</th>
							<th>收货人</th>
							<th>支付方式</th>
							<th>总金额</th>
							<th>订单状态</th>
						</tr>
						<c:forEach items="${orders}" var="orders">
						<tr>
							<td><a href="<c:url value='/user/order_view.action'/>">${orders.id}</a></td>
							<td><fmt:formatDate value="${orders.time}" pattern="yyyy-MM-dd"/> <fmt:formatDate value="${orders.time}" pattern="hh-mm-ss"/></td>
							<td>${orders.uname}</td>
							<td>${orders.payWay}</td>
							<td>${orders.totalMoney}</td>
							<c:choose>
							<c:when test="${orders.state=='1'}">
							<td><b class="orange">订单取消</b></td>
							</c:when>
							<c:otherwise>
							<c:if test="${orders.state=='2'}">
							<td><b class="orange">等待发货</b></td>
							</c:if>
							<c:if test="${order.state=='3'}">
							<td><b class="green">已完成</b></td>
							</c:if>
							</c:otherwise>
							</c:choose>
						</tr>
						</c:forEach>

						<tfoot>
							<tr>
								<td colspan="6" class="t_r"><a class="blue" href="<c:url value='/orders/findAll.action' />">更多订单&gt;&gt;</a></td>
							</tr>
						</tfoot>
					</table>
				</div>
				
			</div>
		</div>
		<jsp:include page="../help.jsp" />
		<jsp:include page="../footer.jsp" />
	</div>
</body>
</html>
