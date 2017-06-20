<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"></meta>
<base href="${base}/" />
<title>个人中心_${site}</title>
<jsp:include page="../base.jsp" />
<script type="text/javascript" src="<c:url value='/js/jquery-3.2.1.min.js' />"></script>
<script type="text/javascript">
        $(document).ready(function () {
        var p = true;
        $("#btn").click(function () {
        if (p) {
        $("#form1").submit();
        p=false;
        }
        else {
        alert("不要慌，你网速有点坑")
        }
        });
    
        });
            function change () {
            var a = $("#file").val();
            if (a=="") {
            alert("你还没有选择图片")
            }
            else {
               $.ajaxFileUpload({  
        url : "<c:url value='/userback/addImg.action?imgName=' />"+$("#imgName").val(),
        secureuri : false,  
        fileElementId : "file",  
        type : 'post',  
        dataType : 'TEXT', 
        success : function(data, status) {  
        $("#imgName").val(data);
        $("#img").attr("src","<c:url value='/userImg' />"+data);
        },  
        error : function(data, status, e)
        {  
           alert(e)  
        }  
    });  
                }
        }
</script>
</head>
<body class="index">
	<div class="ucenter container">
		<jsp:include page="../header.jsp" />
		<jsp:include page="../navbar.jsp" />
		<jsp:include page="../search.jsp" />
		<div class="wrapper clearfix">
			<jsp:include page="left.jsp" />
			<div class="main f_r">
				<div class="userinfo_bar">
					<b class="f14">您好，${sessionScope.user.name}
						欢迎回来!</b>
				</div>
				<div class="box clearfix">
					<h3>用户信息</h3>
					<dl class="userinfo_box">
						<form action="<c:url value='/userback/addEdit.action' />" method="post" enctype="multipart/form-data" id="form1">
							<input type="hidden" name="tok" value="${tok}">
							<input type="hidden" name="imgName" id="imgName" value="${user.avatar}">
							<input type="hidden" name="id" value="${user.id}">
							<img id="img" src="<c:url value='/userImg/${user.avatar }' />" /><br>
							<input type="file" name="file" id="file"  onchange="change()"><br>
							<input type="button" id="btn" value="上传"> 
						</form>
					</dl>
				</div>
			</div>
		</div>
	<jsp:include page="../help.jsp" />
	<jsp:include page="../footer.jsp" />
	</div>
</body>
<script type="text/javascript" src="<c:url value='/js/ajaxfileupload.js'/>"></script>
</html>
