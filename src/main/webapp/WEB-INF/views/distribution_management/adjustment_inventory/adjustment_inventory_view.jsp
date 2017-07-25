<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../../setting.jsp" %>
<script type="text/javascript">
$('#delete_stock').change(function(){
	document.getElementById("taked_stock").value = 1*document.getElementById("stock_amount").value + 1*document.getElementById("delete_stock").value;
});

function chk(){
	var employee_id = document.getElementById("employee_id").value
	var delete_stock = document.getElementById("delete_stock").value
	var taked_stock = document.getElementById("taked_stock").value
	
	if(employee_id == 0){
		alert("담당자를 선택하시오.");
		return false;
	}else if(taked_stock < 0){
		alert("TAKED_STOCK은 0보다 작을 수 없습니다.");
		return false;
	}else if(delete_stock == null || delete_stock ==  0){
		alert("MOVING_STOCK을 입력하시오.");
		return false;
	}
}
</script>
<form action = "adjustment_inventory_pro" method = "post" onsubmit = "return chk();">
<table border = "1">
	<tr>
		<th>PRODUCT_ID</th>
		<th>PRODUCT_NAME</th>
		<th>WAREHOUSE_ID</th>
		<th>WAREHOUSE_NAME</th>
		<th>EMPLOYEE_ID</th>
		<th>STOCK_AMOUNT</th>
		<th>MOVING_STOCK</th>
		<th>TAKED_STOCK</th>			
	</tr>
	<tr>
		<th><input type = "text" name = "product_id" id = "product_id" value = "${product_id}" readonly></th>
		<th><input type ="text" name = "product_name" id = "product_name" value = "${product_name}" readonly></th>
		<th><input type ="text" name = "warehouse_id" id = "warehouse_id" value = "${warehouse_id}" readonly></th>
		<th><input type ="text" name = "warehouse_name" id = "warehouse_name" value = "${warehouse_name}" readonly></th>
		<th>
			<select name = "employee_id" id = "employee_id">
				<option value = "0">담당자를 선택하시오.</option>
				<c:forEach var = "em" items = "${employeeVos}">
					<option value = "${em.employee_id}">${em.employee_name}</option>
				</c:forEach>
			</select>
		</th>
		<th><input type = "number" name = "stock_amount" id = "stock_amount" value = "${stockVo.stock_amount}" readonly></th>
		<th><input type = "number" name = "delete_stock" id = "delete_stock" ></th>
		<th><input type = "number" name = "taked_stock" id = "taked_stock" min = "0" readonly></th>
		
	</tr>
	<tr>
		<th><input type = "submit" value = "확인"></th>
	</tr>
</table>
<br><br>
</form>