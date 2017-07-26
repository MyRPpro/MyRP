<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../../setting.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>현금흐름표</h3>
<button onclick="window.location='/'"> 홈으로 </button>
<input type="button" value="뒤로가기" onclick="window.history.back();">
<table border="1">
	<tr>
		<th>
			계정
		</th>
		<th>
			금액
		</th>
		<th>
			일시
		</th>
	</tr>
	<c:if test="${cnt==0}">
	<tr>
		<td colspan="2"> 등록된 현금거래가 없습니다 </td>
	</tr>
	</c:if>
	<c:forEach var="dtos" items="${dtos}">
	<tr>
		<td> ${dtos.account_name}</td>
		<td> ${dtos.account_value}</td>
		<td> 
			<fmt:formatDate pattern = "yyyy-MM-dd" value="${dtos.reg_date}"/>
		</td>
	</tr>
	</c:forEach>
</table>
</body>
</html>