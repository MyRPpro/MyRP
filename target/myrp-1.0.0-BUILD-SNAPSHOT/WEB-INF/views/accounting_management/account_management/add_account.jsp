<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../../setting.jsp"%>
<script type="text/javascript">	
function slideUpFunction(){
	$('#account_list_stage').slideUp();
}
	function add_account_dupCheck(){
		$("#id_check_msg").slideDown();
		var account_id = document.add_account_form1.account_id.value;
		if(document.add_account_form1.account_id.value.length != 4){
			alert("4자리의 숫자를 입력해주세요")
			document.add_account_form1.account_id.focus();
			return false;
		}
		var url="/accounting_management/account_management/add_account_dupCheck?account_id="+account_id;
		$("#id_check_msg").load(url);
	}
	function reset_dupCheck(){
		document.getElementById("dupCheck").value = 0;
	}
	
	$(function(){
		$("form[name='add_account_form1']").on("submit",function(){
			//bank_account_register 정보가 올바른지 체크
				if(!document.add_account_form1.account_id.value){
					alert("계정 id를 등록해주세요!");
					document.add_account_form1.account_id.focus();
					return false;
				}else if(!document.add_account_form1.account_name.value){
					alert("계정 이름을 등록해주세요!");
					document.add_account_form1.account_name.focus();
					return false;
				}else if(document.add_account_form1.dupCheck.value == 0){
					alert("중복체크를 해주세요!");
					document.add_account_form1.dupCheckButton.focus();
					return false;
				}else if(!document.add_account_form1.account_id.value){
					alert("계정코드를 입력해주세요!");
					document.add_account_form1.account_id.focus();
					return false;
				}
			
			togo = $('#search_account_list');
			var data = $(this).serialize(); 
			$.ajax({ 	
				data:    data,
				type: 	'post',
				url: 	"/accounting_management/account_management/add_account_pro",
				success: function(response) { 	
					togo.html(response);	
				}
			});
			$("#account_list_stage").slideUp();
			return false;
		});
	});
</script>
<div class="panel panel-primary">
<div class="panel-heading">
	<h3 class="panel-title">
	<span class="glyphicon glyphicon-usd" aria-hidden="true"></span>
	 계정 등록
	 </h3>
</div>
<div class="panel-body" style="text-align: center;">
<form action="#" name="add_account_form1">
<input type="hidden" name="dupCheck" id="dupCheck" value="0">
<table class="table table-hover">
	<tr>
		<th> 계정번호 </th>
		<td>
			<div class="input-group">
				<input type="text" name="account_id" id="account_id" onchange="reset_dupCheck()" class="form-control input-sm"> 
				<span class="input-group-btn"><input type="button" value="중복확인" onclick="add_account_dupCheck()" name="dupCheckButton" class="btn btn-primary btn-sm"></span>
			</div>
			<div id="id_check_msg"> </div>
		</td>
	</tr>
	<tr>
		<th> 계정명 </th>
		<td> 
			<input type="text" name="account_name" class="form-control input-sm">
		</td>
	</tr>
	<tr>
		<th> 계정금액 </th>
		<td> 
			<input type ="number" value = "0" min ="0" max="999999999999999999" name="account_balance" class="form-control input-sm">
		</td>
	</tr>
	<tr>
		<th colspan="2">
			<input type="submit" value="등록하기" class="btn btn-primary btn-sm">
			<input type="reset" value="재작성" class="btn btn-default btn-sm">
			<input type="button" value="돌아가기" onclick="slideUpFunction();" class="btn btn-default btn-sm">					
		</th>
	</tr>
</table>
</form>
</div>
</div>
