<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix = "spring"%>
<%String contextPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>권한이 필요합니다.</title>
</head>
<body>
<h1>권한이 필요합니다.</h1>
<script>
	$(function(){
		var path = $(location).attr('pathname');
		if(path == '/whome/loginProcess'){
			location.href='<c:url value="/"/>';
		}
	});
</script>
</body>
</html>