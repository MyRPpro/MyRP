<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="../../setting.jsp" %>
<body>

	<c:if test="${cnt==0}">
		<script type="text/javascript">
			setTimeout(function(){
				alert("검색결과가 없습니다. 전체내역을 표시합니다.");
				search_list(1,0);
			}, 200);
		</script>
	</c:if>
	
	
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
			<!-- 구매번호를 눌렀을 때 이동 -->
			<td>
				<a href="javascript:detail_page('${dto.purchase_id},${dto.sales_state},${dto.account_id}')">
					${dto.purchase_id}
				</a>
			</td>
			<td>${vo.account_id}</td>
			<td>${vo.order_id}</td>
			<td>${vo.product_id}</td>
			<td>${vo.company_name}</td>
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
	
	<script type="text/javascript">	
	
	function detail_page(param){
		
		console.log(" param :" + param )
		
		param = param.split(',');
		console.log(" sales_id :" + param[0] );
		console.log(" sales_state :" + param[1] ); 
		console.log(" order_id :" + param[2] ); 
		
		var state = param[1];
		
		if( state == "23202" ){
			$('#list_dateil').load('/purchase_management/search_purchase/modify_purchase?purchase_id='+param[0]
			+'&purchase_state='+param[1]);
			return false;
			
		} else {
			$('#list_dateil').load('/purchase_management/search_purchase/detail_purchase?purchase_id='+param[0]
			+'&purchase_state='+param[1]
			+'&account_id='+param[2]);
			return false;
			
		}
		
	}
	
	</script>
	
	
	
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