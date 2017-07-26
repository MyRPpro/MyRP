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

function add_account_dupCheck(){
	var account_id = document.add_account_form1.account_id.value;
	if(!document.add_account_form1.account_id.value){
		alert("account_id 를 먼저 입력해주세요!");
		document.add_account_form1.account_id.focus();
		return false;
	}
	if(document.add_account_form1.account_id.value.length != 4){
		alert("4자리의 숫자를 입력해주세요")
		document.add_account_form1.account_id.focus();
		return false;
	}
	var url="/accounting_management/account_management/add_account_dupCheck?account_id="+account_id;
	window.open(url, "confirm", "menubar=no, width=400, height=300");
}
function set_account_id(account_id){
	opener.document.add_account_form1.account_id.value = "5000" + account_id + "0000";
	opener.document.add_account_form1.dupCheck.value = 1;
	self.close();
} 

function inputCheck(){
	if(!document.add_account_form1.account_id.value){
		alert("계정코드를 입력해주세요!");
		document.add_account_form1.account_id.focus();
		return false;
	}else if(!document.add_account_form1.account_name.value){
		alert("계정이름를 입력해주세요!");
		document.add_account_form1.account_name.focus();
		return false;
	}else if(document.add_account_form1.dupCheck.value == 0){
		alert("중복체크를 해주세요!");
		document.add_account_form1.dupCheckButton.focus();
		return false;
	}
}

function quick_date_select(){
	var url = "/accounting_management/financial_statements/show_profit_and_loss_statement";
	
	
	
	/*var d = new Date();
	var year = d.getFullYear();
	var month = d.getMonth() + 1;
	var date = d.getDate();
	var day = d.getDay();
	
	var today_start = year +"-"+ month +"-"+ date;
	var yesterday_start = year +"-"+ month +"-"+ date-1;
		
		if((date-1)<1) {
			if((month-1)<1){ 
				year = year-1; month = 12;
			}else{
				month=month-1;
			}
			if(month==4||month==6||month==9||month==11){
				date = 30;
			}else if(month==2){
				date = 28;
			}else{
				date = 31;
			}
		}
	
	var this_week_start = year +"-"+ month +"-"+ date;
	if(date+(6-day)>)
	var this_week_end = year + "-" + month + "-" + date+(6-day);*/
}

function formatDate(date) {
    var mymonth = date.getMonth() + 1;
    var myweekday = date.getDate();
    return (date.getFullYear() + "-" + ((mymonth < 10) ? "0" : "") + mymonth + "-" + ((myweekday < 10) ? "0" : "") + myweekday);
}
// 오늘
function SetToday(begin, end) {
    var obj1 = document.getElementById(begin);
    var obj2 = document.getElementById(end);
    var mydate = new Date();
    mydate.setDate(mydate.getDate());
    obj1.value = formatDate(mydate);
    if (obj2 != null) {
        obj2.value = obj1.value;
    }
}

