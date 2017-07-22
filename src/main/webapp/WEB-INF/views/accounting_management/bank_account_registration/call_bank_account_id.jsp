<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src = "/resources/accounting_management/accounting_management_script.js"></script>
</head>
<body>
	call_bank_account_id.jsp
	<table border="1">
		<tr>
			<th>
				계좌 개설 목적 
			</th>
		</tr>
		<c:if test="${vos != null}">
		<c:forEach var="vo" items="${vos}">
		<tr>
				<td>
				<button onclick="set_bank_account_id('${vo.account_id}','${vo.account_name}',${vo.account_balance})">
					<c:if test="${vo.account_name.equals('현금')}">
						주 계좌
					</c:if>
					<c:if test="${vo.account_name.equals('매출채권')}">
						판매
					</c:if>
					<c:if test="${vo.account_name.equals('매입채무')}">
						구매
					</c:if>
					<c:if test="${vo.account_name.equals('급여')}">
						급여지급
					</c:if>
					<c:if test="${vo.account_name.equals('부가세예수금')}">
						세금납부
					</c:if>
				</button><br>
				
				</td>
		</tr>
		</c:forEach>
		</c:if>
		<c:if test="${vos}==null">
			모든 계좌가 개설되었습니다
		</c:if>
	</table>
</body>
</html>