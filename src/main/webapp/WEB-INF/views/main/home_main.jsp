<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix = "spring" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page session="true" %>

<html>
	<title>WorldHome</title>
	<style type="text/css">
		.container-fluid{width:100%}
		.home_list{height:320px;margin:0px 10px 10px 10px;padding:0px;}
		.row{margin-top:20px; text-align:center;}
		.home_info_p1{margin-bottom:3px; font-size:14px; color:#717171;}
		.home_info_p2{margin-bottom:3px; font-size:15px; font-weight:bold; color:black;}
		.home_info_p3{margin-bottom:3px; font-size:15px; color:black;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;}
		.home_img{width:100%;height:210px;margin-bottom:10px;border-radius:5px;}
 		.carousel-control-prev-icon,.carousel-control-next-icon {display: inline-block;width: 30px;height: 30px;background: no-repeat 50%/100% 60%;border-radius: 50%;background-color: black;} 
  		.carousel-control-prev-icon { background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' fill='%23fff' width='8' height='8' viewBox='0 0 8 8'%3e%3cpath d='M5.25 0l-4 4 4 4 1.5-1.5L4.25 4l2.5-2.5L5.25 0z'/%3e%3c/svg%3e");} 
 		.carousel-control-next-icon { background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' fill='%23fff' width='8' height='8' viewBox='0 0 8 8'%3e%3cpath d='M2.75 0l-1.5 1.5L3.75 4l-2.5 2.5L2.75 8l4-4-4-4z'/%3e%3c/svg%3e");} 
		.carousel-indicators, .carousel-control-prev, .carousel-control-next{visibility:hidden;}
		.home_list:hover .carousel-indicators{visibility:visible;} 
 		.home_list:hover .carousel-control-prev{visibility:visible;} 
 		.home_list:hover .carousel-control-next{visibility:visible;} 
 		.paging ul{display:inline-block;padding:0px;margin:0px 10px 0px 10px;}
 		.paging ul li{display:inline-block;list-style:none;margin:4px;}
 		.paging  a{cursor:pointer;display:inline-block;height:32px;width:32px;font-size:17px;font-weight:700;color:#222222;border-radius:50%;line-height:34px;}
 		.paging  a:hover{background-color:#f2f2f2;}
 		.paging-active{cursor:default !important;color:white !important;background-color:black;}
 		.paging-active:hover{text-decoration:none;background-color:black !important;}
 		.title{font-size: 35px !important;font-weight: bold; line-height: 1.125em; color: rgb(72, 72, 72);}
	</style>
	
<body>
	<div class="container-fluid">
		<div class="row justify-content-center" style="margin-top:0px">
			<div class="col-md-4">
				<p class="title">
					<c:choose>
						<c:when test ="${!empty area and area ne ''}">
							${area}
						</c:when>
						<c:otherwise>
							모든
						</c:otherwise>
					</c:choose>
					지역의 숙소
				</p>
				<c:if test = "${!empty reserv_d and reserv_d ne ''}">
					<p>${reserv_d} 
						<c:if test ="${!empty reserv_p and reserv_p !='' }">
							/ ${reserv_p}명 
						</c:if>
					</p>
				</c:if>
				<p>숙박 ${paging.totalCount}건</p>
			</div>
		</div>
		<div class = "row justify-content-center">
			<c:choose>
				<c:when test ="${!empty homeList}">
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
								<div class="col-8" style="padding:0px;">
									<p class="home_info_p1">${list.HOME_RANGE} / 침대 ${list.BED_CNT}개</p>
								</div>
								<div class="col-4" style="padding:0px;">
									<div class="float-right" style="font-size:14px;">
										<i class="fa fa-star" style="color:#FF385C"></i> 
										<c:choose>
											<c:when test = "${!empty list.TOTAL_RATE}">
												${list.TOTAL_RATE}
											</c:when>
											<c:otherwise>
												후기 없음
											</c:otherwise>
										</c:choose>
									</div>
								</div>
							</div>
							<p class="home_info_p3">
								${list.HOME_TITLE}
							</p>
							<p class="home_info_p2"><strong>₩<fmt:formatNumber type="number" value="${list.ROW_AMT}"/></strong> / 1박</p>
						</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<div class="col-md-10" style="margin-top:100px;">
						<p class="title">등록된 숙소가 없습니다.</p>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
		<div class = "row justify-content-center">
			<c:choose>
				<c:when test ="${!empty homeList}">
					<div class = "paging">
						<c:if test = "${paging.pageNo ne paging.firstPageNo }">
							<a href="javascript:goMainPage(${paging.prevPageNo});"><i class="fas fa-angle-left"></i></a>
						</c:if>
						<ul>
						<c:forEach var = "i" begin = "${paging.startPageNo}" end="${paging.endPageNo}" step="1">
							<c:choose>
								<c:when test ="${paging.pageNo eq i }">
									<li><a class="paging-active" href="javascript:goMainPage(${i})">${i}</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="javascript:goMainPage(${i})">${i}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						</ul>
						<c:if test = "${paging.pageNo ne paging.finalPageNo }">
							<a href="javascript:goMainPage(${paging.nextPageNo});"><i class="fas fa-angle-right"></i></a>
						</c:if>
					</div>				
				</c:when>
			</c:choose>
		</div>
		<div class = "row justify-content-center">
			<p>총 ${paging.totalCount}건</p>
		</div>
	</div>
	<script>
	$(document).ready(function(){
			$('.carousel').carousel({
					interval: false
				});
		});
	function goMainPage(page){
		location.href = "./?page_no="+page;
	}
	</script>
</body>
</html>



