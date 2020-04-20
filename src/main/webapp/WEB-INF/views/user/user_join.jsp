<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix = "spring" %>
<%@ page session="true" %>
<%String contextPath = request.getContextPath(); %>
<html>
<head>
	<title>회원가입</title>
	<link href = "<%=contextPath%>/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="<%=contextPath%>/resources/css/dev/user_info.css" rel="stylesheet">
	<style>
		.form-signin{position:absolute;right:50%;transform:translate(50%);width:750px;border:2px solid #6c757d; padding:30px; border-radius:10px; box-sizing: border-box;margin-top:30px;margin-bottom:30px;}
		.form-signin caption{caption-side: top;font-size:0.8em;border-bottom:1px solid black;}
		.form-signin th{background-color:#f4f4f7; font-size:0.9em; color:#6c757d;border-bottom:1px solid #dee2e6}
		.form-signin td{border-bottom:1px solid #dee2e6;}
		.data_role{font-size:0.75em;color:#6c757d;}
		.join_custom_group > div > input , select{width:121px !important;}
		.form-signin > input[type="text"]{font-size:0.8em !important;}
		input::placeholder{font-size:0.8em;color:#6c757d;}
		.invalid_data{color:red;margin-top:5px;margin-bottom:0px;font-size:0.75em;}
	</style>
</head>
<body>
	<div class="container">
		<form class ="form-signin" id = "join_form">
			<h3>회원가입</h3>
			<table class ="table">
				<caption><spring:message code="join.info.J102"/></caption><!-- 회원 이용정보 -->
				<colgroup>
					<col style="width:100px;">
					<col style="width:300px;">
				</colgroup>
				<tbody>
					<tr>
						<th class="align-middle"><spring:message code="join.info.J104"/></th><!-- 아이디 -->
						<td>
							<input type="text" class="form-control form-control-sm" id="user_id" name="user_id">
							<p class="invalid_data" role="user_id"></p>
						</td>
					</tr>
					<tr>
						<th class="align-middle"><spring:message code="join.info.J105"/></th><!-- 비밀번호 -->
						<td>
						    <p class="data_role"><spring:message code="join.info.J101"/></p>
							<input type="password" class="form-control form-control-sm" id="user_password" name="user_password">
							<p class="invalid_data" role="user_password"></p>
						</td>
					</tr>
					<tr>
						<th class="align-middle"><spring:message code="join.info.J106"/></th><!-- 비밀번호 확인 -->
						<td>
							<input type="password" class="form-control form-control-sm" id="user_password_check" name="user_password_check">
							<p class="invalid_data" role="user_password_check"></p>
						</td>
					</tr>
				</tbody>
			</table>
			<table class="table">
				<caption><spring:message code="join.info.J103"/></caption> <!-- 회원 개인정보 -->
				<colgroup>
					<col style="width:100px;">
					<col style="width:300px;">
				</colgroup>
				<tbody>
					<tr>
						<th class="align-middle"><spring:message code="join.info.J107"/></th> <!-- 이름 -->
						<td>
							<input type="text" class="form-control form-control-sm" id="user_name" name="user_name"  >
							<p class="invalid_data" role="user_name"></p>
						</td>
					</tr>
					<tr>
						<th class="align-middle"><spring:message code="join.info.J108"/></th><!-- 생년월일 -->
						<td>
							<div class="form-inline join_custom_group">
								<div class="form-group mb-1">
									<input type="text" class="form-control form-control-sm" id="user_birth_year" name="user_birth_year" placeholder="년(4자)" maxlength="4">
								</div>
								<div class="form-group mx-sm-2 mb-1">
									<select class="form-control form-control-sm" name="user_birth_month"  id="user_birth_month">
										<c:forEach var="num" begin="1" end="12" step="1">
											<c:choose>
												<c:when test = "${num < 10 }">
													<option value="0${num}">${num}</option>	
												</c:when>
												<c:otherwise>
													<option value="${num}">${num}</option>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</select>
								</div>
								<div class="form-group mb-1">
									<input type="text" class="form-control form-control-sm" id="user_birth_day" name="user_birth_day" placeholder="일" maxlength="2">
								</div>
							</div>
							<p class="invalid_data" role="user_birth_year"></p><p class="invalid_data" role="user_birth_day"></p>
						</td>
					</tr>
					<tr>
						<th class="align-middle"><spring:message code="join.info.J109"/></th><!-- 주소 -->
						<td>
							<div class="input-group mb-3">
								<input type="text" class="form-control form-control-sm" id="user_address_1" name="user_address_1" readonly onchange="setMentInit('user_address_1');">
								<div class="input-group-append">
									<button class="btn btn-outline-secondary btn-sm" type="button" id="address_search"><spring:message code="join.info.J112"/></button><!-- 주소검색 -->
								</div>
							</div>
							<input type="text" class="form-control form-control-sm" id="user_address_2" name="user_address_2" placeholder="<spring:message code='join.info.J211'/>"> <!-- 나머지주소를 입력해주세요. -->
							<p class="invalid_data" role="user_address_1"></p>
						</td>
					</tr>
					<tr>
						<th class="align-middle"><spring:message code="join.info.J110"/></th><!-- 이메일 -->
						<td>
							<input type="text" class="form-control form-control-sm" id="user_email" name="user_email">
							<p class="invalid_data" role="user_email"></p>
						</td>
					</tr>
					<tr>
						<th class="align-middle"><spring:message code="join.info.J111"/></th> <!-- 휴대전화 -->
						<td>
							<p class="data_role"><spring:message code="join.info.J210"/></p> <!-- "-"을 제외하고 숫자만 적어주세요. -->
							<input type="text" class="form-control form-control-sm" id="user_phone" name="user_phone" maxlength="11">
							<p class="invalid_data" role="user_phone"></p>
						</td>
					</tr>
				</tbody>
			</table>
			<div class="btn-toolbar float-right">
				<div class="btn-group mr-2">
					<input type="button" class="btn btn-outline-secondary" id = "join_btn" value="<spring:message code='common.info.I002'/>">
				</div>
				<input type="button" class="btn btn-outline-secondary" id = "cancel_btn" value="<spring:message code='common.info.I003'/>">			
			</div>
			<input type="hidden" id = "scrf_token" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		</form>
	</div>
	<script src="<%=contextPath %>/resources/jquery/dev/user_info.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script>
	
	$(document).ready(function(){
		
		//비번 유효성 검사
		$('#user_password_check, #user_password').on('blur',function(){
			var password_1 = $('#user_password').val();
			var password_2 = $('#user_password_check').val();
			var regExp = /^[A-Za-z0-9]{8,20}$/;
			
			//비밀번호 유효성 검사
			if(password_1 != ''){
				if(!regExp.test(password_1)){
					$('[role="user_password"]').text('');
					$('[role="user_password"]').text('<spring:message code="join.info.J209"/>');
				}	
			}
			//비밀번호 일치하는지 체크
			if($(this).attr('id') == 'user_password_check'){
				if(password_1 != password_2){
					$('[role="user_password_check"]').text('');
					$('[role="user_password_check"]').text('<spring:message code="join.info.J203"/>');
				}	
			}
		});
		
		//이메일 유효성 검사
		$('#user_email').on('blur', function(){
			var user_email = $('#user_email').val();
			var regExp = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z\-]+/;
			if(!regExp.test(user_email)){
				$('[role="user_email"]').text('');
				$('[role="user_email"]').text('<spring:message code="join.info.J212"/>');
			}
		});
		
		//휴대전화번호 유효성 검사
		$('#user_phone').on('blur', function(){
			var user_phone = $('#user_phone').val();
			var regExp = /(010)([1-9]{1}[0-9]{3})([0-9]{4})$/;
			if(!regExp.test(user_phone)){
				$('[role="user_phone"]').text('');
				$('[role="user_phone"]').text('<spring:message code="join.info.J213"/>');
			}	
		});
		
		
		//회원가입 데이터 유효성 체크
		$('#join_btn').on('click',function(){
			
			var invalid_data = '';
			var message_code = '';
			var password_regExp = /^[a-z0-9_]{8,20}$/; 
			var phone_regExp = /(010)([1-9]{1}[0-9]{3})([0-9]{4})$/;
			var email_regExp = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z\-]+/;
			var invalid_check = true;
			
			if($('#user_id').val() == ''){
				invalid_data = 'user_id';
				message_code = '<spring:message code="join.info.J201"/>'; 
				invalid_check = false;
				
			}else if($('#user_password').val() == ''){
				invalid_data = 'user_password';
				message_code = '<spring:message code="join.info.J202"/>'; //비밀번호를 입력해주세요
				invalid_check = false;
				
			}else if(!password_regExp.test($('#user_password').val())){
				invalid_data = 'user_password';
				message_code = '<spring:message code="join.info.J209"/>'; //영문자, 숫자를 혼합하여 8~16글자 이상 입력하세요.
				invalid_check = false;
				
			}else if($('#user_password_check').val() == ''){
				invalid_data = 'user_password_check';
				message_code = '<spring:message code="join.info.J202"/>'; //비밀번호를 입력해주세요
				invalid_check = false;
				
			}else if($('#user_password').val() != $('#user_password_check').val()){
				invalid_data = 'user_password_check';
				message_code = '<spring:message code="join.info.J203"/>'; //비밀번호가 일치하지 않습니다.
				invalid_check = false;
				
			}else if($('#user_name').val() == ''){
				invalid_data = 'user_name';
				message_code = '<spring:message code="join.info.J204"/>'; //이름을 입력해주세요
				invalid_check = false;
				
			}else if($('#user_birth_year').val() == ''){
				invalid_data = 'user_birth_year';
				message_code = '<spring:message code="join.info.J205"/>';  //생년월일을 입력해주세요
				invalid_check = false;
				
			}else if($('#user_birth_day').val() == ''){
				invalid_data = 'user_birth_day';
				message_code = '<spring:message code="join.info.J205"/>'; //생년월일을 입력해주세요
				invalid_check = false;
				
			}else if($('#user_address_1').val() == ''){
				invalid_data = 'user_address_1';
				message_code = '<spring:message code="join.info.J206"/>'; //주소를 입력해주세요.
				invalid_check = false;
				
			}else if($('#user_email').val() == ''){
				invalid_data = 'user_email';
				message_code = '<spring:message code="join.info.J207"/>'; //이메일을 입력해주세요.
				invalid_check = false;
				
			}else if(!email_regExp.test($('#user_email').val())){
				invalid_data = 'user_email';
				message_code = '<spring:message code="join.info.J212"/>'; //이메일 형식이 옳바르지 않습니다.
				invalid_check = false;
				
			}else if($('#user_phone').val() == ''){
				invalid_data = 'user_phone';
				message_code = '<spring:message code="join.info.J208"/>'; //휴대번호를 입력해주세요.
				invalid_check = false;
				
			}else if(!phone_regExp.test($('#user_phone').val())){
				invalid_data = 'user_phone';
				message_code = '<spring:message code="join.info.J213"/>'; //휴대전화번호 형식이 옳바르지 않습니다.
				invalid_check = false;
				
			}
			
			if(invalid_data != ''){
				$('[role='+invalid_data+']').css('color','red').text(message_code);
				$('#'+invalid_data).focus();
			};

			if(invalid_check){
				
				var user_data = $('#join_form').serialize();
				
				$.ajax({
					url : '<%=contextPath%>/user/joinProcess',
					type : 'POST',
				 	data : user_data,
				 	success : function(result){
				 		alert(result.resMessage);
				 		if(result.resCode == 'E001'){
							location.href = '<%=contextPath%>/login';					 				
				 		}
				 	},
				 	error : function(jqXHR, textStatus, errorThrown){
						alert(errorThrown);					 		
				 	}
				});
			}
		});
	});
	</script>
</body>
</html>
