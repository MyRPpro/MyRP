<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "../../setting.jsp" %>

<script type="text/javascript">

/* $(function(){
	 $('.product_list_chk').unbind("click").bind("click",function(){
		var togo = $('#product_list');
		var product_id = document.getElementById("product_id").value;
		var warehouse_id = document.getElementById("warehouse_id").value;

		var data = {
					"product_id" 	: product_id,
					"warehouse_id"	: warehouse_id,
					"goes"			: "2"
					};
		
		$.ajax({ 					
			data: 	data,
			type: 	'post',	 			
			url: 	"movement_product",
			success: function(response) { 	
				togo.html(response);	
			}
		});  
	});
}); */
</script>

<c:if test = "${goes == '1'}">
<%-- <c:forEach var = "pro" items = "${productVos}">
		<option value = "${pro.product_id}">${pro.product_name}</option>
</c:forEach> --%>
<th>
	<select id = "product_id" name = "product_id">
		<option value = "0">상품을 선택하시오.</option>
		<c:forEach var = "pro" items = "${productVos}">
		<option value = "${pro.product_id}">${pro.product_name}</option>
	</c:forEach>
	</select>
</th>
</c:if>

<c:if test = "${goes == '2'}">
<h3>재고현황</h3>
<table border = "1">
	<tr>
		<th>warehouse_id</th>
		<th>product_id</th>
		<th>product_name</th>
		<th>stock_amount</th>
	</tr>
	<c:forEach var = "pro" items = "${productVos}">
		<tr>
			<th>${pro.warehouse_id}</th>
			<th>${pro.product_id}</th>
			<th>${pro.product_name}</th>
			<th>${pro.stock_amount}</th>
		</tr>
	</c:forEach>
</table>
</c:if>