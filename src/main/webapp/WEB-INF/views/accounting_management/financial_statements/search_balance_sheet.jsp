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
<div class="panel panel-default" id="bank_account_list">
	<div class="panel-heading">
		 회계보고서
	</div>
		<div class="panel-body" style="text-align: center;">
			<div class="btn-group" data-toggle="buttons"> 
			<label for="fi_statements" class="btn btn-primary active" id="balance_sheet" > 재무상태표 
			<input type="radio" name="fi_statements" value="balance_sheet" checked >
			</label>
			<label for="profit_and_loss_statement" class="btn btn-primary" id="profit_and_loss_statement"> 손익계산서
			<input type="radio" name="fi_statements" value="profit_and_loss">
			</label>
			<label for="statement_of_cash_flows" class="btn btn-primary" id="statement_of_cash_flows" > 현금흐름표
				<input type="radio" name="fi_statements" value="cash_flows">
			</label>
			</div>
		</div>
<div id="select_date">

</div>
</div>