<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../../setting.jsp"%>
<script type="text/javascript">
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
<form action="#" name="modify_account_form1" method="POST">
<table border="1">
	<tr>
		<th> 계정번호 </th>
		<td>
			<input type="text" name="account_id" value="${vo.account_id}" readonly="true"> 
		</td>
	</tr>
	<tr>
		<th> 계정명 </th>
		<td> 
			<input type="text" name="account_name" value="${vo.account_name}">
		</td>
	</tr>
	<tr>
		<th> 계정금액 </th>
		<td> 
			<input type ="number" value = "${vo.account_balance}" name="account_balance" readonly="true">
		</td>
	</tr>
	<tr>
		<th colspan="2">
			<input type="submit" value="수정하기">
			<input type="reset" value="재작성">
			<input type="button" value="돌아가기" onclick="window.history.back();">					
		</th>
	</tr>
</table>
</form>
</body>
</html>