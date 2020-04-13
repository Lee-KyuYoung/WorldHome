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
					<p>멋지게 찍은 사진으로 숙소를 어필해보세요.<br>숙소 이미지를 5개 이상 올려주세요.</p>
					<div class="row" id="img_group">
						<c:forEach var = "list" items = "${homeImgInfoList}" varStatus="status">
							<div class = "col-md-6 margin-top20">
								<label class="img_view" for="img_file_${status.index+1}" id="test" style = "background-image:url();background-size:100%,100%;border:0px;">
									<input type = "button" class = "btn btn-danger" value = "삭제" onclick="deleteHomeDetailImg(this,${list.homeImgKey})">
									<input type="file" id="img_file_${status.index+1}" name="home_detail_img" accept="image/*" onchange="imgView(this)">
								</label>
							</div>
						</c:forEach>
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
					<input type="hidden" name="homeid" id = "homeid" value="${homeid}">
				</form>
			</div>
		</div>
	
	</div>
	<script>
		$(document).ready(function(){
			
			initform5();
			var homeid = $('#homeid').val();
			
			$('#home_reg_step5_btn').on('click',function(){
				
				var	imgCount = $('input[type="file"]').length;
				if(imgCount < 6){
					alert("숙소이미지를 최소 5개 이상 올려주세요.");
					return false;
				}

				var reg_step5 = new FormData($('#registration_step5_form')[0]);
				
				$.ajax({
					url : '<c:url value="/management/homeRegProcStep5"/>', 
					type : 'POST',
					data : reg_step5,
					processData : false,
					contentType : false,
					success : function(result){
						alert(result.resCode);
						location.href = '<c:url value="/management/homeReg/step06?homeid='+homeid+'"/>'
					},
					error : function(xhr , status , error){
						alert(error);
					},
					beforeSend : function(xhr){
						 xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
					}
				});
			});
			
			$('#prev_step_5_btn').on('click',function(){
				location.href = './step04?homeid='+homeid;
			});
		});
		
		var home_img_count = 1;
		function imgView(f){
			
			var file = f.files; 
			var reader = new FileReader(); 
			var img_count = $('input[type="file"]').length;
			var current_index = $('input[type="file"]').index($(f));

			reader.onload = function(rst){
				
				$(f).parent().css('background-image','url('+rst.target.result+')').css('background-size','100% 100%').css('border','0px');
				$(f).parent().find('input[type="button"]').remove(); // 이미지를 다시 선택할 경우 버튼 지우고 만들기
				$(f).after('<input type = "button" class = "btn btn-danger" value = "삭제" onclick="deleteHomeDetailImg(this,null)">');
				
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
		
		function deleteHomeDetailImg(btn, val){
			
			//브라우저에서 추가한 이미지 삭제
			if(val == null){
				$(btn).parent().parent().remove();	
			}else{ //이미 저장된 이미지 삭제
				
			}
		}
		
		function initform5(){
			
// 			var img_list = '${homeImgInfoList}';
// 			alert($.parseJSON(img_list));
// 			if(img_list != '' || img_list != 'undefinde'){
// 				$.each($.parseJSON(img_list), function(i, obj){
					
// 				});
// 			}
		}
	</script>
</body>
</html>

