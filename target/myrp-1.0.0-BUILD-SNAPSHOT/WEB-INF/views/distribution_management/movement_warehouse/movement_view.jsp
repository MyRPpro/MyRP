<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file = "../../setting.jsp" %>
</head>
<script type="text/javascript">
$(function(){
	 $('.warehouse_id').change(function(){
		var warehouse_id = $(this).val();

		var data = {
					"warehouse_id" 	: warehouse_id,
					"goes"			: "1"
					};
		
		$.ajax({ 					
			data: 	data,
			type: 	'post',	 			
			url: 	"movement_product",
			success: function(response) { 	
				$('#product').html(response);	
			}
		});  
		
		data = {
				"warehouse_id"	: warehouse_id,
				"goes"			: "2"
				};
	
		$.ajax({ 					
			data: 	data,
			type: 	'post',	 			
			url: 	"movement_product",
			success: function(response) { 	
				$('#product_list').html(response);	
			}
		});  
	});
});

function chk(){
	var warehouse_id = document.getElementsByName("warehouse_id")[0].value;
	var employee_id = document.getElementsByName("employee_id")[0].value;
	var product_id = document.getElementsByName("product_id")[0].value;
	var arrive_warehouse_id = document.getElementsByName("arrive_warehouse_id")[0].value;
	var movement_amount = document.getElementsByName("movement_amount")[0].value;
	
	if(warehouse_id == 0 || employee_id == 0 || product_id == 0 || arrive_warehouse_id == 0 || movement_amount == null){
		alert("입력이 잘못되었습니다.");
		return false;
	}
}
</script>
<body>
<c:if test = "${id == 'new'}">
<form name = "" action = "movement_pro" onsubmit = "return chk();">
<input type = "hidden" name = "id" value = "${id}" onsubmit = "chk();">
<h3>신규등록</h3>
<table border = "1">
		<tr>
			<th>출발 WAREHOUSE_ID</th>
			<th>PRODUCT_ID</th>
			<th>EMPLOYEE_ID</th>
			<th>ARRIVE_WAREHOUSE</th>
			<th>MOVEMENT_AMOUNT</th>
		</tr>
		<tr>
			<th>
				
				<select id = "warehouse_id" class  = "warehouse_id" name = "warehouse_id">
						<option value = "0">창고를 선택하시오.</option>
					<c:forEach var = "ware" items = "${warehouseVos}">
						<option value = "${ware.warehouse_id}">${ware.warehouse_name}</option>
					</c:forEach>
				</select>
			</th>
			<th>
				<div id = "product"></div>
			</th>
			<th>
				<select name = "employee_id">
					<option value = "0">담당자를 선택하시오.</option>
					<c:forEach var = "em" items = "${employeeVos}">
						<option value = "${em.employee_id}">${em.employee_name}</option>
					</c:forEach>
				</select>
			</th>
			<th>
				<select name = "arrive_warehouse_id">
					<c:forEach var = "ware" items = "${warehouseVos}">
						<option value = "${ware.warehouse_id}">${ware.warehouse_name}</option>
					</c:forEach>
				</select>
			</th>
			<th><input type = "number" name = "movement_amount" min = "1"></th>
		</tr>
		<tr>
			<th colspan = "6">
				<input type = "submit" value = "확인">
				<input type = "reset" value = "리셋">
			</th>
		</tr>
	</table>
</form>
</c:if>
<c:if test = "${id != 'new'}">
<form name = "" action = "movement_pro" onsubmit = "return chk();">
<input type = "hidden" name = "id" value = "${id}">
<table border = "1">
		<tr>
			<th>STOCK_ORDER_ID</th>
			<th>출발 WAREHOUSE_ID</th>
			<th>PRODUCT_ID</th>
			<th>EMPLOYEE_ID</th>
			<th>ARRIVE_WAREHOUSE</th>
			<th>MOVEMENT_AMOUNT</th>
			<th>REG_DATE</th>
			<th>MOVEMENT_STATE</th>
			
		</tr>
		<c:forEach var = "dto" items = "${movement_warehouseDtos}">
		<tr>
			<th><input type = "text" name = "stock_order_id" value = "${dto.stock_order_id}"></th>
			<th>
				
				<select id = "warehouse_id"  class = "warehouse_id" name = "warehouse_id">
					<c:forEach var = "ware" items = "${warehouseVos}">
						<option value = "${ware.warehouse_id}" <c:if test = "${ware.warehouse_id == dto.warehouse_id}">selected</c:if>>${ware.warehouse_name}</option>
					</c:forEach>
				</select>
			
			</th>
			<th>
				<div id = "product"></div>
			</th>
			<th>
				<select name = "employee_id">
				<option value = "0">담당자를 선택하시오.</option>
					<c:forEach var = "em" items = "${employeeVos}">
						<option value = "${em.employee_id}"<c:if test = "${em.employee_id == dto.employee_id}">selected</c:if>>${em.employee_name}</option>
					</c:forEach>
				</select>
			</th>
			<th>
				<select name = "arrive_warehouse_id">
					<c:forEach var = "ware" items = "${warehouseVos}">
						<option value = "${ware.warehouse_id}"<c:if test = "${ware.warehouse_id == dto.arrive_warehouse}">selected</c:if>>${ware.warehouse_name}</option>
					</c:forEach>
				</select>
			</th>
			<th><input type = "number" name = "movement_amount" min = "1" max = ""value = "${dto.movement_amount}"></th>
			<th><input type = "text" value = "${dto.reg_date}" readonly></th>
			<th><input type = "text" value = "${dto.movement_state}"readonly></th>
		</tr>
		</c:forEach>
		<tr>
			<th colspan = "11">
				<input type = "submit" value = "확인">
				<input type = "reset" value = "리셋">
			</th>
		</tr>
	</table>
</form>
</c:if>

<div id = "product_list"></div>
</body>
</html>