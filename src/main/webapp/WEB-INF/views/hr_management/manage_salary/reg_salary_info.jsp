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
reg_salary_info.jsp
<form action="/hr_management/manage_salary/reg_salary_info_pro"
method="post" name="reg_salary_info_form1">
	<table border="1">
		<tr>
			<th colspan="8">Salary_registerVO</th>
		</tr>
		<tr>
			<th>reg_date</th>
			<td>
				<c:set var="now" value="<%= new java.util.Date() %>"/>
				<input type="month" name="reg_date" 
				value="<fmt:formatDate value='${now}' pattern='yyyy-MM'/>" 
				required>
			</td>
		</tr>
		<tr>
			<th>salary_register_name</th>
			<td>
				<select name="salary_register_name">
					<option value=0>급여구분 선택</option>
					<c:forEach var="vo" items="${hr_codeVos}">
						<option value="${vo.hr_code_id}">${vo.hr_code_name}</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<th>pay_date</th>
			<td>
				<c:set var="now" value="<%= new java.util.Date() %>"/>
				<input type="date" name="pay_date" 
				value="<fmt:formatDate value='${now}' pattern='yyyy-MM-dd'/>" 
				required>
			</td>
		</tr>
		<tr>
			<th>total_pay</th>
			<td>
				<input type="number" name="total_pay"
				min="0" required>
			</td>
		</tr>
		<tr>
			<th>total_employee</th>
			<td>
				<input type="number" name="total_employee"
				min="0" required>
			</td>
		</tr>
		<tr>
			<th colspan="2">
				<input type="submit" value="등록하기">
				<input type="reset"	value="재작성">
				<input type="button" value="돌아가기"
				onclick="window.history.back();">
			</th>
		</tr>
	</table>
</form>
</body>
</html>