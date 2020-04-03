<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix = "spring" %>
<%@ page session="true" %>
<%String contextPath = request.getContextPath(); %>

<html>
<head>
	<title>숙소 등록하기</title>
	<link href = "<%=contextPath%>/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<style type="text/css">
		p{margin:20 0 10 0;font-size:16px;color:#767676;font-weight:bold}
		.progress_info{color:#767676;margin-top:40px;margin-bottom:20px;font-weight:bold;}
		.progress{margin-bottom:30px;}
		.margin-top20{margin-top:20px;}
		.content{margin:0 auto;}
		#load_map_wrapper{display:none;}
		#load_map{width:630px;height:300px;}

	</style>
<body>
	<div class="container">
		<h4 class="progress_info">3단계 : 숙소의 위치</h4>
		<div class="progress">
	  		<div class="progress-bar" role="progressbar" style="width: 40%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">40%</div>
		</div>
	
		<div class="row">
			<div class="col-sm-7 content">
				<form id="registration_step3_form">
					<h4>숙소의 위치를 입력하세요.</h4>
					<p>주소</p>
					<div class = "row">
						<div class="col-sm-10">
							<div class="input-group">
								<input type="text" class="form-control" id="user_address_1" name="user_address_1" readonly>
								<div class="input-group-append">
									<button class="btn btn-outline-secondary btn-sm" type="button" id="address_search"><spring:message code="join.info.J112"/></button><!-- 주소검색 -->
								</div>
							</div>						
						</div>
					</div>
					<p>나머지 주소 ( 선택사항 )</p>
					<div class="row">
						<div class = "col-sm-10">
							<input type="text" class="form-control" id="user_address_2" name="user_address_2" placeholder = "예 ) 105동 606호">
						</div>
					</div>
					<p>우편번호</p>
					<div class="row">
						<div class = "col-sm-4">
							<input type="text" class="form-control" id="user_postcode" name="user_postcode" readonly>
						</div>
					</div>
					<div class="row">
						<div class = "col-sm-10" id = "load_map_wrapper">
							<p>해당 위치가 정확한가요?</p>
							<div id = "load_map">
							
							</div>
						</div>
					</div>
					<div class = "row margin-top20">
						<div class="col-sm-12">
							<div class = "btn-toolbar float-left">
								<input type = "button" class = "btn btn-secondary" value = "뒤로" id="back">
							</div>
							<div class = "btn-toolbar float-right">
								<input type = "button" class = "btn btn-info" value = "계속" id="home_reg_step3_btn">
							</div>
						</div>
					</div>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" id = "csrf_token"/>
				</form>
			</div>
		</div>
	</div>
	<script src = "<%=contextPath%>/resources/jquery/js/jquery-3.4.1.min.js"></script>
	<script src = "<%=contextPath%>/resources/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3514c018ea159141b84061e35f47b501&libraries=services"></script>
	<script>
		$(document).ready(function(){
			
			$('#home_reg_step3_btn').on('click',function(){
				
				var reg_step3 = $('#registration_step3_form').serialize();
				$.ajax({
					url : '../homeRegProcStep3',
					type : 'POST',
					data : reg_step3,
					success : function(result){
						alert(result.resCode);
						location.href = './step4';
					},
					error : function(xhr , status , error){
						alert(error);
					}
				});
			});
			
			$('#address_search').on('click' , function(){
				getAddress('user_address_1','user_address_2','user_postcode');
			});
		});
		
		//주소검색
		function getAddress(addr_field_1, addr_field_2, postcode_field){
			 new daum.Postcode({
		            oncomplete: function(data) {
		
		                var fullAddr = ''; 
		                var extraAddr = ''; 
		
		                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
		                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		                    fullAddr = data.roadAddress;
		
		                } else { // 사용자가 지번 주소를 선택했을 경우(J)
		                    fullAddr = data.jibunAddress;
		                }
		
		                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
		                if(data.userSelectedType === 'R'){
		                    //법정동명이 있을 경우 추가한다.
		                    if(data.bname !== ''){
		                        extraAddr += data.bname;
		                    }
		                    // 건물명이 있을 경우 추가한다.
		                    if(data.buildingName !== ''){
		                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                    }
		                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
		                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
		                }
		
		                $('#'+addr_field_1).val(fullAddr);
		                $('#'+postcode_field).val(data.zonecode);
		                $('#'+addr_field_2).focus();
		                
		                searchAddressLatLng(data.address);
		            }
		        }).open();	
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
					map.setCenter(coords);
            	}
            });
            document.getElementById('load_map_wrapper').style.display = 'block';
		}
		
		
		
	</script>
</body>
</html>

