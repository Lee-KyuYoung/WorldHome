<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix = "spring" %>
<%@ page session="true" %>
<%String contextPath = request.getContextPath(); %>

<html>
<head>
	<title>숙소 등록하기</title>
	<style type="text/css">
		p{margin:20 0 10 0;font-size:16px;color:#767676;font-weight:bold}
		.word_limit{margin:5 0 10 0;font-size:16px;color:#767676;font-weight:bold}
		.progress_info{color:#767676;margin-top:40px;margin-bottom:20px;font-weight:bold;}
		.progress{margin-bottom:30px;}
		.margin-top20{margin-top:20px;}
		.margin-bottom20{margin-bottom:20px}
		.margin-top10{margin-top:10px;}
		.content{margin:0 auto;}
		.img_view{width:100%;height:200px;border:2px dashed #c2c2d6;border-radius:5px;margin-top:20px;background-image:url('../../resources/img/img_upload.png');background-size:30% 45%;background-repeat:no-repeat;background-position:center center;}
		.img_view:hover{cursor:pointer;border-color:black;}
		input[type="file"]{width:100%;display:none};
	</style>
<body>
	<div class="container">
		<h4 class="progress_info">6단계 : 숙소 소개</h4>
		<div class="progress">
	  		<div class="progress-bar" role="progressbar" style="width: 85%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">85%</div>
		</div>
		<div class="row">
			<div class="col-sm-7 content">
				<form id="registration_step6_form">
					<h4>숙소에 대한 설명을 적어주세요</h4>
					<div class="row margin-bottom20">
						<div class = "col-md-12">
							<p>숙소의 특징과 장점을 살려 숙소의 이름을 지어주세요.</p>
							 <input type = "text" class = "form-control" name = "home_name" value="${homeInfo.homeTitle}">
						</div>
						<div class = "col-md-12">
							<p>숙소에 대해 간략히 설명해 주세요.<br>숙소와 주변 지역에 대한 정보와 게스트와 어떻게 소통하고 싶은지 등의 내용을 적어주세요.</p>
							 <textarea class="form-control" rows="5" name = "home_introduce_main" onkeyup ="wordLimitCheck(this,'500')">${homeInfo.homeComment}</textarea>
							 <p class = "word_limit">( 0 / 500자 )</p>
						</div>
					</div>
					<h4>숙소에 대한 추가 정보(선택사항)</h4>
					<div class="row margin-bottom20">
						<div class = "col-md-12">
						     <p>숙소에대한 기타 세부정보를 추가해주세요.</p>
							 <textarea class="form-control" rows="3"  name = "home_introduce_detail" onkeyup = "wordLimitCheck(this,'200')">${homeInfo.homeETCComment}</textarea>
							 <p class = "word_limit">( 0 / 200자 )</p>
						</div>
						<div class = "col-md-12">
						     <p>숙소 주위에 키피숍, 공원, 명소 등을 소개해 주세요.</p>
							 <textarea class="form-control" rows="3" name = "home_introduce_nearby" onkeyup = "wordLimitCheck(this,'200')">${homeInfo.homeSurround}</textarea>
							 <p class = "word_limit">( 0 / 200자 )</p>
						</div>
						<div class = "col-md-12">
						     <p>주변에 대중교통 수단, 운전정보 등을 알려주세요.</p>
							 <textarea class="form-control" rows="3" name = "home_introduce_traffic" onkeyup = "wordLimitCheck(this,'200')">${homeInfo.homeTraffic}</textarea>
							 <p class = "word_limit">( 0 / 200자 )</p>
						</div>
					</div>
					<div class = "row margin-top20">
						<div class="col-sm-12">
							<div class = "btn-toolbar float-left">
								<input type = "button" class = "btn btn-secondary" value = "뒤로" id="prev_step_6_btn">
							</div>
							<div class = "btn-toolbar float-right">
								<input type = "button" class = "btn btn-info" value = "계속" id="home_reg_step_6_btn">
							</div>
						</div>
					</div>
					<input type="hidden" name="homeid" id = "homeid" value="${homeid}">
				</form>
			</div>
		</div>
	
	</div>
	<script>
		$(document).ready(function(){
			
			var homeid = $('#homeid').val();
			
			$('#home_reg_step_6_btn').on('click',function(){
				
				var reg_step1 = $('#registration_step6_form').serialize();
				
				$.ajax({
					url : '<c:url value="/management/homeRegProcStep6"/>', 
					type : 'POST',
					data : reg_step1,
					success : function(result){
						alert(result.resCode);
						location.href = '<c:url value="/management/homeReg/step07?homeid='+homeid+'"/>'
					},
					error : function(xhr , status , error){
						alert(error);
					},
					beforeSend : function(xhr){
						 xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
					}
				});
			});
			
			$('#prev_step_6_btn').on('click',function(){
				location.href = './step05?homeid='+homeid;
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

