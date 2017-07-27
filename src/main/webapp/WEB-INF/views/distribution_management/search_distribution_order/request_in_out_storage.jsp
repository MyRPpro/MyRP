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
function storage_go(id, goes,storage_in_date){
	var now = new Date();
	var year= now.getFullYear();
    var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
	var today = year + mon + "-" +  (now.getDate());

	if((storage_in_date+"").replace("-","") > today){
		alert("입고예정일이 안되었습니다.");
		return false;
	}
	window.location = "/distribution_management/search_distribution_order/request_in_out_storage_pro?id="+id+"&goes="+goes
}
function storage_comp_go(id, goes,storage_out_date){
	var now = new Date();
	var year= now.getFullYear();
    var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
	var today = year + mon + "-" +  (now.getDate());

	if(storage_out_date.replace("-","") > today){
		alert("출고예정일이 안되었습니다.");
		return false;
	}
	window.location = "/distribution_management/search_distribution_order/request_in_out_storage_pro?id="+id+"&goes="+goes
}
</script>
<body>
<c:if test = "${goes == 'out'}">
물류 출고요청
<table border = "1">
	<tr>
		<th>판매번호</th>
		<th>상품명</th>
		<th>판매 수량</th>
		<th>출고 가능 수량</th>
		<th>부족 수량</th>
		<th>창고명</th>
		<th>출고일</th>
		<th>담당자명</th>
		<th>승인버튼</th>
	</tr>
	<c:forEach var = "dto" items = "${out_storageDtos}">
	<tr>
		<th>${dto.sales_id}</th>	
		<th>${dto.product_id}</th>		
		<th>${dto.warehouse_id}</th>	
		<th>${dto.employee_id}</th>		
		<th>${dto.reg_date}</th>			
		<th>${dto.update_date}</th>		
		<th>${dto.count_sales}</th>		
		<th>${dto.stock_amount}</th>		 
		<c:if test = "${(dto.stock_amount - dto.count_sales) >= 0 }">
			<th>${dto.count_sales}</th>	 
			<th>0</th>
		</c:if>
		<c:if test = "${(dto.stock_amount - dto.count_sales) < 0 }">
			<th>${dto.stock_amount}</th>	 
			<th>${ dto.count_sales - dto.stock_amount}</th>
		</c:if>
		<th>${dto.storage_out_date}</th>	
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
		<th>구매번호</th>
		<th>상품명</th>
		<th>구매 수량</th>
		<th>창고명</th>
		<th>입고일</th>
		<th>담당자명</th>
		<th>승인버튼</th>
	</tr>
	<c:forEach var = "dto" items = "${in_storageDtos}">
	<tr>
		<th>${dto.purchase_id}</th>	 
		<th>${dto.product_id}</th>	 
		<th>${dto.count_purchase}</th>
		<th>${dto.warehouse_id}</th> 
		<th>${dto.storage_in_date}</th>
		<th>${dto.employee_id}</th>	 
		<th>
			<button onclick = "storage_go('${dto.purchase_id}','in_storage','${dto.storage_in_date}')">입고완료</button>
		</th>
	</tr>
	</c:forEach>
</table>
</c:if>


<c:if test = "${goes == 'storage_out_complete'}">
출고완료요청
<table border = "1">
		<tr>
			<th>전표번호</th>
			<th>상태</th>
			<th>출고예정일</th>
			<th>승인버튼</th>
		</tr>
		<c:forEach var = "dto" items = "${order_stateDto}"> 
			<c:if test = "${dto.order_state == 24202}">
			<tr>
				<th>${dto.order_id}</th>
				<th>${dto.order_state}</th>
				<th>출고 대기</th>
				<th>${dto.storage_out_date}</th>
				<th><button onclick = "storage_comp_go('${dto.order_id}','storage_out_complete','${dto.storage_out_date}')">버튼</button></th>
			</tr>
			</c:if>
		</c:forEach>
	</table>
</c:if>
</body>
</html>