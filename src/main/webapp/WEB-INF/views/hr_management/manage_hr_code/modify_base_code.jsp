<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../../setting.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	
	$("#page16160_div01_toggle").bind("click", function(event) {
		$("#page16160_div01").slideToggle();
		return false;
	});
	$("#page16160_btn01").bind("click", function(event) {
		$("#page16160").slideUp();
		$("#page16140_div01").slideDown();
		return false;		
	});
	
	$("form[name='page16160_form01']").on("submit", function(event) {
		var data = $(this).serialize();
		$.ajax({
			data:	data,
			type:	'post',
			url:	'/hr_management/manage_hr_code/modify_base_code_pro',
			success: function(response) {
				$("#page16160_div01").html(response);
				$("#page16160").slideUp();
			}
		});
		return false;
	});
	
</script>
<body>
	<div class="panel panel-default" id="page16160">
		<div class="panel-heading">
			<a id="page16160_div01_toggle">[16160]modify_base_code.jsp</a>
		</div>
		<div class="panel-body" id="page16160_div01">
			<form action="#" name="page16160_form01">
				<table class="table">
					<tr>
						<th>인사코드 그룹번호＊</th>
						<td>
							<input class="form-control input-sm" type="number" name="hr_code_group_id"
							value="${hr_codeVo.hr_code_group_id}" readonly>
						</td>
					</tr>
					<tr>
						<th>인사코드 번호＊</th>
						<td>
							<input class="form-control input-sm" type="number" name="hr_code_id"
							value="${hr_codeVo.hr_code_id}" readonly>
						</td>
					</tr>
					<tr>
					<tr>
						<th>인사코드명＊</th>
						<td>
							<input class="form-control input-sm" type="text" name="hr_code_name"
							value="${hr_codeVo.hr_code_name}" required>
						</td>
					</tr>
					<tr>
						<th>사용 상태＊</th>
						<td>
							<label for="used">사용</label>
							<input type="radio" name="use_state" id="used" value="Y"
							<c:if test="${hr_codeVo.use_state == 'Y'}">checked</c:if>>
							<label for="unused">비사용</label>
							<input type="radio" name="use_state" id="unused" value="N"
							<c:if test="${hr_codeVo.use_state == 'N'}">checked</c:if>>
						</td>
					</tr>
					<tr>
						<th colspan="2">
							<input class="btn btn-default btn-sm" type="submit" value="수정하기">
							<input class="btn btn-default btn-sm" type="reset"	value="재작성">
							<input class="btn btn-default btn-sm" type="button"
							value="닫기" id="page16160_btn01">
						</th>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>