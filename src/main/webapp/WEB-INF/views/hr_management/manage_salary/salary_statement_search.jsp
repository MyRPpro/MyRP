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
salary_statement_search.jsp
<c:if test="${cnt == 0}">
	<table border="1">
		<tr>
			<th>새로 승인완료된 전표가 없습니다.</th>
		</tr>
		<tr>
			<td>
				<input type="button" value="돌아가기"
				onclick="window.location='/hr_management/manage_salary/salary_register_search';">			
			</td>
		</tr>
	</table>
</c:if>
<c:if test="${cnt != 0}">
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
			<th></th>
		</tr>
		<c:forEach var="vo" items="${vos}">
			<tr>
				<td>${vo.salary_register_id}</td>
				<td>${vo.account_id}</td>
				<td>${vo.reg_date}</td>
				<td>${vo.salary_register_name}</td>
				<td>${vo.pay_date}</td>
				<td>${vo.total_pay}</td>
				<td>${vo.total_employee}</td>
				<td>${vo.salary_state}</td>
				<td></td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="8">
				<input type="button" value="돌아가기"
				onclick="window.location='/hr_management/manage_salary/salary_register_search';">			
			</td>
		</tr>
	</table>
</c:if>
</body>
</html>