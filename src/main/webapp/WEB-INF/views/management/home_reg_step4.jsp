<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix = "spring" %>
<%@ page session="true" %>
<%String contextPath = request.getContextPath(); %>

<html>
<head>
	<title>숙소 등록하기</title>
	<link href = "<%=contextPath%>/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<style type="text/css">
		p{margin:20 0 10 0;font-size:16px;color:#767676;font-weight:bold}
		.progress_info{color:#767676;margin-top:40px;margin-bottom:20px;font-weight:bold;}
		.progress{margin-bottom:30px;}
		.margin-top20{margin-top:20px;}
		.margin-top10{margin-top:10px;}
		.content{margin:0 auto;}
	</style>
<body>
	<div class="container">
		<h4 class="progress_info">4단계 : 편의 시설제공 입력</h4>
		<div class="progress">
		  	<div class="progress-bar" role="progressbar" style="width: 60%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">60%</div>
		</div>
		<div class="row">
			<div class="col-sm-7 content">
				<form id="registration_step4_form">
					<h4>어떤 편의시설을 제공하시나요?</h4>
					<p>숙소를 등록한 후 언제든 편의시설을 추가 할 수 있습니다.</p>
					<div class="row margin-top20">
						<div class = "col-sm-10">
							<p>일반 제공</p>
							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input" id="home_range1" name="home_range" value="1">
							    <label class="custom-control-label" for="home_range1">필수 품목</label>
							</div>
							<div class="custom-control custom-checkbox margin-top20">
								<input type="checkbox" class="custom-control-input" id="home_range1" name="home_range" value="1">
							    <label class="custom-control-label" for="home_range1">무선 인터넷</label>
							</div>
							<div class="custom-control custom-checkbox margin-top20">
								<input type="checkbox" class="custom-control-input" id="home_range1" name="home_range" value="1">
							    <label class="custom-control-label" for="home_range1">TV</label>
							</div>
							<div class="custom-control custom-checkbox margin-top20">
								<input type="checkbox" class="custom-control-input" id="home_range1" name="home_range" value="1">
							    <label class="custom-control-label" for="home_range1">에어컨</label>
							</div>
							<div class="custom-control custom-checkbox margin-top20">
								<input type="checkbox" class="custom-control-input" id="home_range1" name="home_range" value="1">
							    <label class="custom-control-label" for="home_range1">다리미</label>
							</div>
							<div class="custom-control custom-checkbox margin-top20">
								<input type="checkbox" class="custom-control-input" id="home_range1" name="home_range" value="1">
							    <label class="custom-control-label" for="home_range1">샴푸</label>
							</div>
							<p>안전시설</p>
							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input" id="home_range1" name="home_range" value="1">
							    <label class="custom-control-label" for="home_range1">연기 감지기</label>
							</div>
							<div class="custom-control custom-checkbox margin-top20">
								<input type="checkbox" class="custom-control-input" id="home_range1" name="home_range" value="1">
							    <label class="custom-control-label" for="home_range1">일산화 탄소 감지기</label>
							</div>
							<div class="custom-control custom-checkbox margin-top20">
								<input type="checkbox" class="custom-control-input" id="home_range1" name="home_range" value="1">
							    <label class="custom-control-label" for="home_range1">구급상자</label>
							</div>
							<div class="custom-control custom-checkbox margin-top20">
								<input type="checkbox" class="custom-control-input" id="home_range1" name="home_range" value="1">
							    <label class="custom-control-label" for="home_range1">소화기</label>
							</div>
							<p>기타 게스트가 사용할 수 있는 공간</p>
							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input" id="home_range1" name="주방" value="1">
							    <label class="custom-control-label" for="home_range1">연기 감지기</label>
							</div>
							<div class="custom-control custom-checkbox margin-top20">
								<input type="checkbox" class="custom-control-input" id="home_range1" name="빨래-세탁기" value="1">
							    <label class="custom-control-label" for="home_range1">일산화 탄소 감지기</label>
							</div>
							<div class="custom-control custom-checkbox margin-top20">
								<input type="checkbox" class="custom-control-input" id="home_range1" name="빨래-건조기" value="1">
							    <label class="custom-control-label" for="home_range1">구급상자</label>
							</div>
							<div class="custom-control custom-checkbox margin-top20">
								<input type="checkbox" class="custom-control-input" id="home_range1" name="주차" value="1">
							    <label class="custom-control-label" for="home_range1">소화기</label>
							</div>
						</div>
					</div>
					<div class = "row margin-top20">
						<div class="col-sm-12">
							<div class = "btn-toolbar float-left">
								<input type = "button" class = "btn btn-secondary" value = "뒤로" id="prev_step_4_btn">
							</div>
							<div class = "btn-toolbar float-right">
								<input type = "button" class = "btn btn-info" value = "계속" id="home_reg_step4_btn">
							</div>
						</div>
					</div>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" id = "csrf_token"/>
				</form>
			</div>
		</div>
	
	</div>
	<script src = "<%=contextPath%>/resources/jquery/js/jquery-3.4.1.min.js"></script>
	<script src = "<%=contextPath%>/resources/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script>
		$(document).ready(function(){
			
			$('#home_reg_step4_btn').on('click',function(){
				
				var reg_step1 = $('#registration_step4_form').serialize();
				$.ajax({
					url : '../homeRegProcStep4',
					type : 'POST',
					data : reg_step1,
					success : function(result){
						alert(result.resCode);
						location.href = './step5';
					},
					error : function(xhr , status , error){
						alert(error);
					}
				});
			});
			
		});
	</script>
</body>
</html>

