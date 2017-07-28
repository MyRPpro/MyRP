<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../../setting.jsp"%>

<script type="text/javascript">
$(document).ready(function onload_function(){
	$("#select_date").load("/accounting_management/financial_statements/search_balance_sheet2");
});
$(function(){
	$('#balance_sheet').unbind("click").bind("click",function(){
		$("#select_date").load("/accounting_management/financial_statements/search_balance_sheet2");
	});
});

$(function(){
	$('#profit_and_loss_statement').unbind("click").bind("click",function(){
		$("#select_date").load("/accounting_management/financial_statements/search_profit_and_loss_statement");
	});
});

$(function(){
	 $('#statement_of_cash_flows').unbind("click").bind("click",function(){
		 $("#select_date").load("/accounting_management/financial_statements/search_statement_of_cash_flows");
	});
});
</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src = "/resources/accounting_management/accounting_management_script.js"></script>​
</head>
<body>


<table>
	<tr>
		<th>
			보고서 선택
		</th>
	</tr>
	<tr>
		<td>
			<input type="radio" name="fi_statements" id="balance_sheet" value="balance_sheet" checked>
			<label for="fi_statements"> 재무상태표 </label>
			<input type="radio" name="fi_statements" id="profit_and_loss_statement" value="profit_and_loss">
			<label for="profit_and_loss_statement"> 손익계산서 </label>
			<input type="radio" name="fi_statements" id="statement_of_cash_flows" value="cash_flows">
			<label for="statement_of_cash_flows"> 현금흐름표 </label>
		</td>
	</tr>
</table>
<div id="select_date">

</div>

</body>
</html>