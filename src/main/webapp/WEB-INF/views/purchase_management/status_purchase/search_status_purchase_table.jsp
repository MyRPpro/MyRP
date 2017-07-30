<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp" %>

<body>
	
	검색결과 : ${cnt} 개
	<c:if test="${cnt==0}">
		<script type="text/javascript">
			setTimeout(function(){
				alert("검색결과가 없습니다. 전체내역을 표시합니다.");
				list_table(1,2);
			}, 200);
		</script>
	</c:if>
	
	<table border="1" style="text-align: center;">
		
		<tr>
			<th>purchase_id</th>
			<th>account</th>
			<!-- <th>order_id</th> -->
			<th>product</th>
			<th>company</th>
			<th>employee</th>
			<th>reg_date</th>
			<th>update_date</th>
			<th>storage_out_date</th>
			<th>count</th>
			<th>selling_price</th>
			<th>purchase_state</th>
			<th>condition</th>
		</tr>
		
		<c:forEach var="dto" items="${purchaseDTOs}">
		
		<tr>
		
			<!-- 구매번호를 눌렀을 때 이동 -->
			<td>
				<a href="javascript:detail_status_page('${dto.purchase_id},${dto.account_id}')">
					${dto.purchase_id}
				</a>
			</td>
			
			<td>${dto.account_name}</td>
			<td>${dto.product_name}</td>
			<td>${dto.company_name}</td>
			<td>${dto.employee_name}</td>
			<td>${dto.reg_date}</td>
			<td>${dto.update_date}</td>
			<td>${dto.storage_out_date}</td>
			<td> <fmt:formatNumber value="${dto.count_purchase}" type="number"/> </td>
			<td> <fmt:formatNumber value="${dto.selling_price}" type="currency"/> </td>
			<td>${dto.state_name} </td>
			<td>${dto.condition_note_receivable}</td>
			
		</tr>
		</c:forEach>
		
	</table>
	

	<script type="text/javascript">	
	
		function detail_status_page(param){
			
			param = param.split(',');
			console.log(" purchase_id :" + param[0] );		
			console.log(" account_id :" + param[1] );	
			
			$('#list_dateil').load('/purchase_management/status_purchase/search_status_purchase_detail?purchase_id='+param[0]
			+'&account_id='+param[1] );
			
		return false;
	}
	
	</script>
	<hr>
	<div id="list_dateil"></div>
	
</body>
</html>