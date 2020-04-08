<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="header.jsp"%>

	<div class="main_space">
		<div class="main_left_img">
			<img class="img_main" src="<%=contextPath%>${detailMap.HOME_IMG_PATH1}">
		</div>
		<div class="main_right_img1">
			<img class="img_main" src="<%=contextPath%>${detailMap.HOME_IMG_PATH2}">
		</div>
		<div class="main_right_img2">
			<img class="img_main" src="<%=contextPath%>${detailMap.HOME_IMG_PATH3}">
		</div>
		<div class="main_right_img3">
			<img class="img_main" src="<%=contextPath%>${detailMap.HOME_IMG_PATH4}">
		</div>
		<div class="main_right_img4">
			<img class="img_main" src="<%=contextPath%>${detailMap.HOME_IMG_PATH5}">
		</div>
	</div>
	<div class="detail_comm_all">
		<div class ="detail_comm_div">
			<div class="comm_title" style="display: inline">${detailMap.HOME_TITLE}</div>
			<div style="display: inline; float: right; margin-top:10px; text-align: center;">
				<img src="\whome\resources\img\profile_default.jpg" class="rounded-circle" alt="Cinque Terre" width= "50px" height="50px">
				<div>${detailMap.USR_ID}</div>
			</div>
			<div class="detail_add_1">${detailMap.HOME_ADD_1}</div>
			<div style ="margin-top: 10px; margin-bottom: 10px;border-bottom: 3px solid #F2F2F2; ">
				<div style="display: inline; margin-top: 10px; margin-bottom: 10px;">최대인원 ${detailMap.MAX_GUEST}명  </div>
				<div style="display: inline; margin-top: 10px; margin-bottom: 10px;">&nbsp&nbsp&nbsp&nbsp침대 ${detailMap.BED_CNT}개  </div>
				<div style="display: inline; margin-top: 10px; margin-bottom: 10px;">&nbsp&nbsp&nbsp&nbsp욕실 ${detailMap.BATHROOM_CNT}개</div>
			</div>
			<div class='detail_comm' style="width:100%">
				<div style ="margin-top: 10px; margin-bottom: 10px; ">${detailMap.HOME_RANGE}</div>
				<div style ="margin-top: 10px; margin-bottom: 10px; ">${detailMap.IS_ONLY_GUEST}</div>
				<div style ="margin-top: 10px; margin-bottom: 10px; ">높은 청결도</div>
				<div style ="margin-top: 10px; margin-bottom: 10px; ">최근 게스트 11명이 이 숙소가 티 없이 깨끗하다고 후기를 남겼습니다.</div>
				<div class ="postscript" style="border-top:3px solid #F2F2F2; width:100%; margin-top: 10px; margin-bottom: 10px;">
					<div style = "font-size: 20px;padding-top: 20px; padding-bottom:20px">★후기</div>
					<div class = "postscriptComm">

					</div>
				</div>	
			</div>
		</div>
	<div style = "float: right; width: 30%; display: inline">
		<div class="date_inf">
			<div style="font-size: 18px; width: 90%; margin: 5px auto; height: 15%;">요금을 확인하려면 날짜를 입력하세요.</div>
			<table style="margin: 5px auto; width: 90%; height: 80%;">
				<tr style="border-top: 1px solid #444444;">
					<td>날짜
						<table style=" width: 100%; height: 50%;">
							<tr>
								<td><input class="form-control" id="datepicker1" type="text" value="체크인" readonly></td>
								<td><div class="_1te61w" aria-hidden="true" role="presentation">
										<svg viewBox="0 0 24 24" role="presentation" aria-hidden="true" focusable="false" style="height: 24px; width: 24px; display: block; fill: currentcolor;">
