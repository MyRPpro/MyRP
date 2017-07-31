<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../../setting.jsp"%>
<script type="text/javascript">
$(document).ready(function onload_function(){
	var search_statements_list_type = "<c:out value='${search_statements_list_type}' />";
	if(search_statements_list_type==1){ //모든 전표 띄우기
		$("#search_statements_list").load("/accounting_management/statement_management/search_all_statements");
	}else if(search_statements_list_type==2){ //미승인 전표 띄우기
		alert("회계전표가 등록되었습니다!");
		$("#search_statements_list").load("/accounting_management/statement_management/search_unapproval_statements");
	 }else if(search_statements_list_type==3){ //승인전표 띄우기
		 $("#search_statements_list").load("/accounting_management/statement_management/search_approval_statements");
	 }
});

$(function(){
	$('#unapproval_statements').unbind("click").bind("click",function(){
		togo = $('#search_statements_list');
		$.ajax({ 		
			type: 	'get',	 			
			url: 	"/accounting_management/statement_management/search_unapproval_statements",
			success: function(response) { 	
				togo.html(response);	
			}
		});
	});
});
$(function(){
	$('#approval_statements').unbind("click").bind("click",function(){
		togo = $('#search_statements_list');
	
		$.ajax({ 		
			type: 	'get',	 			
			url: 	"/accounting_management/statement_management/search_approval_statements",
			success: function(response) { 	
				togo.html(response);	
			}
		});
	});
});
$(function(){
	$('#all_statements').unbind("click").bind("click",function(){
		$("#search_statements_list").load("/accounting_management/statement_management/search_all_statements");
	});
});
$(function(){
	$("form[name='statement_list_form1']").on("submit",function(){
		$("#make_statements_list").load("/accounting_management/statement_management/make_statement");
		$('#make_statements_list').slideDown();
	});
});
</script>
<div id="search_statements_overall">
<button id="all_statements" class="btn btn-default"> 전체 전표 조회</button>
<button id="unapproval_statements" class="btn btn-default"> 미승인 전표 조회</button>
<button id="approval_statements" class="btn btn-default"> 승인 전표 조회</button>
<form action="#" method="get" name="statement_list_form1">
	<input type="submit" value="전표 등록" class="btn btn-default">	
</form>
<div id="make_statements_list">

</div>
<div id="search_statements_list">

</div>
<div id="search_statement_detail">

</div>

</div>
