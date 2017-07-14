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
modify_base_code.jsp
<form action="/hr_management/manage_hr_code/modify_base_code_pro"
name="modify_base_code_form1" method="post">
	<table border="1">
		<tr>
			<th>hr_code_group_id</th>
			<td>
				<input type="number" name="hr_code_group_id"
				value="${hr_codeVo.hr_code_group_id}" readonly>
			</td>
		</tr>
		<tr>
			<th>hr_code_id</th>
			<td>
				<input type="number" name="hr_code_id"
				value="${hr_codeVo.hr_code_id}" readonly>
			</td>
		</tr>
		<tr>
		<tr>
			<th>hr_code_name</th>
			<td>
				<input type="text" name="hr_code_name"
				value="${hr_codeVo.hr_code_name}" required>
			</td>
		</tr>
		<tr>
			<th>use_state</th>
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
				<input type="submit" value="수정하기">
				<input type="reset"	value="재작성">
				<input type="button" value="돌아가기"
				onclick="window.history.back();">
			</th>
		</tr>
	</table>
</form>
</body>
</html>