<path d="m0 12.5a.5.5 0 0 0 .5.5h21.79l-6.15 6.15a.5.5 0 1 0 .71.71l7-7v-.01a.5.5 0 0 0 .14-.35.5.5 0 0 0 -.14-.35v-.01l-7-7a .5.5 0 0 0 -.71.71l6.15 6.15h-21.79a.5.5 0 0 0 -.5.5z" fill-rule="evenodd">
</path>
</svg>
									</div></td>
								<td><input class="form-control" id="datepicker2" type="text" value="체크아웃" readonly></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>게스트
						<table style="border: 1px solid #444444; width: 100%; height: 50%;">
							<tr>
								<select class="form-control" id="sel1">
								 <c:forEach var="i" begin="1" end="${detailMap.MAX_GUEST}" >
								 	<option>${i}</option>
								 </c:forEach>
								 </select>
							</tr>
						</table>
				</tr>
				<tr>
					<td><button type="button" class="btn btn-info" style="width: 100%; height: 80%">예약하기</button></td>
				</tr>
			</table>
		</div>
	</div>	
	</div>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" id = "csrf_token"/>
	<input type="hidden" id="hiddenHomeId" value="${detailMap.HOME_ID}"/>
		<%@ include file="footer.jsp"%>



<script>		
		var startPage =1;
		getList(startPage);
		$(document).ready(function() {
			startPage++;
			var spaceHeight = $(".main_space").outerHeight(true)
			var scrollOffset = $('.date_inf').offset();
			//alert(spaceHeight)
			$('.date_inf').css({
					"float" : "right",
					"position": "fixed",
					"top": Number(spaceHeight)+100,
					"left": "70%",
					"width": "370px",
					"height": "350px",
					"border": "1px solid red",
					"border-radius": "10px",
			});
		
		});

		
		$(window).scroll(function() {
			var spaceScrollHeight =$(".main_space").outerHeight(true);
			if ($(document).scrollTop() > spaceScrollHeight) {
				$('.date_inf').css({
					   "position" : "fixed",
					   "top" : "30px",
					   "left" : "70%"
					})
			} else {
				$('.date_inf').css({
						   "position" : "fixed",
						   "top" : spaceScrollHeight+100-$(document).scrollTop(),
						   "left" : "70%"
						})
			}
			
			if($(document).height() <= $(window).scrollTop()+window.innerHeight+0.5){//스크롤이 최하단 으로 내려가면 리스트를 조회하고 page를 증가시킨다.  
				getList(startPage);
				startPage++;   
		     } 
		});	
 		 
 		function getList(startPage){
 			const csrf_token = $('#csrf_token').val();
 			var homeId = $('#hiddenHomeId').val();
 		    $.ajax({
 				type : 'post',
 				data: {'_csrf' : csrf_token 
 					  ,'page' : startPage
 					  ,'homeId':homeId},
 		        url : '<%=contextPath%>/selectPostscriptList',
 		        success : function(returnData) {
 		        	var html = "";
 		        	$.each(returnData,function(i){
 		        		var dataLength = returnData.length;
 		        		var usrId =returnData[i].USR_ID;
 					    var rviComm =returnData[i].RVI_COMM;
 		        		if (startPage==1){ //페이지가 1일경우에만 id가 list인 html을 비운다.
 	 		                  $(".postscriptComm").html(""); 
 	 		            }
 		                if(dataLength>0){
	 		                html +='<div style="padding-bottom:20px; border-bottom:3px solid #F2F2F2; margin-bottom: 20px;">'
								 +'<div>'+usrId+'</div>'
								 +'<div>'+rviComm+'</div>'
								 +'</div>';
 		                }else{
 		                //데이터가 없을경우
 		                }
 	 		            
 		        		
 		        	});
 		            html = html.replace(/%20/gi, " ");
 		            if (startPage==1){  //페이지가 1이 아닐경우 데이터를 붙힌다.
 		                $(".postscriptComm").html(html); 
 		            }else{
 		                $(".postscriptComm").append(html); 
 		            }
 		       },error : function(a, c) {
 					alert("에러다1");
 				}
 		    }); 
 		}
 		 
</script> 		 