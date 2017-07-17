/**
 * 
 */

function call_bank_account_id(){
	var url="/accounting_management/bank_account_registration/call_bank_account_id";
	window.open(url, "confirm", "menubar=no, width=400, height=300");
}

function set_bank_account_id(bank_account_id, account_name){
	opener.document.register_bank_account_form1.bank_account_id.value = bank_account_id;
	switch(account_name){
		case "현금" : account_name = "주 계좌"; break;
		case "매출채권" : account_name = "판매";break;
		case "매입채무" : account_name = "구매";break;
		case "급여" : account_name = "급여지급";break;
		case "부가세예수금" : account_name = "세금납부";break;
		default : account_name = "잘못됐다";break;
	}
	opener.document.register_bank_account_form1.bank_account_type.value = account_name;
	self.close();
}

function search_statement_detail(statement_id, connected_id){
	var url="/accounting_management/statement_management/search_statement_detail?statement_id="+statement_id+"&connected_id="+connected_id;
	window.open(url, "confirm", "menubar=no, width=800, height=600");
}