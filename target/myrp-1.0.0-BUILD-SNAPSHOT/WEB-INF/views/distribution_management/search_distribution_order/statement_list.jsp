<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file = "../../setting.jsp" %>
<script type="text/javascript">
$(function(){
	$('#storage_out').click(function(){
		var togo = $('#request');
		var data = {
					"goes" : "out",
					}
		$.ajax({ 					
			data: 	data,
			type: 	'post',	 			
			url: 	"/distribution_management/search_distribution_order/request_in_out_storage",
			success: function(response) { 
				togo.html(response);	
			}
		});
	});	
	
	$('#storage_in').click(function(){
		var togo = $('#request');
		var data = {
					"goes" : "in",
					}
		$.ajax({ 					
			data: 	data,
			type: 	'post',	 			
			url: 	"/distribution_management/search_distribution_order/request_in_out_storage",
			success: function(response) {
				togo.html(response);	
			}
		});
	});	
	
	$('#storage_out_complete').click(function(){
		var togo = $('#request');
		var data = {
					"goes" : "storage_out_complete",
					}
		$.ajax({ 					
			data: 	data,
			type: 	'post',	 			
			url: 	"/distribution_management/search_distribution_order/request_in_out_storage",
			success: function(response) {
				togo.html(response);	
			}
		});
	});	
});
</script>
all_statement_list.jsp
<button id = "storage_out">출고요청</button>
<button id = "storage_in">입고요청</button>
<button id = "storage_out_complete">출고완료요청</button>
<button onclick = "window.location = '/'">홈으로</button>
<br>
<br>
<div id = "request"></div>
<br>
<br>	
<h3>입고요청 처리내역</h3>
<table border = "1">
	<tr>
		<th>STOCK_ORDER_ID</th>
		<th>STOCK_ORDER_TYPE</th>
		<th>PRODUCT_ID</th>
		<th>WAREHOUSE_ID</th>
		<th>EMPLOYEE_ID</th>
		<th>REG_DATE</th>
		<th>UPDATE_DATE</th>
		<th>STOCK_STATE</th>
		<th>COUNT_PURCHASE</th>
		<th>STORAGE_IN_DATE</th>
	</tr>
	<c:forEach var = "dto" items = "${in_storageDtos}">
		<tr>
			<th>${dto.stock_order_id}</th>
			<th>${dto.stock_order_type}</th>
			<th>${dto.product_id}</th>
			<th>${dto.warehouse_id}</th>
			<th>${dto.employee_id}</th>
			<th>${dto.reg_date}</th>
			<th>${dto.update_date}</th>
			<th>${dto.stock_state}</th>
			<th>${dto.count_purchase}</th>
			<th>${dto.storage_in_date}</th>
		</tr>
	</c:forEach>
</table>

<h3>출고요청 처리내역</h3>
<table border = "1">
	<tr>
		<th>STOCK_ORDER_ID</th>
		<th>STOCK_ORDER_TYPE</th>
		<th>PRODUCT_ID</th>
		<th>WAREHOUSE_ID</th>
		<th>EMPLOYEE_ID</th>
		<th>REG_DATE</th>
		<th>UPDATE_DATE</th>
		<th>STOCK_STATE</th>
		<th>COUNT_SALES</th>
		<th>AVAILABLE_STOCK</th>
		<th>LACK_STOCK</th>
		<th>STORAGE_OUT_DATE</th>
	</tr>
	<c:forEach var = "dto" items = "${out_storageDtos}">
		<tr>
			<th>${dto.stock_order_id}</th>
			<th>${dto.stock_order_type}</th>
			<th>${dto.product_id}</th>
			<th>${dto.warehouse_id}</th>
			<th>${dto.employee_id}</th>
			<th>${dto.reg_date}</th>
			<th>${dto.update_date}</th>
			<th>${dto.stock_state}</th>
			<th>${dto.count_sales}</th>
			<th>${dto.available_stock}</th>
			<th>${dto.lack_stock}</th>
			<th>${dto.storage_out_date}</th>
		</tr>
	</c:forEach>
</table>
</html>