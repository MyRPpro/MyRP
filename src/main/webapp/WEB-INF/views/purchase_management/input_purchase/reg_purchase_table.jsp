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
	
	
	<form action="#" name="reg_purchase_table_form" method="get">
	
		<table border="1">
			
			<tr>
				<th>순서</th>		<!-- 1 -->
				<th>구매번호</th>	<!-- 2 -->
				<th>계정</th>	<!-- 3 -->
				<th>제품</th>	<!-- 4 -->
				<th>공급처</th>	<!-- 5 -->
				<th>담당자</th>	<!-- 6 -->
				<th>등록일</th>	<!-- 7 -->
				<th>수량</th>	<!-- 11 -->
				<th>공급가</th>		<!-- 8 -->
				<th>구매상태</th>		<!-- 9 -->
				<th>지급기간</th>	<!-- 10 -->
			</tr>
			
			<c:forEach var="dto" items="${dtos}">
			
			<tr>
				<td>${dto.rnum}</td> 			<!-- 1 -->
				<td id="purchase_id">${dto.purchase_id}</td> 		<!-- 2 -->
				<td>${dto.state_name}</td> 		<!-- 3 -->
				<td>${dto.product_name}</td> 	<!-- 4 -->
				<td>${dto.company_name}</td>	<!-- 5 -->
				<td>${dto.employee_name}</td>	<!-- 6 -->
				<td>							<!-- 7 -->
				<fmt:formatDate value="${dto.reg_date}" pattern="MM-dd"/>
				</td>	
				<td>							<!-- 11 -->
				<fmt:formatNumber value="${dto.count_purchase}" type="number" />
				</td>	
				<td>							<!-- 8 -->
				<fmt:formatNumber value="${dto.supply_price}" type="currency" />
				</td>	
				<td>${dto.purchase_state}</td>	<!-- 9 -->
				<td>${dto.condition_note_payable}</td>	<!-- 10 -->

			</tr>

			</c:forEach>
			
		</table>
		<br>
		<input type="button" value="전표입력하기" onclick="sendStatement();">
	</form>
	
	<script type="text/javascript">
	function sendStatement(){
		var purchase_id = document.getElementById("purchase_id").innerHTML
		console.log( " sned purchase_id : " + purchase_id );
		window.location="/accounting_management/statement_management/make_statement";
						/* +"?purchase_id="+purchase_id; */
	}
	</script>

</body>
</html>