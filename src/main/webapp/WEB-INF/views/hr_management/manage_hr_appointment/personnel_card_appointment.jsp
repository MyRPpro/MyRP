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
personnel_card_appointment.jsp
<table border="1">
	<tr>
		<th>
			<input type="button" value="HOME"
			onclick="window.location='/';">
			<input type="button" value="INFO"
			onclick="window.location='/hr_management/manage_personnel_card/modify_personnel_card?employee_id=${employee_id}';">
			<input type="button" value="APPOINT"
			onclick="window.location='/hr_management/manage_hr_appointment/personnel_card_appointment?employee_id=${employee_id}';">
		</th>
	</tr>
</table>
<table border="1">
	<tr>
		<th colspan="12">Hr_appointment_listDTO</th>
	</tr>
	<tr>
		<th colspan="12" style="width:100px; height:130px;">
			<img alt="사진 이미지" src="/resources/images/${employee_id}.jpg"
			width="100" height="125">
		</th>
	</tr>
	<tr>
		<th>employee_id</th>
		<th>employee_name</th>
		<th>appointment_date</th>
		<th>hr_code_group_rank</th>
		<th>pre_rank</th>
		<th>pre_rank_name</th>
		<th>post_rank</th>
		<th>post_rank_name</th>
		<th>pre_dept</th>
		<th>pre_dept_name</th>
		<th>post_dept</th>
		<th>post_dept_name</th>
	</tr>
	<c:forEach var="dto" items="${dtos}">
	<tr>
		<td>${dto.employee_id}</td>
		<td>${dto.employee_name}</td>
		<td>${dto.appointment_date}</td>
		<td>${dto.hr_code_group_rank}</td>
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