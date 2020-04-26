<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix = "spring" %>
<%@ page session="true" %>

<html>
<head>
	<title>Login</title>
	<style>
		.form-signin{position:absolute;right:50%;bottom:50%;transform:translate(50%,50%);width:330px; margin: 0 auto; box-sizing: border-box; padding:50px;border-radius:30px;box-shadow: 5px 5px 5px 5px gray;}
		.form-signin div{padding:7px;}
		.container{height:100%;}
		.user_join{display:block;margin-top:15px; border-top:1px solid #6c757d; height:60px;font-size:0.75em;line-height:30px;}
		.user_join a{text-align:center; color:#6c757d;}
		.login_invalid{font-size:0.7em;color:red;}
		.div-inline-block{display:inline-block};
		.modal-body > p{font-size:0.75em;color:#6c757d;}
		#id_find_modal caption{caption-side: top;font-size:0.8em;color:black;border-bottom:1px solid black;}
		#id_find_modal th{background-color:#f4f4f7; font-size:0.8em; color:#6c757d;vertical-align:middle;border-bottom:1px solid #dee2e6}
		#id_find_modal td{border-bottom:1px solid #dee2e6}
		#id_find_modal p{font-size:0.8em;color:red;}
	</style>
</head>
<body> 
	<div class="container">
		<form class ="form-signin" id = "login_form" action="<c:url value='/loginProcess'/>" method = "POST">
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
				<input type="button" class="btn btn-secondary btn-block submit" value ="Login">
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
					<a href="javascript:;" id="find_id"><spring:message code = "join.info.J104"/> / <spring:message code = "join.info.J113"/></a>
				 </div>
			     <div class="div-inline-block float-right">
			     	<a href="<c:url value='/user/join'/>"><spring:message code="login.info.L102"/></a><!-- 회원가입 -->
			     </div> 
			</div>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" id = "csrf_token"/>
		</form>
		<div class="modal fade" id="id_find_modal" style="z-index:9999">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
		      		<!-- Modal Header -->
					<div class="modal-header" style="background-color:#2e314f">
						<h6 class="modal-title" style="color:white"><spring:message code = "join.info.J104"/> / <spring:message code = "join.info.J113"/></h6>
					</div>
					<!-- Modal body -->
					<div class="modal-body " style="text-align:center">
						<table class = "table">
							<caption>*아이디 찾기</caption>
							<colgroup>
								<col style="width:50px">
								<col style="width:200px">
							</colgroup>
							<tbody>
								<tr>
									<th>이름</th>
									<td>
										<div class="col-md-10">
											<input type="text" class="form-control form-control-sm" id = "find_id_user_name">										
										</div>
									</td>
								</tr>
								<tr>
									<th>이메일</th>
									<td>
										<div class="col-md-10">
											<input type="text" class="form-control form-control-sm" id = "find_id_user_email">										
										</div>
									</td>
								</tr>
							</tbody>
						</table>
						<p></p>
						<button type="button" class="btn btn-secondary" id="find_id_btn">아이디 찾기</button>
						<table class = "table">
							<caption>*비밀번호 찾기</caption>
							<colgroup>
								<col style="width:50px">
								<col style="width:200px">
							</colgroup>
							<tbody>
								<tr>
									<th>이름</th>
									<td>
										<div class="col-md-10">
											<input type="text" class="form-control form-control-sm" id = "find_pw_user_name">										
										</div>
									</td>
								</tr>
								<tr>
									<th>아이디</th>
									<td>
										<div class="col-md-10">
											<input type="text" class="form-control form-control-sm" id = "find_pw_user_id">										
										</div>
									</td>
								</tr>
							</tbody>
						</table>
						<p></p>
						<button type="button" class="btn btn-secondary" id="find_pw_btn">비밀번호 찾기</button>
					</div>
					<!-- Modal footer -->
<!-- 			        <div class="modal-footer"> -->

<!-- 			        </div> -->
	   		    </div>
		    </div>
		</div>
		<div style="height:900px;"></div>
	</div>
	<script>
		$(document).ready(function(){
			
			alreayLogin();
			
			$('.submit').on('click', function(){
				loginProcess();
			});
			
			//팝업창 열기
			$('#find_id').on('click', function(){
				$('#id_find_modal').modal('show');
			});
			
			//아이디 찾기
			$('#find_id_btn').on('click', function(){

				var find_id_user_name = $('#find_id_user_name').val();
				var find_id_user_email = $('#find_id_user_email').val();
				var csrf_token = $('#csrf_token').val();
				
				if(find_id_user_name == ''){
					alert('이름을 입력해주세요.');
					$('#find_id_user_name').focus();
					return false;
				}else if(find_id_user_email == ''){
					alert('이메일 주소를 입력해주세요.');
					$('#find_id_user_email').focus();
					return false;
				}
				
				$.ajax({  
					url : '<c:url value="/user/findUserID"/>', 
					type : 'post',
					data : {'user_email' : find_id_user_email , 'user_name' : find_id_user_name, '_csrf' : csrf_token},
					success : function(result){
						$('#find_id_btn').prev().text('');
						if(result.resCode == 'E001'){
							$('#find_id_btn').prev().text('아이디 : '+result.userID);
						}else{
							$('#find_id_btn').prev().text(result.resMessage);
						}
					},
					error : function(xhr, status, error){
						alert(error);
					}
				});
			});
		});
		
		//비밀번호 찾기
		$('#find_pw_btn').on('click',function(){
			
			var find_pw_user_name = $('#find_pw_user_name').val();
			var find_pw_user_id = $('#find_pw_user_id').val();
			var csrf_token = $('#csrf_token').val();
			
			if(find_pw_user_name == ''){
				alert('이름을 입력해주세요.');
				$('#find_pw_user_name').focus();
				return false;
			}else if(find_pw_user_id == ''){
				alert('아이디를 입력해주세요.');
				$('#find_pw_user_id').focus();
				return false;
			}
			 
			if(confirm('<spring:message code="join.info.J309"/>')){
				$.ajax({
					url : '<c:url value="/user/findUserPw"/>',
					type : 'POST',
					data : {'user_id' : find_pw_user_id , 'user_name' : find_pw_user_name, '_csrf' : csrf_token },
					success : function(result){
						if(result.resCode == 'E001'){
							$('#find_pw_btn').prev().text('');
							$('#find_pw_btn').prev().text(result.resMessage+" "+result.user_pw);
						}else{
							$('#find_pw_btn').prev().text(result.resMessage);
						}
					},
					error : function(xhr , status , error){
						alert(xhr);
					}
				});	
			}
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
				location.href = '<c:url value="/"/>';
			}
		}
	</script>
</body>
</html>

