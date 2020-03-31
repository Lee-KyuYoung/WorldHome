<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix = "spring"%>
<%String contextPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>권한없음</title>
</head>
<body>
<h1>권한없다</h1>
<script src="<%=contextPath%>/resources/jquery/js/jquery-3.4.1.min.js"></script>
<script>
	$(function(){
		var path = $(location).attr('pathname');
		if(path == '/whome/loginProcess'){
			location.href='<%=contextPath%>/';
		}
	});
</script>
</body>
</html>