<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"></meta>
<base href="${base}/" />
<title>购物车_${site}</title>
<jsp:include page="../base.jsp" />
<script type="text/javascript" src="<c:url value='/js/jquery-3.2.1.min.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/jquery-3.2.1.js' />"></script>
<script type="text/javascript">
	$(function() {
		var goodses = get();
		var params = "{\"goodsId\":\"";
		for (var i = 0; i < goodses.length; i++) {
			params += goodses[i].goodsId + ",";
		}
		params = params.substring(0, params.length - 1);
		params += "\"}";
		$.getJSON("goods_getGoodsByIds", JSON.parse(params), function(r) {
			var j = JSON.parse(r);
			var totalMoney = 0;
			for (var i = 0; i < j.length; i++) {
				addJsons(j[i], {
					"goodsNum" : getGoodsNumById(goodses,j[i].id)
				});
				var index=i;
				addJsons(j[i], {
					"index" : index++
				});
				//alert(JSON.stringify(j[i]));
				var html = template('goods', j[i]);
				$("#goodsList").prepend(html);
				totalMoney += j[i].price2 * j[i].goodsNum;
			}
			$("#sum_price").html("￥" + totalMoney);
		});
	});
	function finish() {
		$("#form1").submit();
	}
	 function add(dk,idd){
	 var id = dk;
	 var aa = "#buyNums"+id
	 var bb = "#gh"+id;
	 var cc = "#subtotal"+id;
	 var dd = "#gprice"+id;
	 var tt = $("#subtotal"+dk);
	           var total = $("#sum_price");
			  $(aa).val(Number($(aa).val())+1);
			   var a = Number($(aa).val());
			   $(bb).html(a);
			  var b = Number($(dd).val());
			  var c = a*b;
			  $(cc).html(c);
			  var d = Number($("#tt").val());
			  $("#tt").val(d+b);
			  var attr = $("input[name='checkOne']");
			 var aatrval ="";
			  for (var i = 0;i<attr.length;i++) {
					if(attr[i].checked) {
					aatrval+=Number(attr[i].value)+";";
					}
				}
				var va = aatrval.split(";");
				var real =0;
				for(var j=0;j<va.length;j++) {
				if (j==dk) {
				$("#checkOne"+j).val(Number($("#checkOne"+j).val())+Number($(dd).val()));
				}
				real+=Number(va[j])
				}
			 $("#sum_price").html(real+Number($(dd).val()));
			 
			   $.post("<c:url value='/orders/updateNums.action' />","nums="+$(aa).val()+"&id="+idd);
		 };
		 	function reduce(dk,idd){
		       var id = dk;
	           var aa = "#buyNums"+id;
	           var bb = "#gh"+id;
	           var cc = "#subtotal"+id;
	           var dd = "#gprice"+id;
	           var tt = $("#subtotal"+dk);
	           var total = $("#sum_price");
			  $(aa).val(Number($(aa).val())-1);
			  var a = Number($(aa).val());
			  $(bb).html(a);
			  var b = Number($(dd).val());
			  var c = a*b;
			  $(cc).html(c);
			  var d = Number($("#tt").val());
			  $("#tt").val(d-b); 
			  var attr = $("input[name='checkOne']");
			  var aatrval ="";
			  for (var i = 0;i<attr.length;i++) {
					if(attr[i].checked) {
					aatrval+=Number(attr[i].value)+";";
					}
				}
				var va = aatrval.split(";");
				var real =0;
				for(var j=0;j<va.length;j++) {
				if (j==dk) {
				$("#checkOne"+j).val(Number($("#checkOne"+j).val())-Number($(dd).val()));
				}
				real+=Number(va[j])
				}
			 $("#sum_price").html(real-Number($(dd).val()));
			  $.post("<c:url value='/orders/updateNums.action' />","nums="+$(aa).val()+"&id="+idd);
			  if($(aa).val()==0){
				location.href ="<c:url value='/orders/cart.action' />";
			  }	};
			  function one (s,id) {
			  var cc = $("input[name='checkOne']").length;
			  var total = $("#sum_price");
			  var tt = $("#subtotal"+s);
			  if ($("#checkOne"+s).is(":checked")) {
			  var xx = $("#xxdmh").val().split(";");
			  for (var j=0;j<xx.length;j++) {
			  if (xx.indexOf(id)>=0) {
			  }else {
			  $("#xxdmh").val($("#xxdmh").val()+id+";");
			  break;
			  }
			  }
			  if ($("#checkAll").is(":checked")) {
			  	  var cc = $("input[name='checkAll']");
			        for (var i = 0;i<cc.length;i++) {
					cc[i].checked = false;
				}
			  }
			  else {
			  if ($("input[name='checkOne']:checked").length==cc) {
			  	  var cc = $("input[name='checkAll']");
			        for (var i = 0;i<cc.length;i++) {
					cc[i].checked = true;
				}
			  }
			  }
			  total.html(Number(tt.html())+Number(total.html()));
			  }else {
			  var xx = $("#xxdmh").val().split(";");
			  for (var j=0;j<xx.length;j++) {
			  if (xx.indexOf(id)>=0) {
			  $("#xxdmh").val($("#xxdmh").val().replace(id+";",""));
			  break;
			  }else {
			  }
			  }
			  if ($("#checkAll").is(":checked")) {
			  var cc = $("input[name='checkAll']");
			        for (var i = 0;i<cc.length;i++) {
					cc[i].checked = false;
				}
			  }
			  else {
			  if ($("input[name='checkOne']:checked").length==cc) {
			  var cc = $("input[name='checkAll']");
			        for (var i = 0;i<cc.length;i++) {
					cc[i].checked = false;
			  }
			  }
			  }
			  total.html(Number(total.html())-Number(tt.html()));
			  }
			  }
	$(document).ready(function(){
     $("#checkAll").on("click",function(){
     var cc = $("input[name='checkOne']");
     if (this.checked) {
     alert($("#jihui").val())
     var nn = 0;
      for (var i = 0;i<cc.length;i++) {
					cc[i].checked = true;
					nn+=Number(cc[i].value);
				}
				$("#sum_price").html(nn);
     }else {
      for (var i = 0;i<cc.length;i++) {
					cc[i].checked = false;
				}
				$("#sum_price").html("0");
     }
	});
	
	});
