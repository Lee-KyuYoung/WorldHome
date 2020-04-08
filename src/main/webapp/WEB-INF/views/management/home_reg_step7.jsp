<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix = "spring" %>
<%@ page session="true" %>
<%String contextPath = request.getContextPath(); %>

<html>
<head>
	<title>숙소 등록하기</title>
	<style type="text/css">
		p{margin:0 0 10 0;font-size:16px;color:#767676;font-weight:bold}
		.word_limit{margin:5 0 10 0;font-size:16px;color:#767676;font-weight:bold}
		.progress_info{color:#767676;margin-top:40px;margin-bottom:20px;font-weight:bold;}
		.progress{margin-bottom:30px;}
		.margin-top20{margin-top:20px;}
		.margin-bottom20{margin-bottom:20px}
		.margin-top10{margin-top:10px;}
		.content{margin:0 auto;}
 		form-inline label{padding:0px;justify-content:left !important;} 
     	.inline_block_float_right{display:inline-block;float:right;} 
		.no_padding{padding:0px;}
	</style>
<body>
	<div class="container">
		<h4 class="progress_info">7단계 : 숙소 규칙</h4>
		<div class="progress">
	  		<div class="progress-bar" role="progressbar" style="width: 85%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">85%</div>
		</div>
		<div class="row">
			<div class="col-sm-7 content">
				<form id="registration_step7_form">
					<h4>게스트가 지켜야 할 숙소 이용규칙을 선택하세요</h4>
					<div class="row margin-top20">
						<c:forEach var = "list" items = "${codeList}" varStatus = "status">
							<c:if test = "${list.codeNum eq '21' }">
								<div class="form-inline form-group col-sm-12" >
									<div class="col-sm-5 no_padding">
										<p>${list.codeComment}</p>
									</div>
								    <div class="col-sm-7">
								    	<div class="inline_block_float_right">
											<div class="custom-control custom-radio custom-control-inline">
												<input type="radio" class="custom-control-input" id = "geuet_rule_Y_${status.index}" name="guest_rule_${status.index}" value = "${list.codeKey }" checked>
												<label class="custom-control-label" for = "geuet_rule_Y_${status.index}">Y</label>
											</div>
											<div class="custom-control custom-radio custom-control-inline">
												<input type="radio" class="custom-control-input" id = "geuet_rule_N_${status.index}" name="guest_rule_${status.index}" value = "N">
												<label class="custom-control-label" for = "geuet_rule_N_${status.index}">N</label>
											</div>
										</div>
									</div>
							    </div>
						    </c:if>
						</c:forEach>
					</div>
					<h4>게스트가 숙소에 대해 알아두어야 할 세부 사항</h4>
					<div class="row margin-top20">
						<div class = "col-sm-10">
							<c:forEach var = "list" items = "${codeList}" varStatus = "status">
								<c:if test = "${list.codeNum eq '22' }">
									<div class="custom-control custom-checkbox margin-bottom20">
										<input type="checkbox" class="custom-control-input" id="home_precaution_${status.index }" name="home_precaution" value = "${list.codeKey }">
									    <label class="custom-control-label" for="home_precaution_${status.index }">
									    	${list.codeComment}
									    </label>
									</div>
								</c:if>
							</c:forEach>
						</div>
					</div>
					<div class = "row margin-top20">
						<div class="col-sm-12">
							<div class = "btn-toolbar float-left">
								<input type = "button" class = "btn btn-secondary" value = "뒤로" id="prev_step_7_btn">
							</div>
							<div class = "btn-toolbar float-right">
								<input type = "button" class = "btn btn-info" value = "계속" id="home_reg_step7_btn">
							</div>
						</div>
					</div>
					<input type="hidden" name="homeid" id = "homeid" value="${homeid}">
				</form>
			</div>
		</div>
	
	</div>
	<script>
		$(document).ready(function(){
			
			$('#home_reg_step7_btn').on('click',function(){
				
				var reg_step1 = $('#registration_step7_form').serialize();
				var homeid = $('#homeid').val();
				
				$.ajax({
					url : '<c:url value="/management/homeRegProcStep7"/>', 
					type : 'POST',
					data : reg_step1,
					success : function(result){
						alert(result.resCode);
						location.href = '<c:url value="/management/homeReg/step8?homeid='+homeid+'"/>'
					},
					error : function(xhr , status , error){
						alert(error);
					},
					beforeSend : function(xhr){
						 xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
					}
				});
			});
		});
	
	</script>
</body>
</html>

