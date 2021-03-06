<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix = "spring" %>
<%@ page session="true" %>
<html>
<head>
	<title>숙소 등록하기</title>
	<style type="text/css">
		p{margin:20 0 10 0;font-size:16px;color:#767676;font-weight:bold}
		.progress_info{color:#767676;margin-top:40px;margin-bottom:20px;font-weight:bold;}
		.progress{margin-bottom:30px;}
		.margin-top20{margin-top:20px;}
		.margin-bottom20{margin-bottom:20px;}
		.content{margin:0 auto;}
		.margin-bottom100{margin-bottom:100px;}
	</style>
<body>
	<div class="container">
		
		<h4 class="progress_info">2단계 : 기본사항 입력</h4>
		<div class="progress">
	  		<div class="progress-bar" role="progressbar" style="width: 20%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">20%</div>
		</div>
	
		<div class="row">
			<div class="col-sm-7 content">
				<form id="registration_step2_form">
					<h4>등록하실 숙소의 종류를 선택해주세요.</h4>
					<p>종류1</p>
					<div class="row margin-bottom20">
						<div class = "col-sm-6">
							<select class="form-control" id = "home_type1" name = "home_type1" onchange = "createHomeTypeSelectBox(this.value)">
								<option value = "">선택하세요</option>
								<c:forEach var = "list" items = "${codeList}">
									<option value = "${list.codeNum}/${list.codeSubGroupKey}/${list.codeKey}" ${list.codeKey eq home_type1 ? 'selected="selected"' : ''}>${list.codeComment}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<p>종류2</p>
					<div class="row">
						<div class = "col-sm-6">
							<select class="form-control" id = "home_type" name = "home_type2">
								<option>종류1을 선택해주세요</option>
							</select>
						</div>
					</div>
					<div class="row margin-top20">
						<div class = "col-sm-10">
							<p>게스트가 묵게 될 숙소의 유형을 골라주세요</p>
							<div class="custom-control custom-radio">
								<input type="radio" class="custom-control-input" id="home_range1" name="home_range" value="1" checked>
							    <label class="custom-control-label" for="home_range1">
								    <strong>집 전체</strong><br>
								       게스트가 숙소 전체를 다른 사람과 공유하지 않고 단독으로 이용합니다.<br>일반적으로 침실, 욕실, 부엌이 포함됩니다
							    </label>
							</div>
							<div class="custom-control custom-radio margin-top20">
								<input type="radio" class="custom-control-input" id="home_range2" name="home_range" value="2">
							    <label class="custom-control-label" for="home_range2">
								     <strong>개인실</strong><br>
									 게스트에게 개인 침실이 제공됩니다.<br>침실 이외의 공간은 공용일 수 있습니다.
							    </label>
							</div>
							<div class="custom-control custom-radio margin-top20">
								<input type="radio" class="custom-control-input" id="home_range3" name="home_range" value="3">
							    <label class="custom-control-label" for="home_range3">
									<strong>다인실</strong><br>
									게스트는 개인 공간 없이, 다른 사람과 함께 쓰는 침실이나 공용 공간에서 숙박합니다.
								</label>
							</div>
						</div>
					</div>
					<div class="row margin-top20">
						<div class = "col-sm-10">
							<p>게스트만 사용하도록 만들어진 숙소인가요?</p>
							<div class="custom-control custom-radio">
								<input type="radio" class="custom-control-input" id="is_only_guest1" name="is_only_guest" value="1" checked>
							    <label class="custom-control-label" for="is_only_guest1">
								    <strong>예. 게스트전용으로 마련된 숙소입니다.</strong>
							    </label>
							</div>
							<div class="custom-control custom-radio margin-top20">
								<input type="radio" class="custom-control-input" id="is_only_guest2" name="is_only_guest" value="2">
							    <label class="custom-control-label" for="is_only_guest2">
									<strong>아니요. 제 개인 물건이 숙소에 있습니다.</strong>
							    </label>
							</div>
						</div>
					</div>
					<div class = "row margin-top20 margin-bottom100">
						<div class="col-sm-12">
							<div class = "btn-toolbar float-left">
								<input type = "button" class = "btn btn-secondary" value = "뒤로" id="prev_step_2_btn">
							</div>
							<div class = "btn-toolbar float-right">
								<input type = "button" class = "btn btn-info" value = "계속" id="home_reg_step2_btn">
							</div>
						</div>
					</div>
					<input type="hidden" name="homeid" id = "homeid" value="${homeid}">
					<input type="hidden" name="flag" id = "flag" value="${flag}">
				</form>
			</div>
		</div>
	</div>
	<script>

		$(document).ready(function(){
			
			initStep2Form();
			var homeid = $('#homeid').val();
			
			//스탭2 등록
			$('#home_reg_step2_btn').on('click',function(){
				
				var home_type1 = $('#home_type1').val();
				var home_type2 = $('#home_type2').val();
				
				if(home_type1 == ''){
					alert('종류1을 선택해 주세요');
					$('#home_type1').focus();
					return false;
				}else if(home_type2 == ''){
					$('#home_type2').focus();
					return false;
				}
				
				var reg_step2 = $('#registration_step2_form').serialize();
								
				$.ajax({
					url : '<c:url value="/management/homeRegProcStep2"/>',
					type : 'POST',
					data : reg_step2,
					success : function(result){
						if(result.resCode == ""){
							if('${flag}' == 'reg'){
								location.href = '<c:url value="/management/homeReg/step03?homeid='+homeid+'"/>'
							}else{
								location.href = '<c:url value="/management/homeMod/step03?homeid='+homeid+'"/>'
							}
						}else{
							alert(result.resCode);
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
			
			$('#prev_step_2_btn').on('click',function(){
				location.href = './step01?homeid='+homeid;
			});

		});
		
		//이미 등록된 데이터가 있으면
		function initStep2Form(){
			
			const home_range = "${homeInfo.homeRange}";
			const isOnlyGuest = "${homeInfo.homeIsOnlyGuest}";
			const home_type1 = '${home_type1}';
			const home_type2 = '${home_type2}';
			
			if(home_type1 != ''){
				createHomeTypeSelectBox($('#home_type1').val());
				$('#home_type').val(home_type2).prop('selected',true);
			}

			if(home_range == '1'){
				$('#home_range1').prop('checked',true);
			}else if(home_range == '2'){
				$('#home_range2').prop('checked',true);
			}else if(home_range == '3'){
				$('#home_range3').prop('checked',true);
			}
			
			if(isOnlyGuest == '1'){
				$('#is_only_guest1').prop('checked',true);
			}else if(isOnlyGuest == '2'){
				$('#is_only_guest2').prop('checked',true);
			}
		}
		
		//집 유형 1 선택 시 집 유형2 뿌려주기
		function createHomeTypeSelectBox(value){
			
			if(value == ''){
				$('#home_type').empty();
				$('#home_type').append($('<option>').text("종류1을 선택해주세요").attr("value",""));
				return false;
			}
			
			$.ajax({ 
				url : '<c:url value="/admin/getCodeDefine"/>',
				type : 'POST',
				data : { 'group_key' : value , 'code_type' : 'sub' , '_csrf' : '${_csrf.token}'},
				async : false,
				success : function(result){
					$('#home_type').empty();
					$.each(result, function(index,object){
						$('#home_type').append($('<option>').text(object.codeComment).attr("value",object.codeKey));
					});	
				},
				error : function(xhr, status ,error){
					alert(xhr+" "+status+" "+error);
				}
			});
			
		}
		
	</script>
</body>
</html>


