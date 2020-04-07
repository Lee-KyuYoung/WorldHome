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
		.content{margin:0 auto;}

	</style>
<body>
	<div class="container">
		
		<h4 class="progress_info">2단계 : 숙소 인원 및 침실, 욕실</h4>
		<div class="progress">
	  		<div class="progress-bar" role="progressbar" style="width: 25%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">25%</div>
		</div>
	
		<div class="row">
			<div class="col-sm-7 content">
				<form id="registration_step2_form">
					<h4>숙소 수용인원 및 침실 , 욕실개수를 입력해주세요.</h4>
					<p>모든 게스트가 편안하게 숙박할 수 있도록 침대가 충분히 구비되어 있는지 확인하세요.</p>
					<div class="row">
						<div class="form-inline form-group col-sm-6" >
						    <label for="max_people" class="control-label">최대 인원 : </label>
						    <div class="col-sm-2">
						    	<input type="number" class="form-control" name="max_guest" min=1>
						    </div>
					    </div>
					</div>
					<p>게스트가 사용할 수 있는 침대를 입력해주세요.</p>
				    <div class="row">
						<div class="form-inline form-group col-sm-6" >
						    <label for="max_people" class="control-label">침대 개수 : </label>
						    <div class="col-sm-2">
						    	<input type="number" class="form-control" name="bed_count" min=0 >
						    </div>
					    </div>
					</div>
					<p>욕실 수 를 입력해 주세요.</p>
				   <div class="row">
						<div class="form-inline form-group col-sm-6" >
						    <label for="max_people" class="control-label">욕실 개수 : </label>
						    <div class="col-sm-2">
						    	<input type="number" class="form-control" name="bathroom_count" min=0>
						    </div>
					    </div>
					</div>
					<div class = "row margin-top20">
						<div class="col-sm-12">
							<div class = "btn-toolbar float-left">
								<input type = "button" class = "btn btn-secondary" value = "뒤로" id="prev_step_2_btn">
							</div>
							<div class = "btn-toolbar float-right">
								<input type = "button" class = "btn btn-info" value = "계속" id="home_reg_step2_btn">
							</div>
						</div>
					</div>
					<input type="hidden" name="homeid" id = "homeid" value="${homeid}">
				</form>
			</div>
		</div>
	
	</div>
	<script src = "<%=contextPath%>/resources/jquery/js/jquery-3.4.1.min.js"></script>
	<script src = "<%=contextPath%>/resources/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script>
		$(document).ready(function(){
			
			$('#home_reg_step2_btn').on('click',function(){
				
				var reg_step1 = $('#registration_step2_form').serialize();
				var homeid = $('#homeid').val();
				
				$.ajax({
					url : '../homeRegProcStep2',
					type : 'POST',
					data : reg_step1,
					success : function(result){
						alert(result.resCode);
						location.href = './step3?homeid='+homeid;
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

