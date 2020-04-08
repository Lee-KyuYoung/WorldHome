<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="header.jsp"%>
	


	<div class="container-fluid" id="imgList"></div>

	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" id = "csrf_token"/>

<%@ include file="footer.jsp"%>
	
	
<script>
$(document).ready(function(){
 	const csrf_token = $('#csrf_token').val();
	$.ajax({
		url : "<%=contextPath%>/homeList",
		type : "post",
		data: {'_csrf' : csrf_token },
		success : function(data){
				//숙소 조회 후 화면 구성
				bodyAppend(data);
				
			},
		error : function(a, c) {
			alert("에러다");
		}
	});
		$("#closeBut01").hide();
		$("#closeBut02").hide();
		
	
	 //집 이미지 선택 -> 상세화면 호출
	 $(document).on("click", ".imgFile", function(){
		 location.href ='detailHome?homeId='+$(this).attr("name");
	 });
	 
	//집 내용 선택 -> 상세화면 호출
	 $(document).on("click", ".imgComm", function(){
		 location.href ='detailHome?homeId='+$(this).attr("name");
	 });	
	
	//조회 화면 구성
		function bodyAppend(data) {
			$("#imgList").empty();
			var str = '';
			var pastHomeId = '';
			var HomeGubun = 0;
			var pastHomeComm = '';
			 $.each(data,function(i){
				var homeImgPath =data[i].HOME_IMG_PATH;
			    var homeComm =data[i].HOME_COMM;
			    var homeId =data[i].HOME_ID;
			    
				if(pastHomeId == ''){
					str +='<div class ="celBody"  style="cursor:pointer;">'
						    +'<div id="IMG'+homeId+'" class="carousel slide" data-ride="carousel">'
							+'<ul class="carousel-indicators">'
						    +'<li data-target="#IMG'+homeId+'" data-slide-to="0" class="active"></li>'
						    +'<li data-target="#IMG'+homeId+'" data-slide-to="1"></li>'
						    +'<li data-target="#IMG'+homeId+'" data-slide-to="2"></li>'
						  	+'</ul>';
					pastHomeId = homeId;
					pastHomeComm = homeComm;
					HomeGubun = 0;
				}
				if(homeId != pastHomeId && data.length > i){
					
					str +=  '</div>'
						    +'<a class="carousel-control-prev" href="#IMG'+pastHomeId+'" data-slide="prev">'
						    +'<span class="carousel-control-prev-icon"></span>'
						    +'</a>'
						    +'<a class="carousel-control-next" href="#IMG'+pastHomeId+'" data-slide="next">'
						    +'<span class="carousel-control-next-icon"></span>'
						    +'</a>'
							+'</div>'
							+'<div class="imgComm" name="'+pastHomeId+'">'
							+ pastHomeComm
							+'</div>'
							+'</div>'
					str += '<div class ="celBody" style="cursor:pointer;">'
						+'<div id="IMG'+homeId+'" class="carousel slide" data-ride="carousel">'
						+'<ul class="carousel-indicators">'
					    +'<li data-target="#IMG'+homeId+'" data-slide-to="0" class="active"></li>'
					    +'<li data-target="#IMG'+homeId+'" data-slide-to="1"></li>'
					    +'<li data-target="#IMG'+homeId+'" data-slide-to="2"></li>'
					  	+'</ul>';
					pastHomeId = homeId; 
					pastHomeComm = homeComm;
					HomeGubun = 0;
				}
				
				if(HomeGubun == 0){
					str +='<div class="carousel-inner">'
				    +'<div class="carousel-item active">'
				    +'<img class ="imgFile" name="'+homeId+'" src="'+"<%=contextPath%>"+homeImgPath+'" >'
				    +'</div>'
				    
			        HomeGubun++;
				}else{
					str +='<div class="carousel-item">'
						+'<img class ="imgFile" name="'+homeId+'" src="'+"<%=contextPath%>"
																+ homeImgPath
																+ '" >'
																+ '</div>'
																
					}

					if (data.length == i + 1) {
						str +=  '</div>'
							    +'<a class="carousel-control-prev" href="#IMG'+pastHomeId+'" data-slide="prev">'
								+ '<span class="carousel-control-prev-icon"></span>'
								+ '</a>'
								+ '<a class="carousel-control-next" href="#IMG'+pastHomeId+'" data-slide="next">'
								+ '<span class="carousel-control-next-icon"></span>'
								+ '</a>'
								+ '</div>'
								+'<div class="imgComm" name="'+homeId+'">'
								+ homeComm
								+'</div>'
								+'</div>'
					}

				});
				$("#imgList").append(str);
		}
	
	
		
	
});
</script>



