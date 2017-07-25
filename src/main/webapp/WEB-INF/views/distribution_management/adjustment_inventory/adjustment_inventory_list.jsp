<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%@ include file = "../../setting.jsp" %>
<script type="text/javascript">
$(function(){
	 $('#new_reg').unbind("click").bind("click",function(){
		if(document.getElementById("product_id").value == 0 || document.getElementById("warehouse_id").value == 0){
			alert("상품과 창고를 선택하시오.");
			return false;
		}
		var togo = $('#reg');
		var product = document.getElementById("product_id");
		var product_id = document.getElementById("product_id").value;
		var product_name =  product.options[product.selectedIndex].text;
		
		var warehouse = document.getElementById("warehouse_id");
		var warehouse_id = document.getElementById("warehouse_id").value;
		var warehouse_name = warehouse.options[warehouse.selectedIndex].text;
		
		var data = {
						"product_id" : product_id,
						"product_name" : product_name,
						"warehouse_id" : warehouse_id,
						"warehouse_name" : warehouse_name
					};
		
		$.ajax({ 					
			data:	data,
			type: 	'post',	 			
			url: 	"adjustment_inventory_view",
			success: function(response) { 	
				togo.html(response);	
			}
		});  
	});
});
</script>
<body>
adjustment_inventory_list.jsp
<a href="/">홈으로</a>
<br><br>
<h3>재고조정 리스트</h3>
<table border = "1">
		<tr>
			<th>STOCK_ORDER_ID</th>
			<th>PRODUCT_ID</th>
			<th>PRODUCT_NAME</th>
			<th>WAREHOUSE_ID</th>
			<th>EMPLOYEE_ID</th>
			<th>REG_DATE</th>
			<th>SEARCH_DATE</th>
			<th>TAKED_STOCK</th>
			<th>MOVING_STOCK</th>
			
						
		</tr>
		<c:forEach var = "dto" items = "${Adjustment_inventoryDtos}">
		<tr>
			<th>${dto.stock_order_id}</th>
			<th>${dto.product_id}</th>
			<th>${dto.product_name}</th>
			<th>${dto.warehouse_id}</th>
			<th>${dto.employee_id}</th>
			<th>${dto.reg_date}</th>
			<th>${dto.search_date}</th>
			<th>${dto.taked_stock}</th>
			<th>${dto.delete_stock}</th>
		</tr>
		</c:forEach>
	</table>
	
	<br><br>
	<h3>신규등록</h3>
	<br>
	<select id = "product_id" name = "product_id">
		<option value = "0">상품을 선택하시오.</option>
		<c:forEach var = "pro" items = "${productVos}">
			<option value = "${pro.product_id}">${pro.product_name}</option>
		</c:forEach>
	</select>
	<select id = "warehouse_id" name = "warehouse_id">
		<option value = "0">창고를 선택하시오.</option>
		<c:forEach var = "ware" items = "${warehouseVos}">
			<option value = "${ware.warehouse_id}">${ware.warehouse_name}</option>
		</c:forEach>
	</select>
	<button id = "new_reg">신규등록하기</button>
	
	<div id = "reg"></div>

</body>
</html>