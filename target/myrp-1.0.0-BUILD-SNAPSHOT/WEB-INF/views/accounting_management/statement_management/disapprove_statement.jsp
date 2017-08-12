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
		
	if(scnt == cnt){
		if(typeCnt == 4){
				alert("승인거절 처리되었습니다");
				if(typeCnt==1||typeCnt==2||typeCnt==3){
					if(typeCnt==1){
						url="/accounting_management/statement_management/search_statement_detail?statement_id="+statement_id+"&sales_id="+connected_id;
					}
					if(typeCnt==2){
						url="/accounting_management/statement_management/search_statement_detail?statement_id="+statement_id+"&purchase_id="+connected_id;
					}
					if(typeCnt==3){
						url="/accounting_management/statement_management/search_statement_detail?statement_id="+statement_id+"&salary_register_id="+connected_id;
					}
				}else {
						url="/accounting_management/statement_management/search_statement_detail?statement_id="+statement_id;
				}
			$("#search_statement_detail").load(url);
			$("#search_statements_list").load("/accounting_management/statement_management/search_unapproval_statements");
		}
	
	}
});
</script>
