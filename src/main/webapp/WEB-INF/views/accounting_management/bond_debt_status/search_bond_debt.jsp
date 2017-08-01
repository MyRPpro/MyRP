<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
$(document).ready(function onload_function(){
	$("#search_bond_debt_section").load("/accounting_management/bond_debt_status/search_all_bond_debt");
});

$(function(){
	$('#search_all_bond_debt').unbind("click").bind("click",function(){
		$("#search_bond_debt_section").load("/accounting_management/bond_debt_status/search_all_bond_debt");
	});
});
$(function(){
	$('#search_bond_debt_by_company').unbind("click").bind("click",function(){
		$("#search_bond_debt_section").load("/accounting_management/bond_debt_status/search_bond_debt_by_company");
	});
});

</script>

<div id="search_bond_debt" class="panel panel-default">
	<div class="panel-heading">
		채권/채무 현황
	</div>
	<div class="panel-body">
		<div>
		  <!-- Nav tabs -->
		  <ul class="nav nav-tabs" role="tablist">
		    <li role="presentation" class="active" id="search_all_bond_debt" ><a href="#info" aria-controls="info" role="tab" data-toggle="tab">전체 채권/채무 현황</a></li>
		    <li role="presentation" id="search_bond_debt_by_company"><a href="#appoint" aria-controls="appoint" role="tab" data-toggle="tab">거래처별 채권/채무 현황</a></li>
		  </ul>
		</div>
		<div id="search_bond_debt_section">
			
		</div>
		
	</div>
</div>