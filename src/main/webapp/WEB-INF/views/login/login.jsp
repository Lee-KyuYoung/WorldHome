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
		.user_join{display:block;margin-top:15px; border-top:1px solid #6c757d; height:60px;font-size:0.75em;line-height:30px;}
		.user_join a{text-align:center; color:#6c757d;}
		.login_invalid{font-size:0.7em;color:red;}
		.div-inline-block{display:inline-block};
		.modal-body > p{font-size:0.75em;color:#6c757d;}
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
				 <div class="div-inline-block">
					<a href="javascript:;" id="find_id"><spring:message code = "join.info.J104"/></a><!-- 아이디 -->
					<a href="javascript:;" id="find_pw"><spring:message code = "join.info.J113"/></a><!-- 비밀번호 찾기 -->
				 </div>
			     <div class="div-inline-block float-right">
			     	<a href="<%=contextPath%>/user/join"><spring:message code="login.info.L102"/></a><!-- 회원가입 -->
			     </div>
			</div>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" id = "csrf_token"/>
		</form>
		<!-- The Modal -->
		<div class="modal fade" id="id_find_modal">
			<div class="modal-dialog">
				<div class="modal-content">
		      		<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title"></h4>
					</div>
					<!-- Modal body -->
					<div class="modal-body">
<!-- 						<p>등록하신 이메일을 입력해 주세요.</p> -->
						<input type = "text" class = "form-control form-control-sm" id="user_email" placeholder="이메일주소를 입력해주세요.">
					</div>
					<!-- Modal footer -->
			        <div class="modal-footer">
			          <button type="button" class="btn btn-outline-secondary btn-block" id="find_id_btn">아이디 찾기</button>
<!-- 			          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button> -->
			        </div>
	   		    </div>
		    </div>
		</div>
	</div>
	<script src = "<%=contextPath%>/resources/jquery/js/jquery-3.4.1.min.js"></script>
	<script src = "<%=contextPath%>/resources/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script>
		$(document).ready(function(){
			
			alreayLogin();
			
			$('.submit').on('click', function(){
				loginProcess();
			});
			
			$('#find_id').on('click', function(){
				$('#id_find_modal').modal('show');
			});
			
			$('#find_id_btn').on('click', function(){
				
				var user_email = $('#user_email').val();
				var csrf_token = $('#csrf_token').val();
				
				if(user_email == ''){
					alert('이메일 주소를 입력해주세요.');
					$('#user_email').focus();
					return false;
				}
				
				$.ajax({
					url : './user/findUserID',
					type : 'post',
					data : {'user_email' : user_email , '_csrf' : csrf_token},
					success : function(result){
						$('#user_email').next().remove();
						if(result.resCode == 'E001'){
							$('#user_email').after('<p style ="font-size:0.8em;color:red;margin:8 0 0 0">아이디 : '+result.userID+'</p>');	
						}else{
							$('#user_email').after('<p style ="font-size:0.8em;color:red;margin:8 0 0 0">'+result.resMessage+'</p>');	
						}
					},
					error : function(xhr, status, error){
						alert(error);
					}
				});
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
