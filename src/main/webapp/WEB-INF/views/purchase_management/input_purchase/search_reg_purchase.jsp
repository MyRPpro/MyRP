<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../../setting.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	
	<form action="#" name="search_reg_purchase_form" method="get">
	
		<table width="700px" >
			<tr>
				<th>button</th>		<!-- 6 -->
				<th>num</th>		<!-- 8 -->
				<th>lack_Sales_id</th>		<!-- 1 -->
				<th>lack_stock</th>	<!-- 7 -->
				<th>product</th>	<!-- 2 -->
				<th>employee</th>	<!-- 3 -->
				<th>reg_date</th>	<!-- 4 -->
				<th>state</th>		<!-- 5 -->
				
			</tr>

			<c:forEach var="dto" items="${dtos}">
			<tr>
			
				<td> <!-- 6 -->
					<input type="button" value="등록하기" onclick="return reg_purchase();" >
				</td> 
				
				<td> <!-- 8 -->
					<input type="text" name="rnum" value="${dto.rnum}" readonly >
				</td> 
				
				<td> <!-- 1 -->
					<input type="text" name="sales_id" value="${dto.sales_id}" maxlength="10" readonly >
				</td> 
				
				<td> <!-- 7 -->
					<input type="text" name="lack_stock" value="${dto.lack_stock}" maxlength="4" readonly >
				</td> 
				
				<td> <!-- 2 -->
					<input type="hidden" name="product_id" value="${dto.product_id}"  readonly >
					<input type="text" name="product_name" value="${dto.product_name}"  readonly >
				</td> 
				
				<td> <!-- 3 -->
					<input type="hidden" name="employee_id" value="${dto.employee_id}"readonly >
					<input type="text" name="employee_name" value="${dto.employee_name}" readonly >
				</td> 
				
				<td> <!-- 4 -->
					<input type="date" name="reg_date" value="${dto.reg_date}"  readonly>
				</td> 
				
				<td> <!-- 5 -->
					<input type="text" name="state_name" value="${dto.state_name}"   readonly>
				</td> 
			
			</tr>
			</c:forEach>
		
			
		</table>
	</form>
	
	<script type="text/javascript">
	
	function reg_purchase(){
		
		var sales_id = $("input[name=sales_id]").val();
		console.log("재고가 부족한 판매번호 :" + sales_id);
		window.location="/purchase_management/input_purchase/search_reg_purchase_pro?lack_sales_id="+sales_id;
		

		
	}
	</script>
	
</body>
</html>