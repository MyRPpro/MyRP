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
<script type="text/javascript">
	function fn_validate_form() {
		var salary_register_name = document.modify_salary_info_form1.salary_register_name;
		if(salary_register_name.value == 0) {
			alert("급여종류를 선택하세요.");
			salary_register_name.focus();
			return false;
		}
	}
</script>
<body>
modify_salary_info.jsp
<form action="/hr_management/manage_salary/modify_salary_info_pro"
method="post" name="modify_salary_info_form1"
onsubmit="return fn_validate_form();">
	<table border="1">
		<tr>
			<th colspan="8">Salary_registerVO</th>
		</tr>
		<tr>
			<th>salary_register_id</th>
			<td><input type="text" name="salary_register_id"
			value="${salary_registerVo.salary_register_id}" readonly></td>
		</tr>
		<tr>
			<th>account_id</th>
			<td><input type="text" name="account_id"
			value="${salary_registerVo.account_id}" readonly></td>
		</tr>
		<tr>
			<th>reg_date</th>
			<td>
				<input type="month" name="reg_date" 
				value="<fmt:formatDate value='${salary_registerVo.reg_date}' pattern='yyyy-MM'/>" 
				required
				<c:if test="${salary_registerVo.salary_state != 26450}">readonly</c:if>>
			</td>
		</tr>
		<tr>
			<th>salary_register_name</th>
			<td>
				<c:if test="${salary_registerVo.salary_state == 26450}">
					<select name="salary_register_name">
						<option value=0>급여구분 선택</option>
						<c:forEach var="vo" items="${hr_codeVos}">
							<option value="${vo.hr_code_name}">
								${vo.hr_code_name}
							</option>
						</c:forEach>
					</select>
				</c:if>
				<c:if test="${salary_registerVo.salary_state != 26450}">
					<input type="text" name="salary_register_name"
					value="${salary_registerVo.salary_register_name}" readonly>
				</c:if>
			</td>
		</tr>
		<tr>
			<th>pay_date</th>
			<td>
				<input type="date" name="pay_date" 
				value="<fmt:formatDate value='${salary_registerVo.pay_date}' pattern='yyyy-MM-dd'/>" 
				required
				<c:if test="${salary_registerVo.salary_state != 26450}">readonly</c:if>>
			</td>
		</tr>
		<tr>
			<th>total_pay</th>
			<td>
				<input type="number" name="total_pay"
				min="0" value="${salary_registerVo.total_pay}" required
				<c:if test="${salary_registerVo.salary_state != 26450}">readonly</c:if>>
			</td>
		</tr>
		<tr>
			<th>total_employee</th>
			<td>
				<input type="number" name="total_employee"
				min="0" value="${salary_registerVo.total_employee}" required
				<c:if test="${salary_registerVo.salary_state != 26450}">readonly</c:if>>
			</td>
		</tr>
		<tr>
			<th colspan="2">
				<c:if test="${salary_registerVo.salary_state == 26450}">
					<input type="submit" value="수정하기">
					<input type="reset"	value="재작성">
				</c:if>
				<input type="button" value="돌아가기"
				onclick="window.history.back();">
			</th>
		</tr>
	</table>
	<input type="hidden" name="salary_state" value="${salary_registerVo.salary_state}">
</form>
</body>
</html>