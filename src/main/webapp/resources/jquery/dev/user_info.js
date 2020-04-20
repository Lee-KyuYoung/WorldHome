		$(document).ready(function(){
			//아이디 중복 체크
			$('#user_id').on('blur',function(){
				
				var user_id = $('#user_id').val();
				var obj = $('[role="user_id"]');
				const csrf_token = $('#scrf_token').val();

				if(user_id != ''){
					$.ajax({
						url : './userIDCheck',
						data : {'user_id' : user_id ,'_csrf' : csrf_token },
						type : 'post',
						success : function(result){
							$(obj).text('');
							if(result.resCode == 'E001'){
								$(obj).css('color','red').text(result.resMessage);
							}else{
								$(obj).css('color','green').text(result.resMessage);	
							}
							
						},
						error : function(jqXHR, textStatus, errorThrown){
							alert(errorThrown);
						}
					})
				}
			});	

			//경고 멘트 제거
			$('input').on('keydown', function(){
				var id = $(this).attr("id");
				$('[role='+id+']').text('');
				
			});
			
			//  이거 공통 JS 파일로 뺼것 ( 파라메터에 주소 입력부분 넣기 )
			//다음 주소검색
			$('#address_search').on('click' , function(){
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
		
		                $('#user_address_1').val(fullAddr)
		                $('#user_address_2').focus();
		            }
		        }).open();		
			});
			
			//취소버튼
			$('#cancel_btn').on('click',function(){
				location.href='../login';
			});
		});


		
		
		