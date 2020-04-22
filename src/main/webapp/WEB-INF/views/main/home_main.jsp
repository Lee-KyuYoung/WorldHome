<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix = "spring" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page session="true" %>

<html>
<head>
	<title>WorldHome</title>
	<style type="text/css">
		.container-fluid{width:100%}
		.home_list{border: 0px solid black; height:350px;margin:0px 10px 40px 10px;padding:0px;}
		.row{margin-top:30px; text-align:center;}
		.home_info_p1{margin-bottom:3px; font-size:15px; color:#717171;}
		.home_info_p2{margin-bottom:3px; font-size:16px; font-weight:bold; color:black;}
		.home_img{width:100%;height:250px;margin-bottom:10px;border-radius:10px;}
 		.carousel-control-prev-icon,.carousel-control-next-icon {display: inline-block;width: 30px;height: 30px;background: no-repeat 50%/100% 60%;border-radius: 50%;background-color: black;} 
  		.carousel-control-prev-icon { background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' fill='%23fff' width='8' height='8' viewBox='0 0 8 8'%3e%3cpath d='M5.25 0l-4 4 4 4 1.5-1.5L4.25 4l2.5-2.5L5.25 0z'/%3e%3c/svg%3e");} 
 		.carousel-control-next-icon { background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' fill='%23fff' width='8' height='8' viewBox='0 0 8 8'%3e%3cpath d='M2.75 0l-1.5 1.5L3.75 4l-2.5 2.5L2.75 8l4-4-4-4z'/%3e%3c/svg%3e");} 
		.carousel-indicators, .carousel-control-prev, .carousel-control-next{visibility:hidden;}
		.home_list:hover .carousel-indicators{visibility:visible;} 
 		.home_list:hover .carousel-control-prev{visibility:visible;} 
 		.home_list:hover .carousel-control-next{visibility:visible;} 
	</style>
<body>
	<div class="container-fluid">
		<div class = "row justify-content-center">
			<c:forEach var = "list" items = "${homeList}" varStatus = "status_1">
				<div class="col-xl-2 col-lg-3 col-sm-5 col-11 home_list text-left">
					<div id="img_slider${status_1.index}" class="carousel slide" data-ride="carousel">
	   				    <!-- Indicators -->
						<ul class="carousel-indicators">
						  	<c:forEach var = "img_list" items = "${list.HOME_IMG}" varStatus = "status_2">
						  		<li data-target="#img_slider${status_1.index}" data-slide-to="${status_2.index}" <c:if test = '${status_2.index eq 0}'>class='active'</c:if>></li>
						  	</c:forEach>
						</ul>
						<!-- The slideshow -->
						<div class="carousel-inner">
							<c:forEach var = "img_list" items="${list.HOME_IMG}" varStatus = "status_2">
								<div class = "carousel-item <c:if test = '${status_2.index eq 0}'>active</c:if>">
									<a href="<c:url value='/homeDetail?homeId=${list.HOME_ID}'/>" target="_blank"><img src="/img/${img_list}" class="home_img"></a>
								</div>
							</c:forEach> 
						</div>
					    <!-- Left and right controls -->
						<a class="carousel-control-prev" href="#img_slider${status_1.index}" data-slide="prev">
						    <span class="carousel-control-prev-icon"></span>
						</a>
						<a class="carousel-control-next" href="#img_slider${status_1.index}" data-slide="next">
						    <span class="carousel-control-next-icon fas"></span>
						</a>
					</div>
					<div class="row" style="margin:0px;text-align:left;">
						<div class="col-6" style="padding:0px;">
							<p class="home_info_p1">${list.HOME_RANGE} / 침대 ${list.BED_CNT}개</p>
						</div>
						<div class="col-6" style="padding:0px;">
							<div class="float-right">
								<i class="fa fa-star" style="color:#FF385C"></i> 5.0						
							</div>
						</div>
					</div>
					<p class="home_info_p2">
						<c:choose>
							<c:when test = "${fn:length(list.HOME_COMM) gt 20}">
								${fn:substring(list.HOME_COMM,0,20)}...		
							</c:when>
							<c:otherwise>
								${list.HOME_COMM}
						</c:otherwise>
						</c:choose>
					</p>
					<p class="home_info_p1"><strong>￦<fmt:formatNumber type="number" value="${list.ROW_AMT}"/></strong> / 1박</p>
				</div>
			</c:forEach>
		</div>

	</div>
	<script>
	$(document).ready(function(){
			$('.carousel').carousel('pause');
		});
	</script>
</body>
</html>


