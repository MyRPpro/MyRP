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
<h3> add_account.jsp </h3>
<form action="/accounting_management/account_management/add_account_pro" name="add_account_form1" onsubmit="return inputCheck();">
<input type="hidden" name="dupCheck" value="0">
<table border="1">
	<tr>
		<th> account_id </th>
		<td>
			<input type="text" name="account_id"> 
			<input type="button" value="중복확인" onclick="add_account_dupCheck()" name="dupCheckButton">
		</td>
	</tr>
	<tr>
		<th> account_name </th>
		<td> 
			<input type="text" name="account_name">
		</td>
	</tr>
	<tr>
		<th> account_balance </th>
		<td> 
			<input type ="number" value = "0" min ="0" max="999999999999999999" name="account_balance">
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