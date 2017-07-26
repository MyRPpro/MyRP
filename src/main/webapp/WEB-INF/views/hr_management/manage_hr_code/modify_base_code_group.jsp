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
	function fn_submit() {
		var hr_code_group_id = document.modify_base_code_group_form1.hr_code_group_id;
		var use_state = document.modify_base_code_group_form1.use_state;
		$("#hr_code_group_div").load(
				"/hr_management/manage_hr_code/modify_base_code_group_pro"+
				"?hr_code_group_id="+hr_code_group_id.value+
				"&use_state="+use_state.value
				);
		return false;
	}
</script>
<body>
modify_base_code_group.jsp
<form action="#" method="get" name="modify_base_code_group_form1"
onsubmit="return fn_submit();">
	<table border="1">
		<tr>
			<th>hr_code_group_id</th>
			<th>hr_code_group_name</th>
			<th>use_state</th>
			<th>toggle</th>
			<th>update</th>
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
				<input type="submit" value="적용하기">
				<input type="reset" value="되돌리기">
			</td>
		</tr>
	</table>
</form>
</body>
</html>