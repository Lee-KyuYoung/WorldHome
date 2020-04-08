<%@ page contentType="text/html; charset=utf-8"%>
<%
	String c = request.getContextPath();
%>

<script src="<%=c%>/resources/jquery/js/jquery-3.4.1.min.js"></script>
<script src="<%=c%>/resources/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="<%=c%>/resources/bootstrap/js/jquery-ui.min.js"></script>    
<script>
	 
	 	$(function() {
			$("#datepicker1").datepicker({
				dateFormat : 'yy-mm-dd'
			});
		});

		$(function() {
			$("#datepicker2").datepicker({
				dateFormat : 'yy-mm-dd'
			});
		});
	 
		 
	 	 //집 이미지 선택 -> 상세화면 호출
		 $(document).on("click", ".imgFile", function(){
			 location.href ='detailHome?homeId='+$(this).attr("name");
		 });
		 
		//집 내용 선택 -> 상세화면 호출
		 $(document).on("click", ".imgComm", function(){
			 location.href ='detailHome?homeId='+$(this).attr("name");
		 });
		 
		//여행지 입력
		$(document).on("focusout", "#text01", function(){
			$(".search_add").text("여행지 : "+$("#text01").val());
			
			$("#homeAdd").val($("#text01").val());
			if($("#text01").val() != ''){
				$("#closeBut01").show();
			}else{
				$("#closeBut01").hide();
				$(".search_add").text("");
				$("#homeAdd").text("");
			}
			$(".ui-datepicker-prev ui-corner-all").text("<");
		 }); 
		
		//여행지 입력 데이터 지우기
		$(document).on("click", "#closeBut01", function(){
			$(".search_add").text("");
			$("#closeBut01").hide();
			$("#text01").val("");
		 }); 
		
		
		//체크인 체크아웃 일자
		$(function() {
			//체크인 일자
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
	        		//체크아웃일자
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
				        minDate:  date_add(dateText,1),
				        onSelect: function (dateText1, inst) {
				        	$(".search_date").text(dateText.substring(4,6)+"월 "+dateText.substring(6,8)+"일부터 "+dateText1.substring(4,6)+"월 "+dateText1.substring(6,8)+"일까지");
				        	$("#homeDateIn").val(dateText);
				        	$("#homeDateOut").val(dateText1);
				        	$("#closeBut02").show();
				        }
				        
					});
	        	    
	        	}
			});
			//체크아웃일자(선택 안해도 default 달력 보이게)
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
		//체크인 체크아웃 입력 데이터 지우고 달력 초기화
		$(document).on("click", "#closeBut02", function(){
			$(".search_date").text("");
			$("#homeDateIn").val("");
        	$("#homeDateOut").val("");
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
				        minDate:   date_add(dateText,1),
				        onSelect: function (dateText1, inst) {
				        	$(".search_date").text(dateText.substring(4,6)+"월 "+dateText.substring(6,8)+"일부터 "+dateText1.substring(4,6)+"월 "+dateText1.substring(6,8)+"일까지");
				        	$("#homeDateIn").val(dateText);
				        	$("#homeDateOut").val(dateText1);
				        }
				        
					});
	        	    
	        	}
			});
		 }); 

		//day계산
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

		
		//게스트인원 minus
		$(document).on("click", ".adult_down", function(){
			if("0" != $(".people_cnt").text()){
				$(".people_cnt").text(Number($(".people_cnt").text())-1);
			}
			if("0" == $(".people_cnt").text()){
				$("#closeBut03").hide();
				$(".search_guest").text("");
				$("#homeGuest").val("");
			}else{
				$("#closeBut03").show();
				$(".search_guest").text("게스트 : "+$(".people_cnt").text());
				$("#homeGuest").val($(".people_cnt").text());
			}
			
		});
	
		//게스트인원 plus	
		$(document).on("click", ".adult_up", function(){
			if($(".people_cnt").text() < 16){
				$(".people_cnt").text(Number($(".people_cnt").text())+1);
			}
			if("0" == $(".people_cnt").text()){
				$("#closeBut03").hide();
				$(".search_guest").text("");
				$("#homeGuest").val("");
			}else{
				$("#closeBut03").show();
				$(".search_guest").text("게스트 : "+$(".people_cnt").text());
				$("#homeGuest").val($(".people_cnt").text());
			}
		});
		
		//게스트인원 입력 값 지우기
		$(document).on("click", "#closeBut03", function(){
			$(".search_guest").text("");
			$("#closeBut03").hide();
			$(".people_cnt").text("0");
		 }); 
		
		
		
		//조회 화면 구성
		function bodyAppend(data) {
			$("#imgList").empty();
			var str = '';
			var pastHomeId = '';
			var HomeGubun = 0;
			var pastHomeComm = '';
			 $.each(data,function(i){
				var homeImgPath =data[i].HOME_IMG_PATH;
			    var homeComm =data[i].HOME_COMM;
			    var homeId =data[i].HOME_ID;
			    
				if(pastHomeId == ''){
					str +='<div class ="celBody"  style="cursor:pointer;">'
						    +'<div id="IMG'+homeId+'" class="carousel slide" data-ride="carousel">'
							+'<ul class="carousel-indicators">'
						    +'<li data-target="#IMG'+homeId+'" data-slide-to="0" class="active"></li>'
						    +'<li data-target="#IMG'+homeId+'" data-slide-to="1"></li>'
						    +'<li data-target="#IMG'+homeId+'" data-slide-to="2"></li>'
						  	+'</ul>';
					pastHomeId = homeId;
					pastHomeComm = homeComm;
					HomeGubun = 0;
				}
				if(homeId != pastHomeId && data.length > i){
					
					str +=  '</div>'
						    +'<a class="carousel-control-prev" href="#IMG'+pastHomeId+'" data-slide="prev">'
						    +'<span class="carousel-control-prev-icon"></span>'
						    +'</a>'
						    +'<a class="carousel-control-next" href="#IMG'+pastHomeId+'" data-slide="next">'
						    +'<span class="carousel-control-next-icon"></span>'
						    +'</a>'
							+'</div>'
							+'<div class="imgComm" name="'+pastHomeId+'">'
							+ pastHomeComm
							+'</div>'
							+'</div>'
					str += '<div class ="celBody" style="cursor:pointer;">'
						+'<div id="IMG'+homeId+'" class="carousel slide" data-ride="carousel">'
						+'<ul class="carousel-indicators">'
					    +'<li data-target="#IMG'+homeId+'" data-slide-to="0" class="active"></li>'
					    +'<li data-target="#IMG'+homeId+'" data-slide-to="1"></li>'
					    +'<li data-target="#IMG'+homeId+'" data-slide-to="2"></li>'
					  	+'</ul>';
					pastHomeId = homeId; 
					pastHomeComm = homeComm;
					HomeGubun = 0;
				}
				
				if(HomeGubun == 0){
					str +='<div class="carousel-inner">'
				    +'<div class="carousel-item active">'
				    +'<img class ="imgFile" name="'+homeId+'" src="'+"<%=c%>"+homeImgPath+'" >'
				    +'</div>'
				    
			        HomeGubun++;
				}else{
					str +='<div class="carousel-item">'
						+'<img class ="imgFile" name="'+homeId+'" src="'+"<%=c%>"
																+ homeImgPath
																+ '" >'
																+ '</div>'
																
					}

					if (data.length == i + 1) {
						str +=  '</div>'
							    +'<a class="carousel-control-prev" href="#IMG'+pastHomeId+'" data-slide="prev">'
								+ '<span class="carousel-control-prev-icon"></span>'
								+ '</a>'
								+ '<a class="carousel-control-next" href="#IMG'+pastHomeId+'" data-slide="next">'
								+ '<span class="carousel-control-next-icon"></span>'
								+ '</a>'
								+ '</div>'
								+'<div class="imgComm" name="'+homeId+'">'
								+ homeComm
								+'</div>'
								+'</div>'
					}

				});
				$("#imgList").append(str);
		}
	
		
		//조회 버튼 클릭
		 $(document).on("click", "#homeSearch",function(){
			 	const csrf_token = $('#csrf_token').val();
			 	var homeAdd = $("#homeAdd").val();
			 	var homeDateIn = $("#homeDateIn").val();
			 	var homeDateOut = $("#homeDateOut").val();
			 	var homeGuest = $("#homeGuest").val();
				$.ajax({
					url : "<%=c%>/homeList",
					type : "post",
					data: {'_csrf' : csrf_token, 
						   'homeAdd' : homeAdd,
						   'homeDateIn' : homeDateIn,
						   'homeDateOut' : homeDateOut,
						   'homeGuest' : homeGuest},
					success : function(data){
							bodyAppend(data);
						},
						error : function(a, c) {
							alert("에러다");
						}
					});
				
				
				
			});
		
		
		
		//새로고침
		 $(document).on("click", ".homeLogo", function(){
			 const csrf_token = $('#csrf_token').val();
			 window.location.reload();
			 location.replace("<%=c%>");
			 
			<%--  $.ajax({
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
				}); --%>
		 });
		
	</script>
</body>
</html>