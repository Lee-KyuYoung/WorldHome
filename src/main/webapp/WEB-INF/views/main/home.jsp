<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Home</title>
<style>
.container-fluid {
	margin: 30px auto;
	width: 90%;
}
.detailHome_link{
	wigth: 100%;
	heigth: 100%
}

@media ( max-width : 768px ) {
	.container-fluid {
		display: grid;
		grid-gap: 50px 10px;
		grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
		/* grid-template-rows: repeat(10, 300px); */
		grid-auto-rows: minmax(300px, auto);
		whidth: 90%;
	}
}

@media ( min-width : 768px ) {
	.container-fluid {
		display: grid;
		grid-gap: 30px 10px;
		grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
		/* grid-template-rows: repeat(${rowSizCnt}, 200px); */
		grid-auto-rows: minmax(200px, auto);
		whidth: 90%;
	}
}

@media ( min-width : 1024px ) {
	.container-fluid {
		display: grid;
		grid-gap: 30px 5px;
		grid-template-columns: repeat(auto-fit, 270px);
		/* grid-template-rows: repeat(${rowSizCnt}, 200px); */
		grid-auto-rows: minmax(200px, auto);
		whidth: 90%;
	}
}


.celBody{
	height: 100%;
}

.carousel slide{
	height: 85%;
}
/* .carousel-inner {
	height: 85%;
	width: 100%;
} */
 .imgComm{
	height: 15%;
	width: 100%;
	background-color: white;
	display: table-row;
}
 


.carousel-item active{
	height: 90%;
	width: 100%;
}
.carousel-item{
	height: 90%;
	width: 100%;
}
.imgFile {
	width: 100%;
	height:100%;
}

</style>
</head>
<body>
	<header>
		<%@ include file="header.jsp"%>
	</header>
	


	<div class="container-fluid" id="imgList"></div>

	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" id = "csrf_token"/>
	<div class="content">Hello world!!</div>
	<footer>
		<%@ include file="footer.jsp"%>
	</footer>
	<script src="<%=contextPath%>/resources/jquery/js/jquery-3.4.1.min.js"></script>
	<script src="<%=contextPath%>/resources/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="<%=contextPath%>/resources/bootstrap/js/jquery-ui.min.js"></script>
	
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

	
		$(document).on("click", ".adult_down", function(){
			if("0" != $(".people_cnt").text()){
				$(".people_cnt").text(Number($(".people_cnt").text())-1);
			}
			if("0" == $(".people_cnt").text()){
				$("#closeBut03").hide();
				$(".search_guest").text("");
			}else{
				$("#closeBut03").show();
				$(".search_guest").text("게스트 : "+$(".people_cnt").text());
			}
			
		});

		
		$(document).on("click", ".adult_up", function(){
			if($(".people_cnt").text() < 16){
				$(".people_cnt").text(Number($(".people_cnt").text())+1);
			}
			if("0" == $(".people_cnt").text()){
				$("#closeBut03").hide();
				$(".search_guest").text("");
			}else{
				$("#closeBut03").show();
				$(".search_guest").text("게스트 : "+$(".people_cnt").text());
			}
		});
		
		$(document).on("click", "#closeBut03", function(){
			$(".search_guest").text("");
			$("#closeBut03").hide();
			$(".people_cnt").text("0");
		 }); 
		
		
		
		
		function bodyAppend(data) {
			$("#imgList").empty();
			var str = '';
			var pastHomeId = '';
			var HomeGubun = 0;
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
					HomeGubun = 0;
				}
				if(homeId != pastHomeId && data.length > i+1){
					
					str +=  '</div>'
						    +'<a class="carousel-control-prev" href="#IMG'+pastHomeId+'" data-slide="prev">'
						    +'<span class="carousel-control-prev-icon"></span>'
						    +'</a>'
						    +'<a class="carousel-control-next" href="#IMG'+pastHomeId+'" data-slide="next">'
						    +'<span class="carousel-control-next-icon"></span>'
						    +'</a>'
							+'</div>'
							+'<div class="imgComm" name="'+homeId+'">'
							+ homeComm
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
					HomeGubun = 0;
				}
				
				if(HomeGubun == 0){
					str +='<div class="carousel-inner">'
				    +'<div class="carousel-item active">'
				    +'<img class ="imgFile" name="'+homeId+'" src="'+"<%=contextPath%>"+homeImgPath+'" >'
				    +'</div>'
				    
			        HomeGubun++;
				}else{
					str +='<div class="carousel-item">'
						+'<img class ="imgFile" name="'+homeId+'" src="'+"<%=contextPath%>"
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
	
		
		 $(document).on("click", "#homeSearch",function(){
			 	const csrf_token = $('#csrf_token').val();
			 	/* var homeListDomain = {};
			 	homeListDomain.homeAdd = $('#homeAdd').val();
			 	homeListDomain.homeDate = $('#homeDate').val();
			 	homeListDomain.homeGuest = $('#homeGuest').val(); */
			 	var param = $("form[name=homeListDomain]").serialize();
			 	
				$.ajax({
					url : "<%=contextPath%>/homeList",
					type : "post",
					data: {'_csrf' : csrf_token, 
							"homeListDomain": param},
					success : function(data){
							bodyAppend(data);
						},
						error : function(a, c) {
							alert("에러다");
						}
					});
				
				
				
			});
		
		
		
	</script>

</body>
</html>

