<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix = "spring" %>
<%@ page session="true" %>
<%String contextPath = request.getContextPath(); %>

<html>
<head>
	<title>숙소 등록하기</title>
	<link href = "<%=contextPath%>/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<style type="text/css">
		p{margin:20 0 10 0;font-size:16px;color:#767676;font-weight:bold}
		.progress_info{color:#767676;margin-top:40px;margin-bottom:20px;font-weight:bold;}
		.progress{margin-bottom:30px;}
		.margin-top20{margin-top:20px;}
		.margin-bottom20{margin-bottom:20px;}
		.content{margin:0 auto;}

	</style>
<body>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<ul class="navbar-nav">
		    <li class="nav-item active">
		    	<a class="nav-link" href="#">유저관리</a>
		    </li>
		    <li class="nav-item">
		    	<a class="nav-link" href="#">코드관리</a>
		    </li>
		    <li class="nav-item">
		    	<a class="nav-link" href="#">기타</a>
		    </li>
		    <li class="nav-item">
		    	<a class="nav-link disabled" href="#">Disabled</a>
		    </li>
	    </ul>
	</nav>
	<div class="container">
		<div class="row">
			<div class="col-sm-7 content">
				<form id="admin_code_management" class = "margin-top20">
					<h4>코드 대분류</h4>
					<div class="row margin-bottom20">
						<div class = "col-sm-6">
							<p>대분류 이름</p>
							<input type = "text" class = "form-control" id="code_main_cate_name" name="code_main_cate_name">
						</div>
						<div class = "col-sm-12">
							<p>대분류 설명</p>
							<div class="input-group">
								<input type = "text" class = "form-control" id ="code_main_cate_ment" name = "code_main_cate_ment" placeholder = "코드에대한 설명을 적어주세요.">
								<div class="input-group-append">
									<button class="btn btn-secondary" type="button" id="main_cate_reg_btn">등록</button>
								</div>
							</div>	
						</div>
					</div>
					<h4>코드 소분류 1</h4>
					<div class="row margin-bottom20">
						<div class = "col-sm-3">
							<p>대분류 선택</p>
							<select class="form-control" id = "main_cate_list">
								<option value ="">선택하세요.</option>
								<c:forEach var = "list" items = "${codeList}">
									<c:if test = "${empty list.codeSubGroupKey }">
										<option value = "${list.codeNum}/${list.codeGroupKey}">${list.codeComment}</option>
									</c:if>
								</c:forEach>
							</select>
						</div>
						<div class = "col-sm-3">
							<p>소분류1 이름</p>
							<input type = "text" class = "form-control" id="code_depth1_cate_name" name="code_depth1_cate_name">
						</div>
						<div class = "col-sm-12">
							<p>소분류1 설명</p>
							<div class="input-group">
								<input type = "text" class = "form-control" id ="code_depth1_cate_ment" name = "code_depth1_cate_ment" placeholder = "소분류1에 대한 설명을 적어주세요.">
								<div class="input-group-append">
									<button class="btn btn-secondary" type="button" id="depth1_cate_reg_btn">등록</button>
								</div>
							</div>	
						</div>
					</div>
					<h4>코드 소분류 2</h4>
					<div class="row margin-bottom20">
						<div class = "col-sm-3">
							<p>대분류 선택</p>
							<select class="form-control" id = "main_cate_2" onchange = "getCodeDefine(this,'main')">
								<option value ="">선택하세요.</option>
								<c:forEach var = "list" items = "${codeList}">
									<c:if test = "${empty list.codeSubGroupKey }">
										<option value = "${list.codeNum}/${list.codeGroupKey}">${list.codeComment}</option>
									</c:if>
								</c:forEach>
							</select>
						</div>
						<div class = "col-sm-3">
							<p>소분류1 선택</p>
							<select class="form-control" id = "depth2_cate_1">
								<option value ="">선택하세요.</option>
							</select>
						</div>
						<div class = "col-sm-3">
							<p>소분류2 이름</p>
							<input type = "text" class = "form-control" id="code_depth2_cate_name" name="code_depth2_cate_name">
						</div>
						<div class = "col-sm-12">
							<p>소분류2 설명</p>
							<div class="input-group">
								<input type = "text" class = "form-control" id ="code_depth2_cate_ment" name = "code_depth2_cate_ment" placeholder = "코드에대한 설명을 적어주세요">
								<div class="input-group-append">
									<button class="btn btn-secondary" type="button" id="depth2_cate_reg_btn">등록</button>
								</div>
							</div>	
						</div>
					</div>
					<h4>코드 소분류 3</h4>
					<div class="row margin-bottom20">
						<div class = "col-sm-3">
							<p>대분류 선택</p>
							<select class="form-control" id = "main_cate_3" onchange = "getCodeDefine(this,'main')">
								<option value ="">선택하세요.</option>
								<c:forEach var = "list" items = "${codeList}">
									<c:if test = "${empty list.codeSubGroupKey }">
										<option value = "${list.codeNum}/${list.codeGroupKey}">${list.codeComment}</option>
									</c:if>
								</c:forEach>
							</select>
						</div>
						<div class = "col-sm-3">
							<p>소분류1 선택</p>
							<select class="form-control" id = "depth2_cate_2" onchange = "getCodeDefine(this,'sub')">
								<option value ="">선택하세요.</option>
							</select>
						</div>
						<div class = "col-sm-3">
							<p>소분류2 선택</p>
							<select class="form-control" id = "depth3_cate_1">
								<option value ="">선택하세요.</option>
							</select>
						</div>
						<div class = "col-sm-3">
							<p>소분류3 이름</p>
							<input type = "text" class = "form-control" id="code_depth3_cate_name" name="code_depth3_cate_name">
						</div>
						<div class = "col-sm-12">
							<p>소분류3 설명</p>
							<div class="input-group">
								<input type = "text" class = "form-control" id ="code_depth3_cate_ment" name = "code_depth3_cate_ment" placeholder = "코드에대한 설명을 적어주세요">
								<div class="input-group-append">
									<button class="btn btn-secondary" type="button" id="depth3_cate_reg_btn">등록</button>
								</div>
							</div>	
						</div>
					</div>
					<div class = "row margin-top20">
						<div class="col-sm-12">
							<div class = "btn-toolbar float-right">
<!-- 								<input type = "button" class = "btn btn-info" value = "계속" id="home_reg_step1_btn"> -->
							</div>
						</div>
					</div>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" id = "csrf_token"/>
				</form>
			</div>
		</div>
	</div>
	<script src = "<%=contextPath%>/resources/jquery/js/jquery-3.4.1.min.js"></script>
	<script src = "<%=contextPath%>/resources/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script>
		$(document).ready(function(){
			
			$('#main_cate_reg_btn').on('click',function(){
				var code_name = $('#code_main_cate_name').val();
				var code_ment = $('#code_main_cate_ment').val();
				insertCode(code_name , code_ment , null ,'main');
			});
			
			$('#depth1_cate_reg_btn').on('click', function(){
				var code_name = $('#code_depth1_cate_name').val();
				var code_ment = $('#code_depth1_cate_ment').val();
				var cate_info = $('#main_cate_list').val();
				insertCode(code_name , code_ment , cate_info ,'sub');
			});
			
			$('#depth2_cate_reg_btn').on('click', function(){
				var code_name = $('#code_depth2_cate_name').val();
				var code_ment = $('#code_depth2_cate_ment').val();
				var cate_info = $('#depth2_cate_1').val();
				insertCode(code_name , code_ment , cate_info ,'sub_main');
			});
			
			$('#depth3_cate_reg_btn').on('click', function(){
				var code_name = $('#code_depth3_cate_name').val();
				var code_ment = $('#code_depth3_cate_ment').val();
				var cate_info = $('#depth3_cate_1').val();
				insertCode(code_name , code_ment , cate_info ,'sub_main');
			});
		
		});
		
		//코드 정보 가져오기
		function getCodeDefine(obj , code_type){

			var group_key = $(obj).val(); 
			
			$.ajax({
				url : './getCodeDefine',
				type : 'POST',
				data : { 'group_key' : group_key , 'code_type' : code_type , '_csrf' : '${_csrf.token}'},
				success : function(result){
					
					var targetSelectBox = $(obj).parent().next().find('select');
					$(targetSelectBox).empty();
					
					$.each(result, function(index,object){
						$(targetSelectBox).append($('<option>').text(object.codeComment).attr('value',object.codeNum+'/'+object.codeSubGroupKey));
					});
				},
				error : function(xhr, status ,error){
					alert(xhr+" "+status+" "+error);
				}
			});
		}

		
		//코드 등록
		function insertCode(code_name , code_ment, cate_info , path){
			
			$.ajax({
				url : './insertCode/'+path,
				type : 'POST',
				data : {'code_name' : code_name , 'code_ment' : code_ment , 'cate_info' : cate_info ,'_csrf' : '${_csrf.token}'},
				success : function(result){
					if(result.resCode == 'E001'){
// 						location.reload(true);
					}else{
						alert("에러가 발생하였습니다.");
					}
				},
				error : function(xhr , status , error){
					alert(xhr+" "+status+" "+error);
				}
			});
		}
	</script>
</body>
</html>

