<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="../../setting.jsp" %>
<body>
	
	
	<table border="1">
		
		<tr>
			<th>purchase_id</th>
			<th>account_id</th>
			<th>order_id</th>
			<th>product_id</th>
			<th>company_name</th>
			<th>employee_id</th>
			<th>reg_date</th>
			<th>update_date</th>
			<th>storage_in_date</th>
			<th>count_purchase</th>
			<th>supply_price</th>
			<th>purchase_state</th>
			<th>condition_note_payable</th>
		</tr>
		
		<c:forEach var="vo" items="${purchaseVOs}">
		
		<tr>
			<td>${vo.purchase_id}</td>
			<td>${vo.account_id}</td>
			<td>${vo.order_id}</td>
			<td>${vo.product_id}</td>
			
			<td>
				<a href="javascript:detail_page('${vo.company_id}')">
					${vo.company_name}
				</a>
			</td>
			
			<td>${vo.employee_id}</td>
			<td>${vo.reg_date}</td>
			<td>${vo.update_date}</td>
			<td>${vo.storage_in_date}</td>
			<td> <fmt:formatNumber value="${vo.count_purchase}" type="number"/> </td>
			<td> <fmt:formatNumber value="${vo.supply_price}" type="currency"/> </td>
			<td>${vo.purchase_state} </td>
			<td>${vo.condition_note_payable}</td>
			
		</tr>
		</c:forEach>
		
	</table>
	
	<script src="//code.jquery.com/jquery.min.js"></script>
	<script>	
	
	function detail_page(company_id){
		
		console.log(" company_id :" + company_id )
		$('#list_dateil').load('/purchase_management/search_purchase/detail_purchase?company_id='+company_id);
		return false;
	}
	
	</script>
	<hr>
	<div id="list_dateil"></div>
	
	
	
	
</body>
</html>