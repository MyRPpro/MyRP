<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../../setting.jsp" %>
<script type="text/javascript">
$('#delete_stock').change(function(){
	document.getElementById("taked_stock").value = 1*document.getElementById("stock_amount").value + 1*document.getElementById("delete_stock").value;
});

function chk(){
	var delete_stock = document.getElementById("delete_stock").value
	var taked_stock = document.getElementById("taked_stock").value
	
	if(taked_stock < 0){
		alert("조정 후 재고는 0보다 작을 수 없습니다.");
		return false;
	}else if(delete_stock == null || delete_stock ==  0){
		alert("조정 재고를 입력하시오.");
		return false;
	}

	var data = this.form.serialize();
		
	$.ajax({ 					
		data:	data,
		type: 	'post',	 			
		url: 	"/distribution_management/adjustment_inventory/adjustment_inventory_pro",
		success: function(response) { 	
			$('#reg').html(response);	
		}
	});
}
</script>
<form action = "" method = "post" onsubmit = "return chk();" >
<table border = "1">
	<tr>
		<th>상품명</th>
		<th>창고명</th>
		<th>담당자명</th>
		<th>창고 재고</th>
		<th>조정 재고</th>
		<th>조정 후 재고</th>		
	</tr>
	<tr>
		<input type = "hidden" name = "product_id" id = "product_id" value = "${product_id}" >
		<th><input type ="text" name = "product_name" id = "product_name" value = "${product_name}" readonly></th>
		<input type ="hidden" name = "warehouse_id" id = "warehouse_id" value = "${warehouse_id}" >
		<th><input type ="text" name = "warehouse_name" id = "warehouse_name" value = "${warehouse_name}" readonly></th>
		<th>
			<input type = "hidden" name = "employee_id" value = "${ROLE.employee_id}"> 
			<input type = "text" value = "${ROLE.employee_name}" readonly>
		</th>
		<th><input type = "number" name = "stock_amount" id = "stock_amount" value = "${stockVo.stock_amount}" readonly></th>
		<th><input type = "number" name = "delete_stock" id = "delete_stock" ></th>
		<th><input type = "number" name = "taked_stock" id = "taked_stock" min = "0" readonly></th>
		
	</tr>
	<tr>
		<th><input type = "submit" value = "확인" ></th>
	</tr>
</table>
<br><br>
</form>