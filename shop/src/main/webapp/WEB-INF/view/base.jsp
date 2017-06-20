<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/index.css' />" />
<script type="text/javascript" src="<c:url value='/js/jquery-3.2.1.min.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/jquery-3.2.1.js' />"></script>
<script type="text/javascript">
	//用于用户中心左边菜单栏的选择项的样式
	function setSelectedClass(url){
		 $('div.cont ul.list li a[href~="'+url+'"]').parent().addClass("current");
	}
</script>