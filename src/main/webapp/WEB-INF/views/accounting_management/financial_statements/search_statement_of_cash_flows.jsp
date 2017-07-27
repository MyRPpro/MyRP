<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../../setting.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src = "/resources/accounting_management/accounting_management_script.js"></script>​
</head>
<body>
<h3> 현금흐름표 조회 </h3>
 <button onclick="window.location='/'"> 홈으로 </button>
 <button onclick="window.location='/accounting_management/financial_statements/search_balance_sheet'"> 재무상태표 조회 </button>
 <button onclick="window.location='/accounting_management/financial_statements/search_profit_and_loss_statement'"> 손익계산서 조회 </button>
<form action="/accounting_management/financial_statements/show_statement_of_cash_flows" name="financial_statements_form3" method="post" onsubmit="return check_date_order();">
<table border="1">
	<tr>
		<th>
			보고서 선택
		</th>
		<td>
			<input type="radio" name="fi_statements" id="balance_sheet" value="balance_sheet">
			<label for="fi_statements"> 재무상태표 </label>
			<input type="radio" name="fi_statements" id="profit_and_loss_statement" value="profit_and_loss">
			<label for="profit_and_loss_statement"> 손익계산서 </label>
			<input type="radio" name="fi_statements" id="statement_of_cash_flows" value="cash_flows" checked>
			<label for="statement_of_cash_flows"> 현금흐름표 </label>
		</td>
	</tr>
	<tr>
		<th>기간 선택 </th>
		<td> 
			<input type="date" id="startDate" name="startDate"> 
			~ 
			<input type="date" id="endDate" name="endDate"><br>
			<input type="button" value="금일" onclick="SetToday('startDate', 'endDate');">
			<input type="button" value="전일" onclick="SetYesterday('startDate', 'endDate');">
			<input type="button" value="금주" onclick="SetWeek('startDate', 'endDate');">
			<input type="button" value="전주" onclick="SetPrevWeek('startDate', 'endDate')"><br>
			<input type="button" value="금월" onclick="SetCurrentMonthDays('startDate', 'endDate');">
			<input type="button" value="전월" onclick="SetPrevMonthDays('startDate', 'endDate');">
			<input type="button" value="금 분기" onclick="SetCurrentQuarter('startDate', 'endDate');">
			<input type="button" value="전 분기" onclick="SetPrevQuarter('startDate', 'endDate');">
		</td>
	</tr>
</table>
	<input type="submit" value="조회 ">
</form>
</body>
</html>