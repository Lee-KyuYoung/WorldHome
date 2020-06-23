<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix = "spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="true" %>
<html>
<head>
	<title>My 예약</title>
	<style type="text/css">
		.reserv_table{margin-top:20px;}
		.reserv_table caption{margin-left:-9999px;}
	</style>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-12">
				<h3>나의 예약</h3>
			</div>
			<div class="col-sm-12 content">
				<table class = "table reserv_table">
					<caption>예약 리스트</caption>
					<colgroup>
						<col width="8%"/>
						<col width="10%"/>
						<col width="22%"/>
						<col width="5%"/>
						<col width="10%"/>
						<col width="15%"/>
						<col width="10%"/>
						<col width="5%"/>
						<col width="5%"/>
					</colgroup>
					<thead>
						<tr>
							<th>호스트 이름</th>
							<th>전화번호</th>
							<th>숙박 주소</th>
							<th>인원</th>
							<th>숙박 예약 날짜</th>
							<th>예약한 날짜</th>
							<th>예약 상태</th>
							<th>숙소정보</th>
							<th>예약수정</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test = "${!empty reservList}">
								<c:forEach var = "reservList" items = "${reservList}">
									<tr>
										<td>${reservList.hostName}</td>
										<td>${reservList.hostPhoneNum}</td>
										<td>${reservList.reservAddr}</td>
										<td>${reservList.guestCnt}명</td>
										<td>
											<fmt:parseDate value="${reservList.startDate}" var = "start_date" pattern="yyyy/MM/dd"/>
											<fmt:formatDate value="${start_date}" type = "date" dateStyle="LONG"/> ~
											<fmt:parseDate value="${reservList.endDate}" var = "end_date" pattern = "yyyy/MM/dd"/>
											<fmt:formatDate value="${end_date}" type="date" dateStyle="LONG"/>
										</td>
										<td>
											<fmt:parseDate value = "${reservList.regDate}" var = "reservDate" pattern ="yyyy-MM-dd"/>
											<fmt:formatDate value="${reservDate}" type="both" dateStyle="LONG" timeStyle="short" timeZone="Asia/Seoul" /> 
										</td>
										<td>
											<c:choose>
												<c:when test = "${reservList.reservStatus eq 1}">
													예약 승인 대기중
												</c:when>
												<c:when test = "${reservList.reservStatus eq 2}">
													예약 완료
												</c:when>
												<c:when test = "${reservList.reservStatus eq 3}">
													숙박 완료
												</c:when>
											</c:choose>
										</td>
										<td>
											<input type = "button" class ="btn btn-info btn-sm" value="보기" onclick="window.open('../homeDetail?homeId=${reservList.homeID}')"> 
										</td>
										<td>
											<input type = "button" class ="btn btn-warning btn-sm" value="수정" onclick="imgModal(${reservList.reservID},'${reservList.reservPay}','${reservList.startDate}','${reservList.endDate}','${reservList.guestCnt}');"> 
										</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="8">예약된 숙소가 없습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
		</div>
		<div class = "row justify-content-center">
			<c:choose>
				<c:when test ="${!empty reservList}">
					<div class = "paging">
						<c:if test = "${paging.pageNo ne paging.firstPageNo }">
							<a href="javascript:goReservPage(${paging.prevPageNo});"><i class="fas fa-angle-left"></i></a>
						</c:if>
						<ul>
						<c:forEach var = "i" begin = "${paging.startPageNo}" end="${paging.endPageNo}" step="1">
							<c:choose>
								<c:when test ="${paging.pageNo eq i }">
									<li><a class="paging-active" href="javascript:goReservPage(${i})">${i}</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="javascript:goReservPage(${i})">${i}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						</ul>
						<c:if test = "${paging.pageNo ne paging.finalPageNo }">
							<a href="javascript:goReservPage(${paging.nextPageNo});"><i class="fas fa-angle-right"></i></a>
						</c:if>
					</div>				
				</c:when>
			</c:choose>
		</div>
	</div>
	
	<!-- The Modal -->
	<div class="modal fade" id="reservViewModal">
		<div class="modal-dialog modal-md">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header" style="border: 0px;">
					<h4 class="modal-title img-index" style="margin:0 auto;">예약 수정</h4>
					<button type="button" class="close" data-dismiss="modal" style="margin:-1rem -1rem -1rem 0;">&times;</button>
				</div>
				<!-- Modal body -->
				<div class="modal-body">
					<div class="container">
						<div class = "row">
							<div class = "col-sm-12">
								<div class="col-12 reserv_div">
									<form class="reserv_form">
										<div class="col-12">
											<p class=""><font style="font-size:20px;font-weight:bold;" id="pay_info"></font> / 1박</p>
										</div>
										<div class="col-12">
											<label>날짜</label>
											<input type ="text" class="form-control" id="reserv_date" name="reserv_date" autocomplete="off" readonly>
										</div>
										<div class="col-12">
											<label>인원</label>
											<input type ="number" id="guest_num" name = "guest_num" class="form-control" min=0>
										</div>
										<div class="col-12 margin-top20">
											<div class="row" style="font-size:15px;font-weight:500;color:rgb(72, 72, 72);">
												<div class="col-9">
													<p class="home_pay_info"></p>
												</div>
												<div class="col-3">
													<div class="float-right">
														<p class="home_pay">₩ 0</p>
													</div>
												</div>
											</div>
										</div>
										<div class="col-12">
											<div class="row" style="font-size:15px;font-weight:500;color:rgb(72, 72, 72);">
												<div class="col-6">
													<p>서비스 수수료</p>
												</div>
												<div class="col-6">
													<div class="float-right">
														<p class="fees">
															₩ 0
														</p>
													</div>
												</div>
											</div>
										</div>
										<div class="col-12">
											<div class="row">
												<div class="col-6">
													<p class="total_pay">총 합계</p>
												</div>
												<div class="col-6">
													<div class="float-right">
														<p class="total_pay">₩ 0</p>
													</div>
												</div>
											</div>
											<hr>
										</div>
										<div class="col-12">
											<input type = "button" class="btn btn-warning btn-block" id="reserv_btn" value="수정하기">
										</div>
										<div class="col-12 margin-top20" style="text-align:center;">

										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Modal footer -->
				<div class="modal-footer" style="border: 0px;"></div>
			</div>
		</div>
	</div>
	
	<script>
		$(document).ready(function(){
			
		});
		
		function goReservPage(page){
			location.href="./list?page_no="+page;
		}
		
		function imgModal(reserv_id, pay, start_date, end_date, guest_count){
			
			var s_d = new Date(start_date);
			var e_d = new Date(end_date);
			
			
			
			$('#pay_info').text('₩'+numberFormat(pay));
			$('#guest_num').val(guest_count);
			$('.home_pay_info').text('₩'+numberFormat(pay)+' x 0박');
			
			$('#reservViewModal').modal('show');
		}
		
		function numberFormat(num) {
	    	return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
		
		//날짜 차이 계산
		function dateDiff(date1, date2){
			
	        var date_1 = new Date(date1);
	        var date_2 = new Date(date2);
	     
	        date_1 = new Date(date_1.getFullYear(), date_1.getMonth()+1, date_1.getDate());
	        date_2 = new Date(date_2.getFullYear(), date_2.getMonth()+1, date_2.getDate());
	     
	        var diff = Math.abs(date_2.getTime() - date_1.getTime());
	        diff = Math.ceil(diff / (1000 * 3600 * 24));
			
			return diff;
		}
	</script>
</body>
</html>



