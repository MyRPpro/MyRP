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
hr_appointment_list.jsp
<table border="1">
	<tr>
		<th colspan="11">Hr_appointment_listDTO</th>
	</tr>
	<tr>
		<th>appointment_date</th>
		<th>employee_id</th>
		<th>employee_name</th>
		<th>pre_rank</th>
		<th>pre_rank_name</th>
		<th>post_rank</th>
		<th>post_rank_name</th>
		<th>pre_dept</th>
		<th>pre_dept_name</th>
		<th>post_dept</th>
		<th>post_dept_name</th>
	</tr>
	<c:forEach var="dto" items="${hr_appointment_listDtos}">
	<tr>
		<td>${dto.appointment_date}</td>
		<td>${dto.employee_id}</td>
		<td>
			<a href="/hr_management/manage_hr_appointment/personnel_card_appointment?employee_id=${dto.employee_id}">
				${dto.employee_name}
			</a>
		</td>
		<td>${dto.pre_rank}</td>
		<td>${dto.pre_rank_name}</td>
		<td>${dto.post_rank}</td>
		<td>${dto.post_rank_name}</td>
		<td>${dto.pre_dept}</td>
		<td>${dto.pre_dept_name}</td>
		<td>${dto.post_dept}</td>	
		<td>${dto.post_dept_name}</td>	
	</tr>
	</c:forEach>
</table>
</body>
</html>