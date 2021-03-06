<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix = "spring" %>
<%@ page session="true" %>
<%String contextPath = request.getContextPath(); %>

<html>
<head>
	<title>숙소 등록하기</title>
	<style type="text/css">
		.title_p{margin:20 0 5 0;font-size:16px;color:#767676;font-weight:bold}
		.progress_info{color:#767676;margin-top:40px;margin-bottom:20px;font-weight:bold;}
		.progress{margin-bottom:30px;}
		.margin-top20{margin-top:20px;}
		.margin-bottom20{margin-bottom:20px;}
		.content{margin:0 auto;}
		#load_map_wrapper{display:none;} 
 		#load_map{width:100%;height:400px;} 
 		.info_p{margin:20 0 5 0;font-size:16px;color:red;font-weight:bold}
		.margin-bottom100{margin-bottom:100px;}
	</style>
<body>
	<div class="container">
		<h4 class="progress_info">1단계 : 숙소의 위치</h4>
		<div class="progress">
	  		<div class="progress-bar" role="progressbar" style="width: 0%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">0%</div>
		</div>
		<div class="row">
			<div class="col-sm-7 content">
				<form id="registration_step1_form">
					<h4>숙소의 위치를 입력하세요.</h4>
					<p class ="title_p">주소</p>
					<div class = "row margin-bottom20">
						<div class="col-sm-10">
							<div class="input-group">
								<input type="text" class="form-control" id="user_address_1" name="user_address_1" value = "${homeInfo.homeAddr1}" readonly>
								<div class="input-group-append">
									<button class="btn btn-outline-secondary btn-sm" type="button" id="address_search"><spring:message code="join.info.J112"/></button><!-- 주소검색 -->
								</div>
							</div>						
						</div>
					</div>
					<p class ="title_p">나머지 주소 ( 선택사항 )</p>
					<div class="row margin-bottom20">
						<div class = "col-sm-10">
							<input type="text" class="form-control" id="user_address_2" name="user_address_2" value = "${homeInfo.homeAddr2}" placeholder = "예 ) 105동 606호">
						</div>
					</div>
					<p class ="title_p">우편번호</p>
					<div class="row margin-bottom20">
						<div class = "col-sm-4">
							<input type="text" class="form-control" id="user_postcode" name="user_postcode" value = "${homeInfo.homePostCode}" readonly>
						</div>
					</div>
					<div class="row">
						<div class = "col-sm-12" id = "load_map_wrapper">
							<p class = "info_p">해당 위치가 정확한가요?</p>
							<div id = "load_map">
							
							</div>
						</div>
					</div>
					<div class = "row margin-top20 margin-bottom100">
						<div class="col-sm-12">
							<div class = "btn-toolbar float-left">
								<input type = "button" class = "btn btn-secondary" value = "뒤로" id="prev_step_1_btn">
							</div>
							<div class = "btn-toolbar float-right">
								<input type = "button" class = "btn btn-info" value = "계속" id="home_reg_step1_btn">
							</div>
						</div>
					</div>
					<input type="hidden" name="sigungu" id = "sigungu">
					<input type="hidden" name="homeid" id = "homeid" value="${homeid}">
					<input type="hidden" name="flag" id = "flag" value="${flag}">
					<input type="hidden" name="latitude" id="latitude">
					<input type="hidden" name="longitude" id="longitude">
				</form>
			</div>
		</div>
	</div>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3514c018ea159141b84061e35f47b501&libraries=services"></script>
	<script>
		$(document).ready(function(){

			initStep1Form();
			
			//1단계 등록
			$('#home_reg_step1_btn').on('click',function(){
				
				var user_address_1 = $('#user_address_1').val();
				var reg_step1 = $('#registration_step1_form').serialize();
				var homeid = $('#homeid').val();
				
				if(user_address_1 == ''){
					alert('주소를 검색해 주세요.');
					return false;
				}
				
				$.ajax({  
					url : '<c:url value="/management/homeRegProcStep1"/>', 
					type : 'POST',
					data : reg_step1,
					success : function(result){
						if(result.resCode =='E001'){
							if(homeid == 'undefined'|| homeid == ''){
								homeid = result.homeID;
							}
							if('${flag}' == 'reg'){
								location.href = '<c:url value="/management/homeReg/step02?homeid='+homeid+'"/>'	
							}else{
								location.href = '<c:url value="/management/homeMod/step02?homeid='+homeid+'"/>'
							}
						}else{
							alert("잠시 후 다시 시도해주세요.");
						}
					}, 
					error : function(xhr , status , error){
						alert(error);
					},
					beforeSend : function(xhr){
						 xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
					}
				});
			});
			
			//뒤로가기
			$('#prev_step_1_btn').on('click',function(){
				location.href = "../homeReg";
			});
			
			//주소검색
			$('#address_search').on('click' , function(){
				getAddress('user_address_1','user_address_2','user_postcode');
			});
		});
		
		
		function initStep1Form(){
			var homeAddr = "${homeInfo.homeAddr1}";
			if(homeAddr != ''){
				searchAddressLatLng(homeAddr);
			}
		}
		
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
		
		                $('#sigungu').val(data.sido+" "+data.sigungu)
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
			
			var zoomControl = new kakao.maps.ZoomControl();
			map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

			return map;
		}
		
		//카카오맵에 주소에 맞는 좌표에 마커 찍기
		function searchAddressLatLng(address){
			
			document.getElementById('load_map_wrapper').style.display = 'block';
			
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
					
					$('#latitude').val(result[0].y);
					$('#longitude').val(result[0].x);
            	}
            });
		}
</script>
</body>
</html>

