<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="../../setting.jsp" %>
<body>
	
	
	<table border="1" style="text-align: center;">
		
		<tr>
			<th>sales_id</th>
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
			<th>sales_state</th>
			<th>condition</th>
		</tr>
		
		<c:forEach var="dto" items="${SalesDTOs}">
		
		<tr>
		
			<!-- 판매번호를 눌렀을 때 이동 -->
			<td>
				<a href="javascript:detail_page('${dto.sales_id},${dto.sales_state}')">
					${dto.sales_id}
				</a>
			</td>
			
			<td>${dto.account_name}</td>
			<%-- <td>${dto.order_id}</td> --%>
			<td>${dto.product_name}</td>
			<td>${dto.company_name}</td>
			
			<%-- 수정 전 버젼 : 회사이름으로 이동하면 곂친다.
			<td>
				<a href="javascript:detail_page('${dto.company_id},${dto.sales_id},${dto.account_id},${dto.sales_state}')">
					${dto.company_name}
				</a>
			</td>
			 --%>
			<td>${dto.employee_name}</td>
			<td>${dto.reg_date}</td>
			<td>${dto.update_date}</td>
			<td>${dto.storage_out_date}</td>
			<td> <fmt:formatNumber value="${dto.count_sales}" type="number"/> </td>
			<td> <fmt:formatNumber value="${dto.selling_price}" type="currency"/> </td>
			<td>${dto.state_name} </td>
			<td>${dto.condition_note_receivable}</td>
			
		</tr>
		</c:forEach>
		
	</table>
	

	<script type="text/javascript">	
	
	function detail_page(param){
		
		console.log(" param :" + param )
		
		param = param.split(',');
		console.log(" sales_id :" + param[0] )
		console.log(" sales_state :" + param[1] )
		var state = param[1];
		
		if( state == "22211" ){
			$('#list_dateil').load('/sales_management/search_sales/modify_sales?sales_id='+param[0]
			+'&sales_state='+param[1]);
			return false;
			
		} else {
			$('#list_dateil').load('/sales_management/search_sales/detail_sales?sales_id='+param[0]
			+'&sales_state='+param[1]);
			return false;
			
		}
		
	}
	
	</script>
	<hr>
	<div id="list_dateil"></div>
	
	
	
	
</body>
</html>