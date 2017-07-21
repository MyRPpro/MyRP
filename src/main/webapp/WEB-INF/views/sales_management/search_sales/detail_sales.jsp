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
	
	<h3> 판매내역 상세 페이지 : detail_sales.jsp</h3>
	
		<form action="#" method="post" name="search_sales_from">
	
		<!-- 수정불가 -->
		<table border="1">
		
			<tr>
				<!-- 1  --> <th>sales</th>
				<!-- 2  --> <th>account</th>
				<!-- 3  --> <th>order</th>
				<!-- 4  --> <th>product</th>
				<!-- 5  --> <th>company</th>
				<!-- 6  --> <th>employee</th>
				<!-- 7  --> <th>reg_date</th>
				<!-- 8  --> <th>update_date</th>
				<!-- 9  --> <th>storage_out_date</th>
				<!-- 10 --> <th>count_sales</th>
				<!-- 11 --> <th>selling_price</th>
				<!-- 12 --> <th>sales_state</th>
				<!-- 13 --> <th>condition_note_receivable</th>
			</tr>
				
			<tr>	
				<td>
					<c:forEach var="dto" items="${dtos}">
						<input type="text" name="sales_id" 	value="${dto.sales_id}" maxlength="10" readonly >
					</c:forEach>
				</td>
				
				<td>
					<c:forEach var="dto" items="${dtos}">
						<input type="hidden" name="account_id" value="${dto.account_id}" readonly >
						<input type="text" name="account_name" value="${dto.account_name} 계정" readonly >
					</c:forEach>
				</td>
				
				<td>
					<c:forEach var="dto" items="${dtos}">
						<input type="text" name="order_id" value="${dto.order_id}" readonly >
					</c:forEach>
				</td>
				
				<td>
					<c:forEach var="dto" items="${dtos}">
						<input type="hidden" name="product_id" value="${dto.product_id}"  readonly >
						<input type="text" name="product_name" value="${dto.product_name}"  readonly >
					</c:forEach>
				</td>
				
				<td>
					<c:forEach var="dto" items="${dtos}">
						<input type="hidden" name="company_id" value="${dto.company_id}" readonly >
						<input type="text" name="company_name" value="${dto.company_name}" readonly  >
					</c:forEach>
				</td>
				
				<td>
					<c:forEach var="dto" items="${dtos}">
						<input type="hidden" name="employee_id" value="${dto.employee_id}"readonly >
						<input type="text" name="employee_name" value="${dto.employee_name}" readonly >
					</c:forEach>
				</td>
				
				<td>
					<c:forEach var="dto" items="${dtos}">
						<input type="date" name="reg_date" value="${dto.reg_date}"  readonly>
					</c:forEach>
				</td>
				
				<td>
					<c:forEach var="dto" items="${dtos}">
						<input type="date" name="update_date" value="${dto.update_date}" readonly>
					</c:forEach>
				</td>
				
				<td>
					<c:forEach var="dto" items="${dtos}">
						<input type="date" name="storage_out_date" value="${dto.storage_out_date}" readonly>
					</c:forEach>
				</td>
				
				<td>
					<c:forEach var="dto" items="${dtos}">
						<input type="number" name="count_sales" value="${dto.count_sales}" max="9999" readonly>
					</c:forEach>
				</td>
				
				<td>
					<c:forEach var="dto" items="${dtos}">
						<input type="number" name="selling_price" value="${dto.selling_price}" max="9999999999" readonly>
					</c:forEach>
				</td>
				
				<td>
					<c:forEach var="dto" items="${dtos}">
						<input type="text" name="state_name" value="${dto.state_name}"   readonly>
					</c:forEach>
				</td>
				
				<td>
					<c:forEach var="dto" items="${dtos}">
						<input type="number" name="condition_note_receivable" value="${dto.condition_note_receivable}" max="12" required>
					</c:forEach>
				</td>
				
			</tr>
		</table>
		
		<input type="button" value="회계전표 입력하기 " 
			onclick="window.location='/accounting_management/statement_management/search_all_statements'" >
	</form>
	
</body>
</html>




<%-- 	예전 버젼
		<form action="#" method="post" name="search_sales_from">
	
		<!-- 수정불가 -->
		<table border="1">
			<tr>
				<th>sales</th>
				<td>
					<input type="text" name="sales_id" 	value="${dto.sales_id}" maxlength="10" readonly >
				</td>
			</tr>
			<tr>
				<th>account</th>
				<td>
					<input type="hidden" name="account_id" value="${dto.account_id}" readonly >
					<input type="text" name="account_name" id="account_name" value="${dto.account_name} 계정" readonly >
					
				</td>
			</tr>
			<tr>
				<th>order</th>
				<td>
					<input type="text" name="order_id" value="${dto.order_id}" maxlength="12" readonly >
				</td>
			</tr>
			<tr>
				<th>product</th>
				<td>
					<input type="hidden" name="product_id" value="${dto.product_id}"  readonly >
					<input type="text" name="product_name" value="${dto.product_name}"  readonly >
				</td>
			</tr>
			<tr>
				<th>company</th>
				<td>
					<input type="hidden" name="company_id" value="${dto.company_id}">
					<input type="text" name="company_name" value="${dto.company_name}" readonly  >
				</td>
			</tr>
			<tr>
				<th>employee</th>
				<td>
					<input type="hidden" name="employee_id" value="${dto.employee_id}">
					<input type="text" name="employee_name" value="${dto.employee_name}" readonly >
					
				</td>
			</tr>
			<tr>
				<th>reg_date</th>
				<td>
					<input type="date" name="reg_date" value="${dto.reg_date}"  readonly>
				</td>
			</tr>
			
			<tr>
				<th>update_date</th>
				<td>
					<input type="date" name="update_date" value="${dto.update_date}" readonly>
				</td>
			</tr>
			<tr>
				<th>storage_out_date</th>
				<td>
					<input type="date" name="storage_out_date" value="${dto.storage_out_date}"readonly >
				</td>
			</tr>
			<tr>
				<th>count_sales</th>
				<td>
					<input type="number" name="count_sales" value="${dto.count_sales}"  readonly>
				</td>
			</tr>
			<tr>
				<th>selling_price</th>
				<td>
					<input type="number" name="selling_price" value="${dto.selling_price}" readonly>
				</td>
			</tr>
			<tr>
				<th>sales_state</th>
				<td>
					<input type="number" name="sales_state" value="${dto.sales_state}"  readonly>
				</td>
			</tr>
			<tr>
				<th>condition_note_receivable</th>
				<td>
					<input type="number" name="condition_note_receivable" value="${dto.condition_note_receivable}" required>
				</td>
			</tr>
			
			
		</table>
		<input type="button" value="회계전표 입력하기 " onclick="window.location='/accounting_management/statement_management/search_all_statements'" >
	
		</form>
		
		
	<script type="text/javascript">
		// 사원번호 자리수 제한 
		function employee_id_check(){
			var employee_id = document.getElementsByName("employee_id")[0];
			console.log( "employee_id.value.length : " + employee_id.value.length);
			if( employee_id.value.length > 4 ){
				alert("4자리 까지만 입력이 가능합니다.");
				employee_id.value = employee_id.value.substring(0,4);
			}
		}
	</script>
 --%>