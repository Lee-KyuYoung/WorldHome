<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix = "spring" %>
<%@ page session="true" %>
<%String contextPath = request.getContextPath(); %>

<html>
<head>
	<title>Login</title>
	<link href = "<%=contextPath%>/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<style>
		.form-signin{position:absolute;right:50%;bottom:50%;transform:translate(50%,50%);width:330px; margin: 0 auto; box-sizing: border-box; padding:50px;border-radius:30px;box-shadow: 5px 5px 5px 5px gray;}
		.form-signin div{padding:7px;}
		.container{height:100%;}
		.user_join{display:block;text-align:center; margin-top:25px; border-top:1px solid #6c757d; height:60px;font-size:0.9em;line-height:50px;}
		.user_join a{text-align:center; color:#6c757d;}
		.login_invalid{font-size:0.7em;color:red;}
	</style>
</head>
<body>
	<div class="container">
		<form class ="form-signin" id = "login_form" action="./loginProcess" method = "POST">
			<h3>Login.</h3>
			<div class="row">
				<label for="user_id" class="sr-only"><spring:message code="login.info.L103"/></label><!-- 유저 아이디 -->
				<input type="text" class="form-control" id="user_id" name="user_id"  placeholder ="ID" value="${loginId}">
			</div>
			<div class="row">
				<label for="user_password" class="sr-only"><spring:message code="login.info.L104"/></label><!-- 비밀번호 -->
				<input type="password" class="form-control" id="user_password" name="user_password" placeholder="PASSWORD" onkeydown="if(event.keyCode==13) loginProcess();">
			</div>
			<div class="row">
				<input type="button" class="btn btn-outline-secondary btn-block submit" value ="Login">
			</div>
			<div class="row">
				<font class = "login_invalid">
					<c:if test = "${!empty ERRORMSG}">
						${ERRORMSG}
					</c:if>	
				</font>
			</div>
			<div class="row user_join">
				 <a href="<%=contextPath%>/join"><spring:message code="login.info.L102"/></a><!-- 회원가입 -->
			</div>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		</form>
	</div>
	<script src = "<%=contextPath%>/resources/jquery/js/jquery-3.4.1.min.js"></script>
	<script src = "<%=contextPath%>/resources/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script>
		$(document).ready(function(){
			
			alreayLogin();
			
			$('.submit').on('click',function(){
				loginProcess();
			});
		});

		//로그인		
		function loginProcess(){
			var user_id = $('#user_id').val();
			var user_password = $('#user_password').val();
			
			if(user_id == ''){
				$('.login_invalid').text('아이디를 입력해주세요.');
				$('#user_id').focus();
				return false;
			}else if(user_password == ''){
				$('.login_invalid').text('비밀번호를 입력해주세요.').focus();
				$('#user_password').focus();
				return false;
			}
			$(".form-signin").submit();
		}

		//임시방편으로한거 나중에 시큐러티에서 찾아보기
		function alreayLogin(){
			var user_id = '${sessionScope.user_info.user_id}';
			if(user_id != ''){
				location.href = '<%=contextPath%>/';
			}
		}
	</script>
</body>
</html>