// 어제
function SetYesterday(begin, end) {
    var obj1 = document.getElementById(begin);
    var obj2 = document.getElementById(end);
    var mydate = new Date();
    mydate.setDate(mydate.getDate() - 1);
    obj1.value = formatDate(mydate);
    if (obj2 != null) {
        obj2.value = obj1.value;
    }
}
// 이번주
function SetWeek(begin, end) {
	var obj1 = document.getElementById(begin);
    var obj2 = document.getElementById(end);
    var now = new Date();
    var nowDayOfWeek = now.getDay();
    var nowDay = now.getDate();
    var nowMonth = now.getMonth();
    var nowYear = now.getYear();
    nowYear += (nowYear < 2000) ? 1900 : 0;
    var weekStartDate = new Date(nowYear, nowMonth, nowDay - nowDayOfWeek);
    var weekEndDate = new Date(nowYear, nowMonth, nowDay + (6 - nowDayOfWeek));
    obj1.value = formatDate(weekStartDate);
    obj2.value = formatDate(weekEndDate);
}
//전 주
function SetPrevWeek(begin, end) {
	var obj1 = document.getElementById(begin);
    var obj2 = document.getElementById(end);
    var now = new Date();
    var nowDayOfWeek = now.getDay();
    var nowDay = now.getDate();
    var nowMonth = now.getMonth();
    var nowYear = now.getYear();
    nowYear += (nowYear < 2000) ? 1900 : 0;
    var weekStartDate = new Date(nowYear, nowMonth, nowDay - nowDayOfWeek);
    var weekEndDate = new Date(nowYear, nowMonth, nowDay - nowDayOfWeek-1);
    weekStartDate.setDate(weekStartDate.getDate() - 7);
    obj1.value = formatDate(weekStartDate);
    obj2.value = formatDate(weekEndDate);
}
// 이번달
function SetCurrentMonthDays(begin, end) {
    var obj1 = document.getElementById(begin);
    var obj2 = document.getElementById(end);
    var d2, d22;
    d2 = new Date();
    d22 = new Date(d2.getFullYear(), d2.getMonth());
    var d3, d33;
    d3 = new Date();
    d33 = new Date(d3.getFullYear(), d3.getMonth() + 1, "");
    obj1.value = formatDate(d22);
    obj1.focus();
    obj2.value = formatDate(d33);
    obj2.focus();
}
// 이전달
function SetPrevMonthDays(begin, end) {
    var obj1 = document.getElementById(begin);
    var obj2 = document.getElementById(end);
    var d2, d22;
    d2 = new Date();
    d22 = new Date(d2.getFullYear(), d2.getMonth() -1);
    var d3, d33;
    d3 = new Date();
    d33 = new Date(d3.getFullYear(), d3.getMonth(), "");
    obj1.value = formatDate(d22);
    obj1.focus();
    obj2.value = formatDate(d33);
    obj2.focus();
}
//금 분기 
function SetCurrentQuarter(begin, end) {
	 var obj1 = document.getElementById(begin);
	 var obj2 = document.getElementById(end);
	 var quarter;
	 var d2, d22;
	    d2 = new Date();
	    switch(d2.getMonth()){
	    	case 1 : case 2 : case 3 : 
	    		quarter = 3; break;
	    	case 4 : case 5 : case 6 : 
	    		quarter = 6; break;
	    	case 7 : case 8 : case 9 : 
	    		quarter = 9; break;
	    	case 10 : case 11 : case 12 : 
	    		quarter = 12; break;
	    }
	    d22 = new Date(d2.getFullYear(), quarter);
	    var d3, d33;
	    d3 = new Date();
	    d33 = new Date(d3.getFullYear(), quarter+3, "");
	    obj1.value = formatDate(d22);
	    obj1.focus();
	    obj2.value = formatDate(d33);
	    obj2.focus();
}

// 전 분기
function SetPrevQuarter(begin, end) {
	 var obj1 = document.getElementById(begin);
	 var obj2 = document.getElementById(end);
	 var quarter;
	 var d2, d22;
	    d2 = new Date();
	    switch(d2.getMonth()){
	    	case 1 : case 2 : case 3 : 
	    		quarter = 0; break;
	    	case 4 : case 5 : case 6 : 
	    		quarter = 3; break;
	    	case 7 : case 8 : case 9 : 
	    		quarter = 6; break;
	    	case 10 : case 11 : case 12 : 
	    		quarter = 9; break;
	    }
	    d22 = new Date(d2.getFullYear(), quarter);
	    var d3, d33;
	    d3 = new Date();
	    d33 = new Date(d3.getFullYear(), quarter+3, "");
	    obj1.value = formatDate(d22);
	    obj1.focus();
	    obj2.value = formatDate(d33);
	    obj2.focus();
}

// 올해
function SetCurrentYearDays(begin, end) {
    var obj1 = document.getElementById(begin);
    var obj2 = document.getElementById(end);
    var d2, d22;
    d2 = new Date();
    d22 = new Date(d2.getFullYear() ,"0","1");
    var d3, d33;
    d3 = new Date();
    d33 = new Date(d3.getFullYear() + 1,"", "");
    obj1.value = formatDate(d22);
    obj1.focus();
    obj2.value = formatDate(d33);
    obj2.focus();
}
// 전년
function SetPrevYearDays(begin, end) {
    var obj1 = document.getElementById(begin);
    var obj2 = document.getElementById(end);
    var d2, d22;
    d2 = new Date();
    d22 = new Date(d2.getFullYear() - 1 ,"0","1");
    var d3, d33;
    d3 = new Date();
    d33 = new Date(d3.getFullYear(),"", "");
    obj1.value = formatDate(d22);
    obj1.focus();
    obj2.value = formatDate(d33);
    obj2.focus();
}
//start 보다 end 가 앞서지는 않는지 비교
function check_date_order(){
	 var obj1 = document.financial_statements_form2.startDate.value;
	 var obj2 = document.financial_statements_form2.endDate.value;
	if(!obj1||!obj2){
		alert("날짜를 입력해주세요!");
		document.financial_statements_form2.startDate.focus();
		return false;
	}
	if(obj1>obj2){
		alert("검색 시작날짜가 끝날짜보다 앞서야합니다!");
		return false;
	}
	
}













