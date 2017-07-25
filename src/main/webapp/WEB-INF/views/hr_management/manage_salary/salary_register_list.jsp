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
salary_register_list.jsp
<table border="1">
	<tr>
		<th colspan="8">Salary_registerVO</th>
	</tr>
	<tr>
		<th>salary_register_id</th>
		<th>account_id</th>
		<th>reg_date</th>
		<th>salary_register_name</th>
		<th>pay_date</th>
		<th>total_pay</th>
		<th>total_employee</th>
		<th>salary_state</th>		

	</tr>
	<c:forEach var="vo" items="${salary_registerVos}">
	<tr>
		<td>${vo.salary_register_id}</td>
		<td>${vo.account_id}</td>
		<td>${vo.reg_date}</td>
		<td>
			<a href="/hr_management/manage_salary/salary_register_info?salary_register_id=${vo.salary_register_id}">
				${vo.salary_register_name}
			</a>
		</td>
		<td>${vo.pay_date}</td>
		<td>${vo.total_pay}</td>
		<td>${vo.total_employee}</td>
		<td>${vo.salary_state}</td>
	</tr>
	</c:forEach>
</table>
<hr>
</body>
</html>