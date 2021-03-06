<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<base href="${base}/" />
<title>核对订单信息-${site}</title>
<jsp:include page="../base.jsp" />
</head>
<script type="text/javascript"
	src="<c:url value='/js/jquery-3.2.1.min.js' />"></script>
<script type="text/javascript">
	$(document).ready(function() {
	var c = Number($("#sub").val());
	$("#final_sum").html(c);
	$("#r1").on("click",function(){
	var a =$("#fu").val("20");
	var b = Number($("#fu").val());
	var c = Number($("#sub").val());
	$("#delivery_fee_show").html(b);
	$("#final_sum").html(b+c);
	});
	$("#r2").on("click",function(){
	var a = $("#fu").val("10");
	var b = Number($("#fu").val());
	var c = Number($("#sub").val());
	$("#delivery_fee_show").html(b);
	$("#final_sum").html(b+c);
	});
	});
</script>
<body class="second">
	<div class="brand_list container_2">
		<jsp:include page="../header.jsp" />
		<div class="wrapper clearfix">
			<div class="position mt_10">
				<span>您当前的位置：</span> <a href="<c:url value='/user/index.action' />"> 首页</a> » 填写核对订单信息
			</div>
			<div class="myshopping m_10">
				<ul class="order_step">
					<li class="current_prev"><span class="first"><a
							href='javascript:window.history.go(-1);'>1、查看购物车</a></span></li>
					<li class="current"><span>2、填写核对订单信息</span></li>
					<li class="last"><span>3、成功提交订单</span></li>
				</ul>
			</div>

			<form action="<c:url value='/orders/addOrders.action' />" method='post' name='order_form'>
				<input type="hidden" value="${tok}" name="tok">
				<div class="cart_box m_10">
					<div class="title">填写核对订单信息</div>
					<div class="cont">

						<!--地址管理 开始-->
						<div class="wrap_box">
							<h3>
								<span class="orange">收货人信息</span>
							</h3>
							<!--收货表单信息 开始-->
							<div class="prompt_4 m_10" id='address_often'>
								<strong>常用收货地址</strong>
								<ul class="addr_list">
									<c:forEach items="${aList}" var="address">
										<li><label><input class="radio"
												name="order.address.id" type="radio" value="${address.id}"
												<c:if test="${address.state eq '1'}">checked</c:if> />${address.uname}&nbsp;&nbsp;&nbsp;&nbsp;
												${address.area} ${address.street} </label></li>
									</c:forEach>
								</ul>
							</div>
						</div>
						<!--地址管理 结束-->
						<div class="wrap_box" id="deliveryBox">
							<h3>
								<span class="orange">配送方式</span>
							</h3>
							<!--配送修改 开始-->
							<table width="100%" class="border_table m_10" id="delivery_form"
								style="display: table;">
								<colgroup>
									<col width="180px">
									<col>
								</colgroup>
								<tbody id="deliveryFormTrBox">
									<tr>
										<th><label><input type="radio" name="sendWay" id="r1"
												paytype="0" alt="20.00" value="Express">快递</label></th>
										<td>直接由第三方物流公司配送 运费：￥20.00 &nbsp;&nbsp;</td>
									</tr>
									<tr>
										<th><label><input type="radio" name="sendWay" id="r2"
												paytype="0" alt="10.00" value="EMS">EMS</label></th>
										<td>运费：￥10.00 &nbsp;&nbsp;</td>
									</tr>
									<input type="hidden" value="" id="fu"/>
								</tbody>
								<tfoot>
									<tr>
										<th>指定送货时间：</th>
										<td><label class="attr"><input type="radio"
												name="sendTime" checked="checked" value="AnyTime">任意</label>
											<label class="attr"><input type="radio"
												name="sendTime" value="1-5">周一到周五</label> <label
											class="attr"><input type="radio"
												name="sendTime" value="6-7">周末</label></td>
									</tr>
								</tfoot>
							</table>
							<!--配送修改 结束-->
						</div>
						<!--配送方式 结束-->

						<!--支付方式 开始-->
						<div class="wrap_box" id='paymentBox'>
							<h3>
								<span class="orange">支付方式</span>
							</h3>

							<table width="100%" class="border_table" id='payment_form'>
								<col width="200px" />
								<col />

								<tr>
									<th><label><input class="radio"
											name="payWay" alt="0" title="预存款支付" type="radio" 
											value="ADP" checked />预存款支付</label></th>
									<td>支付手续费：￥0</td>
								</tr>
								<tr>
									<th><label><input class="radio"
											name="payWay" alt="0" title="支付宝" type="radio"
											value="Alipay" />支付宝</label></th>
									<td>支付手续费：￥0</td>
								</tr>
								<tr>
									<th><label><input class="radio"
											name="payWay" alt="0" title="货到付款" type="radio"
											value="Cash on Delivery" />货到付款</label></th>
									<td>支付手续费：￥0</td>
								</tr>
							</table>
						</div>
						<!--支付方式 结束-->
						<!--购买清单 开始-->
						<div class="wrap_box">
							<h3>
								<span class="orange">购买的商品</span>
							</h3>

							<table width="100%" class="cart_table t_c">
								<col width="115px" />
								<col />
								<col width="80px" />
								<col width="80px" />
								<col width="80px" />

								<thead>
									<tr>
										<th>图片</th>
										<th>商品名称</th>
										<th>单价</th>
										<th>数量</th>
										<th class="last">小计</th>
									</tr>
								</thead>

								<tbody>
									<c:set var="totalMoney" value="0"></c:set>
									<c:choose>
										<c:when test="${not empty ods }">
											<tr>
												<td><img src="<c:url value='/goodsImg${ods.gimage}' />"
													width="66px" height="66px" alt="${ods.gname}"
													title="${ods.gname}" /></td>
												<td class="t_l"><a href="" class="blue">${ods.gname}</a></td>
												<td>￥<b>${ods.gprice}</b></td>
												<td>${ods.nums}</td>
												<td>￥<b class="red2">${ods.subtotal}</b></td>
												<c:set var="totalMoney" value="${ods.subtotal}"></c:set>
											</tr>
											<input type="hidden" value="${ods.subtotal}" id="sub">
										</c:when>
										<c:otherwise>
											<c:forEach items="${odsList}" var="orderDetail"
												varStatus="s">
												<tr>
													<td><img src="<c:url value='/goodsImg${orderDetail.gimage}' />"
														width="66px" height="66px" alt="${orderDetail.gname}"
														title="${orderDetail.gname}" /></td>
													<td class="t_l"><a href="" class="blue">${orderDetail.gname}</a></td>
													<td>￥<b>${orderDetail.gprice}</b></td>
													<td>${orderDetail.nums}</td>
													<td>￥<b class="red2">${orderDetail.subtotal}</b></td>
													<c:set var="totalMoney"
														value="${totalMoney+orderDetail.subtotal }"></c:set>
												</tr>
											</c:forEach>
											<!-- 商品展示 结束-->
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
						</div>
						<!--购买清单 结束-->

					</div>
				</div>

				<!--金额结算-->
				<div class="cart_box" id='amountBox'>
					<div class="cont_2">
						<strong>结算信息</strong>
						<div class="pink_box">
							<p class="f14 t_l">
							<input type="hidden" value="${totalMoney}" id="sub">
								商品总金额：<b>${totalMoney}</b> + 运费总计：<b id='delivery_fee_show'>0</b>
							</p>
						</div>
						<hr class="dashed" />
						<div class="pink_box gray m_10">
							<table width="100%" class="form_table t_l">
								<col width="220px" />
								<col />
								<col width="250px" />
								<tr>
									<td class="t_r"><b class="price f14">应付总额：<span
											class="red2">￥<b id='final_sum'></b></span>元
									</b></td>
								</tr>
							</table>
						</div>
						<p class="m_10 t_r">
						<input type="hidden" value="${xxdmh }" name="xxdmh">
							<input type="hidden" name="order.totalMoney"
								value="${totalMoney+sendPrice}"> <input type="submit"
								class="submit_order" />
						</p>
					</div>
				</div>

			</form>

		</div>
		<jsp:include page="../footer.jsp" />
	</div>
</body>
</html>
