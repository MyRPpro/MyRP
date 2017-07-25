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
function fn_salary_register_search() {
	var salary_register_name = document.salary_register_search_form1.salary_register_name.value;
	var search_start = document.salary_register_search_form1.search_start.value;
	var search_end = document.salary_register_search_form1.search_end.value;
	$("#salary_register_nav_div").load(
			"/hr_management/manage_salary/salary_register_nav"+
			"?salary_register_name="+salary_register_name+
			"&search_start="+search_start+
			"&search_end="+search_end);
	$("#salary_register_div").load(
			"/hr_management/manage_salary/salary_register_list"+
			"?salary_register_name="+salary_register_name+
			"&search_start="+search_start+
			"&search_end="+search_end);
	return false;
}
function fn_salary_register_nav(pageNum) {
	var salary_register_name = document.salary_register_search_form1.salary_register_name.value;
	var search_start = document.salary_register_search_form1.search_start.value;
	var search_end = document.salary_register_search_form1.search_end.value;
	$("#salary_register_nav_div").load(
			"/hr_management/manage_salary/salary_register_nav"+
			"?salary_register_name="+salary_register_name+
			"&search_start="+search_start+
			"&search_end="+search_end+
			"&pageNum="+pageNum);
	$("#salary_register_div").load(
			"/hr_management/manage_salary/salary_register_list"+
			"?salary_register_name="+salary_register_name+
			"&search_start="+search_start+
			"&search_end="+search_end+
			"&pageNum="+pageNum);
	return false;
}
</script>
<body>
salary_register.jsp
<div>
<form action="#" name="salary_register_search_form1" method="get"
onsubmit="return fn_salary_register_search();">
	<table border="1">
		<tr>
			<td>
				<select name="salary_register_name">
					<option value=0>급여구분 선택</option>
					<c:forEach var="vo" items="${hr_codeVos}">
						<option value="${vo.hr_code_id}">${vo.hr_code_name}</option>
					</c:forEach>
				</select>
			</td>
			<td>
				<input type="date" name="search_start">
				 &nbsp;~&nbsp;
				<input type="date" name="search_end">
			</td>
			<td>
				<input type="submit" value="검색">
				<input type="reset" value="재작성">
				<input type="button" value="급여대장 등록"
				onclick="window.location='/hr_management/manage_salary/reg_salary_info';">
				<input type="button" value="회계전표 등록"
				onclick="window.location='/accounting_management/statement_management/make_statement';">
				<input type="button" value="회계전표조회"
				onclick="window.location='/hr_management/manage_salary/salary_statement_search';">
				<input type="button" value="급여지급"
				onclick="window.location='/hr_management/manage_salary/clear_salary_bank_account';">
				<input type="button" value="돌아가기" onclick="window.location='/';">			
			</td>
		</tr>
	</table>
</form>
</div>
<hr>
<div id="salary_register_nav_div">
</div>
<hr>
<div id="salary_register_div">
<table border="1">
	<tr>
		<th>검색하실 급여대장의 급여구분이나 지급연월 범위를 검색창에 입력하세요.</th>
	</tr>
</table>
</div>
</body>
</html>