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
<button <c:if test="${approval_state != 25451}"> disabled="disabled" </c:if> onclick="window.location.href='/accounting_management/statement_management/approve_statement?statement_id=${statement_id}';"> <!-- 승인된 상태이면 승인버튼 비활성 -->
	승인
</button>
<button<c:if test="${approval_state != 25451}"> disabled="disabled" </c:if> onclick="window.location.href='/accounting_management/statement_management/disapprove_statement?statement_id=${statement_id}';"> <!--  승인되지않은 상태이면 승인거절버튼 비활성-->
 	거절
</button>
<table border="1">
	<tr>
		<th> 
			전표타입 			
		</th>
		<td>
			<c:if test="${statement_type=='54101'}"> 매출전표 </c:if>
			<c:if test="${statement_type=='54102'}"> 매입전표 </c:if>
			<c:if test="${statement_type=='54104'}"> 입금전표 </c:if>
			<c:if test="${statement_type=='54105'}"> 출금전표 </c:if>	
			<c:if test="${statement_type=='54106'}"> 일반전표 </c:if>	
		</td>
		<th> 승인상태 </th>
		<td> 
			<c:if test="${approval_state=='25451'}"> 미승인 </c:if>
			<c:if test="${approval_state=='25452'}"> 승인 </c:if> 
			<c:if test="${approval_state=='25453'}"> 승인거절 </c:if> 
		</td>
	</tr>
	<tr>
		<th> 주문 코드 </th>
		<td>
			<c:if test="${typeCnt==1}">
				${sales_id}
			</c:if>
			<c:if test="${typeCnt==2}">
				${purchase_id}
			</c:if>
			<c:if test="${typeCnt==3}">
				${salary_register_id}
			</c:if>
			<c:if test="${typeCnt==4}">
				* tax_managing
			</c:if>
		</td>
		<th> 거래처명 </th>
		<td> ${company_name} </td>
	</tr>
	<tr>
		<th> 전표번호 </th>
		<td colspan="3">
			 <c:forEach var ="dto" items="${dtos}">
				<c:if test="${statement_id == dto.statement_id}"><b></c:if> 
				${dto.statement_id}
				<c:if test="${statement_id == dto.statement_id}"></b></c:if><br>
			 </c:forEach>
		</td>
	</tr>
	 <tr>
	 	<th colspan="4"> 거래 </th>
	 </tr>
	 <c:forEach var ="dto" items="${dtos}">
		<c:if test="${statement_type=='54101' && (dto.account_id !='500011020000' && dto.account_id !='500011010000')}"> <!-- 매출전표의 경우 매출채권이나 현금이 아닌경우 거래내역 -->
				<tr>
					<td colspan="2">
						${dto.account_name}
					</td>
					<td colspan="2">
						<c:set var="sum" value="${sum + dto.account_value}" />
						${dto.account_value}
						
						
					</td>
				</tr>
		</c:if>
		<c:if test="${statement_type=='54102' && (dto.account_id !='500012010000' && dto.account_id !='500011010000')}"> <!-- 매입전표는 매입채무나 현금이 아닌경우가 거래내역  -->
				<tr>
					<td colspan="2">
						${dto.account_name}
					</td>
					<td colspan="2">
						<c:set var="sum" value="${sum + dto.account_value}" />
						${dto.account_value}
					</td>
				</tr>
		</c:if>
		<c:if test="${(statement_type=='54104' || statement_type=='54105') && dto.account_id =='500011010000'}"> <!-- 입금/출금 전표의 경우 현금인 경우가 거래내역 -->
				<tr>
					<td colspan="2">
						${dto.account_name}
					</td>
					<td colspan="2">
						<c:set var="sum" value="${sum + dto.account_value}" />
						${dto.account_value}
					</td>
				</tr>
		</c:if>
		<c:if test="${statement_type=='54103' && dto.account_id !='500011010000'}"> <!-- 급여전표의 경우 현금이 아닌 경우가 거래내역 -->
				<tr>
					<td colspan="2">
						${dto.account_name}
					</td>
					<td colspan="2">
						${dto.account_value}
						<c:set var="sum" value="${sum + dto.account_value}" />
					</td>
				</tr>
		</c:if> 
	</c:forEach>
	<tr>
		<th colspan="2"> 계 </th>
		<th colspan="2"> 
			<c:out value="${sum}" />
			<c:set var = "sum" value="0" />
		</th>
	</tr>
	
	 <tr>
	 	<th colspan="4"> 회계처리내역 </th>
	 </tr>
	 <c:forEach var ="dto" items="${dtos}">
		<c:if test="${statement_type=='54101' && (dto.account_id=='500011020000' || dto.account_id=='500011010000')}"> <!-- 매출전표의 경우 매출채권이나 현금의 경우로 결제한다. -->
				<tr>
					<td colspan="2">
						${dto.account_name}
					</td>
					<td colspan="2">
						${dto.account_value}
						<c:set var="sum" value="${sum + dto.account_value}" />
					</td>
				</tr>
		</c:if>
		<c:if test="${statement_type=='54102' && (dto.account_id=='500012010000' || dto.account_id=='500011010000')}"> <!-- 매입전표의 경우 매입채무나 현금의 경우로 결제한다. -->
				<tr>
					<td colspan="2">
						${dto.account_name}
					</td>
					<td colspan="2">
						${dto.account_value}
						<c:set var="sum" value="${sum + dto.account_value}" />
					</td>
				</tr>
		</c:if>
		<c:if test="${(statement_type=='54104' || statement_type=='54105') && dto.account_id !='500011010000'}"> <!-- 입금/출금 전표의 경우 현금이 아닌경우가 결제내역 -->
				<tr>
					<td colspan="2">
						${dto.account_name}
					</td>
					<td colspan="2">
						${dto.account_value}
						<c:set var="sum" value="${sum + dto.account_value}" />
					</td>
				</tr>
		</c:if>
		<c:if test="${statement_type=='54103' && dto.account_id =='500011010000'}"> <!-- 급여전표의 경우 현금인 경우가 결제내역 -->
				<tr>
					<td colspan="2">
						${dto.account_name}
					</td>
					<td colspan="2">
						${dto.account_value}
						<c:set var="sum" value="${sum + dto.account_value}" />
					</td>
				</tr>
		</c:if> 
	</c:forEach>
	<tr>
		<th colspan="2"> 계 </th>
		<th colspan="2"> <c:out value="${sum}" /></th>
	</tr>
	
</table>
</body>
</html>