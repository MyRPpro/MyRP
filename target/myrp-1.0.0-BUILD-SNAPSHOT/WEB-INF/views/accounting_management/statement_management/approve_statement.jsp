<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../../setting.jsp"%>
<script type="text/javascript">
	$(document).ready(function onload_function(){
			
		 var scnt = "<c:out value='${scnt}' />";
		 var acnt = "<c:out value='${acnt}' />";
		 var cnt = "<c:out value='${cnt}' />";
		 var typeCnt = "<c:out value='${typeCnt}' />";
		var checkCnt = "<c:out value='${checkCnt}' />";
		var statement_id = "<c:out value='${statement_id}' />";
		var connected_id = "<c:out value='${connected_id}' />";
		var typeCnt = "<c:out value='${typeCnt}' />";
	
		var url="";
		if(typeCnt==1){
			url="/accounting_management/statement_management/search_statement_detail?statement_id="+statement_id+"&sales_id="+connected_id;
		}
		if(typeCnt==2){
			url="/accounting_management/statement_management/search_statement_detail?statement_id="+statement_id+"&purchase_id="+connected_id;
		}
		if(typeCnt==3){
			url="/accounting_management/statement_management/search_statement_detail?statement_id="+statement_id+"&salary_register_id="+connected_id;
		}
		
	if(scnt == cnt && acnt == cnt){
		if(typeCnt == 4){//승인메시지 띄우고 전표페이지 다시 돌아가기 (세금)
			alert("등록/승인처리되었습니다");
			var search_statements_list_type = 3;
			togo = $('#main_screen');
			var data = {"search_statements_list_type" : search_statements_list_type }
			$.ajax({ 
				data:    data,
				type: 	'get',
				url: 	"/accounting_management/statement_management/search_statements",
				success: function(response) { 	
					togo.html(response);	
				}
			});
		}else{//승인메시지 띄우고 전표페이지 다시 돌아가기
			alert("승인처리되었습니다");
			var currentURL = document.URL;
			$("#search_statement_detail").load(url);
			$("#search_statements_list").load("/accounting_management/statement_management/search_unapproval_statements");
		}
	}else if(checkCnt == 2){//해당전표거래 해당 계좌가 존재하는지 체크
		alert("관련 전표거래에 해당하는 은행계좌가 존재하지 않거나, 이용이 불가하여 거래승인이 불가합니다. 계좌를 먼저 개설해주세요 ");
		if(confirm("계좌개설페이지로 이동하시겠습니까?")){
			 $("#main_screen").load(
					 "/accounting_management/bank_account_registration/bank_account_list?"+
							 			"bank_account_reg_on=1" );
		}else{
			$("#search_statement_detail").load(url);
		}
	}
});
</script>