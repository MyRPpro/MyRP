<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3> 상세 전표 조회 </h3>
search_statement_detail.jsp
<button <c:if test="${vo.approval_state}=25452"> disabled="disabled" </c:if> onclick="window.location.href='/accounting_management/statement_management/approve_statement?statement_id=id123';"> <!-- 승인된 상태이면 승인버튼 비활성 -->
	승인
</button>
<button<c:if test="${vo.approval_state}=25453"> disabled="disabled" </c:if>> <!--  승인되지않은 상태이면 승인거절버튼 비활성-->
 	거절
</button>
<table border="1">
	<tr>
		<th> 
			전표타입 			
		</th>
		<td>
			<c:if test="${statement_type} == 54101"> 매출전표 </c:if>
			<c:if test="${statement_type} == 54102"> 매입전표 </c:if>
			<c:if test="${statement_type} == 54103"> 급여전표 </c:if>	
			<c:if test="${statement_type} == 54104"> 입금전표 </c:if>
			<c:if test="${statement_type} == 54105"> 출금전표 </c:if>	
			<c:if test="${statement_type} == 54106"> 일반전표 </c:if>	
		</td>
	</tr>
	<tr>
		<th> 거래처명 </th>
		<td> ${company_name} </td>
	</tr>
	<tr>
		<th>
		계정
		</th>
		<th>
		값
		</th>
	</tr>
	<tr>
		<td>
		${vo.account_name}
		</td>
		<td>
		${vo.account_value}
		</td>
	</tr>
	<tr>
		<th colspan="2" align="right"> 계 : </th>
	</tr>
</table>
</body>
</html>