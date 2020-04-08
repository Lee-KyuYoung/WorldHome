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
		
	
		
	
});
</script>



