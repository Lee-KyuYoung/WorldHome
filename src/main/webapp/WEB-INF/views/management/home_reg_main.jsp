<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix = "spring" %>
<%@ page session="true" %>

<html>
<head>
	<title>숙소 등록하기</title>
	<style type="text/css">
		.word_limit{margin:5 0 10 0;font-size:16px;color:#767676;font-weight:bold}
		.progress_info{color:#767676;margin-top:40px;margin-bottom:20px;font-weight:bold;}
		.progress{margin-bottom:30px;}
		.margin-top20{margin-top:20px;}
		.margin-bottom50{margin-bottom:50px;}
		.margin-top10{margin-top:10px;}
		.content{margin:0 auto;}
		.home_reg_table{border:1px solid #e0e0eb;box-shadow: 1px 1px 1px 1px #e0e0eb;}
		.home_reg_table td{vertical-align:middle;}
		.home_reg_table a{color:black; text-decoration:none;}
		.home_reg_table_h tr:hover{cursor:pointer;box-shadow: 5px 5px 5px 5px #e0e0eb;}
	</style>
<body>
	<div class="container">
		<h4 class="progress_info">숙소 등록</h4>
		<hr>
		<div class="row">
			<div class="col-sm-7 content">
				<form id="registrationform">
					<h4>신규 등록</h4>
					<div class="row margin-bottom50">
						<div class = "col-md-12">
							<table class="table home_reg_table home_reg_table_h">
								<colgroup>
									<col style = "width:100px;">
									<col style = "width:200px;vertical-align:middle;">
								</colgroup>
								<tbody>
									<tr onclick = "location.href='./homeReg/step01'">
										<td>
											<div style="width:100px;height:100px;background-image:url('../resources/imgFile/home_icon.png');background-size:100% 100%;background-repeat:no-repeat;background-position:center center;">
											</div>
										</td>
										<td style="vertical-align:middle;"><h4>새로 등록하기</h4></td>									
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<h4>등록중인 숙소</h4>
					<div class="row margin-bottom50">
						<div class = "col-md-12">
							<c:choose>
								<c:when test = "${!empty  userHomeTempList}">
									<table class="table home_reg_table">
										<colgroup>
											<col style = "width:30px;">
											<col style = "width:400px;">
											<col style = "width:80px;">
										</colgroup>
										<tbody>
											<c:forEach var = "list" items = "${userHomeTempList}" varStatus = "status">
												<tr>
													<td>${status.index + 1}</td>
													<td><a href = "./homeReg/step01?homeid=${list.homeID}">${list.homeAddr1} 
														<c:if test = "${!empty list.homeAddr2}">
															/ ${list.homeAddr2} 
														</c:if>
														</a>
													</td>
													<td>
														<input type = "button" class="btn btn-danger btn-sm" value="삭제" onclick = "javascript:removeTmepHome('${list.homeID}','temp')">
													</td>
												</tr>
											</c:forEach>	
										</tbody>
									</table>									
								</c:when>
								<c:otherwise>
									<p>등록중인 숙소가 없습니다.</p>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<h4>등록 완료된 숙소</h4>
					<div class="row margin-bottom50">
						<div class = "col-md-12">
							<c:choose>
								<c:when test = "${!empty  userHomeList}">
									<table class="table home_reg_table">
										<colgroup>
											<col style = "width:30px;">
											<col style = "width:400px;">
											<col style = "width:80px;">
										</colgroup>
										<tbody>
											<c:forEach var = "list" items = "${userHomeList}" varStatus = "status">
												<tr>
													<td>${status.index + 1}</td>
													<td><a href="./homeMod/step01?homeid=${list.homeID}">${list.homeAddr1} 
														<c:if test = "${!empty list.homeAddr2}">
															/ ${list.homeAddr2} 
														</c:if>
														</a>
													</td>
													<td>
														<input type = "button" class="btn btn-danger btn-sm" value="삭제" onclick = "javascript:removeTmepHome('${list.homeID}','normal')">
													</td>
												</tr>
											</c:forEach>	
										</tbody>
									</table>									
								</c:when>
								<c:otherwise>
									<p>등록 완료된 숙소가 없습니다.</p>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<div class = "row">
						<div class="col-sm-12">
<!-- 							<div class = "btn-toolbar float-left"> -->
<!-- 								<input type = "button" class = "btn btn-secondary" value = "뒤로" id="prev_step_5_btn"> -->
<!-- 							</div> -->
<!-- 							<div class = "btn-toolbar float-right"> -->
<!-- 								<input type = "button" class = "btn btn-info" value = "계속" id="home_reg_step5_btn"> -->
<!-- 							</div> -->
						</div>
					</div>
				</form>
			</div>
		</div>
	
	</div>
	<script>
		$(document).ready(function(){
	
		});
		
		function removeTmepHome(home_id, status){

			if(!confirm('정말 삭제하시겠습니까?')){
				return false;
			}

			$.ajax({
				url : './removeHomeInfo',
				data : {'home_id' : home_id, 'status' : status},
				type : 'POST',
				success : function(resData){
					if(resData.resCode == ''){
						alert('삭제되었습니다.');
						location.reload();
					}else{
						alert('삭제에 실패하였습니다\n관리자에게 문의 바랍니다.');
					}
				},
				error : function(){
					alert('잠시 후 다시 이용해 주세요.');
				},
				beforeSend : function(xhr){
					$('#spinner').show();
					xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				complete : function(){
					$('#spinner').hide();
				}
					
			});
	
		}
</script>
</body>
</html>


