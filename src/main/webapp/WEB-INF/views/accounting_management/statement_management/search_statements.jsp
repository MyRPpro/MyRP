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
function slideUpFunction(){
	$('#make_statements_list').slideUp();
}
$(function(){
	$('#unapproval_statements').unbind("click").bind("click",function(){
		$('#make_statements_list').slideUp();
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
		$('#make_statements_list').slideUp();
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
		$('#make_statements_list').slideUp();
		$("#search_statements_list").load("/accounting_management/statement_management/search_all_statements");
	});
});
$(function(){
	$("#make_statement_button").unbind("click").bind("click",function(){
		$("#make_statements_list").load("/accounting_management/statement_management/make_statement");
		$('#make_statements_list').slideDown();
	});
});
</script>
<div id="search_statements_overall" class="panel panel-default">
<div class="panel-heading">
		전표 조회 
</div>
	<div>
		  <!-- Nav tabs -->
		  <ul class="nav nav-tabs" role="tablist">
		    <li role="presentation" class="active" id="all_statements" ><a href="#info" aria-controls="info" role="tab" data-toggle="tab">전체 전표 조회</a></li>
		    <li role="presentation" id="unapproval_statements"><a href="#appoint" aria-controls="appoint" role="tab" data-toggle="tab">미승인 전표 조회</a></li>
		    <li role="presentation" id="approval_statements"><a href="#retired" aria-controls="retired" role="tab" data-toggle="tab">승인 전표 조회</a></li>
		  </ul>
		  <input type="button" value="전표 등록" id="make_statement_button" class="btn btn-default">	
	</div>

<div id="make_statements_list">

</div>
<div id="search_statements_list">

</div>
<div id="search_statement_detail">

</div>


</div>