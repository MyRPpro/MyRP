<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../../setting.jsp"%>
<script type="text/javascript">

	function set_bank_account_id(account_id,account_name,account_balance){
		
		switch(account_name){
			case "현금" : account_name = "주 계좌"; break;
			case "매출채권" : account_name = "판매";break;
			case "매입채무" : account_name = "구매";break;
			case "급여" : account_name = "급여지급";break;
			case "부가세예수금" : account_name = "세금납부";break;
			default : account_name = "잘못됐다";break;
		}
		
		document.getElementById("bank_account_id").value = account_id;
		document.getElementById("bank_account_type").value = account_name;
		document.getElementById("bank_account_balance").value = account_balance;
		return false;
	}
	
	$(function(){
		$("form[name='register_bank_account_form1']").on("submit",function(){
			//bank_account_register 정보가 올바른지 체크
				if(!document.register_bank_account_form1.bank_account_id.value){
					alert("개설 목적을 선택해 계좌코드를 입력해주세요!");
					document.register_bank_account_form1.calling_button.focus();
					return false;
				}else if(!document.register_bank_account_form1.bank_account_name.value){
					alert("계좌이름을 입력해주세요!");
					document.register_bank_account_form1.bank_account_name.focus();
					return false;
				}else if(!document.register_bank_account_form1.bank_account_number.value){
					alert("계좌번호를 입력해주세요!");
					document.register_bank_account_form1.bank_account_number.focus();
					return false;
				}else if(!document.register_bank_account_form1.bank_name.value){
					alert("은행이름을 입력해주세요!");
					document.register_bank_account_form1.bank_name.focus();
					return false;
				}	
			togo = $('#bank_account_list');
			var data = $(this).serialize(); 
			$.ajax({ 	
				data:    data,
				type: 	'post',
				url: 	"/accounting_management/bank_account_registration/register_bank_account_pro",
				success: function(response) { 	
					togo.html(response);	
				}
			});
			return false;
		});
	});
</script>
<body>
	
	<form name="register_bank_account_form1">
		<table border="1">
			<tr>
				<th>개설목적</th>
				<td>
					<c:if test="${vos != null}">
						<c:forEach var="vo" items="${vos}">
									<c:set var = "name">
									<c:if test="${vo.account_name.equals('현금')}">주 계좌</c:if>
									<c:if test="${vo.account_name.equals('매출채권')}">판매</c:if>
									<c:if test="${vo.account_name.equals('매입채무')}">구매</c:if>
									<c:if test="${vo.account_name.equals('급여')}">급여지급</c:if>
									<c:if test="${vo.account_name.equals('부가세예수금')}">세금납부</c:if>
									</c:set>
								<input type="button" onclick="set_bank_account_id('${vo.account_id}','${vo.account_name}',${vo.account_balance})" value="${name}">
						</c:forEach>
					</c:if>
					<c:if test="${vos==null}">
						모든 계좌가 개설되었습니다
					</c:if>
					<input type="hidden" name="bank_account_id" id="bank_account_id" readonly="true">
					<input type="hidden" id="bank_account_type" name="bank_account_type" readonly="true">
				</td>
			</tr>
			<tr>
				<th>계좌명</th>
				<td>
					<input type="text" name="bank_account_name" maxlength="20">
				</td>
			</tr>
			<tr>
				<th>계좌번호</th>
				<td>
					<input type="text" name="bank_account_number" maxlength="20">
				</td>
			</tr>
			<tr>
				<th>잔액</th>
				<td>
					<input type="number" id="bank_account_balance" name="bank_account_balance" readonly="true"> <!-- max="999999999999999999" min="0" -->
				</td>
			</tr>
			<tr>
				<th>은행</th>
				<td>
					<input type="text" name="bank_name" maxlength="12">
				</td>
			</tr>
			<tr>
				<th>사용상태</th>
				<td>
					<label for="used">사용</label>
					<input type="radio" name="use_state" id="used" value="Y" checked>
					<label for="unused">비사용</label>
					<input type="radio" name="use_state" id="unused" value="N">
				</td>
			</tr>
			<tr>
				<th>등록일</th>
				<td>
					<input type="Date" name="reg_date"> 
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="submit" value="등록하기">
					<input type="reset" value="재작성">
					<input type="button" value="돌아가기" onclick="window.history.back();">					
				</th>
			</tr>
		</table>
	</form>
</body>
</html>