<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../../setting.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script src = "/resources/accounting_management/accounting_management_script.js"></script>
<body>
<h3> 전표 생성 </h3>
<form action="/accounting_management/statement_management/make_statement_pro" name="make_statement_form1" method="post" onsubmit="return check_input_value();">
	<input type="hidden" name=typeCnt>
<button onclick="window.location='/'"> 홈으로 </button>
<table border="1">
	<tr>	
		<th> statement_type </th>
		<td colspan="2">
			<select name="statement_type" onchange=""> 
				<option value="54101">매출전표</option>
				<option value="54102">매입전표</option>
				<option value="54103">급여전표</option>
				<option value="54104">입금전표</option>
				<option value="54105">출금전표</option>
				<option value="54106">일반전표</option>
			</select>
		</td>
		<th> connected_id </th>
		<td colspan="2">
			
			<input type="text" name="connected_id" >  
			<input type="button" value="조회" onclick="call_connected_id()" name="calling_button">
		</td>
	</tr>
	<tr>
		<th colspan="6"> 계정등록 </th>
	</tr>
	<tr>
		<th> account_id </th>
		<td>
			<input type="text" name="account_id"  readonly="true">
		</td>
		<th> account_name </th>
		<td>
			<input type="text" name="account_name" readonly="true">
		</td>
		<th> account_value</th>
		<td>
			<input type="number" name="account_value"  readonly="true">
		</td>
	</tr>
</table>
<input type="submit" value="등록하기">
<input type="reset" value="재작성">
<input type="button" value="돌아가기" onclick="window.history.back();">			
</form>
</body>
</html>