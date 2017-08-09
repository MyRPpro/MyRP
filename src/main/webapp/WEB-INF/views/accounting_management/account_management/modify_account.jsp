<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../../setting.jsp"%>
<script type="text/javascript">
function slideUpFunction(){
	$('#account_list_stage').slideUp();
}
$(function(){
	$("form[name='modify_account_form1']").on("submit",function(){
		//bank_account_register 정보가 올바른지 체크
			if(!document.modify_account_form1.account_id.value){
				alert("계정번호를 입력해주세요!");
				document.modify_account_form1.account_id.focus();
				return false;
			}else if(!document.modify_account_form1.account_name.value){
				alert("계정이름을 입력해주세요!");
				document.modify_account_form1.account_name.focus();
				return false;
			}else if(!document.modify_account_form1.account_balance.value){
				alert("계정금액을 입력해주세요!");
				document.modify_account_form1.account_balance.focus();
				return false;
			}	
		togo = $('#search_account_list');
		var data = $(this).serialize(); 
		$.ajax({ 	
			data:    data,
			type: 	'post',
			url: 	"/accounting_management/account_management/modify_account_pro",
			success: function(response) { 	
				togo.html(response);	
			}
		});
		$("#account_list_stage").slideUp();
		return false;
	});
});
</script>
<div id="modify_account" class="panel panel-primary">
	<div class="panel-heading">
		<h3 class="panel-title">
		<span class="glyphicon glyphicon-usd" aria-hidden="true"></span>
		계정 수정
		</h3>
	</div>
<form action="#" name="modify_account_form1" method="POST">
<table class="table table-hover">
	<tr>
		<th> 계정번호 </th>
		<td>
			<input type="text" name="account_id" value="${vo.account_id}" readonly="true" class="form-control input-sm"> 
		</td>
	</tr>
	<tr>
		<th> 계정명 </th>
		<td> 
			<input type="text" name="account_name" value="${vo.account_name}" class="form-control input-sm">
		</td>
	</tr>
	<tr>
		<th> 계정금액 </th>
		<td> 
			<input type ="number" value = "${vo.account_balance}" name="account_balance" readonly="true" class="form-control input-sm">
		</td>
	</tr>
	<tr>
		<th colspan="2">
			<input type="submit" value="수정하기" class="btn btn-primary btn-sm">
			<input type="reset" value="재작성" class="btn btn-default btn-sm">
			<input type="button" value="돌아가기" onclick="slideUpFunction();" class="btn btn-default btn-sm">						
		</th>
	</tr>
</table>
</form>
</div>