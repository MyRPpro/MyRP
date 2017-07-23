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
	function fn_retired_reg() {
		var employee_state = document.retired_employee_regform1.employee_state;
		if(employee_state.value == 0) {
			alert("직원 상태를 선택하세요.");
			employee_state.focus();
			return false;
		}
		var retired_date = document.retired_employee_regform1.retired_date;
		var now = new Date();
		var select_date = new Date(retired_date.value); 
		if(select_date < now) {
			alert("퇴사일은 금일 이후로만 선택가능합니다.");
			retired_date.focus();
			return false;			
		}
	}
</script>
<body>
add_retired_employee_regform.jsp
<form action="/hr_management/manage_retired_employee/add_retired_employee_pro"
method="post" name="retired_employee_regform1"
onsubmit="return fn_retired_reg();">
	<table border="1">
		<tr>
			<th>employee_id</th>
			<td>${dto.employee_id}</td>
		</tr>
		<tr>
			<th>employee_name</th>
			<td>${dto.employee_name}</td>
		</tr>
		<tr>
			<th>dept_id</th>
			<td>${dto.dept_id}</td>
		</tr>
		<tr>
			<th>dept_name</th>
			<td>${dto.dept_name}</td>
		</tr>
		<tr>
			<th>hr_code_group_rank</th>
			<td>${dto.hr_code_group_rank}</td>
		</tr>
		<tr>
			<th>rank_code</th>
			<td>${dto.rank_code}</td>
		</tr>
		<tr>
			<th>hr_code_name</th>
			<td>${dto.hr_code_name}</td>
		</tr>
		<tr>
			<th>join_date</th>
			<td>${dto.join_date}</td>
		</tr>
		<tr>
			<th>retired_date</th>
			<td>
				<c:set var="now" value="<%= new java.util.Date() %>"/>
				<input type="date" name="retired_date"
				value="<fmt:formatDate value='${now}' pattern='yyyy-MM-dd'/>"
				required>
			</td>
		</tr>
		<tr>
			<th>retired_reason</th>
			<td>
				<textarea rows="5" name="retired_reason">사유를 작성하세요.</textarea>
			</td>
		</tr>
		<tr>
			<th colspan="2">
				<input type="submit" value="퇴사자 등록">
				<input type="reset" value="재작성">
				<input type="button" value="돌아가기"
				onclick="window.history.back();">
			</th>
		</tr>
	</table>
	<input type="hidden" name="employee_id" value="${dto.employee_id}">
</form>
</body>
</html>