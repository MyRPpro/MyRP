<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../../setting.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
modify_base_code_group.jsp

<form action="/hr_management/manage_hr_code/modify_base_code_group_pro"
method="get" name="modify_base_code_group_form1">
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
				<label for="unused">미사용</label>
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