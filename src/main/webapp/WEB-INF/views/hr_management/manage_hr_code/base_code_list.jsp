<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
base_code_list.jsp
<table border="1">
	<tr>
		<th colspan="5">${hr_code_group_name}</th>
	</tr>
	<tr>
		<th>hr_code_group_id</th>
		<th>hr_code_id</th>
		<th>hr_code_name</th>
		<th>use_state</th>
	</tr>
	<c:forEach var="vo" items="${hr_codeVos}">
	<tr>
		<td>${vo.hr_code_group_id}</td>
		<td>${vo.hr_code_id}</td>
		<td>
			<a href="/hr_management/manage_hr_code/modify_base_code?hr_code_id=${vo.hr_code_id}">
				${vo.hr_code_name}
			</a>
		</td>
		<td>${vo.use_state}</td>
	</c:forEach>
</table>
<form action="/hr_management/manage_hr_code/add_base_code" method="get" name="base_code_list_form1">
	<input type="submit" value="인사코드  등록">
</form>
</body>
</html>