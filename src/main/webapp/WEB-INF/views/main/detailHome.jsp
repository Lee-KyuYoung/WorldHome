<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page session="false"%>
<%
	String contextPath = request.getContextPath();
%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Home</title>
<link href="<%=contextPath%>/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=contextPath%>/resources/bootstrap/css/jquery-ui.css" rel="stylesheet">
</head>
<style>
.main_space {
	width: 100%;
	height: 50%;
}

.detail_comm_all{
	width: 70%;
	margin: 0 auto;
}

.date_inf {
	float: right;
	position: absolute;
	/* position: fixed; */
	top: 330px;
	left: 780px;
	width: 370px;
	height: 350px;
	border: 1px solid red;
	border-radius: 10px;
}

.comm_title {
	font-family: "돋움", dotum, "굴림", gulim, arial, helvetica, sans-serif;
	font-weight: 800;
	font-size: 40;
	width: 70%;
	float: left;
}

.detail_comm{
	width: 60%;
	float: left;
}

.main_left_img {
	width: 50%;
	height: 100%;
	background-color: red;
	float: left;
}

.main_right_img1 {
	width: 25%;
	height: 50%;
	background-color: blue;
	float: right;
}

.main_right_img2 {
	width: 25%;
	height: 50%;
	background-color: yellow;
	float: right;
}

.main_right_img3 {
	width: 25%;
	height: 50%;
	background-color: yellow;
	float: right;
}

.main_right_img4 {
	width: 25%;
	height: 50%;
	background-color: red;
	float: right;
}

.img_main {
	width: 100%;
	height: 100%;
}
</style>


<body>
	<div class="main_space">
		<div class="main_left_img">
			<img class="img_main" src="\whome\resources\imgFile\20200329000000200001.jpg">
		</div>
		<div class="main_right_img1">
			<img class="img_main" src="\whome\resources\imgFile\20200329000000200011.jpg">
		</div>
		<div class="main_right_img2">
			<img class="img_main" src="\whome\resources\imgFile\20200329000000200021.jpg">
		</div>
		<div class="main_right_img3">
			<img class="img_main" src="\whome\resources\imgFile\20200329000000200002.jpg">
		</div>
		<div class="main_right_img4">
			<img class="img_main" src="\whome\resources\imgFile\20200329000000200001.jpg">
		</div>
	</div>
	<div class="detail_comm_all">
		<div class="comm_title">The World Famous Seashell House ~ Casa Caracol</div>
		<div class='detail_comm'>${test_comm}
			<div>집 전체</div>
			<div>주택 전체를 단독으로 사용하시게 됩니다.</div>
			<div>높은 청결도</div>
			<div>최근 게스트 11명이 이 숙소가 티 없이 깨끗하다고 후기를 남겼습니다.</div>
			<div>1</div>
			<div>1</div>
			<div>1</div>
			<div>1</div>
			<div>1</div>
			<div>The world famous Seashell house is a gated property .
Your concierge is available next door to help you with tips and tricks
You will have a private pool, two king beds , kitchenette and BBQ and entire property, both shells . In shell wifi, air conditioning.
***If you have 5,6 people we have constructed a third shell with a king bed and full bath for an additional $99 per night.
Enjoy the rare interior like a celebrity as passers by will seek to look in with intrigued expressions.</div>
			<div>1</div>
			<div>1</div>
			<div>1</div>
			<div>1</div>
			<div>1</div>
			<div>1</div>
			<div>1</div>
			<div>1</div>
			<div>1</div>
			<div>1</div>
			<div>1</div>
			<div>1</div>
			<div>1</div>
			<div>1</div>
			<div>1</div>
			<div>1</div>
			<div>1</div>
			<div>1</div>
			<div>1</div>
			<div>1</div>
		</div>

		<div class="date_inf">
			<div style="font-size: 18px; width: 90%; margin: 5px auto; height: 15%;">요금을 확인하려면 날짜를 입력하세요.</div>
			<table style="margin: 5px auto; width: 90%; height: 80%;">
				<tr style="border-top: 1px solid #444444;">
					<td>날짜
						<table style=" width: 100%; height: 50%;">
							<tr>
								<td><input class="form-control" id="datepicker1" type="text" value="체크인" readonly></td>
								<td><div class="_1te61w" aria-hidden="true" role="presentation">
										<svg viewBox="0 0 24 24" role="presentation" aria-hidden="true" focusable="false" style="height: 24px; width: 24px; display: block; fill: currentcolor;">
<path d="m0 12.5a.5.5 0 0 0 .5.5h21.79l-6.15 6.15a.5.5 0 1 0 .71.71l7-7v-.01a.5.5 0 0 0 .14-.35.5.5 0 0 0 -.14-.35v-.01l-7-7a .5.5 0 0 0 -.71.71l6.15 6.15h-21.79a.5.5 0 0 0 -.5.5z" fill-rule="evenodd">
</path>
</svg>
									</div></td>
								<td><input class="form-control" id="datepicker2" type="text" value="체크아웃" readonly></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>게스트
						<table style="border: 1px solid #444444; width: 100%; height: 50%;">
							<tr>

							</tr>
						</table>
				</tr>
				<tr>
					<td><button type="button" class="btn btn-info" style="width: 100%; height: 80%">날짜입력</button></td>
				</tr>
			</table>
		</div>
	</div>



	<script src="<%=contextPath%>/resources/jquery/js/jquery-3.4.1.min.js"></script>
	<script src="<%=contextPath%>/resources/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="<%=contextPath%>/resources/bootstrap/js/jquery-ui.min.js"></script>
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

		$(function() {

			$(document).ready(function() {

				var scrollOffset = $('.date_inf').offset();

				$(window).scroll(function() {
					if ($(document).scrollTop() > 330) {
						$('.date_inf').css({
							   "position" : "fixed",
							   "top" : "30px",
							   "left" : "780px"
							})
					} else {
						$('.date_inf').css({
											   "position" : "absolute",
											   "top" : "330px",
											   "left" : "780px"
											})
					}
				});
			});

		});
		
		$(document).ready(function(){
			$.ajax({
				url : "<%=contextPath%>/homeDetailHome",
				type : 'post',
				data : {'user_email' : user_email , '_csrf' : csrf_token},
				success : function(result){
					$('#user_email').next().remove();
					if(result.resCode == 'E001'){
						$('#user_email').after('<p style ="font-size:0.8em;color:red;margin:8 0 0 0">아이디 : '+result.userID+'</p>');	
					}else{
						$('#user_email').after('<p style ="font-size:0.8em;color:red;margin:8 0 0 0">'+result.resMessage+'</p>');	
					}
				},
				error : function(xhr, status, error){
					alert(error);
				}
			})
		});
	</script>
</body>
</html>