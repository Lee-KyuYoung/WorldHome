<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix = "spring" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page session="true" %>

<html>
<head>
	<title></title>
	<style type="text/css">
		.home_img div{padding:0px;}
		.home_img_group1{height:500px;border:1px solid #484848;overflow:hidden;}
		.home_img_group2{height:500px;}
		.home_img_group2 div{border:1px solid #484848;overflow:hidden;}
		.home_img_group3{height:500px;}
		.home_img_group3 div{border:1px solid #484848;overflow:hidden;}
 		.home_img img{width:100%;height:100%;-webkit-transform:scale(1);-moz-transform:scale(1);-ms-transform:scale(1); -o-transform:scale(1); transform:scale(1);-webkit-transition:.2s;-moz-transition:.2s;-ms-transition:.2s;-o-transition:.2s;transition:.2s;} 
/* 		.home_img img{display: inline-block; min-width: 100%; min-height: 100%; -ms-interpolation-mode: bicubic; */
/* 		-webkit-transform:scale(1);-moz-transform:scale(1);-ms-transform:scale(1); -o-transform:scale(1); transform:scale(1);-webkit-transition:.2s;-moz-transition:.2s;-ms-transition:.2s;-o-transition:.2s;transition:.2s;} */
 		.home_img img:hover{cursor:pointer;-webkit-transform:scale(1.1);-moz-transform:scale(1.1);-ms-transform:scale(1.1);-o-transform:scale(1.1);transform:scale(1.1);transition-delay: 0.1s;}
 		.container{margin-top:30px;}
 		.comm{ font-family:sans-serif !important; font-size: 32px !important; font-weight: 800; line-height: 1.125em; color: rgb(72, 72, 72); padding-top: 6px; padding-bottom: 6px; margin-bottom: 10px;}
        .home_info p{display:inline-block; font-size: 16px; font-weight: 500; line-height: 1.375em; color: rgb(72, 72, 72); margin:0px 15px 0px 0px;}
        .home_info div{padding:0px}
        .home_info i{font-size:17px; color:#FF385C;}
        .home_info_title{margin-bottom:20px;font-size:20px;font-weight:bold;}
        #load_map{width:100%;height:400px;margin-top:20px}
        .container-fluid{width:100%;margin:0px 0px 20px 0px;}
        .reserv_form{margin:20px 0px 20px 0px;}
        .reserv_form p{margin-bottom:5px;font-size:14px;color:rgb(72, 72, 72);}
        .reserv_form label{font-size:12px; font-weight:700;color:rgb(72, 72, 72);margin-bottom:2px;}
        .margin-bottom10{margin-bottom:10px;}
        .margin-bottom40{margin-bottom:40px;}
        .margin-top20{margin-top:20px;}
        .margin-top10{margin-top:10px;}
        .margin-top40{margin-top:40px;}
        .m-tb30{margin:30px 0px 30px 0px;}
        .user_profile img{width:65px; height:65px; border-radius:50%;}
        .user_profile p{margin:0px;color:rgb(118, 118, 118);font-size:14px;}
        .reserv_div{position:sticky;position: -webkit-sticky;top:120px;border:1px solid #f2f2f2;border-radius:10px;box-shadow:4px 4px 10px #f2f2f2,-4px -4px 10px #f2f2f2;}
        .no-margin{margin:0px;}
        .no-padding{padding:0px;}
        .progress{height:3px;}
        .user-img-info{vertical-align:middle;padding-top:11px;margin-left:10px;}
        .user-img-info p:first-child{color:black;font-weight:bold;}
        .user-img-info p:last-child{font-size:13px;}
        .h-review p{font-size:15px;font-weight:100;color:black;line-height:25px;}
        .input-review{width:100%;border-top:0px;border-right:0px;border-left:0px;}
        .input-review:focus{outline:none;border-bottom:2px solid black;}
	     #star_grade i{cursor:pointer;color:gray;font-size:17px;}
	     #star_grade i.on{color:#FF385C;}
	     .start_rate{display:none;}

	</style>
<body>
	<div class="container-fluid">
		<div class = "row home_img">
			<div class = "col-xl-6 col-md-8 home_img_group1">
				<img src = "/img/${homeDetailInfo.HOME_IMG_PATH1}" id="home_img_1">
			</div>
			<div class = "col-xl-3 col-md-4 home_img_group2">
				<div class = "col-xl-12" style="height:50%;">
					<img src = "/img/${homeDetailInfo.HOME_IMG_PATH2}" id ="home_img_2">
				</div>
				<div class = "col-xl-12" style="height:50%;">
					<img src = "/img/${homeDetailInfo.HOME_IMG_PATH3}" id="home_img_3">
				</div>
			</div>
			<div class = "col-xl-3 home_img_group3">
				<div class = "col-xl-12" style="height:50%;">
					<img src = "/img/${homeDetailInfo.HOME_IMG_PATH4}" id="home_img_4">
				</div>
				<div class = "col-xl-12" style="height:50%;">
					<img src = "/img/${homeDetailInfo.HOME_IMG_PATH5}" id="home_img_5">
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-lg-8 home_info">
				<div class="col-12">
					<div class ="row" style="margin:0px;">
						<div class="col-10">
							<h2 class="comm">${homeDetailInfo.HOME_TITLE}</h2>
							<p>${homeDetailInfo.HOME_RANGE}</p> 
							<p>인원 ${homeDetailInfo.MAX_GUEST}명</p>
							<p>침대 ${homeDetailInfo.BED_CNT}개</p>
							<p>욕실 ${homeDetailInfo.BATHROOM_CNT}개</p>
						</div>
						<div class="col-2 user_profile" style="text-align:center">
							<div>
								<a href ="javascript:moveUserProfile();">
									<c:choose>
										<c:when test="${!empty userInfo.userImg}">
											<img src = "/user_img/${userInfo.userImg}">		
										</c:when>
										<c:otherwise>
											<img src = "\whome\resources\img\profile_default.jpg">										
										</c:otherwise>
									</c:choose>
								</a>
							</div>
							<p>${homeDetailInfo.USR_ID}</p>
						</div>
					</div>
				</div>
				<hr>
				<div class="col-12 m-tb30">
					<h5 class="home_info_title">숙소 위치</h5>
					<p>
						${homeDetailInfo.HOME_ADD_1}
						<c:if test = "${!empty homeDetailInfo.HOME_ADD_2}"> / ${homeDetailInfo.HOME_ADD_2}</c:if>
					</p>
					<div id="load_map"></div>
				</div>
				<hr>
				<div class="col-12 m-tb30">
					<h5 class="home_info_title">편의 시설</h5> 
					<div class="row" style="margin:0px;">
						<c:forEach var = "code_1" items ="${homeCodeList}"> 
							<c:if test ="${code_1.codeNum eq 11 }">
								<c:forEach var = "code_2" items = "${homeFacility}">
									<c:if test = "${code_1.codeKey eq  code_2}">
										<div class="col-3 margin-bottom10">
											<p><i class="fas fa-caret-right"></i> ${status.index} ${code_1.codeComment}</p>
										</div>		
									</c:if>
								</c:forEach>
							</c:if>
						</c:forEach>
					</div>
				</div>
				<div class="col-12 margin-top40">
					<h5 class="home_info_title">안전 시설</h5> 
					<div class="row" style="margin:0px;">
						<c:forEach var = "code_1" items ="${homeCodeList}"> 
							<c:if test ="${code_1.codeNum eq 12 }">
								<c:forEach var = "code_2" items = "${homeFacility}">
									<c:if test = "${code_1.codeKey eq  code_2}">
										<div class="col-3 margin-bottom10">
											<p><i class="fas fa-caret-right"></i> ${status.index} ${code_1.codeComment}</p>
										</div>		
									</c:if>
								</c:forEach>
							</c:if>
						</c:forEach>
					</div>
				</div>
				<div class="col-12 margin-top40">
					<h5 class="home_info_title">사용 가능한 공간</h5> 
					<div class="row" style="margin:0px;">
						<c:forEach var = "code_1" items ="${homeCodeList}"> 
							<c:if test ="${code_1.codeNum eq 13 }">
								<c:forEach var = "code_2" items = "${homeFacility}">
									<c:if test = "${code_1.codeKey eq  code_2}">
										<div class="col-3 margin-bottom10">
											<p><i class="fas fa-caret-right"></i> ${status.index} ${code_1.codeComment}</p>
										</div>		
									</c:if>
								</c:forEach>
							</c:if>
						</c:forEach>
					</div>
				</div>
				<hr class="profile_hr">
				<div class="col-12  m-tb30">
					<div class = "row" style = "margin:0px;">
						<div class = "col-10">
							<h5 class="home_info_title">호스트 : ${homeDetailInfo.USR_ID}님</h5>
							<p>회원 가입  :
								<fmt:parseDate value="${userInfo.userRegData}" var="regdate" pattern="yyyy-MM-dd"/>
								<fmt:formatDate value="${regdate}" type="date" dateStyle="LONG"/>
							</p>
							<p><i class="fa fa-star" style="color:#FF385C;"></i> <font class="star_rate">0.0 ( 0개 )</font></p>
						</div>
						<div class="col-2 user_profile">
							<div>
								<a href ="javascript:;">
									<c:choose>
										<c:when test="${!empty userInfo.userImg}">
											<img src = "/user_img/${userInfo.userImg}">		
										</c:when>
										<c:otherwise>
											<img src = "\whome\resources\img\profile_default.jpg">										
										</c:otherwise>
									</c:choose>
								</a>
							</div>
						</div>
					</div>
					<div class = "col-12 margin-top20">
						<p>${userInfo.userIntroduce}</p>
					</div>
				</div>
				<hr>
				<div class="col-12 m-tb30">
					<h5 class="home_info_title">유의 사항</h5> 
					<div class="row" style="margin:0px;">
						<c:forEach var = "code_1" items ="${homeCodeList}"> 
							<c:if test ="${code_1.codeNum eq 22}">
								<c:forEach var = "code_2" items = "${homePrecautions}">
									<c:if test = "${code_1.codeKey eq  code_2}">
										<div class="col-6 margin-bottom10">
											<p><i class="fas fa-caret-right"></i> ${status.index} ${code_1.codeComment}</p>
										</div>		
									</c:if>
								</c:forEach>
							</c:if>
						</c:forEach>
					</div>
				</div>
				<div class="col-12 margin-top40">
					<h5 class="home_info_title">게스트가 지켜야할 규칙</h5> 
					<div class="row" style="margin:0px;">
						<c:forEach var = "code_1" items ="${homeCodeList}"> 
							<c:if test ="${code_1.codeNum eq 21}">
								<c:forEach var = "code_2" items = "${homeGuestRule}">
									<c:if test = "${code_1.codeKey eq  code_2}">
										<div class="col-6 margin-bottom10">
											<p><i class="fas fa-caret-right"></i> ${status.index} ${code_1.codeComment}</p>
										</div>		
									</c:if>
								</c:forEach>
							</c:if>
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="col-lg-4">
				<div class="col-12 reserv_div">
					<form class="reserv_form">
						<div class="col-12">
							<p class=""><strong>₩<fmt:formatNumber type="number" value="${homeDetailInfo.ROW_AMT}"/></strong> / 1박</p>
							<p style="font-size:12px;"><i class="fa fa-star" style="color:#FF385C;"></i> 5.0 ( 후기 3개 )</p><hr>
						</div>
						<div class="col-12">
							<label>날짜</label>
							<input type ="text" class="form-control">
						</div>
						<div class="col-12">
							<label>인원</label>
							<input type ="number" class="form-control">
						</div>
						<div class="col-12 margin-top20">
							<div class="row" style="font-size:15px;font-weight:500;color:rgb(72, 72, 72);">
								<div class="col-6">
									<p>숙소</p>
								</div>
								<div class="col-6">
									<div class="float-right">
										<p>₩2,78500</p>
									</div>
								</div>
							</div>
						</div>
						<div class="col-12">
							<div class="row" style="font-size:15px;font-weight:500;color:rgb(72, 72, 72);">
								<div class="col-6">
									<p>서비스 수수료</p>
								</div>
								<div class="col-6">
									<div class="float-right">
										<p>₩2,78500</p>
									</div>
								</div>
							</div>
						</div>
						<div class="col-12">
							<div class="row" style="font-size:15px;font-weight:500;color:rgb(72, 72, 72);">
								<div class="col-6">
									<p>총 합계</p>
								</div>
								<div class="col-6">
									<div class="float-right">
										<p>₩2,78500</p>
									</div>
								</div>
							</div>
							<hr>
						</div>
						<div class="col-12">
							<input type = "button" class="btn btn-info btn-block" value="예약하기">
						</div>
						<div class="col-12 margin-top20" style="text-align:center;">
							<label>예약 확정 전에는 요금이 청구되지 않습니다.<br>일부 예약에는 보증금이 있을 수 있습니다.</label>
						</div>
					</form>
				</div>
			</div>			
		</div>
		</div>
		<div class="container"><hr>
			<div class="row">
				<div class="col-lg-12 home_info margin-top20">
					<h5 class="home_info_title in-block">후기 <i class="fa fa-star" style="color:#FF385C;"></i><font class="star_rate"> 0.0 ( 0개 )</font></h5>
				</div>
			</div>
			<div class="row start_rate">
				<div class = "col-md-6">
					<div class ="row">
						<div class="col-6">
							<p>청결도</p>
						</div>
						<div class="col-6">
							<div class = "row">
								<div class = "float-left col-10" style="margin-top:10px">
									<div class="progress">
										<div class="progress-bar bg-dark" style="width:0%;"></div>
									</div>
								</div>
								<div class = "col-2 no-padding rate_cl" style="text-align:left">
									<p style="font-size:14px;line-height:28px;">0</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class = "col-md-6">
					<div class ="row">
						<div class="col-6">
							<p>정확성</p>
						</div>
						<div class="col-6">
							<div class = "row">
								<div class = "float-left col-10" style="margin-top:10px">
									<div class="progress">
										<div class="progress-bar bg-dark" style="width:0%;"></div>
									</div>
								</div>
								<div class = "col-2 no-padding rate_a" style="text-align:left">
									<p style="font-size:14px;line-height:28px;">0</p>
								</div>
							</div>
						</div>
					</div>
				</div>	
				<div class = "col-md-6">
					<div class ="row">
						<div class="col-6">
							<p>의사소통</p>
						</div>
						<div class="col-6">
							<div class = "row">
								<div class = "float-left col-10" style="margin-top:10px">
									<div class="progress">
										<div class="progress-bar bg-dark" style="width:0%;"></div>
									</div>
								</div>
								<div class = "col-2 no-padding rate_c" style="text-align:left">
									<p style="font-size:14px;line-height:28px;">0</p>
								</div>
							</div>
						</div>
					</div>
				</div>	
				<div class = "col-md-6">
					<div class ="row">
						<div class="col-6">
							<p>위치</p>
						</div>
						<div class="col-6">
							<div class = "row">
								<div class = "float-left col-10" style="margin-top:10px">
									<div class="progress">
										<div class="progress-bar bg-dark" style="width:0%;"></div>
									</div>
								</div>
								<div class = "col-2 no-padding rate_l" style="text-align:left">
									<p style="font-size:14px;line-height:28px;">0</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class = "col-md-6">
					<div class ="row">
						<div class="col-6">
							<p>체크인</p>
						</div>
						<div class="col-6">
							<div class = "row">
								<div class = "float-left col-10" style="margin-top:10px">
									<div class="progress">
										<div class="progress-bar bg-dark" style="width:0%;"></div>
									</div>
								</div>
								<div class = "col-2 no-padding rate_ci" style="text-align:left">
									<p style="font-size:14px;line-height:28px;">0</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class = "col-md-6">
					<div class ="row">
						<div class="col-6">
							<p>가격 대비 만족도</p>
						</div>
						<div class="col-6">
							<div class = "row">
								<div class = "float-left col-10" style="margin-top:10px">
									<div class="progress">
										<div class="progress-bar bg-dark" style="width:0%;"></div>
									</div>
								</div>
								<div class = "col-2 no-padding rate_s" style="text-align:left">
									<p style="font-size:14px;line-height:28px;">0</p>
								</div>
							</div>
						</div>
					</div>
				</div>						
			</div>
			<div class="row h-review margin-bottom40">
				
			</div>
			<div class = "row justify-content-center">
				<div class = "paging">

				</div>
			</div>
			<c:if test = "${!empty sessionScope.user_info }">
				<div class="row margin-top40">
					<div class="col-lg-12 home_info margin-top20">
						<div class = "row no-margin">
							<h5 class="home_info_title in-block" style="margin-right:10px;">후기 작성</h5>
							<p>( 아래의 항목들을 평가해 주시고 후기를 작성해 주세요. )</p>
						</div>
					</div>
				</div>
				<div class="row review">
					<form id = "review_form">
						<div class = "col-12">
							<div class = "row">
								<div class = "col-md-6">
									<div class ="row">
										<div class="col-6">
											<p>청결도</p>
										</div>
										<div class="col-6">
											<div class = "float-right">
												<div id="star_grade">
											        <i class="fa fa-star on" role="1"></i>
											        <i class="fa fa-star on" role="2"></i>
											        <i class="fa fa-star on" role="3"></i>
											        <i class="fa fa-star on" role="4"></i>
											        <i class="fa fa-star on" role="5"></i>
												</div>
												<input type = "hidden" id = "cleanliness" name = "cleanliness" value="5">
											</div>
										</div>
									</div>
								</div>
								<div class = "col-md-6">
									<div class ="row">
										<div class="col-6">
											<p>정확성</p>
										</div>
										<div class="col-6">
											<div class = "float-right">
												<div id="star_grade">
											        <i class="fa fa-star on" role="1"></i>
											        <i class="fa fa-star on" role="2"></i>
											        <i class="fa fa-star on" role="3"></i>
											        <i class="fa fa-star on" role="4"></i>
											        <i class="fa fa-star on" role="5"></i>
												</div>
												<input type = "hidden" id = "accuracy" name = "accuracy" value="5">
											</div>
										</div>
									</div>
								</div>
								<div class = "col-md-6">
									<div class ="row">
										<div class="col-6">
											<p>의사소통</p>
										</div>
										<div class="col-6">
											<div class = "float-right">
												<div id="star_grade">
											        <i class="fa fa-star on" role="1"></i>
											        <i class="fa fa-star on" role="2"></i>
											        <i class="fa fa-star on" role="3"></i>
											        <i class="fa fa-star on" role="4"></i>
											        <i class="fa fa-star on" role="5"></i>
												</div>
												<input type = "hidden" id = "communication" name = "communication" value="5">
											</div>
										</div>
									</div>
								</div>
								<div class = "col-md-6">
									<div class ="row">
										<div class="col-6">
											<p>위치</p>
										</div>
										<div class="col-6">
											<div class = "float-right">
												<div id="star_grade">
											        <i class="fa fa-star on" role="1"></i>
											        <i class="fa fa-star on" role="2"></i>
											        <i class="fa fa-star on" role="3"></i>
											        <i class="fa fa-star on" role="4"></i>
											        <i class="fa fa-star on" role="5"></i>
												</div>
												<input type = "hidden" id = "location" name = "location" value="5">
											</div>
										</div>
									</div>
								</div>
								<div class = "col-md-6">
									<div class ="row">
										<div class="col-6">
											<p>체크인</p>
										</div>
										<div class="col-6">
											<div class = "float-right">
												<div id="star_grade">
											        <i class="fa fa-star on" role="1"></i>
											        <i class="fa fa-star on" role="2"></i>
											        <i class="fa fa-star on" role="3"></i>
											        <i class="fa fa-star on" role="4"></i>
											        <i class="fa fa-star on" role="5"></i>
												</div>
												<input type = "hidden" id = "check_in" name = "check_in" value="5">
											</div>
										</div>
									</div>
								</div>
								<div class = "col-md-6">
									<div class ="row">
										<div class="col-6">
											<p>가격 대비 만족</p>
										</div>
										<div class="col-6">
											<div class = "float-right">
												<div id="star_grade">
											        <i class="fa fa-star on" role="1"></i>
											        <i class="fa fa-star on" role="2"></i>
											        <i class="fa fa-star on" role="3"></i>
											        <i class="fa fa-star on" role="4"></i>
											        <i class="fa fa-star on" role="5"></i>
												</div>
												<input type = "hidden" id = "satisfaction" name = "satisfaction" value="5">
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class = "col-12 margin-top20">
							<div class = "row">
								<div class="col-md-1 user_profile">
									<c:choose>
										<c:when test="${!empty sessionScope.user_info.userImg and sessionScope.user_info.userImg ne ''}">
											<img src = "/user_img/${sessionScope.user_info.userImg}">		
										</c:when>
										<c:otherwise>
											<img src = "\whome\resources\img\profile_default.jpg">										
										</c:otherwise>
									</c:choose>
								</div>
								<div class = "col-lg-11">
<!-- 									<textarea rows="1" class="form-control"></textarea> -->
									<input type = "text" class = "input-review" id="home_review" name="home_review" placeholder="후기 남기기..." style = "border-top:0px;border-right:0px;border-left:0px;">
									<div class="float-right margin-top10">
										<input type = "button" class = "btn btn-danger"  id="cancle_review_btn" value = "취소">
										<input type = "button" class = "btn btn-primary" id="reg_review_btn" value = "등록">
									</div>
								</div>
							</div>
						</div>
						<input type = "hidden" id ="home_id" name = "home_id" value = "${homeDetailInfo.HOME_ID}">
						<input type = "hidden" name = "user_id" value = "${homeDetailInfo.USR_ID}">
						<input type = "hidden" name = "review_id" value = "${sessionScope.user_info.user_id}">
					</form>
				</div>
			</c:if>
		</div>
		<div style="height:300px;">
		</div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3514c018ea159141b84061e35f47b501&libraries=services"></script>
	<script>
		$(document).ready(function(){
			
			var resErrorCode = "${errorCode}";
			if(resErrorCode != ''){
				if(resErrorCode == 'E101' || resErrorCode == 'E102'){
					alert('잘못된 접근입니다.');
				}else if(resErrorCode == 'E103'){
					alert('잠시 후 다시 시도해 주세요.');
				}
				location.href = "./";
			}else{
				//초기화
				initHomeDetailForm();
			}
			
			
			//윈도우 창 크기에 따라 숙소 이미지 개수 변경
			$(window).resize(function(){
				var width = $(window).width();
				if(width <= 1182 ){
					$('.home_img_group3').hide();
				}else if(width > 1182){
					$('.home_img_group3').show();
				}
				if(width <= 750){
					$('.home_img_group2').hide();
				}else{
					$('.home_img_group2').show();
				}
			});

			//숙소 이미지 hover시 이미지 밝기 조절
			$('.home_img img').hover(function(evt){
				$('.home_img img').css('filter','brightness(50%)');
				var obj = evt.target;
				$(obj).css('filter','brightness(100%)');
			},function(){
				$('.home_img img').css('filter','brightness(100%)');				
			});
			
			
			//별점 세팅
			$('#star_grade i').click(function(){
	            $(this).parent().children("i").removeClass("on"); 
	            $(this).addClass("on").prevAll("i").addClass("on"); 
	            var score = $(this).attr('role');
	            $(this).parent().next().val(score);
	        });
			
			$('#home_review').on('keydown',function(event){
				 if (event.keyCode === 13) {
				    event.preventDefault();
				  };
			});
			
			//리뷰 등록
			$('#reg_review_btn').on('click', function(){
				
				if($('#home_review').val() == ''){
					alert('후기를 작성해 주세요.');
					$('#home_review').focus();
					return false;
				}

				$.ajax({
					url : '<c:url value="/reservation/insertReview"/>',
					data : $('#review_form').serialize(),
					type : 'POST',
					success : function(resData){
						
						if(resData.resCode == ''){
							$('#home_review').val('');
							//리뷰 그리기
							setReviewList();
						}
						else{
							alert('일시적인 오류가 발생하였습니다.\n잠시 후 다시 시도해 주세요.')
						}
					},
					error : function(){
						
					},
					beforeSend : function(xhr){
						xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
						$('#spinner').show();
					},
					complete : function(){
						$('#spinner').hide();
					}
				});
			});
			
			//리뷰 등록 취소
			$('#cancle_review_btn').on('click',function(){
				$('#home_review').val('');
			});
			
			
			
		});

		
		//ajax로 리뷰 그려주기
		function setReviewList(page){
			
			var home_id = "${homeDetailInfo.HOME_ID}";
			
			$.ajax({
				url : '<c:url value="/reservation/getReviewList"/>', 
				data : {'home_id' : home_id , 'page_no' : page},
				type : 'POST',
				success : function(resData){
					
					var html = '';
					
					if(resData.review_list.length == 0){
						
						html =  '<div class = "col-md-12">'+
									'<div class = "col-12 margin-top20" style="text-align:center;">'+
										'<h4 style="">등록된 후기가 없습니다.</h4>'+
									'</div>'+
								'</div>';
					}else{
						
						//별점 그래프 
						$('.start_rate').css('display','flex');
						
						//벌점, 후기 개수 적기
						$('.star_rate').text(' '+resData.star_rate.TOTAL_RATE+' ( '+resData.star_rate.TOTAL_COUNT+'개 )');
						
						$('.h-review').empty();		
						$.each(resData.review_list , function(i,o){

						    html +=	'<div class = "col-md-6 margin-top20">' +
											'<div class ="col-12 user_profile margin-top20">' +
												'<div class = "row">';

							if(o.userImg != ''){
								html +=             '<img src = "/user_img/'+o.userImg+'">';
							}
							else{
								html +=             '<img src = "/whome/resources/img/profile_default.jpg">';
							}
													
						    	html +=	        '<div class ="user-img-info">'+
													'<p><strong>'+o.reviewID+'</strong></p>' +
													'<p>'+o.strRegDate+'</p>' +
												'</div>'+
											'</div>'+
										 '</div>' +
									'<div class = "col-12 margin-top20">' +
										'<div class = "row" style="word-wrap:break-word; word-break:break-all;">'+
											'<p>'+o.reviewComm+'</p>'+
										'</div>'+
									'</div>'+
								'</div>';
						});
						
						//별점 그래프 그리기
						var rate_obj = {
							'rate_cl' : resData.star_rate.RATE_CL,
							'rate_a' : resData.star_rate.RATE_A,
							'rate_c' : resData.star_rate.RATE_C,
							'rate_l' : resData.star_rate.RATE_L,
							'rate_ci' : resData.star_rate.RATE_CI,
							'rate_s' : resData.star_rate.RATE_S
						};
						
						var keys = Object.keys(rate_obj);
						
						for( var i in keys){
							$('.'+keys[i]).children('p').text(rate_obj[keys[i]]);
							$('.'+keys[i]).parent().find('.progress-bar').css('width',rate_obj[keys[i]]*20+'%');
						}
						
						//페이징 처리
						$('.paging').empty();
				
						var paging = ''
						
						if(resData.paging.pageNo > resData.paging.firstPageNo){
							paging += '<a href="javascript:setReviewList('+resData.paging.prevPageNo+')"><i class="fas fa-angle-left"></i></a>'; 			
						}
							paging +=   	'<ul>';
												for(var i = resData.paging.startPageNo; i <= resData.paging.endPageNo; i++){
													
													if(i == resData.paging.pageNo){
														paging += '<li><a class="paging-active">'+i+'</a></li>';				
													}else{
														paging += '<li><a href="javascript:setReviewList('+i+')">'+i+'</a></li>';					
													}
												}
							paging +=	    '</ul>';

						if(resData.paging.pageNo < resData.paging.finalPageNo){
							paging += '<a href="javascript:setReviewList('+resData.paging.nextPageNo+')"><i class="fas fa-angle-right"></i></a>'; 			
						}
						
					    $('.paging').append(paging);
					}
					 $('.h-review').append(html);
				},
				error : function(xhr , status , error){
					
				},
				beforeSend : function(xhr){
					xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				}
			});
		}
		
		//유저 프로필 클릭 시 소개페이지로 스크롤
		function moveUserProfile(){
			var profile_offset = $('.profile_hr').offset();
			$('html, body').animate({scrollTop : profile_offset.top - 100}, 500);
		}
		
		//폼 초기화
		function initHomeDetailForm(){
			//지도 그리기
			var address = '${homeDetailInfo.HOME_ADD_1}';
			searchAddressLatLng(address);
			
			//title 변경
			var title = '${homeDetailInfo.HOME_TITLE}';
			$(document).attr('title',title);
			
			//후기불러오기
			setReviewList(1);
		}
		
		//카카오맵 할 때 카카오 디벨로퍼 사이트에서 도메인을 설정해줘함 
		//맵 초기화
		function initKaKaoMap(){
		
			var load_map = document.getElementById('load_map');
			var options = {
					center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
					level: 3
				};
			var map = new kakao.maps.Map(load_map, options);
			var marker = new daum.maps.Marker({ position: new daum.maps.LatLng(33.450701, 126.570667), map: map });

			return map;
		}
		
		//카카오맵에 주소에 맞는 좌표에 마커 찍기
		function searchAddressLatLng(address){
			
			var map = initKaKaoMap();
			var geocoder = new kakao.maps.services.Geocoder();
            geocoder.addressSearch(address , function(result , status){
            	
            	if(status === kakao.maps.services.Status.OK) {
            		
            		var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
					var marker = new kakao.maps.Marker({
						map : map,
						position : coords
					});
					map.setZoomable(false);    
					map.setCenter(coords);
            	}
            });
		}
	</script>
</body>
</html>




