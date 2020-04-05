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
		.margin-top10{margin-top:10px;}
		.content{margin:0 auto;}
		.img_view{width:100%;height:200px;border:2px dashed #c2c2d6;border-radius:5px;margin-top:20px;background-image:url('../../resources/imgFile/img_upload.png');background-size:30% 45%;background-repeat:no-repeat;background-position:center center;}
		.img_view:hover{cursor:pointer;border-color:black; -webkit-transform:scale(1.05); -moz-transform:scale(1.05);-ms-transform:scale(1.05);-o-transform:scale(1.05); transform:scale(1.05);}
		input[type="file"]{width:100%;display:none};
		
	</style>
<body>
	<div class="container">
		<h4 class="progress_info">5단계 : 숙소 사진</h4>
		<div class="progress">
	  		<div class="progress-bar" role="progressbar" style="width: 70%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">70%</div>
		</div>
		<div class="row">
			<div class="col-sm-7 content">
				<form id="registration_step5_form">
					<h4>숙소 사진 올리기</h4>
					<p>멋지게 찍은 사진으로 숙소를 어필해보세요.<br>이미지는 최대 5개 등록 가능합니다.</p>
					<div class="row">
						<div class = "col-md-6 margin-top20">
							  <label class="img_view" for="img_file_0" id="test">
							  	<input type="file" id="img_file_0" name="home_detail_img" accept="image/*" onchange="imgView(this)">
							  </label>
						</div>
					</div>
					<div class = "row margin-top20">
						<div class="col-sm-12">
							<div class = "btn-toolbar float-left">
								<input type = "button" class = "btn btn-secondary" value = "뒤로" id="prev_step_5_btn">
							</div>
							<div class = "btn-toolbar float-right">
								<input type = "button" class = "btn btn-info" value = "계속" id="home_reg_step5_btn">
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
			
			$('#home_reg_step5_btn').on('click',function(){
				
				var reg_step1 = $('#registration_step5_form').serialize();
				$.ajax({
					url : '../homeRegProcStep5',
					type : 'POST',
					data : reg_step1,
					success : function(result){
						alert(result.resCode);
						location.href = './step6';
					},
					error : function(xhr , status , error){
						alert(error);
					}
				});
			});
			
		});
		
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

