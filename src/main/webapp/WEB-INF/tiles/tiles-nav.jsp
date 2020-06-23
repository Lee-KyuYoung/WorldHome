<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<style>
	@font-face { font-family: 'KHNPHU'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/KHNPHU.woff') format('woff'); font-weight: normal; font-style: normal; }
	@font-face { font-family: 'yg-jalnan'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.2/JalnanOTF00.woff') format('woff'); font-weight: normal; font-style: normal; }
	a,p,li,label,input,textarea,div,font,h2,h3,h4,h5{font-family:'KHNPHU', 'sans-serif';}
	.navbar-search-custom li{font-size:14px;cursor:pointer;}
	.navbar-search-custom ul{border-radius:15px;box-shadow: 2px 2px 4px #f2f2f2;-webkit-transition:.2s;-moz-transition:.2s;-ms-transition:.2s;-o-transition:.2s;transition:.2s; }
	.navbar-search-custom ul:hover{box-shadow:4px 4px 12px rgba(0, 0, 0, 0.1);}
	.navbar-search-custom li:first-child{border-radius:15px 0px 0px 15px !important}
	.navbar-search-custom li:last-child{border-radius:0px 15px 15px 0px !important}
	.navbar{position:fixed;width:100%;background-color:white;border-bottom:2px solid #f2f2f2;height:80px; padding:0px 30px 0px 30px !important;z-index:10;}
	.navbar-nav{margin:0 auto;}
	.navbar-nav a{color:#4d4d4d;font-weight:600}
	.wh_font font{color:#FF385C;font-size:28px !important;font-family:'yg-jalnan','sans-serif';}
	.wh_font:hover{color:#FF385C;}
	.navbar-join-custom li{font-size:14px;color:rgb(34, 34, 34);font-weight:800;cursor:pointer; border-radius:30px !important;border:1px solid rgba(0,0,0,.125) !important;box-shadow: 2px 2px 4px #f2f2f2;-webkit-transition:.2s;-moz-transition:.2s;-ms-transition:.2s;-o-transition:.2s;transition:.2s; }
	.navbar-join-custom li:first-child{margin-right:10px;}
	.navbar-join-custom li:hover{box-shadow:4px 4px 12px rgba(0, 0, 0, 0.1);}
	#spinner {display: none;position: fixed;left: 0px;top: 0px;width: 100%;height: 100%;z-index: 9999;-moz-opacity: 0.8;opacity: .70;filter: alpha(opacity=80);background: url('/whome/resources/imgFile/spinner.gif') 50% 50% no-repeat;}
	#searchModal{z-index:3000;}
	.home_search{box-shadow:2px 2px 12px #dee2e6}
	.home_search input[type=text]{border:0px;padding-left:0px;font-size:14px;}
	.home_search input:-moz-read-only {background-color: white;}
	.home_search input:read-only {background-color: white;}
</style>
		<nav class="navbar navbar-expand">
		  <a class="navbar-brand wh_font" href="<c:url value ='/'/>">
		    <font>World Home</font>
		  </a>
		  <div class="collapse navbar-collapse navbar-search-custom" id="collapsibleNavbar">
			<ul class="navbar-nav list-group list-group-horizontal" data-toggle="modal" data-target="#searchModal">
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
			        <a class="dropdown-item" href="<c:url value='/reservation/list'/>">나의 예약</a>
			        <a class="dropdown-item" href="<c:url value ='/logout'/>">로그아웃</a>
			      </div>
			    </li>
			  </ul>
			</c:otherwise>	
		</c:choose>
	</nav>
 	<!-- The Modal -->
	 <div class="modal fade" id="searchModal">
	   <div class="modal-dialog modal-xl">
	     <div class="modal-content">
	     
	       <!-- Modal Header -->
	       <div class="modal-header" style="border:0px;">
	         <h4 class="modal-title">숙소 검색</h4>
	         <button type="button" class="close" data-dismiss="modal">&times;</button>
	       </div>
	       <!-- Modal body -->
	       <div class="modal-body">
	       		<form action="<c:url value='/'/>" method="get" id="home_search_form">
	       			<input type = "hidden" id = "page_no" name = "page_no">
		       		<div class="col-md-12 home_search" style="border:1px solid #dee2e6;border-radius:10px;">
		       			<div class = "row" style="margin-top:0px;">
		       				<div class="col-md-4" style="padding:15px 0px 15px 0px; border-radius:10px;">
		       					<div class="col-md-12" style="font-size:12px;text-align:left">지역</div>
		       					<div class="col-md-12"><input type ="text" class="form-control" id="area" name="area" placeholder="시 ,구를 입력해주세요."></div>
		       				</div>
		       				<div class="col-md-4" style="padding:15px 0px 15px 0px; border-radius:10px;">
		       					<div style="border-right:1px solid #dee2e6;border-left:1px solid #dee2e6;">
			       					<div class="col-md-12" style="font-size:12px;text-align:left">예약 가능한 날짜</div>
			       					<div class="col-md-12"><input type ="text" class="form-control" id="reserv_d" name="reserv_d" placeholder="클릭해주세요." readonly></div>
		       					</div>
		       				</div>
		       				<div class="col-lg-3 col-md-4" style="padding:15px 0px 15px 0px; border-radius:10px;">
								<div class="col-md-12" style="font-size:12px;text-align:left">인원</div>
		       					<div class="col-md-12"><input type ="text" class="form-control" id="reserv_p" name="reserv_p" placeholder="인원을 입력해주세요."></div>
		       				</div>
		       				<div class="col-xl-1" style="padding:20px 0px 15px 0px; border-radius:10px;">
								<button class="btn btn-danger" id="home_serach_btn">
								<i class="fas fa-search" style="color:white;font-size:12px;"></i> 검색
								</button>
		       				</div>
		       			</div>
		       		</div>
	       		</form>
	       </div>
	       <!-- Modal footer -->
	       <div class="modal-footer" style="border:0px;">
	
	       </div>
	     </div>
	   </div>
	 </div>
	<div id="spinner"></div>
	<div style="height:80px;"></div>
	<script>
	$(document).ready(function(){
		
		setNavbar();
		
		$(window).resize(function(){
			setNavbar();
		});
		
		var date = new Date();
		var year = date.getFullYear();
		var month = date.getMonth() + 1;
		var day = date.getDate();
		
		//date range pircker
		$('input[name="reserv_d"]').daterangepicker({
			autoUpdateInput: false,
		    "locale": {
		        "format": "YYYY/MM/DD",
		        "separator": "~",
		        "applyLabel": "적용",
		        "cancelLabel": "취소",
		        "daysOfWeek": ["일", "월", "화", "수", "목", "금", "토" ],
		        "monthNames": ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
		        "firstDay": 1
		    },
		    "minDate" : year+"/"+month+"/"+day
		});
		
		$('input[name="reserv_d"]').on('apply.daterangepicker', function(ev, picker) {
		     $(this).val(picker.startDate.format('YYYY/MM/DD') + '~' + picker.endDate.format('YYYY/MM/DD'));
		 });
		
		//모달 초기화
	    $("#searchModal").on('show.bs.modal', function () {

		 });
		
	    //숙소 검색
	    $('#home_serach_btn').on('click',function(){
	    	$('#home_search_form').submit();
	    });
	});	
	
	function setNavbar(){
		
		var area = "${area}";
		var reserv_d = "${reserv_d}";
		var reserv_p = "${reserv_p}";
		
		$('#area').val(area);
		$('#reserv_d').val(reserv_d);
		$('#reserv_p').val(reserv_p);
		
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

	