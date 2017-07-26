<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../../setting.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
function fn_clear_payment(salary_register_id,account_id,pay_date) {
	var now = new Date();
	var year= now.getFullYear();
    var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
	var today = year + mon + "-" +  (now.getDate());
	
	if(pay_date.replace("-","") > today) {
		alert("지급예정일 이후로만 급여지급이 가능합니다.");
		return false;
	}
	window.location="/hr_management/manage_salary/clear_salary_bank_account_pro"+
					"?salary_register_id="+salary_register_id+
					"&account_id="+account_id;
}
</script>
<body>
clear_salary_bank_account.jsp
<c:if test="${cnt == 0}">
	<table border="1">
		<tr>
			<th>지급대기 중인 급여가 없습니다.</th>
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
			<th colspan="9">Salary_registerVO</th>
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
			<th>clear_payment</th>
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
				<td>
					<input type="button" value="급여지급"
					onclick="return fn_clear_payment(${vo.salary_register_id},${vo.account_id},'${vo.pay_date}');">
				</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="9">
				<input type="button" value="돌아가기"
				onclick="window.location='/hr_management/manage_salary/salary_register_search';">			
			</td>
		</tr>
	</table>
</c:if>

</body>
</html>