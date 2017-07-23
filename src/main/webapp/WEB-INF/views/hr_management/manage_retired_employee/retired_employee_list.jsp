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
retired_employee_list.jsp
<table border="1">
	<tr>
		<th colspan="11">Retired_EmployeeDTO</th>
	</tr>
	<tr>
		<th>employee_id</th>
		<th>employee_name</th>
		<th>dept_id</th>
		<th>dept_name</th>
		<th>hr_code_group_id</th>
		<th>hr_code_id</th>
		<th>hr_code_name</th>
		<th>join_date</th>
		<th>retired_date</th>
	</tr>
	<c:forEach var="dto" items="${retired_employeeDto}">
	<tr>
		<td>${dto.employee_id}</td>
		<td>
			<a href="/hr_management/manage_retired_employee/personnel_card_retired?employee_id=${dto.employee_id}">
				${dto.employee_name}
			</a>
		</td>
		<td>${dto.dept_id}</td>
		<td>${dto.dept_name}</td>
		<td>${dto.hr_code_group_rank}</td>
		<td>${dto.rank_code}</td>
		<td>${dto.hr_code_name}</td>
		<td>${dto.join_date}</td>
		<td>${dto.retired_date}</td>	
	</tr>
	</c:forEach>
</table>
</body>
</html>