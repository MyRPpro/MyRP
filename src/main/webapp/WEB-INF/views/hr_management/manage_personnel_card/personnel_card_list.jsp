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
personnel_card_list.jsp
<hr>
<table border="1">
	<tr>
		<th colspan="7">EmployeeVO</th>
	</tr>
	<tr>
		<th>employee_id</th>
		<th>dept_id</th>
		<th>hr_code_group_rank</th>
		<th>rank_code</th>
		<th>employee_name</th>
		<th>residence_reg_no</th>
		<th>join_date</th>
	</tr>
	<c:forEach var="vo" items="${employeeVos}">
	<tr>
		<td>${vo.employee_id}</td>
		<td>${vo.dept_id}</td>
		<td>${vo.hr_code_group_rank}</td>
		<td>${vo.rank_code}</td>
		<td>
			<a href="/hr_management/manage_personnel_card/modify_personnel_card?employee_id=${vo.employee_id}">
				${vo.employee_name}
			</a>
		</td>
		<td>${vo.residence_reg_no}</td>
		<td>${vo.join_date}</td>
	</tr>
	</c:forEach>
</table>
<hr>
<table border="1">
	<tr>
		<th colspan="10">Personnel_card_listDTO</th>
	</tr>
	<tr>
		<th>employee_id</th>
		<th>dept_id</th>
		<th>dept_name</th>
		<th>hr_code_group_rank</th>
		<th>hr_code_group_name</th>
		<th>rank_code</th>
		<th>hr_code_name</th>
		<th>employee_name</th>
		<th>residence_reg_no</th>
		<th>join_date</th>
	</tr>
	<c:forEach var="dto" items="${presonnel_card_listDtos}">
	<tr>
		<td>${dto.employee_id}</td>
		<td>${dto.dept_id}</td>
		<td>${dto.dept_name}</td>
		<td>${dto.hr_code_group_rank}</td>
		<td>${dto.hr_code_group_name}</td>
		<td>${dto.rank_code}</td>
		<td>${dto.hr_code_name}</td>
		<td>
			<a href="/hr_management/manage_personnel_card/modify_personnel_card?employee_id=${dto.employee_id}">
				${dto.employee_name}
			</a>
		</td>
		<td>${dto.residence_reg_no}</td>
		<td>${dto.join_date}</td>
	</tr>
	</c:forEach>
</table>
<hr>
</body>
</html>