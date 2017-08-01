<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../../setting.jsp"%>
<script type="text/javascript">
function slideUpFunction(){
	$('#bank_account_list_stage').slideUp();
}
$(function(){
	$("form[name='modify_bank_account_form1']").on("submit",function(){
		//bank_account_register 정보가 올바른지 체크
			if(!document.modify_bank_account_form1.bank_account_name.value){
				alert("계좌이름을 입력해주세요!");
				document.modify_bank_account_form1.bank_account_name.focus();
				return false;
			}else if(!document.modify_bank_account_form1.bank_account_number.value){
				alert("계좌번호를 입력해주세요!");
				document.modify_bank_account_form1.bank_account_number.focus();
				return false;
			}else if(!document.modify_bank_account_form1.bank_name.value){
				alert("은행이름을 입력해주세요!");
				document.modify_bank_account_form1.bank_name.focus();
				return false;
			}	
		togo = $('#bank_account_list');
		var data = $(this).serialize(); 
		$.ajax({ 	
			data:    data,
			type: 	'post',
			url: 	"/accounting_management/bank_account_registration/modify_bank_account_pro",
			success: function(response) { 	
				togo.html(response);	
			}
		});
		return false;
	});
});
</script>
	<form action="#" name="modify_bank_account_form1" method="post">
	 	<table class="table table-hover">
	 		<tr>
				<th>계좌 ID</th>
				<td>
					<input type="text" name="bank_account_id" value="${vo.bank_account_id}" readonly="true">
				</td>
			</tr>
			<tr>
				<th>계좌 이름</th>
				<td>
					<input type="text" name="bank_account_name" value="${vo.bank_account_name}" maxlength="20">
				</td>
			</tr>
			<tr>
				<th>계좌 번호</th>
				<td>
					<input type="text" name="bank_account_number" value="${vo.bank_account_number}" maxlength="20">
				</td>
			</tr>
			<tr>
				<th>잔액</th>
				<td>
					<input type="number" name="bank_account_balance" value="${vo.bank_account_balance}" maxlength="18" min="0" value="0" readonly="true">
				</td>
			</tr>
			<tr>
				<th>계좌 타입</th>
				<td>
					<input type="text" name="bank_account_type" value="${vo.bank_account_type}" readonly="true">
				</td>
			</tr>
			<tr>
				<th>은행명</th>
				<td>
					<input type="text" name="bank_name" value="${vo.bank_name}" maxlength="12">
				</td>
			</tr>
			<tr>
				<th>사용상태</th>
				<td>
					<label for="used">사용</label>
					<input type="radio" name="use_state" id="used" value="Y"
						<c:if test="${vo.use_state.equals('Y')}">checked</c:if>>
					<label for="unused">비사용</label>
					<input type="radio" name="use_state" id="unused" value="N"
					<c:if test="${vo.use_state.equals('N')}">checked</c:if>>
				</td>
			</tr>
			<tr>
				<th>등록일</th>
				<td>
					<input type="date" name="reg_date" value="${vo.reg_date}" >
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="submit" value="수정하기" class="btn btn-default">
					<input type="reset" value="재작성" class="btn btn-default">
					<input type="button" value="돌아가기"  onclick="slideUpFunction();" class="btn btn-default">					
				</th>
			</tr>
	 	</table>
	</form>
</body>
</html>