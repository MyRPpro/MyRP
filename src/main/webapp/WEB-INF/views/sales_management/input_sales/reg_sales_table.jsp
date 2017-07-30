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
	
	<h3>등록된 내역</h3>
	
	<c:if test="${cnt == 3}">
		<script type="text/javascript">
			setTimeout(function(){
				alert("정상적으로 입력되었습니다.");
				 $('#reg_table').load('/purchase_management/input_purchase/reg_purchase_table');
			}, 200);
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
				<th>번호</th>		<!-- 1 -->
				<th>판매번호</th>	<!-- 2 -->
				<th>계정</th>	<!-- 3 -->
				<th>상품</th>	<!-- 4 -->
				<th>거래처</th>	<!-- 5 -->
				<th>담당자</th>	<!-- 6 -->
				<th>등록일</th>	<!-- 7 -->
				<th>수량</th>	<!-- 11 -->
				<th>가격</th>		<!-- 8 -->
				<th>총합</th>		<!-- 12 -->
				<th>판매상태</th>		<!-- 9 -->
				<th>어음기간</th>	<!-- 10 -->
			</tr>
			
			<c:forEach var="dto" items="${dtos}">
			
			<tr>
				<td>${dto.rnum}</td> 			<!-- 1 -->
				<td id="sales_id">${dto.sales_id}</td> 		<!-- 2 -->
				<td>${dto.account_name}</td> 	<!-- 3 -->
				<td>${dto.product_name}</td> 	<!-- 4 -->
				<td>${dto.company_name}</td>	<!-- 5 -->
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
				<td>							<!-- 12 -->
				<fmt:formatNumber value="${dto.selling_price * dto.count_sales}" type="currency" /> 
				</td>
				<td>${dto.state_name}</td>	<!-- 9 -->
				<td>${dto.condition_note_receivable}</td>	<!-- 10 -->

			</tr>

			</c:forEach>
		</table>
		<br>
	
		<input type="button" value="전표입력하기" onclick="sendStatement();">
	</form>
	
	<script type="text/javascript">
	function sendStatement(){
		var sales_id = document.getElementById("sales_id").innerHTML
		/* console.log( " sned sales_id : " + sales_id ); */
		window.location="/accounting_management/statement_management/make_statement"
						+"?sales_id="+sales_id;
	}
	</script>
</body>
</html>