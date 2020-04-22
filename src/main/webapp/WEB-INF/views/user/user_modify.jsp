<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix = "spring" %>
<%@ page session="true" %>
<%String contextPath = request.getContextPath(); %>

<html>
<head>
	<title>정보수정</title>
	<link href="<%=contextPath%>/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="<%=contextPath%>/resources/css/dev/user_info.css" rel="stylesheet">
</head>
<body>
	<div class="container">
		<form class ="form-signin" id = "user_info_modify_form">
			<h3>회원 정보 수정</h3>
			<table class ="table table-bordered">
				<caption><spring:message code="join.info.J102"/></caption><!-- 회원 이용정보 -->
				<colgroup>
					<col style="width:100px;">
					<col style="width:300px;">
				</colgroup>
				<tbody>
					<tr>
						<th class="align-middle"><spring:message code="join.info.J104"/></th><!-- 아이디 -->
						<td>
							<input type="text" class="form-control" id="user_id" name="user_id" readonly value="${user_info.userId }">
							<p class="invalid_data" role="user_id"></p>
						</td>
					</tr>
					<tr>
						<th class="align-middle"><spring:message code="join.info.J105"/></th><!-- 비밀번호 -->
						<td>
						    <p class="data_role"><spring:message code="join.info.J101"/></p>
							<input type="password" class="form-control" id="user_password" name="user_password">
							<p class="invalid_data" role="user_password"></p>
						</td>
					</tr>
					<tr>
						<th class="align-middle"><spring:message code="join.info.J106"/></th><!-- 비밀번호 확인 -->
						<td>
							<input type="password" class="form-control" id="user_password_check" name="user_password_check">
							<p class="invalid_data" role="user_password_check"></p>
						</td>
					</tr>
				</tbody>
			</table>
			
			<table class="table table-bordered">
				<caption><spring:message code="join.info.J103"/></caption> <!-- 회원 개인정보 -->
				<colgroup>
					<col style="width:100px;">
					<col style="width:300px;">
				</colgroup>
				<tbody>
					<tr>
						<th class="align-middle"><spring:message code="join.info.J109"/></th><!-- 주소 -->
						<td>
							<div class="input-group mb-3">
								<input type="text" class="form-control" id="user_address_1" name="user_address_1" readonly onchange="setMentInit('user_address_1');" value="${user_info.userAddress1 }">
								<div class="input-group-append">
									<button class="btn btn-outline-secondary" type="button" id="address_search"><spring:message code="join.info.J112"/></button><!-- 주소검색 -->
								</div>
							</div>
							<input type="text" class="form-control" id="user_address_2" name="user_address_2" value="${user_info.userAddress2 }" placeholder="<spring:message code='join.info.J211'/>"> <!-- 나머지주소를 입력해주세요. -->
							<p class="invalid_data" role="user_address_1"></p>
						</td>
					</tr>
					<tr>
						<th class="align-middle"><spring:message code="join.info.J110"/></th><!-- 이메일 -->
						<td>
							<input type="text" class="form-control" id="user_email" name="user_email" value="${user_info.userEmail}">
							<p class="invalid_data" role="user_email"></p>
						</td>
					</tr>
					<tr>
						<th class="align-middle"><spring:message code="join.info.J111"/></th> <!-- 휴대전화 -->
						<td>
							<p class="data_role"><spring:message code="join.info.J210"/></p> <!-- "-"을 제외하고 숫자만 적어주세요. -->
							<input type="text" class="form-control" id="user_phone" name="user_phone" maxlength="11" value="${user_info.userPhone }">
							<p class="invalid_data" role="user_phone"></p>
						</td>
					</tr>
				</tbody>
			</table>
			<div class="btn-toolbar float-right">
				<div class="btn-group mr-2">
					<input type="button" class="btn btn-outline-secondary" id = "modify_btn" value="<spring:message code='common.info.I005'/>">
				</div>
				<input type="button" class="btn btn-outline-secondary" id = "cancel_btn" value="<spring:message code='common.info.I003'/>">			
			</div>
			<input type="hidden" id = "scrf_token" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		</form>
		<div style="height:900px;"></div>
	</div>
	<script src = "<%=contextPath%>/resources/jquery/js/jquery-3.4.1.min.js"></script>
	<script src = "<%=contextPath%>/resources/bootstrap/js/bootstrap.bundle.min.js"></script>
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
		$('#modify_btn').on('click',function(){
			
			var invalid_data = '';
			var message_code = '';
			var password_regExp = /^[a-z0-9_]{8,20}$/; 
			var phone_regExp = /(010)([1-9]{1}[0-9]{3})([0-9]{4})$/;
			var email_regExp = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z\-]+/;
			var invalid_check = true;
			
			if(!password_regExp.test($('#user_password').val()) && $('#user_password').val() != ''){
				invalid_data = 'user_password';
				message_code = '<spring:message code="join.info.J209"/>'; //영문자, 숫자를 혼합하여 8~16글자 이상 입력하세요.
				invalid_check = false;
				
			}else if($('#user_password').val() != $('#user_password_check').val()){
				invalid_data = 'user_password_check';
				message_code = '<spring:message code="join.info.J203"/>'; //비밀번호가 일치하지 않습니다.
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
				
				var user_ID = "${user_info.userId}";
				var ori_pw = "${user_info.userPw}";
				var ori_address1 = "${user_info.userAddress1}";
				var ori_address2 = "${user_info.userAddress2}";
				var ori_email = "${user_info.userEmail}";
				var ori_phone = "${user_info.userPhone}";
				
				var modi_pw = $("#user_password").val();
				var modi_address1 = $("#user_address_1").val();
				var modi_address2 = $("#user_address_2").val();
				var modi_email = $("#user_email").val();
				var modi_phone = $("#user_phone").val();
				
				var isModify = false;
				var modify_data = {};
				modify_data.userID = user_ID;
				modify_data._csrf = "${_csrf.token}";

				//변경된 데이터만 저장
				if(modi_pw != '' && (ori_pw != modi_pw)){
					isModify = true;
					modify_data.userPw = modi_pw;
					
				}
				if(ori_address1 != modi_address1){
					isModify = true;
					modify_data.userAddress1 = modi_address1
					
				}
				if(ori_address2 != modi_address2){
					isModify = true;
					modify_data.userAddress2 = modi_address2;
					
				}
				if(ori_email != modi_email){
					isModify = true;
					modify_data.userEmail = modi_email;
					
				}
				if(ori_phone != modi_phone){
					isModify = true;
					modify_data.userPhone = modi_phone;
				}
				
				if(isModify){
					$.ajax({
						url : '<%=contextPath%>/user/modifyProcess',
						type : 'POST',
					 	data : modify_data,
					 	success : function(result){
					 		alert(result.resMessage);
					 		if(result.resCode == 'E001'){
								location.href = '<%=contextPath%>/user/modify';					 				
					 		}
					 	},
					 	error : function(jqXHR, textStatus, errorThrown){
							alert(errorThrown);					 		
					 	}
					});		
				}else{
					alert('<spring:message code="join.info.J214"/>'); //수정된 정보가 없습니다.
				}
			}
		});
	});
	</script>
</body>
</html>

