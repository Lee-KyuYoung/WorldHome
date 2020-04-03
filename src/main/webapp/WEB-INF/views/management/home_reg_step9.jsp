<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix = "spring" %>
<%@ page session="true" %>
<%String contextPath = request.getContextPath(); %>

<html>
<head>
	<title>숙소 등록하기</title>
	<link href = "<%=contextPath%>/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href ='<%=contextPath%>/resources/jquery-plug-in/fullcalendar/css/core_main.css' rel='stylesheet' />
    <link href ='<%=contextPath%>/resources/jquery-plug-in/fullcalendar/css/daygrid_main.css' rel='stylesheet' />
	<style type="text/css">
		.word_limit{margin:5 0 10 0;font-size:16px;color:#767676;font-weight:bold}
		.progress_info{color:#767676;margin-top:40px;margin-bottom:20px;font-weight:bold;}
		.progress{margin-bottom:30px;}
		.margin-top20{margin-top:20px;}
		.margin-bottom20{margin-bottom:20px}
		.margin-top10{margin-top:10px;}
		.content{margin:0 auto;}
	</style>
<body>
	<div class="container">
		<h4 class="progress_info">8단계 : 예약 가능 날짜</h4>
		<div class="progress">
	  		<div class="progress-bar" role="progressbar" style="width: 85%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">85%</div>
		</div>
		<div class="row">
			<div class="col-sm-7 content">
				<form id="registration_step5_form">
					<h4>예약가능한 날짜를 업데이트해주세요.</h4>
					<div class="row margin-bottom20">
						<div class = "col-md-12">
							<p>예약 날짜를 지정해 주세요.</p>
							<input type = "text" class="form-control" id = "reserv_date" name = "reserv_date">
						</div>
					</div>
					<div class = "row margin-top20">
						<div class="col-sm-12">
							<div class = "btn-toolbar float-left">
								<input type = "button" class = "btn btn-secondary" value = "뒤로" id="prev_step_5_btn">
							</div>
							<div class = "btn-toolbar float-right">
								<input type = "button" class = "btn btn-info" value = "계속" id="home_reg_step5_btn">
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
    <script src = '<%=contextPath%>/resources/jquery-plug-in/fullcalendar/js/core_main.js'></script>
    <script src = '<%=contextPath%>/resources/jquery-plug-in/fullcalendar/js/daygrid_main.js'></script>
	<script>
		$(document).ready(function(){
			
// 			fullCalendarInit();
			
			$('#home_reg_step5_btn').on('click',function(){
				
				var reg_step1 = $('#registration_step5_form').serialize();
				$.ajax({
					url : '../homeRegProcStep5',
					type : 'POST',
					data : reg_step1,
					success : function(result){
						alert(result.resCode);
						location.href = './step6';
					},
					error : function(xhr , status , error){
						alert(error);
					}
				});
			});
		});
		
		window.onload = function(){
		      document.addEventListener('DOMContentLoaded', function() {
//		   		function fullCalendarInit(){
		  	        var calendarEl = document.getElementById('calendar');
		  	      
		  	        var calendar = new FullCalendar.Calendar(calendarEl, {
		  	          plugins: [ 'dayGrid' ]
		  	        });
		  	      
		  	        calendar.render();
//		   		}
		  	      });
			
			
		}
		
		


		
	</script>
</body>
</html>


