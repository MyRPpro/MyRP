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
	$("form[name='page16130_form01']").on("submit", function(event) {
		var data = $(this).serialize();
		$.ajax({
			data:	data,
			type:	'get',
			url:	"/hr_management/manage_hr_code/modify_base_code_group_pro",
			success: function(response) {
				$("#page16110_div02").html(response);
			}
		});
		return false;
	});
</script>
<body>
	<div id="page16130">
		<form action="#" name="page16130_form01">
			<table class="table">
				<tr>
					<th>인사코드 그룹번호</th>
					<th>인사코드 그룹명</th>
					<th>사용 상태</th>
					<th>toggle</th>
					<th>갱신</th>
				</tr>
				<tr>
					<td>${hr_code_groupVo.hr_code_group_id}</td>
					<td>${hr_code_groupVo.hr_code_group_name}</td>
					<td>${hr_code_groupVo.use_state}</td>
					<td>
						<input type="hidden" name="hr_code_group_id" value="${hr_code_groupVo.hr_code_group_id}">
						<label for="used">사용</label>
						<input type="radio" name="use_state" id="used" value="Y"
						<c:if test="${hr_code_groupVo.use_state == 'Y'}">checked</c:if>>
						<label for="unused">비사용</label>
						<input type="radio" name="use_state" id="unused" value="N"
						<c:if test="${hr_code_groupVo.use_state == 'N'}">checked</c:if>>
					</td>
					<td>
						<input class="btn btn-default btn-sm" type="submit" value="적용하기">
						<input class="btn btn-default btn-sm" type="reset" value="되돌리기">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>