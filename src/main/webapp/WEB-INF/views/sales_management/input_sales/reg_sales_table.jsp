<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h3>등록된 내역</h3>
	
	<c:if test="${cnt == 3}">
		<script type="text/javascript">
			setTimeout(function(){
				alert("정상적으로 입력되었습니다.");
				/* window.location="/purchase_management/input_purchase/reg_purchase" */
			}, 500);
		</script>
	</c:if>
	
	<c:if test="${cnt != 3}">
		<script type="text/javascript">
			alert("입력작업중 오류가 발생했습니다.");
			window.history.back();
		</script>
	</c:if>
	
	
	<form action="#" name="reg_sales_table_form" method="get">
	
		<table border="1">
			
			<tr>
				<th>List</th>		<!-- 1 -->
				<th>sales</th>	<!-- 2 -->
				<th>account</th>	<!-- 3 -->
				<th>product</th>	<!-- 4 -->
				<th>company</th>	<!-- 5 -->
				<th>employee</th>	<!-- 6 -->
				<th>reg_date</th>	<!-- 7 -->
				<th>count</th>	<!-- 11 -->
				<th>price</th>		<!-- 8 -->
				<th>state</th>		<!-- 9 -->
				<th>condition</th>	<!-- 10 -->
			</tr>
			
			<c:forEach var="dto" items="${dtos}">
			
			<tr>
				<th>${dto.rnum}</th> 			<!-- 1 -->
				<td>${dto.sales_id}</td> 		<!-- 2 -->
				<td>${dto.account_name}</td> 	<!-- 3 -->
				<td>${dto.product_name}</td> 	<!-- 4 -->
				<td>${dto.company_name}</td>		<!-- 5 -->
				<td>${dto.employee_name}</td>	<!-- 6 -->
				<td>							<!-- 7 -->
				<fmt:formatDate value="${dto.reg_date}" pattern="MM-dd"/>
				</td>	
				<td>							<!-- 11 -->
				<fmt:formatNumber value="${dto.count_sales}" type="number" />
				</td>	
				<td>							<!-- 8 -->
				<fmt:formatNumber value="${dto.selling_price}" type="currency" />
				</td>	
				<td>${dto.state_name}</td>	<!-- 9 -->
				<td>${dto.condition_note_receivable}</td>	<!-- 10 -->

			</tr>

			</c:forEach>
		</table>
		<br>
		<c:if test="${dto.sales_state == 22213 }">
		<input type="button" value="전표입력하기" onclick="window.location='/accounting_management/statement_management/make_statement';" >
		</c:if>
		
		
	</form>

</body>
</html>