<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page session="true"%>
<%
	String contextPath = request.getContextPath();
%>
<html>
<head>
<title>Insert title here</title>
<link href="<%=contextPath%>/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=contextPath%>/resources/bootstrap/css/jquery-ui.css" rel="stylesheet">  
<style type="text/css">
.navbar-nav {
	/* display: table; */
	margin-left: auto;
	margin-right: auto;
}

.modal-dialog {
	max-width: 100%;
	margin: 0px;
	width: 100%;
}

.modal-content {
	width: 100%;
}

.ui-datepicker {
	font-size: 20px;
	width: 400px;
	height: 300px;
}

#menu_guest{
	width:100%; 
	height:100%; 
	padding:100px; 
	text-align:center;
}
.guest_div{
	width:300px; 
	height:80%; 
	display:inline-block;
	border-left: 4px solid #bcbcbc;
	border-right: 4px solid #bcbcbc;
	padding-top: 20px;
}


.tab-content{
	height: 350px;
}
body {
margin: 0;
height: 100%;
}

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

.main_space {
	width: 100%;
	height: 50%;
}

.detail_comm_all{
	width: 70%;
	margin: 0 auto;
}

.detail_comm_div {
	float: left;
	width: 70%;
	display: inline
}

.comm_title {
	font-family: "돋움", dotum, "굴림", gulim, arial, helvetica, sans-serif;
	font-weight: 800;
	font-size: 40;
	width: 70%;
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
</head>
<body>
	<header>
		<nav class="navbar navbar-expand-sm bg-light navbar-light">
			<div class = "homeLogo"style="cursor:pointer"><img src= "\whome\resources\img\homeMark.png" width="50px" height="50px"></div>
			<ul class="navbar-nav">
				<div class="btn-group" data-toggle="modal" data-target="#myModal">
					<button type="button" class="btn btn-primary">여행지 추가</button>
					<button type="button" class="btn btn-primary">날짜추가</button>
					<button type="button" class="btn btn-primary">게스트 추가</button>
				</div>
			</ul>
		</nav>
	</header>

	<!-- The Modal -->
	<div class="modal fade" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<!-- Nav tabs -->
					<ul class="nav nav-tabs">
						<li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#menu_add"> 여행지 </a></li>
						<li class="nav-item" id="chk_tab"><a class="nav-link" data-toggle="tab" href="#menu_chk">체크인 체크아웃</a></li>
						<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#menu_guest">게스트 추가</a></li>
					</ul>
					<!-- Nav tabs end-->
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>

				<!-- Modal body -->
				<!-- Tab panes -->
				<div class="tab-content">
					<div id="menu_add" class="container tab-pane active">
						<br>
						<h3>여행지 검색</h3>
						<div class="form-group">
							<input type="text" class="form-control form-control-lg" placeholder="여행지를 입력해 주세요." id="text01">
						</div>
					</div>
					<div id="menu_chk" class="container tab-pane fade">
						<div id="chk_in_date" style="float: left; width: 50%; display: inline;">체크인</div>
						<div id="chk_out_date" style="float: right; width: 50%; display: inline;">체크아웃</div>
					</div>
					<div id="menu_guest" class="contai ner tab-pane fade">
						<div class ="guest_div">
							<div class="_5afswi" aria-live="polite">만13세 이상의 성인</div>
							
							<button class="adult_down" type="button" aria-label="값 내리기" aria-describedby="subtitle-label-stepper-adults" style="margin-top: 10px;">
								<svg viewBox="0 0 24 24" role="presentation" aria-hidden="true" focusable="false" style="height: 22px; width: 22px; display: block; fill: currentcolor;">
									<rect height="2" rx="1" width="12" x="6" y="11"></rect>
								</svg>
							</button>
							<!-- <div class="adult_age" style="display : inline; text-align:center;"> -->
								<div class = "people_cnt" style="font-size:25px; display : inline;">0</div>
							<!-- </div> -->
							<button class="adult_up" type="button" aria-label="값 올리기" aria-describedby="subtitle-label-stepper-adults">
								<svg viewBox="0 0 24 24" role="presentation" aria-hidden="true" focusable="false" style="height: 22px; width: 22px; display: block; fill: currentcolor;">
									<rect height="2" rx="1" width="12" x="6" y="11"></rect>
									<rect height="12" rx="1" width="2" x="11" y="6"></rect>
									</svg>
							</button>
							
						</div>
					</div>
				</div>
				<!-- Modal footer -->
				<div class="modal-footer" style="background-color: white;">
					<div>
						<button type="button" class="close" id="closeBut01">×</button>
					</div>
					<div class="search_add"></div>
					<div>
						<button type="button" class="close" id="closeBut02">×</button>
					</div>
					<div class="search_date"></div>
					<div>
						<button type="button" class="close" id="closeBut03">×</button>
					</div>
					<div class="search_guest"></div>
					
					<form name="homeListDomain" method="post">
					    <input type="hidden" name="homeAdd" id = "homeAdd">
 						<input type="hidden" name="homeDateIn" id = "homeDateIn">
 						<input type="hidden" name="homeDateOut" id = "homeDateOut">
 						<input type="hidden" name="homeGuest" id = "homeGuest">
					</form>
						<button class="btn btn-danger" id="homeSearch" data-dismiss="modal">search</button>
					
					
				</div>
			</div>
			




		</div>
	</div>
	<!-- Modal Header end-->