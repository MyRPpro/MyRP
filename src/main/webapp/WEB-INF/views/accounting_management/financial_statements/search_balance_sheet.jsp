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
<h3> 재무상태표 조회 </h3>
 <button onclick="window.location='/'"> 홈으로 </button>
 <button onclick="window.location='/accounting_management/financial_statements/search_profit_and_loss_statement'"> 손익계산서 조회 </button>
 <button onclick="window.location='/accounting_management/financial_statements/search_statement_of_cash_flows'"> 현금흐름표 조회 </button>
<form action="/accounting_management/financial_statements/show_balance_sheet" name="financial_statements_form1" method="post">
<table border="1">
	<tr>
		<th>
			보고서 선택
		</th>
		<td>
			<input type="radio" name="fi_statements" id="balance_sheet" value="balance_sheet" checked>
			<label for="fi_statements"> 재무상태표 </label>
			<input type="radio" name="fi_statements" id="profit_and_loss_statement" value="profit_and_loss">
			<label for="profit_and_loss_statement"> 손익계산서 </label>
			<input type="radio" name="fi_statements" id="statement_of_cash_flows" value="cash_flows">
			<label for="statement_of_cash_flows"> 현금흐름표 </label>
		</td>
	</tr>
	<tr>
		<th>기간 선택 </th>
		<td> 
			<select name="year">
			<c:forEach var = "yearDto" items = "${yearDto}">
				<option value="${yearDto.year}"> ${yearDto.year}년 </option>
			</c:forEach>
			</select>
			<select name="quarter">
				<option value="03"> 1분기 </option>
				<option value="06"> 2분기 </option>
				<option value="09"> 3분기 </option>
				<option value="12"> 4분기 </option>
			</select>
		</td>
	</tr>
</table>
	<input type="submit" value="조회 ">
</form>
</body>
</html>