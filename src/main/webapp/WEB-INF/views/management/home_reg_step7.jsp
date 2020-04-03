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
		p{margin:0 0 10 0;font-size:16px;color:#767676;font-weight:bold}
		.word_limit{margin:5 0 10 0;font-size:16px;color:#767676;font-weight:bold}
		.progress_info{color:#767676;margin-top:40px;margin-bottom:20px;font-weight:bold;}
		.progress{margin-bottom:30px;}
		.margin-top20{margin-top:20px;}
		.margin-bottom20{margin-bottom:20px}
		.margin-top10{margin-top:10px;}
		.content{margin:0 auto;}
 		form-inline label{padding:0px;justify-content:left !important;} 
     	.inline_block_float_right{display:inline-block;float:right;} 
		.no_padding{padding:0px;}
	</style>
<body>
	<div class="container">
		<h4 class="progress_info">7단계 : 숙소 규칙</h4>
		<div class="progress">
	  		<div class="progress-bar" role="progressbar" style="width: 85%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">85%</div>
		</div>
		<div class="row">
			<div class="col-sm-7 content">
				<form id="registration_step7_form">
					<h4>게스트가 지켜야 할 숙소 이용규칙을 선택하세요</h4>
					<div class="row margin-top20">
						<div class="form-inline form-group col-sm-12" >
							<div class="col-sm-4 no_padding">
								<p>반려동물 동반 가능</p>
							</div>
						    <div class="col-sm-8">
						    	<div class="inline_block_float_right">
									<div class="custom-control custom-radio custom-control-inline">
										<input type="radio" class="custom-control-input" id = "animal_permission_Y" name="optradio">
										<label class="custom-control-label" for = "animal_permission_Y">Y</label>
									</div>
									<div class="custom-control custom-radio custom-control-inline">
										<input type="radio" class="custom-control-input" id = "animal_permission_N" name="optradio">
										<label class="custom-control-label" for = "animal_permission_N">N</label>
									</div>
								</div>
							</div>
					    </div>
						<div class="form-inline form-group col-sm-12" >
							<div class="col-sm-4 no_padding">
								<p>흡연 가능</p>
							</div>
						    <div class="col-sm-8">
						    	<div class="inline_block_float_right">
									<div class="custom-control custom-radio custom-control-inline">
										<input type="radio" class="custom-control-input" id = "animal_permission_Y" name="optradio">
										<label class="custom-control-label" for = "animal_permission_Y">Y</label>
									</div>
									<div class="custom-control custom-radio custom-control-inline">
										<input type="radio" class="custom-control-input" id = "animal_permission_N" name="optradio">
										<label class="custom-control-label" for = "animal_permission_N">N</label>
									</div>
								</div>
							</div>
					    </div>
						<div class="form-inline form-group col-sm-12" >
							<div class="col-sm-4 no_padding">
								<p>행사나 파티 허용</p>
							</div>
						    <div class="col-sm-8">
						    	<div class="inline_block_float_right">
									<div class="custom-control custom-radio custom-control-inline">
										<input type="radio" class="custom-control-input" id = "animal_permission_Y" name="optradio">
										<label class="custom-control-label" for = "animal_permission_Y">Y</label>
									</div>
									<div class="custom-control custom-radio custom-control-inline">
										<input type="radio" class="custom-control-input" id = "animal_permission_N" name="optradio">
										<label class="custom-control-label" for = "animal_permission_N">N</label>
									</div>
								</div>
							</div>
					    </div>
					</div>
					<h4>게스트가 숙소에 대해 알아두어야 할 세부 사항</h4>
					<div class="row margin-top20">
						<div class = "col-sm-10">
							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input" id="home_range1" name="home_range" value="1">
							    <label class="custom-control-label" for="home_range1">필수 품목</label>
							</div>
							<div class="custom-control custom-checkbox margin-top20">
								<input type="checkbox" class="custom-control-input" id="home_range1" name="home_range" value="1">
							    <label class="custom-control-label" for="home_range1">무선 인터넷</label>
							</div>
							<div class="custom-control custom-checkbox margin-top20">
								<input type="checkbox" class="custom-control-input" id="home_range1" name="home_range" value="1">
							    <label class="custom-control-label" for="home_range1">TV</label>
							</div>
							<div class="custom-control custom-checkbox margin-top20">
								<input type="checkbox" class="custom-control-input" id="home_range1" name="home_range" value="1">
							    <label class="custom-control-label" for="home_range1">에어컨</label>
							</div>
							<div class="custom-control custom-checkbox margin-top20">
								<input type="checkbox" class="custom-control-input" id="home_range1" name="home_range" value="1">
							    <label class="custom-control-label" for="home_range1">다리미</label>
							</div>
						</div>
					</div>
					<div class = "row margin-top20">
						<div class="col-sm-12">
							<div class = "btn-toolbar float-left">
								<input type = "button" class = "btn btn-secondary" value = "뒤로" id="prev_step_7_btn">
							</div>
							<div class = "btn-toolbar float-right">
								<input type = "button" class = "btn btn-info" value = "계속" id="home_reg_step7_btn">
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
	<script>
		$(document).ready(function(){
			
			$('#home_reg_step7_btn').on('click',function(){
				
				var reg_step1 = $('#registration_step7_form').serialize();
				$.ajax({
					url : '../homeRegProcStep6',
					type : 'POST',
					data : reg_step1,
					success : function(result){
						alert(result.resCode);
						location.href = './step8';
					},
					error : function(xhr , status , error){
						alert(error);
					}
				});
			});
		});
		
		//글자 수 제한 체크
		function wordLimitCheck(obj , limit_num){
			var word_count = $(obj).val().length;
			if(word_count > limit_num){
				$(obj).next().text('( '+word_count+' / '+limit_num+' ) 글자가 '+limit_num+'자 이상 초과 되었습니다!').css('color','red');	
			}else{
				$(obj).next().text('( '+word_count+' / '+limit_num+' )').css('color','#767676');	
			}
		}
		
		var home_img_count = 1;
		function imgView(f){
			
			var file = f.files; 
			var reader = new FileReader(); 
			var img_count = $('input[type="file"]').length;
			var current_index = $('input[type="file"]').index($(f));
			
			//이미지는 5개로 제한을 둔다.
			//current_index + 1 == img_count는 새롭게 추가되는 이미지 요소
			if(img_count >= 6 && current_index + 1 == img_count){
				alert('이미지는 최대 5개 등록 가능합니다.');
				return false;
			}				
			
			reader.onload = function(rst){
				
				$(f).parent().css('background-image','url('+rst.target.result+')').css('background-size','100% 100%').css('border','0px');
				$(f).parent().find('input[type="button"]').remove(); // 이미지를 다시 선택할 경우 버튼 지우고 만들기
				$(f).after('<input type = "button" class = "btn btn-danger" value = "삭제" onclick="deleteHomeDetailImg(this)">');
				
				//새로운 이미지 추가 시 만들어주기 
				if(current_index + 1 == img_count){ 
					$(f).parent().parent().after('<div class = "col-md-6 margin-top20">' +
	                        '<label class="img_view" for="img_file_'+home_img_count+'" id="test">'+
	                            '<input type="file" id="img_file_'+home_img_count+'" name="home_detail_img" accept="image/*" onchange="imgView(this)">' +
	                        '</label>' +
	                    '</div>');	
				}
			}
			home_img_count += 1;
			reader.readAsDataURL(file[0]); 
		}
		
		function deleteHomeDetailImg(btn){
			$(btn).parent().parent().remove();
		}
	</script>
</body>
</html>

