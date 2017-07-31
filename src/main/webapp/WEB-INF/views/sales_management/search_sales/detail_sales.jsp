<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
    table {
        table-layout: fixed;
    }
    th{
    	background: LightGrey;
    }
    th tr td {
    	text-align: center;
        text-overflow: ellipsis;
        overflow: hidden;
    }
    table tr:hover {  
        background: #f3f3f3;
    }
</style>

</head>

<body>
	
	<h3> 판매내역 상세 페이지 : detail_sales.jsp</h3>

	
	
	<form action="#" method="post" name="search_sales_from"   >
	
		<!-- 수정불가 -->
		<table border="1">
		
			<tr>
				<!-- 1  --> <th>판매번호</th>
				<!-- 2  --> <th>계정</th>
				<!-- 3  --> <th>주문번호</th>
				<!-- 4  --> <th>상품</th>
				<!-- 5  --> <th>거래처</th>
				<!-- 6  --> <th>담당자</th>
				<!-- 7  --> <th>등록일</th>
			</tr>
			
			<tr>	
				<td>
					<c:forEach var="dto" items="${dtos}">
						<input type="text" name="sales_id" id="sales_id" value="${dto.sales_id}" maxlength="10" readonly >
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
			</tr>
			
			<tr>
				
				<!-- 8  --> <th>최근수정일</th>
				<!-- 9  --> <th>출고일</th>
				<!-- 10 --> <th>수량</th>
				<!-- 11 --> <th>가격</th>
				<!-- 14 --> <th>총합</th>
				<!-- 12 --> <th>어음기간</th>
				<!-- 13 --> <th>판매상태</th>
			</tr>
			
			<tr>	
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
						<input type="number" name="count_sales" max="9999" readonly
						value="<fmt:formatNumber value="${dto.count_sales}" type="number" />" >
					</c:forEach>
				</td>
				
				<td>
					<c:forEach var="dto" items="${dtos}">
						<input type="text" name="selling_price"  max="9999999999" readonly
						value="<fmt:formatNumber value="${dto.selling_price}" type="currency" />" >
					</c:forEach>
				</td>
				
				<td>
					<c:forEach var="dto" items="${dtos}">
						<input type="text" name="sum_price" max="9999999999" readonly
						value="<fmt:formatNumber value="${dto.selling_price * dto.count_sales}" type="currency" />" >
					</c:forEach>
				</td>
				
				<td>
					<c:forEach var="dto" items="${dtos}">
						<input type="number" name="condition_note_receivable" value="${dto.condition_note_receivable}" max="12" required>
					</c:forEach>
				</td>
				
				<td>
					<c:forEach var="dto" items="${dtos}">
						<input type="text" name="state_name" value="${dto.state_name}"   readonly>
					</c:forEach>
				</td>
				
				
				
			</tr>
		</table>
		<c:if test="${sales_state == 22213 }">
			<input type="button" value="회계전표 입력하기 "  
			onclick="window.location='/accounting_management/statement_management/search_all_statements'" >
		</c:if>
		<c:if test="${sales_state == 22214 and account_id == '500014030000'}">
			<input type="button" value="출고요청하기" name="req_storage_out" onclick="req_storage_out();">
		</c:if>

	</form>
	
	<script type="text/javascript">
	function req_storage_out(){
		var sales_id = document.getElementById("sales_id").value;

		window.location="/sales_management/search_sales/detail_sales_pro"
						+"?req_kind=storage_out&sales_id="+sales_id;
						
	}
	

	
	</script>
	
	
	
</body>
</html>


