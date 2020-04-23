<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix = "spring" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
 		.comm{ font-family: Circular, -apple-system, BlinkMacSystemFont, Roboto, "Helvetica Neue", sans-serif !important; font-size: 32px !important; font-weight: 800; line-height: 1.125em; color: rgb(72, 72, 72); padding-top: 6px; padding-bottom: 6px; margin-bottom: 10px;}
        .home_info p{display:inline-block;font-family: Circular, -apple-system, BlinkMacSystemFont, Roboto, "Helvetica Neue", sans-serif !important; font-size: 16px; font-weight: 500; line-height: 1.375em; color: rgb(72, 72, 72); margin:0px 15px 0px 0px;}
        .home_info div{padding:0px}
        .home_info i{font-size:17px; color:#484848;}
        .home_info_title{margin-bottom:20px;font-size:18px;font-weight:900;}
        #load_map{width:100%;height:400px;margin-top:20px}
        .container-fluid{width:100%;margin:0px 0px 20px 0px;}
        .reserv_form{margin:20px 0px 20px 0px;}
        .reserv_form p{margin-bottom:5px;font-size:14px;color:rgb(72, 72, 72);font-family: Circular, -apple-system, BlinkMacSystemFont, Roboto, "Helvetica Neue", sans-serif !important;}
        .reserv_form label{font-size:12px; font-weight:700;color:rgb(72, 72, 72);margin-bottom:2px;}
        .margin-bottom10{margin-bottom:10px;}
        .margin-top20{margin-top:20px;}
        .margin-top40{margin-top:40px;}
        .m-tb30{margin:30px 0px 30px 0px;}
        .user_profile{text-align:center;}
        .user_profile img{width:65px; height:65px; border-radius:50%;}
        .user_profile p{margin:0px;color:rgb(118, 118, 118);font-size:14px;}
        
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
				<hr>
				<div class="col-12  m-tb30">
					<div class = "row" style = "margin:0px;">
						<div class = "col-10">
							<h5 class="home_info_title">호스트 : ${homeDetailInfo.USR_ID}님</h5>
							<p>회원 가입  :
								<fmt:parseDate value="${userInfo.userRegData}" var="regdate" pattern="yyyy-MM-dd"/>
								<fmt:formatDate value="${regdate}" type="date" dateStyle="LONG"/>
							</p>
							<p><i class="fa fa-star" style="color:#FF385C;"></i> 후기 1,024개</p>
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
				<hr>
			</div>
			<div class="col-lg-4">
				<div class="col-12 reserv_div" style="border:1px solid #e4e4e4">
					<form class="reserv_form">
						<div class="col-12">
							<p class=""><strong>￦<fmt:formatNumber type="number" value="${homeDetailInfo.ROW_AMT}"/></strong> / 1박</p>
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
										<p>￦2,78500</p>
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
										<p>￦2,78500</p>
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
										<p>￦2,78500</p>
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
		<div style="height:1000px;">
		
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
			
			//스크롤 위치에 따라 예약폼 fixed or relative
// 			var form_offset = $('.home_info').offset();
// 			$(window).scroll(function(){
// 				scroll_position = $(window).scrollTop();
// 				if( scroll_position > form_offset.top - 20){
// 					$('.reserv_div').css('position','fixed').css('top','50px').css('right','100px').css('width','350px');
// 				}else{
// 					$('.reserv_div').css('position','relative').css('top','0px').css('right','0px');
// 				}
// 			});

			//숙소 이미지 hover시 이미지 밝기 조절
			$('.home_img img').hover(function(evt){
				$('.home_img img').css('filter','brightness(50%)');
				var obj = evt.target;
				$(obj).css('filter','brightness(100%)');
			},function(){
				$('.home_img img').css('filter','brightness(100%)');				
			});

		});
		
		//폼 초기화
		function initHomeDetailForm(){
			var address = '${homeDetailInfo.HOME_ADD_1}';
			searchAddressLatLng(address);
			var title = '${homeDetailInfo.HOME_TITLE}';
			$(document).attr('title',title);
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



