<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src="<c:url value='/js/jquery-3.2.1.min.js' />"></script>
<script>
$(function(){
	$('.mycart').hover(
			function(){
				$('#div_mycart').show('slow',function(){
				$.post("<c:url value='/user/cartShow.action' />",function(res){
				var content = eval("("+res+")");
				var length =content.length;
				var total =0;
				var dl = $("#dl1");
				dl.html("")
				$.each(content,function(i,val){
				total=total+val.gprice;
				var id = "\""+val.id+"\"";
				dl.append("<dd><div class='pic f_l'><img width='55' height='55' src='<c:url value='/goodsImg/"+val.gimage+"' />'></div>"+
				"<h3 class='title f_l'><a href='<c:url value='/agoods/goodsView.action/"+val.gid+"' />'>"+val.gname+"</a></h3><div class='price f_r t_r'><b class='block'>￥"+val.gprice+"</b>"
				+"<input class='del' type='button' value='删除' onclick='del("+id+")'/>  /></div></dd>");
				});
				dl.append("<dd class='static'><span>共<b name='mycart_count'>"+length+"</b>件商品</span>金额总计：<b name='mycart_sum'>￥"+total+"</b></dd>"+
				"<dd class='static'><label class='btn_orange'><input type='button' value='去购物车结算' onclick='go()' /></label></dd>");
				});
				});
			},
			
			function(){
				$('#div_mycart').hide('slow');
				
			}
		);
		
});

        function go () {
		window.location.href="<c:url value='/orders/cart.action' />";
		}
		function del(id) {
		alert("asdas")
		$.post("<c:url value='/orders/deleteCart.action?id="+id+"' />");
				$('#div_mycart').hide('slow');
		}
		

</script>
<div class="navbar">
	<ul>
		<li><a href="<c:url value='/user/index.action' />">首页</a></li>
	</ul>
	<div class="mycart">
		<dl>
			<dt>
				<a href="<c:url value='/orders/cart.action' />">购物车<b name="mycart_count" id="mycart_count">0</b>件
				</a>
			</dt>
			<dd>
				<a href="<c:url value='/orders/cart.action' />">去结算</a>
			</dd>
		</dl>

		<!--购物车浮动div 开始-->
		<div class="shopping" id='div_mycart' style='display:none;'>
		<dl class="cartlist" id="dl1">	
			</dl>
			
				
			</div>
		<!--购物车浮动div 结束-->
		<script type='text/html' id='cartTemplete'>
		
			</script>
		<!--购物车模板 结束-->

	</div>
</div>