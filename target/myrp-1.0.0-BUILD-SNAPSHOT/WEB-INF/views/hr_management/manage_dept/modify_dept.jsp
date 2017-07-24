<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../../setting.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
modify_dept.jsp
<form action="/hr_management/manage_dept/modify_dept_pro"
name="modify_dept_form1" method="post">
	<table border="1">
		<tr>
			<th>dept_id</th>
			<td>
				<input type="text" name="dept_id"
				value="${deptVo.dept_id}" readonly>
			</td>
		</tr>
		<tr>
			<th>dept_name</th>
			<td>
				<input type="text" name="dept_name"
				value="${deptVo.dept_name}" required>
			</td>
		</tr>
		<tr>
			<th>access_role</th>
			<td>
				<input type="text" name="access_role"
				value="${deptVo.access_role}" required>
			</td>
		</tr>
		<tr>
			<th>use_state</th>
			<td>
				<label for="used">사용</label>
				<input type="radio" name="use_state" id="used" value="Y"
				<c:if test="${deptVo.use_state == 'Y'}">checked</c:if>>
				<label for="unused">비사용</label>
				<input type="radio" name="use_state" id="unused" value="N"
				<c:if test="${deptVo.use_state == 'N'}">checked</c:if>>
			</td>
		</tr>
		<tr>
			<th colspan="2">
				<input type="submit" value="수정하기">
				<input type="reset"	value="재작성">
				<input type="button" value="돌아가기"
				onclick="window.location='/hr_management/manage_dept/dept_list';">
			</th>
		</tr>
	</table>
</form>
</body>
</html>