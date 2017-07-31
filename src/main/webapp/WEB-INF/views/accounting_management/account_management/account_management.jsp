<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../../setting.jsp"%>
<script type="text/javascript">
$(document).ready(function onload_function(){
	$("#account_list").load("/accounting_management/account_management/search_account_list");
});
function slideUp(){
		$("#search_account_list_content").slideUp(); 
}
$(function(){
	$("#add_account_button").bind("click",function(){
		$("#search_account_list_content").slideUp(); 
		$("#account_list_stage").slideDown();
		$("#account_list_stage").load("/accounting_management/account_management/add_account");
	});
});
$(function(){
	$("#search_account_list a").bind("click", function(){
		$("#search_account_list_content").slideDown(); 
	})
})
$(function(){
	$('#account_list_table a').bind("click",function(){
		$("#account_list_stage").slideDown(); 
		$("#account_list_stage").load($(this).attr("href"));
		return false;
	});
});
$(function(){
	$('.page_nav a').bind("click",function(){
		$("#search_account_list").load($(this).attr("href"));
		return false;
	});
});
</script>
<div id="search_account_list_overall" class="panel panel-default">
	<div class="panel-heading">
		계정 관리
	</div>
	<div class="panel-body">
	 <small>총 계정 개수 : ${cnt}</small>
	 <input type="submit" value="계정 추가" class="btn btn-default" id="add_account_button">
	<div id="account_list">
	
	</div>
	<div id="account_list_stage">
	
	</div>
	</div>
</div>