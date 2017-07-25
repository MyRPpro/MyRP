<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	
	<form action="#" name="search_reg_purchase_form" method="get">
	
		<table border="1">
			<tr>
				<th>Id</th>			<!-- 1 -->
				<th>product</th>	<!-- 2 -->
				<th>employee</th>	<!-- 3 -->
				<th>reg_date</th>	<!-- 4 -->
				<th>state</th>		<!-- 5 -->
				<th>button</th>		<!-- 6 -->
			</tr>
			
			<tr>	
				<td>	<!-- 1 -->
				<c:forEach var="dto" items="${dtos}">
					<input type="text" name="sales_id" id="sales_id" value="${dto.sales_id}" maxlength="10" readonly >
				</c:forEach>
				</td>
				
				<td>	<!-- 2 -->
					<c:forEach var="dto" items="${dtos}">
						<input type="hidden" name="product_id" value="${dto.product_id}"  readonly >
						<input type="text" name="product_name" value="${dto.product_name}"  readonly >
					</c:forEach>
				</td>
				
				<td>	<!-- 3 -->
					<c:forEach var="dto" items="${dtos}">
						<input type="hidden" name="employee_id" value="${dto.employee_id}"readonly >
						<input type="text" name="employee_name" value="${dto.employee_name}" readonly >
					</c:forEach>
				</td>
				
				<td>	<!-- 4 -->
					<c:forEach var="dto" items="${dtos}">
						<input type="date" name="reg_date" value="${dto.reg_date}"  readonly>
					</c:forEach>
				</td>
				
				<td>	<!-- 5 -->
					<c:forEach var="dto" items="${dtos}">
					<input type="hidden" name="stock_state" value="${dto.stock_state}" readonly >
						<input type="text" name="state_name" value="${dto.state_name}"   readonly>
						<td> <!-- 6 -->
						<input type="button" value="등록" >
						</td>
					</c:forEach>
				</td>
				
			</tr>
			
			<c:forEach var="dto2" items="${dtos}">
			<tr>
			
				<td> <!-- 1 -->
				</td> 
				
				<td> <!-- 2 -->
				</td> 
				
				<td> <!-- 3 -->
				</td> 
				
				<td> <!-- 4 -->
				</td> 
				
				<td> <!-- 5 -->
				</td> 
				
				<td> <!-- 6 -->
				</td> 
			
			</tr>
			</c:forEach>
			
		</table>
		</form>

</body>
</html>