<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<style>
    table {
        table-layout: fixed;
    }
    tr td {
        text-overflow: ellipsis;
        overflow: hidden;
    }
    table tr:hover {  
        background: #f3f3f3;
    }
</style>

<body>

	<h3> 구매 내역 상세 페이지 : detail_purchase.jsp</h3>
	
	
	<c:if test="${cnt > 0}">
		<script type="text/javascript">
			setTimeout(function(){
				alert("상태코드가 정상적으로 변경되었습니다.");
				window.location="/sales_management/search_sales/sales_list"
			}, 200);
		</script>
	</c:if>
	
	<c:if test="${cnt == 0}">
		<script type="text/javascript">
			alert("상태코드 변경 오류가 발생했습니다.");
			window.history.back();
		</script>
	</c:if>
	
	<form action="#" name="modify_purchase_form" method="get">
	
	<!-- 수정불가 -->
		<table border="1" width="1500px" >
		
			<tr>
				<!-- 1  --> <th>purchase</th>
				<!-- 2  --> <th>account</th>
				<!-- 3  --> <th>order</th>
				<!-- 4  --> <th>product</th>
				<!-- 5  --> <th>company</th>
				<!-- 6  --> <th>employee</th>
				<!-- 7  --> <th>reg_date</th>
				<!-- 8  --> <th>update_date</th>
				<!-- 9  --> <th>storage_in_date</th>
				<!-- 10 --> <th>count_purchase</th>
				<!-- 11 --> <th>supply_price</th>
				<!-- 12 --> <th>purchase_state</th>
				<!-- 13 --> <th>condition_note_payable</th>
			</tr>
				
			<tr>	
				<td>
					<c:forEach var="dto" items="${dtos}">
						<input type="text" name="purchase_id" id="purchase_id" value="${dto.purchase_id}" maxlength="10" readonly >
					</c:forEach>
				</td>
				
				<td>
					<c:forEach var="dto" items="${dtos}">
						<input type="hidden" name="account_id" id="account_id" value="${dto.account_id}" readonly >
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
						<input type="date" name="storage_in_date" value="${dto.storage_in_date}" readonly>
					</c:forEach>
				</td>
				
				<td>
					<c:forEach var="dto" items="${dtos}">
						<input type="number" name="count_purchase" value="${dto.count_purchase}" max="9999" readonly>
					</c:forEach>
				</td>
				
				<td>
					<c:forEach var="dto" items="${dtos}">
						<input type="number" name="supply_price" value="${dto.supply_price}" max="9999999999" readonly>
					</c:forEach>
				</td>
				
				<td>
					<c:forEach var="dto" items="${dtos}">
						<input type="text" name="purchase_state" value="${dto.purchase_state}"   readonly>
					</c:forEach>
				</td>
				
				<td>
					<c:forEach var="dto" items="${dtos}">
						<input type="number" name=condition_note_payable value="${dto.condition_note_payable}" max="12" required>
					</c:forEach>
				</td>
				
			</tr>
		</table>
		<c:if test="${purchase_state == 22213 }">
			<input type="button" value="회계전표 입력하기 " 
			onclick="window.location='/accounting_management/statement_management/search_all_statements'" >
		</c:if>
		<c:if test="${purchase_state == 23203 and account_id == 500011050000 }"><!-- 상품매입시 -->
			<input type="button" value="입고요청하기" onclick="req_storage_in();">
		</c:if>

	</form>
	
	
	<script type="text/javascript">
	function req_storage_in(){
		var purchase_id = document.getElementById("purchase_id").value;
		console.log( " sned purchase_id : " + purchase_id );

		window.location="/purchase_management/search_purchase/detail_purchase_pro"
						+"?req_kind=storage_in&purchase_id="+purchase_id;
						
	}

	</script>
	

	


</body>
</html>