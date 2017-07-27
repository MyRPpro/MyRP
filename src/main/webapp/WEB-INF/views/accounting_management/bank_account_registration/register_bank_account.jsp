<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../../setting.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src = "/resources/accounting_management/accounting_management_script.js"></script>
</head>

<body>
 register_bank_account.jsp 페이지
 <button onclick="window.location='/'"> 홈으로 </button>
	<form action="/accounting_management/bank_account_registration/register_bank_account_pro" name="register_bank_account_form1" method="post" onsubmit ="return check_bank_account();">
		<table border="1">
			<tr>
				<th>bank_account_id</th>
				<td>
					<input type="text" name="bank_account_id" readonly="true"><input type="button" value="조회" name = "calling_button" onclick="call_bank_account_id()">
				</td>
			</tr>
			<tr>
				<th>bank_account_name</th>
				<td>
					<input type="text" name="bank_account_name" maxlength="20">
				</td>
			</tr>
			<tr>
				<th>bank_account_number</th>
				<td>
					<input type="text" name="bank_account_number" maxlength="20">
				</td>
			</tr>
			<tr>
				<th>bank_account_balance</th>
				<td>
					<input type="number" name="bank_account_balance" readonly="true"> <!-- max="999999999999999999" min="0" -->
				</td>
			</tr>
			<tr>
				<th>bank_account_type</th>
				<td>
					<input type="text" name="bank_account_type" readonly="true">
				</td>
			</tr>
			<tr>
				<th>bank_name</th>
				<td>
					<input type="text" name="bank_name" maxlength="12">
				</td>
			</tr>
			<tr>
				<th>use_state</th>
				<td>
					<label for="used">사용</label>
					<input type="radio" name="use_state" id="used" value="Y" checked>
					<label for="unused">비사용</label>
					<input type="radio" name="use_state" id="unused" value="N">
				</td>
			</tr>
			<tr>
				<th>reg_date</th>
				<td>
					<input type="month"> 
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