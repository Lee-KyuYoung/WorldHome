<%@ page contentType="text/html; charset=utf-8"%>
	<%@ include file="header.jsp"%>
	


	<div class="container-fluid" id="imgList"></div>

	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" id = "csrf_token"/>
	
<<<<<<< HEAD
=======
	<script>
		 $(document).ready(function(){
			 	const csrf_token = $('#csrf_token').val();
				$.ajax({
					url : "<%=contextPath%>/homeList",
					type : "post",
<<<<<<< HEAD
					data: { '_csrf' : csrf_token },
=======
					data: {'_csrf' : csrf_token },
>>>>>>> f9a671b81976cbc41d52e0dfd4cf4f8e6d52226e
					success : function(data){
							bodyAppend(data);
						},
										error : function(a, c) {
											alert("에러다");
										}
									});
				
				
						$("#closeBut01").hide();
						$("#closeBut02").hide();
				
			});
		 
	 	 //집 이미지 선택 -> 상세화면 호출
		 $(document).on("click", ".imgFile", function(){
			 location.href ='detailHome?homeId='+$(this).attr("name");
		 });
		 
		//집 내용 선택 -> 상세화면 호출
		 $(document).on("click", ".imgComm", function(){
			 location.href ='detailHome?homeId='+$(this).attr("name");
		 });
		 
		
		$(document).on("focusout", "#text01", function(){
			$(".search_add").text("여행지 : "+$("#text01").val());
			if($("#text01").val() != ''){
				$("#closeBut01").show();
			}else{
				$("#closeBut01").hide();
				$(".search_add").text("");
			}
			$(".ui-datepicker-prev ui-corner-all").text("<");
		 }); 
		
		$(document).on("click", "#closeBut01", function(){
			$(".search_add").text("");
			$("#closeBut01").hide();
			$("#text01").val("");
		 }); 
		
		$(function() {
			$("#chk_in_date").datepicker({
				dateFormat: 'yymmdd',
		        prevText: '이전 달',
		        nextText: '다음 달',
		        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
		        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
		        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		        showMonthAfterYear: true,
		        yearSuffix: '년',
	        	minDate: 0,
	        	onSelect: function (dateText, inst) {
	        		/* var y= dateText.substring(0,4);
	        		var m= dateText.substring(4,6);
	        		var d= dateText.substring(6,8); */	
	        		dateText=date_add(dateText,1);

	        		
	        		$("#chk_out_date").datepicker("destroy");
	        		$("#chk_out_date").remove();
	        		$("#menu_chk").append('<div id ="chk_out_date" style="float:right; width: 50%; display : inline;">체크아웃</div>')
	        	    $("#chk_out_date").datepicker({
						dateFormat: 'yymmdd',
				        prevText: '이전 달',
				        nextText: '다음 달',
				        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
				        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
				        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
				        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
				        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
				        showMonthAfterYear: true,
				        yearSuffix: '년', 
				        minDate:  dateText+"",
				        onSelect: function (dateText1, inst) {
				        	$(".search_date").text(dateText.substring(4,6)+"월에서 "+dateText1.substring(6,8)+"일까지");
				        	$("#closeBut02").show();
				        }
				        
					});
	        	    
	        	}
			});
			$("#chk_out_date").datepicker({
				dateFormat: 'yymmdd',
		        prevText: '이전 달',
		        nextText: '다음 달',
		        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
		        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
		        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		        showMonthAfterYear: true,
		        yearSuffix: '년', 
		        minDate: 0
			});  
			
		});
		
		$(document).on("click", "#closeBut02", function(){
			$(".search_date").text("");
			$("#closeBut02").hide();
			$("#chk_in_date").datepicker({
				dateFormat: 'yymmdd',
		        prevText: '이전 달',
		        nextText: '다음 달',
		        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
		        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
		        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		        showMonthAfterYear: true,
		        yearSuffix: '년',
	        	minDate: 0,
	        	onSelect: function (dateText, inst) {
	        		$("#chk_out_date").datepicker("destroy");
	        		$("#chk_out_date").remove();
	        		$("#menu_chk").append('<div id ="chk_out_date" style="float:right; width: 50%; display : inline;">체크아웃</div>')
	        	    $("#chk_out_date").datepicker({
						dateFormat: 'yymmdd',
				        prevText: '이전 달',
				        nextText: '다음 달',
				        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
				        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
				        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
				        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
				        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
				        showMonthAfterYear: true,
				        yearSuffix: '년', 
				        minDate:  dateText+"",
				        onSelect: function (dateText1, inst) {
				        	$(".search_date").text(dateText.substring(4,6)+"월에서 "+dateText1.substring(6,8)+"일까지");
				        }
				        
					});
	        	    
	        	}
			});
		 }); 

		
		function date_add(sDate, nDays) {
		    var yy = parseInt(sDate.substr(0, 4), 10);
		    var mm = parseInt(sDate.substr(4, 2), 10);
		    var dd = parseInt(sDate.substr(6), 10);
		    d = new Date(yy, mm - 1, dd + nDays);
		    yy = d.getFullYear();
		    mm = d.getMonth() + 1; mm = (mm < 10) ? '0' + mm : mm;
		    dd = d.getDate(); dd = (dd < 10) ? '0' + dd : dd;
		    return ''+yy+mm+dd;
		}

>>>>>>> f24a1bcb90babf6375b60115317cabbced1f2694
	
	<%@ include file="footer.jsp"%>
	
	
<script>
$(document).ready(function(){
 	const csrf_token = $('#csrf_token').val();
	$.ajax({
		url : "<%=contextPath%>/homeList",
		type : "post",
		data: {'_csrf' : csrf_token },
		success : function(data){
				//숙소 조회 후 화면 구성
				bodyAppend(data);
			},
		error : function(a, c) {
			alert("에러다");
		}
	});
		$("#closeBut01").hide();
		$("#closeBut02").hide();
		
	
		
	
});
</script>



