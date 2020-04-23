<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<style>

	.navbar-search-custom li{font-size:14px;color:rgb(113, 113, 113);cursor:pointer;}
	.navbar-search-custom ul{border-radius:15px;box-shadow: 2px 2px 4px #f2f2f2;-webkit-transition:.2s;-moz-transition:.2s;-ms-transition:.2s;-o-transition:.2s;transition:.2s; }
	.navbar-search-custom ul:hover{box-shadow:4px 4px 12px rgba(0, 0, 0, 0.1);}
	.navbar-search-custom li:first-child{border-radius:15px 0px 0px 15px !important}
	.navbar-search-custom li:last-child{border-radius:0px 15px 15px 0px !important}
	.navbar{position:fixed;width:100%;background-color:white;border-bottom:2px solid #f2f2f2;height:80px; padding:0px 30px 0px 30px !important;z-index:3333;;}
	.navbar-nav{margin:0 auto;}
	.navbar-nav a{color:#4d4d4d;font-weight:600}
	.wh_font{color:#FF385C;font-size:23px !important;font-weight:1000}
	.wh_font:hover{color:#FF385C;}
	.navbar-join-custom li{font-size:14px;color:rgb(34, 34, 34);font-weight:800;cursor:pointer; border-radius:30px !important;border:1px solid rgba(0,0,0,.125) !important}
	.navbar-join-custom li{box-shadow: 2px 2px 4px #f2f2f2;-webkit-transition:.2s;-moz-transition:.2s;-ms-transition:.2s;-o-transition:.2s;transition:.2s; }
	.navbar-join-custom li:first-child{margin-right:10px;}
	.navbar-join-custom li:hover{box-shadow:4px 4px 12px rgba(0, 0, 0, 0.1);}
		#spinner {
	    display: none;
	    position: fixed;
		left: 0px;
		top: 0px;
		width: 100%;
		height: 100%;
		z-index: 9999;
		-moz-opacity: 0.8;
	    opacity: .70;
	    filter: alpha(opacity=80);
		background: url('/whome/resources/imgFile/spinner.gif') 50% 50% no-repeat;
	}
</style>
<!-- 		<nav class="navbar navbar-expand-sm bg-light navbar-light"> -->
<%-- 			<div class = "homeLogo"><a href = "<c:url value ='/'/>"><img src= "\whome\resources\img\homeMark.png" width="50px" height="50px"></a></div> --%>
<!-- 			<ul class="navbar-nav"> -->
<!-- 				<div class="btn-group" data-toggle="modal" data-target="#myModal"> -->
<!-- 					<button type="button" class="btn btn-primary">여행지 추가</button> -->
<!-- 					<button type="button" class="btn btn-primary">날짜추가</button> -->
<!-- 					<button type="button" class="btn btn-primary">게스트 추가</button> -->
<!-- 				</div> -->
<!-- 			</ul> -->
<!-- 		</nav> -->

		<nav class="navbar navbar-expand">
		  <a class="navbar-brand wh_font" href="<c:url value ='/'/>">
		    <font>World Home</font>
		  </a>
		  <div class="collapse navbar-collapse navbar-search-custom" id="collapsibleNavbar">
			<ul class="navbar-nav list-group list-group-horizontal">
			  <li class="list-group-item" >여행지 추가</li>
			  <li class="list-group-item">날짜 추가</li>
			  <li class="list-group-item">게스트 추가</li>
			  <li class="list-group-item"><i class="fas fa-search" style="color:#FF385C"></i></li>
			</ul>
		  </div>
		<c:choose>
			<c:when test = "${empty sessionScope.user_info}">
				<div class="navbar-join-custom">
					<ul class="navbar-nav list-group">
					  <li class="list-group-item" onclick = "location.href='<c:url value="/user/join"/>'">회원가입</li>
					  <li class="list-group-item" onclick = "location.href='<c:url value="/login"/>'">로그인</li>
					</ul>
				</div>
			</c:when>
			<c:otherwise>
			  <ul class="navbar-nav">
			    <!-- Dropdown -->
			    <li class="nav-item dropdown">
			      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
			        ${sessionScope.user_info.user_id}님 환영합니다.
			      </a>
			      <div class="dropdown-menu">
			        <a class="dropdown-item" href="<c:url value='/user/modify'/>">회원 정보수정</a>
			        <a class="dropdown-item" href="<c:url value='/management/homeReg'/>">숙소 등록</a>
			        <a class="dropdown-item" href="<c:url value ='/logout'/>">로그아웃</a>
			      </div>
			    </li>
			  </ul>
			</c:otherwise>	
		</c:choose>
	</nav>
	<div id="spinner"></div>
	<div style="height:80px;"></div>
	<!-- The Modal -->
	<div class="modal fade" id="myModal">
		<div class="modal-dialog nav-modal">
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
<!-- 					<div> -->
<!-- 						<button type="button" class="close" id="closeBut01">×</button> -->
<!-- 					</div> -->
<!-- 					<div class="search_add"></div> -->
<!-- 					<div> -->
<!-- 						<button type="button" class="close" id="closeBut02">×</button> -->
<!-- 					</div> -->
<!-- 					<div class="search_date"></div> -->
<!-- 					<div> -->
<!-- 						<button type="button" class="close" id="closeBut03">×</button> -->
<!-- 					</div> -->
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
	<script>
	$(document).ready(function(){
		
		setNavbar();
		
		$(window).resize(function(){
			setNavbar();
		});
	});	
	
	function setNavbar(){
		
		var width = $(window).width();
		
		if(width <= 716){
			$('.dropdown').css('display','none');
			$('.navbar-join-custom').css('display','none');
		}else {
			$('.dropdown').css('display','list-item');
			$('.navbar-join-custom').css('display','block');
		}
		
		if(width <= 526){
			$('.navbar-brand font').css('display','none');
		}else{
			$('.navbar-brand font').css('display','block');
		}
		
		if(width <= 850){
			$('.navbar-brand font').text('WH')
		}else{
			$('.navbar-brand font').text('World Home')
		}
	}
	</script>
	<!-- Modal Header end-->