</script>
<script type="text/plain" id="goods">
	<tr>
						<td><input type="hidden" name="orderDetails[{{index}}].goods.id" value="{{id}}"/>
						<img src="{{thumbnail}}" width="66px"
							height="66px" alt="{{name}}"
							title="{{name}}" /></td>
						<td class="t_l"><a href="" class="blue">{{name}}</a></td>
						<td>￥<b>{{price2}}</b></td>
						<td>
							<div class="num">
								<a class="reduce" href="javascript:void(0)" onclick=''>-</a> <input
									name="orderDetails[{{index}}].nums" class="tiny" value="{{goodsNum}}" onblur='' type="text" id="goods_count_3">
								<a class="add" href="javascript:void(0)" onclick=''>+</a>
							</div>
						</td>
						<td>￥<b class="red2" id="goods_sum_3">{{goodsNum*price2}}</b></td>
						<td><a href="">删除</a></td>
					</tr>
</script>
</head>
<body class="second">
	<div class="brand_list container_2">
		<jsp:include page="../header.jsp"></jsp:include>
		<div class="wrapper clearfix">
			<div class="position mt_10">
				<span>您当前的位置：</span> <a href="<c:url value='/user/index.action' />"> 首页</a> » 购物车
			</div>
			<div class="myshopping m_10">
				<ul class="order_step">
					<li class="current"><span class="first">1、查看购物车</span></li>
					<li><span>2、填写核对订单信息</span></li>
					<li class="last"><span>3、成功提交订单</span></li>
				</ul>
			</div>
			<form action="<c:url value='/orders/seeOrders.action' />" id="form1">
				<table width="100%" class="cart_table m_10">
					<col width="115px" />
					<col width="400px" />
					<col width="80px" />
					<col width="80px" />
					<col width="80px" />
					<caption>查看购物车</caption>
					<thead>
						<tr>
							<th>图片</th>
							<th>商品名称</th>
							<th>单价</th>
							<th>数量</th>
							<th>小计</th>
							<th class="last">操作</th>
							<th><input type="checkbox" name="checkAll" id="checkAll"></th>
						</tr>
					</thead>
					<tbody id="goodsList">
					<c:forEach items="${cartList}" var="carts" varStatus="s">
					<tr>
					<td><img src="<c:url value='/goodsImg${carts.gimage}' />"
						width="66px" height="66px" alt="${carts.gname}"
						title="${carts.gname}" /></td>
					<td>${carts.gname }</td>
					<td><b id="gp${s.count }">${carts.gprice}</b></td>
					<td id="gh${s.count }">${carts.nums }</td>
					<td id="subtotal${s.count }">${carts.subtotal }</td>
					<input type="hidden" value="${carts.gprice}" id="gprice${s.count }">
					<td>
					<div ><input class="gray_t f_l" name="nums" type="text" id="buyNums${s.count}" value="${carts.nums }"
								maxlength="5" />
							<div class="resize" >
								<a class="add" id="add" onclick="add(${s.count},'${carts.id}')" ></a> 
								<a class="reduce"  id="reduce" onclick="reduce(${s.count},'${carts.id}')" ></a>
							</div></div>
							</td>
							<td><input type="checkbox" name="checkOne" value="${carts.subtotal }" id="checkOne${s.count}" onclick="one(${s.count},'${carts.id }')" ></td>
					</tr>
					<c:set var="miu" value="${miu}+${carts.id}"></c:set>
					</c:forEach>
						<tr class="stats">
							<td colspan="8">金额总计（不含运费）：￥<b class="orange" id='sum_price'></b></td>
						</tr>
					</tbody>
					<input type="hidden" value="${total}" id="tt">
					<input type="hidden" value="${miu}" id="jihui">
					<input type="hidden" name="xxdmh" value="" id="xxdmh">
					<tfoot>
						<tr>
							<td colspan="2" class="t_l"></td>
							<td colspan="6" class="t_r"><a class="btn_continue" href="<c:url value='/user/index.action' />">继续购物</a>
								<a class="btn_pay" href="javascript:finish();">去结算</a></td>
						</tr>
					</tfoot>
				</table>
			</form>
			<div class="box">
				<div class="title">热门商品推荐</div>
			</div>
			<ul id="scrollpic" class="prolist">
				<c:forEach items="${hot}" var="hot">
				<form action="<c:url value='/orders/addHot.action?id=${hot.id}' />" method="post">
					<li><a href=""> <img width="98px" height="106px"
							src="<c:url value='/goodsImg${hot.image}' />" alt="${hot.name}"
							title="${hot.name }">
					</a>
						<p class="pro_title">
							<a href="<c:url value='goodsView.action/${hot.id}' />">${hot.name}</a>
						</p>
						<p class="brown">
							<b>￥${hot.salePrice}</b>
						</p> <label class="btn_orange2"><input type="submit"
							 value="加入购物车"></label></li>
							 </form>
				</c:forEach>
			</ul>
		</div>
		<jsp:include page="../footer.jsp" />
	</div>
</body>
</html>
