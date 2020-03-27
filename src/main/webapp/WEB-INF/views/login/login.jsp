<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix = "spring" %>
<%@ page session="false" %>
<%String contextPath = request.getContextPath(); %>

<html>
<head>
	<title>Home</title>
	<link href = "<%=contextPath%>/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<style>
		.form-signin{position:absolute;right:50%;bottom:50%;transform:translate(50%,50%);width:330px; margin: 0 auto 50; box-sizing: border-box; padding:50px;border-radius:30px;box-shadow: 5px 5px 5px 5px gray;}
		.form-signin div{padding:7px;}
		.container{height:100%;}
		.user_join{display:block;text-align:center; margin-top:25px; border-top:1px solid #6c757d; height:60px;font-size:0.9em;line-height:50px;}
		.user_join a{text-align:center; color:#6c757d;}
	</style>
</head>
<body>

	<div class="container">
		<form class ="form-signin">
			<h3>Login.</h3>
			<div class="row">
				<label for="user_id" class="sr-only">유저아이디</label>
				<input type="text" class="form-control" id="user_id" name="user_id"  placeholder ="ID">
			</div>
			<div class="row">
				<label for="user_password" class="sr-only">비밀번호</label>
				<input type="password" class="form-control" id="user_password" name="user_password" placeholder="PASSWORD">
			</div>
			<div class="row">
				<input type="button" class="btn btn-outline-secondary btn-block" value ="Login" id = "submit">
			</div>
			<div class="row user_join">
				 <a href="">회원가입</a>
			</div>
		</form>
	</div>
	
	<script src = "<%=contextPath%>/resources/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src = "<%=contextPath%>/resources/jquery/js/jquery-3.4.1.min.js"></script>
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