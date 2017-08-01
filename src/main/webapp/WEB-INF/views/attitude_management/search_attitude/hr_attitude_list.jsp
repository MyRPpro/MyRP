<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../../setting.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
hr_attitude_list.jsp
<table border="1">
	<tr>
		<th colspan="10">Hr_attitude_listDTO</th>
	</tr>
	<tr>
		<th>employee_id</th>
		<th>employee_name</th>
		<th>attitude_date</th>
		<th>hr_code_group_leave</th>
		<th>leave_code</th>
		<th>leave_code_name</th>
		<th>attitude_period</th>
		<th>hr_code_group_reason</th>
		<th>attitude_reason</th>
		<th>attitude_reason_name</th>
	</tr>
	<c:forEach var="dto" items="${hr_attitude_listDtos}">
	<tr>
		<td>${dto.employee_id}</td>
		<td>${dto.employee_name}</td>
		<td>${dto.attitude_date}</td>
		<td>${dto.hr_code_group_leave}</td>
		<td>${dto.leave_code}</td>
		<td>${dto.leave_code_name}</td>
		<td>${dto.attitude_period}</td>
		<td>${dto.hr_code_group_reason}</td>
		<td>${dto.attitude_reason}</td>
		<td>${dto.attitude_reason_name}</td>
	</tr>
	</c:forEach>
</table>
</body>
</html>