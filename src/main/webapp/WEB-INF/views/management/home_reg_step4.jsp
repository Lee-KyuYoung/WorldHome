<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix = "spring" %>
<%@ page session="true" %>
<%String contextPath = request.getContextPath(); %>

<html>
<head>
	<title>숙소 등록하기</title>
	<style type="text/css">
		p{margin:20 0 10 0;font-size:16px;color:#767676;font-weight:bold}
		.progress_info{color:#767676;margin-top:40px;margin-bottom:20px;font-weight:bold;}
		.progress{margin-bottom:30px;}
		.margin-top20{margin-top:20px;}
		.margin-top10{margin-top:10px;}
		.margin-bottom20{margin-bottom:20px;}
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
							<c:forEach var = "list" items = "${codeList}" varStatus ="status">
								<c:if test = "${list.codeGroupKey eq '1015' }">
									<div class="custom-control custom-checkbox margin-bottom20">
										<input type="checkbox" class="custom-control-input" id="home_range${status.index}" name="home_facility" value="${list.codeKey}">
									    <label class="custom-control-label" for="home_range${status.index}">
									    	${list.codeComment}
									    <c:forEach var = "sub_list" items = "${codeList}">
									    	<c:if test = "${list.codeSubGroupKey eq sub_list.codeGroupKey}">
									    		<br>${sub_list.codeComment}
									    	</c:if>
									    </c:forEach>	
									    </label>
								    </div>
								</c:if>
							</c:forEach>
							
							<p>안전시설</p>
							<c:forEach var = "list" items = "${codeList}" varStatus ="status">
								<c:if test = "${list.codeGroupKey eq '1016' }">
									<div class="custom-control custom-checkbox margin-bottom20">
										<input type="checkbox" class="custom-control-input" id="home_range${status.index}" name="home_facility" value="${list.codeKey}">
									    <label class="custom-control-label" for="home_range${status.index}">
									    	${list.codeComment}
									    <c:forEach var = "sub_list" items = "${codeList}">
									    	<c:if test = "${list.codeSubGroupKey eq sub_list.codeGroupKey}">
									    		<br>${sub_list.codeComment}
									    	</c:if>
									    </c:forEach>	
									    </label>
								    </div>
								</c:if>
							</c:forEach>
							<p>기타 게스트가 사용할 수 있는 공간</p>
							<c:forEach var = "list" items = "${codeList}" varStatus ="status">
								<c:if test = "${list.codeGroupKey eq '1017' }">
									<div class="custom-control custom-checkbox margin-bottom20">
										<input type="checkbox" class="custom-control-input" id="home_range${status.index}" name="home_facility" value="${list.codeKey}">
									    <label class="custom-control-label" for="home_range${status.index}">
									    	${list.codeComment}
									    <c:forEach var = "sub_list" items = "${codeList}">
									    	<c:if test = "${list.codeSubGroupKey eq sub_list.codeGroupKey}">
									    		<br>${sub_list.codeComment}
									    	</c:if>
									    </c:forEach>	
									    </label>
								    </div>
								</c:if>
							</c:forEach>
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
					<input type="hidden" name="homeid" id = "homeid" value="${homeid}">
				</form>
			</div>
		</div>
	
	</div>
	<script>
		$(document).ready(function(){
			
			$('#home_reg_step4_btn').on('click',function(){
				
				var reg_step4 = $('#registration_step4_form').serialize();
				var homeid = $('#homeid').val();
				
				$.ajax({
					url : '<c:url value="/management/homeRegProcStep4"/>', 
					type : 'POST',
					data : reg_step4,
					success : function(result){
						alert(result.resCode);
						location.href = '<c:url value="/management/homeReg/step5?homeid='+homeid+'"/>'
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


