/**
 * 
 */

//bank_account_id 조회
function call_bank_account_id(){
	var url="/accounting_management/bank_account_registration/call_bank_account_id";
	window.open(url, "confirm", "menubar=no, width=400, height=300");
}

// 은행 account_id 설정
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

//전표 상세페이지 띄우기
function search_statement_detail(statement_id, connected_id, typeCnt){
	if(typeCnt==1){
		var url="/accounting_management/statement_management/search_statement_detail?statement_id="+statement_id+"&sales_id="+connected_id;
	}
	if(typeCnt==2){
		var url="/accounting_management/statement_management/search_statement_detail?statement_id="+statement_id+"&purchase_id="+connected_id;
	}
	if(typeCnt==3){
		var url="/accounting_management/statement_management/search_statement_detail?statement_id="+statement_id+"&salary_register_id="+connected_id;
	}
	if(typeCnt==4){
		var url="/accounting_management/statement_management/search_statement_detail?statement_id="+statement_id;
	}
	
	window.open(url, "confirm", "menubar=no, width=800, height=600");
}

//승인메시지 띄우고 전표페이지 다시 돌아가기
function complete_approval(statement_id, connected_id, typeCnt){
	alert("승인처리되었습니다");
	if(typeCnt==1){
		window.location="/accounting_management/statement_management/search_statement_detail?statement_id="+statement_id+"&sales_id="+connected_id;
	}
	if(typeCnt==2){
		window.location="/accounting_management/statement_management/search_statement_detail?statement_id="+statement_id+"&purchase_id="+connected_id;
	}
	if(typeCnt==3){
		window.location="/accounting_management/statement_management/search_statement_detail?statement_id="+statement_id+"&salary_register_id="+connected_id;
	}
	if(typeCnt==4){
		window.location="/accounting_management/statement_management/search_statement_detail?statement_id="+statement_id;
	}
}

//승인거절 메세지 띄우고 전표페이지 다시 돌아가기
function complete_disapproval(statement_id, connected_id, typeCnt){
	alert("승인거절 처리되었습니다");
	if(typeCnt==1){
		window.location="/accounting_management/statement_management/search_statement_detail?statement_id="+statement_id+"&sales_id="+connected_id;
	}
	if(typeCnt==2){
		window.location="/accounting_management/statement_management/search_statement_detail?statement_id="+statement_id+"&purchase_id="+connected_id;
	}
	if(typeCnt==3){
		window.location="/accounting_management/statement_management/search_statement_detail?statement_id="+statement_id+"&salary_register_id="+connected_id;
	}
	if(typeCnt==4){
		window.location="/accounting_management/statement_management/search_statement_detail?statement_id="+statement_id;
	}
}
//자식창 닫을 때 부모창 새로고침
function reload(){
	window.opener.document.location.href=window.opener.document.URL;
}



