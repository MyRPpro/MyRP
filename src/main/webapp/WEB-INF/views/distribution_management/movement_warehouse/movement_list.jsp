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

function modify(id,warehouse_id){
		var data = {
					"id" 	: id,
					"warehouse_id" : warehouse_id,
					"doit" : "1"
					};
		$.ajax({ 					
			data: 	data,
			type: 	'post',	 			
			url: 	"movement_view",
			success: function(response) { 	
				$('#modify').html(response);	
			}
		});  
}

$(function(){
	 $('.movement_modify').unbind("click").bind("click",function(){
		var id = $(this).val();

		var data = {
					"id" 	: id,
					"warehouse_id" : "0"
					};
		
		$.ajax({ 					
			data: 	data,
			type: 	'post',	 			
			url: 	"movement_view",
			success: function(response) { 	
				$('#modify').html(response);	
			}
		});  
	});
});

function movement_del(id){
	var con = confirm("삭제하시겠습니까?");
	if(con){
		window.location = "movement_pro?id="+id+"&opt=del";
	}
}

function movement_movement_confirm(id){
	var con = confirm("승인하시겠습니까?");
	if(con){
		window.location = "movement_pro?id="+id+"&opt=confirm";
	}
}
</script>
<body>
	<a href="/">홈으로</a>
	
	<br>
	<br>
	<br>
	<h3>창고이동 리스트</h3>
	<table border = "1">
		<tr>
			<th>주문번호</th>
			<th>상품명</th>
			<th>수량</th>
			<th>출발 창고명</th>
			<th>도착 창고명</th>
			<th>담당자명</th>
			<th>등록일</th>
			<th>수정일</th>
			<th>상태</th>
			<th>수정</th>
			<th>삭제</th>
			<th>승인</th>
		</tr>
		<c:forEach var = "dto" items = "${movement_warehouseDtos}">
		<tr>
			<th>${dto.stock_order_id}</th>
			<th>${dto.product_name}</th>
			<th>${dto.movement_amount}</th>
			<th>${dto.warehouse_name}</th>
			<c:forEach var = "ware" items = "${warehouseVos}">
				<c:if test = "${ware.warehouse_id ==  dto.arrive_warehouse}">
					<th>${ware.warehouse_name}</th>
				</c:if>
			</c:forEach>
			<th>${dto.employee_name}</th>
			<th>${dto.reg_date}</th>
			<th>${dto.update_date}</th>
			<th>
				<c:if test = "${dto.movement_state == 0}">
					승인 대기중
				</c:if> 
				<c:if test = "${dto.movement_state == 1}">
					이동 완료
				</c:if>
			</th>
			<th><c:if test = "${dto.movement_state == 0}"><button class = "movement_modify" onclick = "modify('${dto.stock_order_id}','${dto.warehouse_id}')">수정</button></c:if></th>
			<th><c:if test = "${dto.movement_state == 0}"><button class = "movement_del" onclick = "movement_del('${dto.stock_order_id}')">삭제</button></c:if></th>
			<th><c:if test = "${dto.movement_state == 0}"><button class = "movement_movement_confirm" onclick = "movement_movement_confirm('${dto.stock_order_id}')">이동승인</button></c:if></th>
		</tr>
		</c:forEach>
		<tr>
			<th colspan = "13">
				<button class = "movement_modify" value = "new">신규등록</button>
			</th>
		</tr>
	</table>
	
	<br><br>
	<div id = "modify"></div>
	<br>
	<br>
	<div id = "product_list"></div>
	
</body>
</html>