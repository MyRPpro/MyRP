<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../../setting.jsp"%>
<script type="text/javascript">

/* $(function(){
	$('#calling_button').unbind("click").bind("click",function(){ */
function set_bank_account_id(account_id,account_name,account_balance){
		/* var account_id = $('input[name="account_id"]').val()
		var account_name = $('input[name="account_name"]').val()
		var account_balance = $('input[name="account_balance"]').val()*/
		
		switch(account_name){
			case "현금" : account_name = "주 계좌"; break;
			case "매출채권" : account_name = "판매";break;
			case "매입채무" : account_name = "구매";break;
			case "급여" : account_name = "급여지급";break;
			case "부가세예수금" : account_name = "세금납부";break;
			default : account_name = "잘못됐다";break;
		}
		
		document.getElementById("bank_account_id").value = account_id;
		document.getElementById("bank_account_type").value = account_name;
		document.getElementById("bank_account_balance").value = account_balance;
		
		/* togo = $('#call_bank_id_stage');
	
		$.ajax({ 		
			type: 	'get',	 			
			url: 	"/accounting_management/bank_account_registration/call_bank_account_id",
			success: function(response) { 	
				togo.html(response);	
			}
		}); */
	}
	
	/* }); */
	
		
</script>
<body>
		
		
</body>
</html>