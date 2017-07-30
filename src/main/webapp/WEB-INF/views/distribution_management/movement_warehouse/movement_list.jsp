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
	 $('.movement_modify').unbind("click").bind("click",function(){
		var id = $(this).val();

		var data = {
					"id" 	: id,
					"warehouse_id" : "0"
					};
		
		$.ajax({ 					
			data: 	data,
			type: 	'post',	 			
			url: 	"/distribution_management/movement_warehouse/movement_view",
			success: function(response) { 	
				$('#modify').html(response);	
			}
		});  
	});

	 $('.movement_del').unbind("click").bind("click",function(){
		 var con = confirm("삭제하시겠습니까?");
		
		 if(con){
			 var id = $(this).val();
	
				var data = {
							"id" 	: id,
							"opt" : "del"
							};
				
				$.ajax({ 					
					data: 	data,
					type: 	'post',	 			
					url: 	"/distribution_management/movement_warehouse/movement_pro",
					success: function(response) { 	
						$('#main_screen').html(response);	
					}
				});  
		 }
	});
	 
	 $('.movement_movement_confirm').unbind("click").bind("click",function(){
		 var con = confirm("승인하시겠습니까?");
		
		 if(con){
			 var id = $(this).val();
	
				var data = {
							"id" 	: id,
							"opt" : "confirm"
							};
				
				$.ajax({ 					
					data: 	data,
					type: 	'post',	 			
					url: 	"/distribution_management/movement_warehouse/movement_pro",
					success: function(response) { 	
						$('#main_screen').html(response);	
					}
				});  
		 }
	});



	$(".modify").click(function(){
		var pageNum = document.getElementById("currentPage").value;
		var obj =  $(this).val().split("-");
		var data = {
						"id" 	: obj[0],
						"pageNum" : pageNum,
						"warehouse_id" : obj[1],
						"doit" : "1"
						};
			$.ajax({ 					
				data: 	data,
				type: 	'post',	 			
				url: 	"/distribution_management/movement_warehouse/movement_view",
				success: function(response) { 	
					$('#modify').html(response);	
				}
			});  
	});
	
	$(".page").bind("click", function(event) {
		$("#main_screen").load($(this).attr("href"));
		return false;
	});
});
</script>
<body>
<div class="row">
<div class="col-xs-12">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">창고이동 리스트</h3>
		</div>
		<div class="panel-body">
			<div class="table-responsive">
			<table class="table table-condensed">
				<tr>
					<td colspan = "13">
						<button class = "movement_modify btn btn-default" value = "new">신규등록</button>
					</td>
				</tr>
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
						<th><c:if test = "${dto.movement_state == 0}"><button class = "modify btn btn-default" value = "${dto.stock_order_id}-${dto.warehouse_id}">수정</button></c:if></th>
						<th><c:if test = "${dto.movement_state == 0}"><button class = "movement_del btn btn-default" value = "${dto.stock_order_id}">삭제</button></c:if></th>
						<th><c:if test = "${dto.movement_state == 0}"><button class = "movement_movement_confirm btn btn-default" value = "${dto.stock_order_id}">이동승인</button></c:if></th>
					</tr>
				</c:forEach>
				<tr>
					<th colspan = "13">
						<div class="text-center">
				          <ul class="pagination">
				          <input type = "hidden" value = "${currentPage}" id = "currentPage">
							<c:if test="${startPage > pageBlock}">
								<li><a class = "page" href="/distribution_management/movement_warehouse/movement_list">◀◀</a></li>  <!-- 첫 페이지로 이동 -->
								<li><a class = "page" href="/distribution_management/movement_warehouse/movement_list?pageNum=${startPage - pageBlock}">◀</a></li> <!-- 이전 블록으로 이동 -->
							</c:if>
							<c:forEach var="i" begin="${startPage}" end="${endPage}">
								<c:if test="${i == currentPage}">
									<li><span>${i}</span></li>
								</c:if>
								<c:if test="${i != currentPage}">
									<li><a class = "page"  href="/distribution_management/movement_warehouse/movement_list?pageNum=${i}">${i}</a></li>
								</c:if>
							</c:forEach>
							<c:if test="${pageCount > endPage}">
								<li><a class = "page"  href="/distribution_management/movement_warehouse/movement_list?pageNum=${startPage + pageBlock}">▶</a></li> <!-- 다음 블록으로 이동 -->
								<li><a class = "page"  href="/distribution_management/movement_warehouse/movement_list?pageNum=${pageCount}">▶▶</a></li> <!-- 마지막 페이지로 이동 -->
							</c:if>
				           </ul>
				        </div>
					</th>
				</tr>
			</table>
			</div>
		</div>
	</div>
</div>
</div>
<br>
<div id = "modify"></div>
<br>
<div id = "product_list"></div>
</body>
</html>