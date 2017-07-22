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
function storage_go(id, goes){
	window.location = "/distribution_management/search_distribution_order/request_in_out_storage_pro?id="+id+"&goes="+goes
}

</script>
<body>
<c:if test = "${goes == 'out'}">
물류 출고요청 ${out_storageDtos}
<table border = "1">
	<tr>
		<!-- <th>STOCK_ORDER_ID</th> -->
		<th>STOCK_ORDER_TYPE</th>
		<th>PRODUCT_ID</th>
		<th>WAREHOUSE_ID</th>
		<th>EMPLOYEE_ID</th>
		<th>REG_DATE</th>
		<th>UPDATE_DATE</th>
		<th>STOCK_STATE</th>
		
		<th>COUNT_SALES</th>
		<th>STOCK_AMOUNT</th>
		<th>AVAILABLE_STOCK</th>
		<th>LACK_STOCK</th>
		<th>STORAGE_OUT_DATE</th>
	</tr>
	<c:forEach var = "dto" items = "${out_storageDtos}">
	<tr>
		<%-- <th>${dto.stock_order_id}</th> --%> 	<!-- strage_out_order_seq-->
		<th>${dto.sales_id}</th>	<!-- 영업번호 -->
		<th>${dto.product_id}</th>		<!-- 영업 테이블에서 불러오기 -->
		<th>${dto.warehouse_id}</th>		<!-- 재고정보 테이블에서 불러오기 -->
		<th>${dto.employee_id}</th>		<!-- 영업 테이블에서 불러오기 -->
		<th>${dto.reg_date}</th>			<!-- 영업 테이블에서 불러오기 -->
		<th>${dto.update_date}</th>		<!-- sysdate -->
		<th>${dto.stock_state}</th>		<!-- 24201 -->
		<th>${dto.count_sales}</th>		<!-- 영업 테이블에서 불러오기 -->
		<th>${dto.stock_amount}</th>		<!-- 재고정보 테이블에서 불러오기 -->
		<c:if test = "${(dto.stock_amount - dto.count_sales) >= 0 }">
			<th>${dto.count_sales}</th>	<!-- 재고 - 판매수량  >= 0 -> 판매수량  재고 - 판매수량 < 0 재고-->
			<th>0</th>
		</c:if>
		<c:if test = "${(dto.stock_amount - dto.count_sales) < 0 }">
			<th>${dto.stock_amount}</th>	<!-- 재고 - 판매수량  >= 0 -> 판매수량  재고 - 판매수량 < 0 재고-->
			<th>${ dto.count_sales - dto.stock_amount}</th>
		</c:if>
		<th>${dto.storage_out_date}</th>	<!-- 영업 테이블에서 불러오기 -->
	</tr>
	<tr>
		<th>
			<c:if test = "${(dto.stock_amount - dto.count_sales) >= 0 }">
				<button onclick = "storage_go('${dto.sales_id}','out_storage')">출고대기</button>
			</c:if>
			<c:if test = "${(dto.stock_amount - dto.count_sales) < 0 }">
				<button onclick = "storage_go('${dto.sales_id}','out_storage_wait')">재고준비중</button>
			</c:if>
		</th>
	</tr>
	</c:forEach>
</table>

</c:if>

<c:if test = "${goes == 'in'}">
물류 입고요청
<table border = "1">
	<tr>
		<!-- <th>STOCK_ORDER_ID</th> -->
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
		<%-- <th>${dto.stock_order_id}</th> --%> 	<!-- strage_in_order_seq-->
		<th>${dto.purchase_id}</th>	<!-- 구매번호 -->
		<th>${dto.product_id}</th>		<!-- 구매 테이블에서 불러오기 -->
		<th>${dto.warehouse_id}</th>		<!-- 재고정보 테이블에서 불러오기 -->
		<th>${dto.employee_id}</th>		<!-- 구매 테이블에서 불러오기 -->
		<th>${dto.reg_date}</th>			<!-- 구매 테이블에서 불러오기 -->
		<th>${dto.update_date}</th>		<!-- sysdate -->
		<th>${dto.stock_state}</th>		<!-- 24101 -->
		<th>${dto.count_purchase}</th>		<!-- 구매 테이블에서 불러오기 -->
		<th>${dto.storage_in_date}</th>		<!-- 구매 테이블에서 불러오기 -->
	</tr>
	<tr>
		<th>
			<button onclick = "storage_go('${dto.purchase_id}','in_storage')">입고완료</button>
		</th>
	</tr>
	</c:forEach>
</table>

</c:if>

</body>
</html>