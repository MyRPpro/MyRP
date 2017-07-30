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
			url: 	"/distribution_management/adjustment_inventory/adjustment_inventory_view",
			success: function(response) { 	
				togo.html(response);	
			}
		});  
	});
	 
	 $(".page").bind("click", function(event) {
			$("#main_screen").load($(this).attr("href"));
			return false;
		});
	 
	 $("#page16140_div01_toggle").bind("click", function(event) {
			$("#page16140_div01").slideToggle();
			return false;
		});
		
		$("#page16140_div01 a").bind("click", function(event) {
			$("#page16140_div01").slideUp();
			$("#page16140_div03").slideDown();
			$("#page16140_div03").load($(this).attr("href"));
			return false;
		});
		
		$("form[name='page16140_form01']").on("submit", function(event) {
			var hr_code_group_id = $("form[name='page16140_form01'] input[name='hr_code_group_id']");
			$("#page16140_div01").slideUp();
			$("#page16140_div03").slideDown();
			$("#page16140_div03").load("/hr_management/manage_hr_code/add_base_code?hr_code_group_id="+hr_code_group_id.val());
			return false;		
		});
		
		$("#page16140_btn01").bind("click", function(event) {
			$("#page16140").slideUp();
			$("#page16110_div01").slideDown();
			
			return false;		
		});
});
</script>
<body>
<div id = "page16140_div01_toggle">
adjustment_inventory_list.jsp
<h3>재고조정 리스트</h3>
<table border = "1">
		<tr>
			<th>주문번호</th>
			<th>상품명</th>
			<th>창고명</th>
			<th>담당자명</th>
			<th>등록일</th>
			<th>조정 재고</th>
			<th>조정 후 재고</th>
		</tr>
		<c:forEach var = "dto" items = "${Adjustment_inventoryDtos}">
		<tr>
			<th>${dto.stock_order_id}</th>
			<th>${dto.product_name}</th>
			<th>${dto.warehouse_name}</th>
			<th>${dto.employee_name}</th>
			<th>${dto.reg_date}</th>
			<th>${dto.delete_stock}</th>
			<th>${dto.taked_stock}</th>
		</tr>
		</c:forEach>
		<tr>
			<th colspan = "13">
				<div class="text-center">
            <ul class="pagination">
            <input type = "hidden" value = "${currentPage}" id = "currentPage">
               <c:if test="${startPage > pageBlock}">
                  <li><a class = "page" href="/distribution_management/adjustment_inventory/adjustment_inventory_list">◀◀</a></li>  <!-- 첫 페이지로 이동 -->
                  <li><a class = "page" href="/distribution_management/adjustment_inventory/adjustment_inventory_list?pageNum=${startPage - pageBlock}">◀</a></li> <!-- 이전 블록으로 이동 -->
               </c:if>
               <c:forEach var="i" begin="${startPage}" end="${endPage}">
                  <c:if test="${i == currentPage}">
                     <li><span>${i}</span></li>
                  </c:if>
                  <c:if test="${i != currentPage}">
                     <li><a class = "page"  href="/distribution_management/adjustment_inventory/adjustment_inventory_list?pageNum=${i}">${i}</a></li>
                  </c:if>
                  
               </c:forEach>
               <c:if test="${pageCount > endPage}">
                  <li><a class = "page"  href="/distribution_management/adjustment_inventory/adjustment_inventory_list?pageNum=${startPage + pageBlock}">▶</a></li> <!-- 다음 블록으로 이동 -->
                  <li><a class = "page"  href="/distribution_management/adjustment_inventory/adjustment_inventory_list?pageNum=${pageCount}">▶▶</a></li> <!-- 마지막 페이지로 이동 -->
               </c:if>
            </ul>
         </div>
			</th>
		</tr>
	</table>
</div>	
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