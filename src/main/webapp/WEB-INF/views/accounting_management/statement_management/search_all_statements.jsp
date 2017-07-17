<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script src = "/resources/accounting_management/accounting_management_script.js"></script>
<body>
search_all_statements.jsp
<h3> 전체 전표 조회 </h3>
총 전표 개수 : ${cnt}
<table border="1">
	<tr>
		<th> statement_id </th>
		<th> statement_type </th>
		<th> connected_id </th>
		<th> (account_id) </th>
		<th> account_value </th>
		<th> reg_date </th>
		<th> approval_state </th>
	</tr>
	<c:forEach var="vo" items="${statementsVos}">
	<tr>
		<td onclick="search_statement_detail(${vo.statement_id},${vo.connected_id})"> 
			${vo.statement_id}
		</td>
		<td>
			<c:if test="${vo.statement_type} == 54101"> 매출전표 </c:if>
			<c:if test="${vo.statement_type} == 54102"> 매입전표 </c:if>
			<c:if test="${vo.statement_type} == 54103"> 급여전표 </c:if>	
			<c:if test="${vo.statement_type} == 54104"> 입금전표 </c:if>
			<c:if test="${vo.statement_type} == 54105"> 출금전표 </c:if>	
			<c:if test="${vo.statement_type} == 54106"> 일반전표 </c:if>	
		</td>
		<td> 
			${vo.connected_id}
		</td>
		<td> ${vo.account_id} </td>
		<td> ${vo.account_value}</td>
		<td> ${vo.reg_date}</td>
		<td> ${vo.approval_state}</td>
	</tr>
	</c:forEach>
	<tr>
		<td> 
			<a href="javascript:void(0);" onclick="search_statement_detail('id123','211000000000')">id 123</a>
		</td>
		<td> 
			매입전표
		</td>
		<td> id 1233 </td>
		<td> id 1233 </td>
		<td> id 1233 </td>
		<td> id 1233 </td>
		<td> id 1233 </td>
	</tr>
</table>
</body>
</html>