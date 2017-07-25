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
<form action="/accounting_management/account_management/modify_account_pro" name="modify_account_form1" method="POST">
<table border="1">
	<tr>
		<th> account_id </th>
		<td>
			<input type="text" name="account_id" value="${vo.account_id}" readonly="true"> 
		</td>
	</tr>
	<tr>
		<th> account_name </th>
		<td> 
			<input type="text" name="account_name" value="${vo.account_name}">
		</td>
	</tr>
	<tr>
		<th> account_balance </th>
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