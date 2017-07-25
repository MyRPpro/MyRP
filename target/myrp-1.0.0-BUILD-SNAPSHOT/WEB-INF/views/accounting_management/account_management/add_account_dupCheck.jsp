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
	<h3> add_account_dupCheck.jsp </h3>
<c:if test="${cnt == 0}">
	<table border="1">
		<tr>
			<th>선택하신 [${account_id}]는 사용가능합니다.</th>
		</tr>
		<tr>
			<th>
				<input type="button" value="확인" onclick="set_account_id('${account_id}');">
			</th>
		</tr>
	</table>
</c:if>
<c:if test="${cnt == 1}">
	<form action="/accounting_management/account_management/add_account_dupCheck" name="add_account_dupCheck_form1" method="get">
		<table border="1">
			<tr>
				<th colspan="2">
					선택하신 [${account_id}]는<br>
					[${account_name}]에 사용중입니다.<br>
					다른 account_id를 입력하세요.
				</th>
			</tr>
			<tr>
				<th>account_id</th>
				<td>
					<input type="text" name="account_id">
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="submit" value="중복확인">
					<input type="reset" value="재작성">
					<input type="button" value="닫기" onclick="self.close()">
				</th>
			</tr>
		</table>
	</form>
</c:if>
</body>
</html>