<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix = "spring" %>
<%@ page session="false" %>
<%String contextPath = request.getContextPath(); %>

<html>
<head>
	<title>Home</title>
	<link href="<%=contextPath%>/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	
</head>
<body>
<header>
<%@ include file="header.jsp" %>
</header>

<h1>
	hi
</h1>
<pre>
a





























</pre>



<footer>
<%@ include file="footer.jsp" %>
</footer>

<script src="<%=contextPath%>/resources/jquery/js/jquery-3.4.1.min.js"></script>
<script src="<%=contextPath%>/resources/bootstrap/js/bootstrap.bundle.min.js"></script>
<script>
		$(document).ready(function(){
			$("#submit").on('click',function(){
				$.ajax({
					url : "<%=contextPath%>/login",
					type : "post",
					data : $(".form-signin").serialize(), 
					success : function(resCode){
						if(resCode == "C001"){
							alert(resCode);
							location.href="<%=contextPath%>/main";
						}
					},
					error : function(a , c){
						alert(a+"    "+c);
					}
				});
			});
		});
</script>

</body>
</html>

