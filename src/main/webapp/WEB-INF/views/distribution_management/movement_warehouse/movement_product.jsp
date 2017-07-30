<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "../../setting.jsp" %>
<script type="text/javascript">
$(function(){
	$('#movement_button').click(function(){
		var pro = document.getElementById("product_id").value;
		var movement_amount = document.getElementById("movement_amount"); 
		var warehouse_id = document.getElementById("warehouse_id").value;
		var arrive_warehouse_id = document.getElementById("arrive_warehouse_id");
		
		if(pro == 0){
			alert("상품을 선택하시오.");
			return false;
		}
		
		var stock = document.getElementById(pro+"").value;
		if(warehouse_id == arrive_warehouse_id.value){
			alert("출발 창고는 도착 창고와 같을 수 없습니다.");
			arrive_warehouse_id.focus();
			return false;
		}
		
		if(movement_amount.value*1 > stock*1){
			alert("입력값은 재고수량 보다 클 수 없습니다.");
			movement_amount.focus();
			return false;
		}
		
		var togo = $('#main_screen');
		var data = $('#movement_form').serialize();
		$.ajax({ 					
			data: 	data,
			type: 	'post',	 			
			url: 	"/distribution_management/movement_warehouse/movement_pro",
			success: function(response) { 	
				togo.html(response);	
			}
		});  
	});
});
</script>

<c:if test = "${id == 'new'}">
<form id = "movement_form" action = "/distribution_management/movement_warehouse/movement_pro">
<c:forEach var = "pro" items = "${productVos}">
	<input type = "hidden" id = "${pro.product_id}" value = "${pro.stock_amount}">
</c:forEach>
<table class="table table-condensed">
<input type = "hidden" name = "id" value = "${id}">
		<tr>
			<th>출발 창고명</th>
			<th>도착 창고명</th>
			<th>상품명</th>
			<th>수량</th>
			<th>담당자명</th>
		</tr>
		<tr>
			<th>
				<input type = "hidden" value = "${warehouse_id}" name = "warehouse_id" readonly>
				<input type = "text" value = "${warehouse_name}" readonly>
			</th>
			<th>
				<select name = "arrive_warehouse_id" id = "arrive_warehouse_id">
					<c:forEach var = "ware" items = "${warehouseVos}">
						<option value = "${ware.warehouse_id}">${ware.warehouse_name}</option>
					</c:forEach>
				</select>
			</th>
			<th>
				<select id = "product_id" name = "product_id">
				<option value = "0">상품을 선택하시오.</option>
				<c:forEach var = "pro" items = "${productVos}"> 
				<option value = "${pro.product_id}">${pro.product_name}</option>
				</c:forEach>
				</select>
			</th>
			<th><input type = "number" id = "movement_amount" name = "movement_amount" min = "1" required></th>
			<th>
				<input type = "hidden" name = "employee_id" value = "${ROLE.employee_id}"> 
				<input type = "text" value = "${ROLE.employee_name}" readonly>
			</th>
		</tr>
		<tr>
			<th colspan = "6">
				<input type = "button" class="btn btn-primary" id = "movement_button" value = "확인">
				<input type = "reset" class="btn btn-info" value = "리셋">
			</th>
		</tr>
	</table>
</form>
</c:if>
<c:if test = "${id != 'new'}">
<form id = "movement_form" action = "/distribution_management/movement_warehouse/movement_pro">
<table class="table table-condensed">
<c:forEach var = "pro" items = "${productVos}">
	<input type = "hidden" id = "${pro.product_id}" value = "${pro.stock_amount}">
</c:forEach>
<input type = "hidden" name = "id" value = "${id}">
		<tr>
			<th>주문번호</th>
			<th>출발 창고명</th>
			<th>도착 창고명</th>
			<th>상품명</th>
			<th>수량</th>
			<th>담당자명</th>
		</tr>
		<c:forEach var = "dto" items = "${movement_warehouseDtos}">
		<tr>
			<th>
				<input type = "text" name = "stock_order_id" value = "${dto.stock_order_id}">
			<th>
				<input type = "text" value = "${dto.warehouse_id}" id = "warehouse_id" name = "warehouse_id" readonly>
			</th>
			<th>
				<select name = "arrive_warehouse_id" id = "arrive_warehouse_id">
					<c:forEach var = "ware" items = "${warehouseVos}">
						<option value = "${ware.warehouse_id}"<c:if test = "${ware.warehouse_id == dto.arrive_warehouse}">selected</c:if>>${ware.warehouse_name}</option>
					</c:forEach>
				</select>
			</th>
			<th>
				<select id = "product_id" name = "product_id">
				<option value = "0">상품을 선택하시오.</option>
				<c:forEach var = "pro" items = "${productVos}">
				<option value = "${pro.product_id }" <c:if test = "${pro.product_id == dto.product_id}">selected</c:if>>${pro.product_name}</option>
				</c:forEach>
				</select>
			</th>
			<th><input type = "number" id = "movement_amount" name = "movement_amount" min = "1" value = "${dto.movement_amount}"></th>
			<th>
				<input type = "hidden" name = "employee_id" value = "${ROLE.employee_id}"> 
				<input type = "text" value = "${ROLE.employee_name}" readonly>
			</th>
		</tr>
		</c:forEach>
		<tr>
			<th colspan = "6">
				<input type = "button" class="btn btn-primary" id = "movement_button" value = "확인">
				<input type = "reset" class="btn btn-info" value = "리셋">
			</th>
		</tr>
	</table>
	</form>
</c:if>


		<div class="panel-heading">
			<h3 class="panel-title"> 재고현황</h3>
			</div>
<table class="table table-condensed">
	<tr>
		<th>상품명</th>
		<th>창고명</th>
		<th>재고</th>
	</tr>
	<c:forEach var = "pro" items = "${productVos}">
		<tr>
			<th>${pro.product_name}</th>
			<c:forEach var = "ware" items = "${warehouseVos}">
				<c:if test = "${pro.warehouse_id == ware.warehouse_id}">
					<th>${ware.warehouse_name}</th>
				</c:if>
			</c:forEach>
			<th>${pro.stock_amount}</th>
		</tr>
	</c:forEach>
</table>
