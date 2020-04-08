<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix = "spring" %>
<%@ page session="true" %>
<html>
<head> 
	<title>숙소 등록하기</title> 
	<link href="<c:url value='/resources/jquery-plug-in/datarangepicker/css/daterangepicker.css'/>" rel="stylesheet">
	<style type="text/css">
		p{margin:20 0 10 0;font-size:16px;color:#767676;font-weight:bold}
		.progress_info{color:#767676;margin-top:40px;margin-bottom:20px;font-weight:bold;}
		.progress{margin-bottom:30px;}
		.margin-top20{margin-top:20px;}
		.margin-bottom20{margin-bottom:20px;}
		.margin-bottom30{margin-bottom:30px;}
		.margin-top10{margin-top:10px;}
		.content{margin:0 auto;}
		.fc-past:hover{cursor:not-allowed;}
		.fc-future , .fc-today:hover{cursor:pointer;}
	</style>
	
</head>
<body>
	<div class="container">
		<h4 class="progress_info">8단계 : 예약 가능 날짜 및 요금 설정</h4>
		<div class="progress">
	  		<div class="progress-bar" role="progressbar" style="width: 100%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">100%</div>
		</div>
		<div class="row">
			<div class="col-sm-7 content">
				<form id="registration_step8_form">
					<h4>예약가능한 날짜를 업데이트해주세요.</h4>
					<div class="row margin-bottom30">
						<div class = "col-md-6">
							<p>예약 날짜를 지정해 주세요.</p>
							<input type = "text" class="form-control" id = "reserv_date" name = "reserv_date"  onkeydown="numberFormat(this)">
						</div>
					</div>
					<h4>성수기 및 비성수기의 1박에 대한 요금을 입력해주세요.</h4>
					<div class="row margin-bottom20">
						<div class = "col-md-6">
							<p>성수기 요금</p>
							<div class="input-group">
								<div class="input-group-prepend">
     								<span class="input-group-text">￦</span>
   								</div>
   								<input type = "text" class="form-control" id = "peak_season_pay" name = "peak_season_pay">
 							</div>
						</div>
						<div class = "col-md-6">
							<p>비성수기 요금</p>
							<div class="input-group">
								<div class="input-group-prepend">
     								<span class="input-group-text">￦</span>
   								</div>
   								<input type = "text" class="form-control" id = "offpeak_season_pay" name = "offpeak_season_pay">
 							</div>
						</div>
					</div>
					<div class = "row margin-top20">
						<div class="col-sm-12">
							<div class = "btn-toolbar float-left">
								<input type = "button" class = "btn btn-secondary" value = "뒤로" id="prev_step_8_btn">
							</div>
							<div class = "btn-toolbar float-right">
								<input type = "button" class = "btn btn-info" value = "계속" id="home_reg_step8_btn">
							</div>
						</div>
					</div>
					<input type="hidden" name="homeid" id = "homeid" value="${homeid}">
				</form>
			</div>
		</div>
	</div>
	<script src="<c:url value='/resources/jquery-plug-in/datarangepicker/js/moment.min.js'/>"></script>
	<script src="<c:url value='/resources/jquery-plug-in/datarangepicker/js/daterangepicker.js'/>"></script>
    
	<script>
		$(document).ready(function(){
			
			var date = new Date();
			var year = date.getFullYear();
			var month = date.getMonth() + 1;
			var day = date.getDate();

			//date range pircker
			$('input[name="reserv_date"]').daterangepicker({
				
			    "locale": {
			        "format": "YYYY/MM/DD",
			        "separator": "~",
			        "applyLabel": "적용",
			        "cancelLabel": "취소",
			        "daysOfWeek": [
			            "일",
			            "월",
			            "화",
			            "수",
			            "목",
			            "금",
			            "토"
			        ],
			        "monthNames": [
			            "1월",
			            "2월",
			            "3월",
			            "4월",
			            "5월",
			            "6월",
			            "7월",
			            "8월",
			            "9월",
			            "10월",
			            "11월",
			            "12월"
			        ],
			        "firstDay": 1
			    },
			    "minDate" : year+"/"+month+"/"+day
			});

			$('#peak_season_pay , #offpeak_season_pay').on('keyup',function(){
				$(this).val(numberFormat($(this).val().replace(/[^0-9]/g,"")));
			});
			
			$('#home_reg_step8_btn').on('click',function(){
				
				var reg_step1 = $('#registration_step8_form').serialize();
				$.ajax({
					url : '<c:url value="/management/homeRegProcStep8"/>', 
					type : 'POST',
					data : reg_step1,
					success : function(result){
						alert(result.resCode);
						location.href = '<c:url value="/"/>'
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
		
		//콤마 찍기
		function numberFormat(num) {
	    	return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
		
		
//    		function fullCalendarInit(){

//   	        var calendarEl = document.getElementById('calendar');
  	      
//   	        var calendar = new FullCalendar.Calendar(calendarEl, {
// 	  	        plugins: [ 'interaction', 'dayGrid' ] ,
// 	  	        dateClick : function(info){
// 		  	    	console.log("fewfewewew");
// 		  	    },
// 		  	    columnHeaderText: function(date) {
// 			  	    let weekList = ["일", "월", "화", "수", "목", "금", "토"];
// 			  	    return weekList[date.getDay()];
// 		  	    }, 
// 		  	    titleFormat: function(date) {
// 		  	  		return date.date.year+'년 '+(date.date.month+1)+'월';
// 		  	    }
// 		  	});
//   	        calendar.render();
//    		}
		  	  

	</script>
</body>
</html>


