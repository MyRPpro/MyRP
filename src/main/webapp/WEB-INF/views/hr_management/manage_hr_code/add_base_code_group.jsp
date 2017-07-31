<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "../../setting.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	
	$("#page16120_div01_toggle").bind("click", function(event) {
		$("#page16120_div01").slideToggle();
		return false;
	});
	
	$("#page16120_div03_toggle").bind("click", function(event) {
		$("#page16120_div03").slideToggle();
		return false;
	});
	
	$("input[name='hr_code_group_id']").on("change",function() {
		$("input[name='dupcheck']").val(0);
	});
	
	$("#page16120_div01 form").on("submit", function(event) {
		if($("input[name='dupcheck']").val() == 0) {
			alert("인사코드 그룹 번호의 중복체크가 필요합니다.");
			$("#page16120_btn02").focus();
			return false;
		}
		var data =  $(this).serialize();
		$.ajax({ 					
			data: 	 data,
			type: 	'post',	 			
			url: 	"/hr_management/manage_hr_code/add_base_code_group_pro",
			success: function(response) { 	
				$('#page16120_div01').html(response);	
			}
		});
		return false;
	});
	
	$("#page16120_btn02").on("click", function() {
		var $hr_code_group_id = $("input[name='hr_code_group_id']");
		if(!$hr_code_group_id.val()) {
			alert("먼저 인사코드 그룹 번호에 값을 입력하세요.");
			$hr_code_group_id.focus();
			return false;
		}
		var url = "/hr_management/manage_hr_code/add_base_code_group_dupCheck?hr_code_group_id="+$hr_code_group_id.val();
		$("#page16120_div01").slideUp();
		$("#page16120_div02").slideDown();
		$("#page16120_div02").load(url);
	});
	
	$("#page16120_btn01").bind("click", function(event) {
		$("#page16120").slideUp();
		$("#page16110_div01").slideDown();
		return false;		
	});
	
</script>
<body>
<div class="panel panel-default" id="page16120">
	<div class="panel-heading">
		<a id="page16120_div01_toggle">[16120]add_base_code_group.jsp</a>
	</div>
	<div class="panel-body" id="page16120_div01">
		<form action="#" name="page16120_form01">
			<table class="table text-center">
				<tr>
					<th>인사코드 그룹번호</th>
					<td>
						<div class="input-group">
							<input class="form-control input-sm" type="number" name="hr_code_group_id"
						min="1" max="9" step="1" value="${hr_code_group_id}" required>
						<span class="input-group-btn">
							<input class="btn btn-default btn-sm" type="button" value="중복확인" id="page16120_btn02">
						</span>
						</div>
					</td>
				</tr>
				<tr>
					<th>인사코드 그룹명</th>
					<td>
						<input class="form-control input-sm" type="text" name="hr_code_group_name" maxlength="255" required>
					</td>
				</tr>
				<tr>
					<th>사용 상태</th>
					<td>
						<label for="used">사용</label>
						<input type="radio" name="use_state" id="used" value="Y" checked>
						<label for="unused">비사용</label>
						<input type="radio" name="use_state" id="unused" value="N">
					</td>
				</tr>
				<tr>
					<th colspan="2">
						<input type="hidden" name="dupcheck" 
						<c:if test="${dupcheck == null}">value="0"</c:if>
						<c:if test="${dupcheck == 1}">value="1"</c:if>>
						<input class="btn btn-default btn-sm" type="submit" value="등록하기">
						<input class="btn btn-default btn-sm" type="reset"	value="재작성">
						<input class="btn btn-default btn-sm" type="button" value="닫기" id="page16120_btn01">
					</th>
				</tr>
			</table>
		</form>
	</div>
	<div id="page16120_div02"></div>
</div>
</body>
</html>