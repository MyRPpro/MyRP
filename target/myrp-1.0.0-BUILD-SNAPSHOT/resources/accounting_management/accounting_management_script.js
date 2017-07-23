/**
 * 
 */

//bank_account_id 조회
function call_bank_account_id(){
	var url="/accounting_management/bank_account_registration/call_bank_account_id";
	window.open(url, "confirm", "menubar=no, width=400, height=300");
}

// 은행 account_id 설정
function set_bank_account_id(bank_account_id, account_name, account_balance){
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
	opener.document.register_bank_account_form1.bank_account_balance.value = account_balance;
	self.close();
}

//bank_account_register 정보가 올바른지 체크
function check_bank_account(){
	if(!document.register_bank_account_form1.bank_account_id.value){
		alert("'조회' 버튼을 통해 계좌코드를 입력해주세요!");
		document.register_bank_account_form1.calling_button.focus();
		return false;
	}else if(!document.register_bank_account_form1.bank_account_name.value){
		alert("계좌이름을 입력해주세요!");
		document.register_bank_account_form1.bank_account_name.focus();
		return false;
	}else if(!document.register_bank_account_form1.bank_account_number.value){
		alert("계좌번호를 입력해주세요!");
		document.register_bank_account_form1.bank_account_number.focus();
		return false;
	}else if(!document.register_bank_account_form1.bank_name.value){
		alert("은행이름을 입력해주세요!");
		document.register_bank_account_form1.bank_name.focus();
		return false;
	}	
} 
//해당전표거래 해당 계좌가 존재하는지 체크
function bank_account_excist(){
	alert("관련 전표거래에 해당하는 은행계좌가 존재하지 않거나, 이용이 불가하여 거래승인이 불가합니다. 계좌를 먼저 개설해주세요 ");
	if(confirm("계좌개설페이지로 이동하시겠습니까?")){
		self.close();
		window.opener.location="/accounting_management/bank_account_registration/register_bank_account";
	}else{
		window.opener.location="/accounting_management/statement_management/search_all_statements";
	}
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
	if(typeCnt==null){
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
}
//승인메시지 띄우고 전표페이지 다시 돌아가기 (세금)
function complete_approval_tax(statement_id){
	alert("등록/승인처리되었습니다");
	var url="/accounting_management/statement_management/search_statement_detail?statement_id="+statement_id;
	window.location="/accounting_management/statement_management/search_all_statements";
}
//승인거절 메세지 띄우고 전표페이지 다시 돌아가기
function complete_disapproval(statement_id, connected_id, typeCnt){
	alert("승인거절 처리되었습니다");
	if(typeCnt==1||typeCnt==2||typeCnt==3){
		if(typeCnt==1){
			window.location="/accounting_management/statement_management/search_statement_detail?statement_id="+statement_id+"&sales_id="+connected_id;
		}
		if(typeCnt==2){
			window.location="/accounting_management/statement_management/search_statement_detail?statement_id="+statement_id+"&purchase_id="+connected_id;
		}
		if(typeCnt==3){
			window.location="/accounting_management/statement_management/search_statement_detail?statement_id="+statement_id+"&salary_register_id="+connected_id;
		}
	}else {
			window.location="/accounting_management/statement_management/search_statement_detail?statement_id="+statement_id;
	}
}
//자식창 닫을 때 부모창 새로고침
function reload(){
	window.opener.document.location.href=window.opener.document.URL;
}

// connected_id => sales_id, purchase_id, salary_register_id 불러오기
function call_connected_id(){
	var statement_type = document.make_statement_form1.statement_type.value;
	var url="/accounting_management/statement_management/call_connected_id_view?statement_type="+statement_type;
	window.open(url, "confirm", "menubar=no, width=800, height=300");
}

// connected_id => sales_id, purchase_id, salary_register_id 불러오기
function set_connected_id(connected_id, account_id, account_name, account_value, typeCnt){
	opener.document.make_statement_form1.connected_id.value = connected_id;
	opener.document.make_statement_form1.account_id.value = account_id;
	opener.document.make_statement_form1.account_name.value = account_name;
	opener.document.make_statement_form1.account_value.value = account_value;
	opener.document.make_statement_form1.typeCnt.value = typeCnt;
	self.close();
}

function set_account_id(account_id, account_name, account_value, typeCnt){
	opener.document.make_statement_form1.account_id.value = account_id;
	opener.document.make_statement_form1.account_name.value = account_name;
	opener.document.make_statement_form1.account_value.value = account_value;
	opener.document.make_statement_form1.typeCnt.value = typeCnt;
	if(typeCnt==4){ // tax 선택
		if(account_id == "500012020000"){//부가세예수금 =>출금전표
			opener.document.make_statement_form1.statement_type.value = "54105";
		}else{ //부가세대급금 => 입금전표
			opener.document.make_statement_form1.statement_type.value = "54104";
		}
	}
	if(typeCnt==3){ // salary 선택
		opener.document.make_statement_form1.statement_type.value = "54103";
	}
	self.close();
}

function check_input_value(){
	if(!document.make_statement_form1.account_id.value){
		alert("'조회' 버튼을 통해 계정코드를 입력해주세요!");
		document.make_statement_form1.calling_button.focus();
		return false;
	}else if(!document.make_statement_form1.account_name.value){
		alert("조회 버튼을 통해 계정이름를 입력해주세요!");
		document.make_statement_form1.calling_button.focus();
		return false;
	}else if(!document.make_statement_form1.account_value.value){
		alert("조회 버튼을 통해 계정코드를 입력해주세요!");
		document.make_statement_form1.calling_button.focus();
		return false;
	}
}



















