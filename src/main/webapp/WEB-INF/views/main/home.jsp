<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page session="false"%>
<%
	String contextPath = request.getContextPath();
%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Home</title>
<link href="<%=contextPath%>/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<style>
.container-fluid {
	margin: 30px auto;
	width: 90%;
}
.detailHome_link{
	wigth: 100%;
	heigth: 100%
}

@media ( max-width : 768px ) {
	.container-fluid {
		display: grid;
		grid-gap: 50px 10px;
		grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
		/* grid-template-rows: repeat(10, 300px); */
		grid-auto-rows: minmax(300px, auto);
		whidth: 90%;
	}
}

@media ( min-width : 768px ) {
	.container-fluid {
		display: grid;
		grid-gap: 30px 10px;
		grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
		/* grid-template-rows: repeat(${rowSizCnt}, 200px); */
		grid-auto-rows: minmax(200px, auto);
		whidth: 90%;
	}
}

@media ( min-width : 1024px ) {
	.container-fluid {
		display: grid;
		grid-gap: 30px 5px;
		grid-template-columns: repeat(auto-fit, 270px);
		/* grid-template-rows: repeat(${rowSizCnt}, 200px); */
		grid-auto-rows: minmax(200px, auto);
		whidth: 90%;
	}
}


.celBody{
	height: 100%;
}

.carousel slide{
	height: 85%;
}
/* .carousel-inner {
	height: 85%;
	width: 100%;
} */
 .imgComm{
	height: 15%;
	width: 100%;
	background-color: white;
	display: table-row;
}
 


.carousel-item active{
	height: 90%;
	width: 100%;
}
.carousel-item{
	height: 90%;
	width: 100%;
}
.imgFile {
	width: 100%;
	height:100%;
}

</style>
</head>
<body>
	<header>
		<%@ include file="header.jsp"%>
	</header>
	


	<div class="container-fluid" id="imgList"></div>


	<div class="content">Hello world!!</div>
	<footer>
		<%@ include file="footer.jsp"%>
	</footer>
	<script src="<%=contextPath%>/resources/jquery/js/jquery-3.4.1.min.js"></script>
	<script src="<%=contextPath%>/resources/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script>
		 $(document).ready(function(){
				$.ajax({
					url : "<%=contextPath%>/homeList",
					type : "post",
					data: $(".form-signin").serialize(), 
					success : function(data){
						var str = '';
						var pastHomeId = '';
						var HomeGubun = 0;
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
								HomeGubun = 0;
							}
							if(homeId != pastHomeId && data.length > i+1){
								
								str +=  '</div>'
									    +'<a class="carousel-control-prev" href="#IMG'+pastHomeId+'" data-slide="prev">'
									    +'<span class="carousel-control-prev-icon"></span>'
									    +'</a>'
									    +'<a class="carousel-control-next" href="#IMG'+pastHomeId+'" data-slide="next">'
									    +'<span class="carousel-control-next-icon"></span>'
									    +'</a>'
										+'</div>'
										+'<div class="imgComm" name="'+homeId+'">'
										+ homeComm
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
						},
										error : function(a, c) {
											alert("에러다");
										}
									});
				
				
						});
		 
		 
		 $(document).on("click", ".imgFile", function(){
			 //alert("zz");
			 alert($(this).attr("name"));
			 location.href ='detailHome?userName=33&userId=44'
			 //location.href = 'detailHome';
		 });
		 
		 $(document).on("click", ".imgComm", function(){
			 alert($(this).attr("name"));
			//alert("옹");
		 });
			
		 

		
	</script>

</body>
</html>

