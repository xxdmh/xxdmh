<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<script type="text/javascript" src="<c:url value='/js/jquery-3.2.1.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/jquery-3.2.1.min.js' />"></script>
<script>
	$(function() {
		$('.allsort').hover(function() {
		$.post("<c:url value='/cate/getCate.action' />",function(res){
		var content = eval("("+res+")");
		var ul1 = $("#div_allsort");
		ul1.html(""); 
		$.each(content,function(i,val){
		ul1.append("<h2><a target='_blank' href='<c:url value='/agoods/findById.action?id=' />"+val.id+"&name="+val.name+"'><li>"+val.name+"</li></a></h2>");
		});
		});
			$('#div_allsort').show();
		}, function() {
			$('#div_allsort').hide();
		});
	});
</script>
<div class="searchbar">
	<div class="allsort">
		<a href="javascript:void(0);">全部商品分类</a>

		<!--总的商品分类-开始-->
		<ul class="sortlist" id='div_allsort' style='display:none'>

		</ul>
	</div>

	<div class="searchbox">
		<form method='get' action=''>
			<input type='hidden' name='controller' value='site' /> <input
				type='hidden' name='action' value='search_list' /> <input
				class="text" type="text" name='word' autocomplete="off"
				value="输入关键字..." /> <input class="btn" type="submit" value="商品搜索"
				onclick="checkInput('word','输入关键字...');" />
		</form>

	</div>
	<div class="hotwords">热门搜索：</div>
</div>