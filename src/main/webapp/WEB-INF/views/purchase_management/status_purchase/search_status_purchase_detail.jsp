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

	<table border="1">
		<tr>
			<th>purchase_id</th>			<!-- 1 -->
			<!-- <th>account</th>	 -->		<!-- 2 -->
			<th>order_id</th>			<!-- 3 -->	
			<th>product</th>			<!-- 4 -->
			<th>company</th>			<!-- 5 -->
		</tr>
		
		
		<tr>	
			<td>
				<c:forEach var="dto" items="${dtos}">
					<input type="text" name="purchase_id" 	value="${dto.purchase_id}" maxlength="10" readonly required >
				</c:forEach>
			</td>
			
			<td>
				<c:forEach var="dto" items="${dtos}">
					<input type="hidden" name="account_id" value="${dto.account_id}" readonly >
					<input type="text" name="account_name" value="${dto.account_name} 계정" readonly required >
				</c:forEach>
			</td>
			<%-- 
			<td>
				<c:forEach var="dto" items="${dtos}">
					<input type="text" name="order_id" value="${dto.order_id}" readonly >
				</c:forEach>
			</td>
			 --%>
			<td>
				<c:forEach var="dto" items="${dtos}">
					<input type="hidden" name="product_id" value="${dto.product_id}"  readonly >
					<input type="text" name="product_name" value="${dto.product_name}"  readonly required >
				</c:forEach>
			</td>
			
			<td>
				<c:forEach var="dto" items="${dtos}">
					<input type="hidden" name="company_id" value="${dto.company_id}" readonly >
					<input type="text" name="company_name" value="${dto.company_name}" readonly required >
				</c:forEach>
			</td>
		</tr>	
			
		<tr>
			<th>employee</th>			<!-- 6 -->
			<th>reg_date</th>			<!-- 7 -->
			<th>update_date</th>		<!-- 8 -->	
			<th>storage_out_date</th>	<!-- 9 -->
		</tr>
		
		<tr>
			<td>
				<c:forEach var="dto" items="${dtos}">
					<input type="hidden" name="employee_id" value="${dto.employee_id}"readonly >
					<input type="text" name="employee_name" value="${dto.employee_name}" readonly required >
				</c:forEach>
			</td>
			
			<td>
				<c:forEach var="dto" items="${dtos}">
					<input type="date" name="reg_date" value="${dto.reg_date}" readonly required >
				</c:forEach>
			</td>
			
			<td>
				<c:forEach var="dto" items="${dtos}">
					<input type="date" name="update_date" value="${dto.update_date}" readonly required >
				</c:forEach>
			</td>
			
			<td>
				<c:forEach var="dto" items="${dtos}">
					<input type="date" name="storage_out_date" value="${dto.storage_out_date}" readonly required >
				</c:forEach>
			</td>
		</tr>	
		
		<tr>
			<th>count</th>				<!-- 10 -->
			<th>selling_price</th>		<!-- 11 -->
			<th>purchase_state</th>		<!-- 12 -->
			<th>condition</th>			<!-- 13 -->
		</tr>
		
		<tr>
			<td>
				<c:forEach var="dto" items="${dtos}">
					<input type="text" name="count_purchase" readonly required 
					value="<fmt:formatNumber value="${dto.count_purchase}" type="Number"/>" >
				</c:forEach>
			</td>
			
			<td>
				<c:forEach var="dto" items="${dtos}">
					<input type="text" name="selling_price" id="selling_price" readonly required 
					value="<fmt:formatNumber value="${dto.selling_price}" type="currency" currencySymbol="￦"/>"  >
				</c:forEach>
			</td>
			
			<td>
				<c:forEach var="dto" items="${dtos}">
					<input type="hidden" name="purchase_state" value="${dto.purchase_state}"  readonly required>
					<input type="text" name="state_name" value="${dto.state_name}"  readonly required>
				</c:forEach>
			</td>
			
			<td>
				<c:forEach var="dto" items="${dtos}">
					<input type="number" name="condition_note_receivable" value="${dto.condition_note_receivable}" readonly required >
				</c:forEach>
			</td>
			
		</tr>
		
	</table>

		



</body>
</html>