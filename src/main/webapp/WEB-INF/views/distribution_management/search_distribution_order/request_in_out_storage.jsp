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
	var togo =$("#request_in");
	var data = {
				"id" : id,
				"goes" : goes
				}
	
	$.ajax({ 					
		data:	data,
		type: 	'post',	 			
		url: 	"/distribution_management/search_distribution_order/request_in_out_storage_pro",
		success: function(response) { 	
			togo.html(response);	
		}
	});  
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

	var togo =$("#request_out");
	var data = {
			"id" : id,
			"goes" : goes
			}

$.ajax({ 					
	data:	data,
	type: 	'post',	 			
	url: 	"distribution_management/search_distribution_order/request_in_out_storage_pro",
	success: function(response) { 	
		togo.html(response);	
	}
});  
}

$(".page_in").bind("click", function(event) {
	$("#request_in").load($(this).attr("href"));
	return false;
});

$(".page_out").bind("click", function(event) {
	$("#request_out").load($(this).attr("href"));
	return false;
});

$('.distribution_view_heading').bind("click",function(){  
	$('.distribution_view_content').slideToggle();
});
</script>
<body>
<c:if test = "${goes == 'out'}">

<div class="row">
<div class="col-xs-12">
	<div class="panel panel-primary">
		<div class="panel-heading distribution_view_heading">
			<h3 class="panel-title">물류 출고요청</h3>
		</div>
		<div class="panel-body distribution_view_content">
			<div class="table-responsive">
				<table class="table table-condensed">
					<tr>
						<th colspan = "13">
						<div class="text-center">
			            <ul class="pagination">
			          	  <input type = "hidden" value = "${currentPage}" id = "currentPage">
			               <c:if test="${startPage > pageBlock}">
			                  <li><a class = "page_out" href="/distribution_management/search_distribution_order/request_in_out_storage?goes=out">◀◀</a></li>  <!-- 첫 페이지로 이동 -->
			                  <li><a class = "page_out" href="/distribution_management/search_distribution_order/request_in_out_storage?goes=out&pageNum=${startPage - pageBlock}">◀</a></li> <!-- 이전 블록으로 이동 -->
			               </c:if>
			               <c:forEach var="i" begin="${startPage}" end="${endPage}">
			                  <c:if test="${i == currentPage}">
			                     <li><span>${i}</span></li>
			                  </c:if>
			                  <c:if test="${i != currentPage}">
			                     <li><a class = "page_out"  href="/distribution_management/search_distribution_order/request_in_out_storage?goes=out&pageNum=${i}">${i}</a></li>
			                  </c:if>
			               </c:forEach>
            			   <c:if test="${pageCount > endPage}">
			                  <li><a class = "page_out"  href="/distribution_management/search_distribution_order/request_in_out_storage?goes=out&pageNum=${startPage + pageBlock}">▶</a></li> <!-- 다음 블록으로 이동 -->
			                  <li><a class = "page_out"  href="/distribution_management/search_distribution_order/request_in_out_storage?goes=out&pageNum=${pageCount}">▶▶</a></li> <!-- 마지막 페이지로 이동 -->
			               </c:if>
            			</ul>
        			 	</div>
						</th>
					</tr>
					<tr>
						<th>판매번호</th>
						<th>상품명</th>
						<th>판매 수량</th>
						<th>출고 가능 수량</th>
						<th>부족 수량</th>
						<th>출고일</th>
						<th>담당자명</th>
						<th>승인버튼</th>
					</tr>
					<c:forEach var = "dto" items = "${out_storageDtos}">
					<tr>
						<th>${dto.sales_id}</th>	
						<th>${dto.product_name}</th>		
						<th>${dto.count_sales}</th>
						<c:if test = "${(dto.stock_amount - dto.count_sales) >= 0 }">
							<th>${dto.count_sales}</th>	 
							<th>0</th>
						</c:if>
						<c:if test = "${(dto.stock_amount - dto.count_sales) < 0 }">
							<th>${dto.stock_amount}</th>	 
							<th>${ dto.count_sales - dto.stock_amount}</th>
						</c:if>
						<th>${dto.storage_out_date}</th>
						<th>${dto.employee_name}</th>		
						<th>
							<c:if test = "${(dto.stock_amount - dto.count_sales) >= 0 }">
								<butto class="btn btn-primary"n onclick = "storage_comp_go('${dto.sales_id}','out_storage','${storage_out_date}')">출고대기</button>
							</c:if>
							<c:if test = "${(dto.stock_amount - dto.count_sales) < 0 }">
								<button class="btn btn-primary" onclick = "storage_comp_go('${dto.sales_id}','out_storage_wait','${storage_out_date}')">재고준비중</button>
							</c:if>
						</th>
					</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div
></div>
</div>
</c:if>

<c:if test = "${goes == 'in'}">
<div class="row">
<div class="col-xs-12">
	<div class="panel panel-primary">
		<div class="panel-heading distribution_view_heading">
			<h3 class="panel-title">물류 입고요청</h3>
		</div>
		<div class="panel-body distribution_view_content">
			<div class="table-responsive">
				<table class="table table-condensed">
					<tr>
						<th colspan = "13">
							<div class="text-center">
				           <ul class="pagination">
				           <input type = "hidden" value = "${currentPage}" id = "currentPage">
				               <c:if test="${startPage > pageBlock}">
				                  <li><a class = "page_in" href="/distribution_management/search_distribution_order/request_in_out_storage?goes=in&">◀◀</a></li>  <!-- 첫 페이지로 이동 -->
				                  <li><a class = "page_in" href="/distribution_management/search_distribution_order/request_in_out_storage?goes=in&pageNum=${startPage - pageBlock}">◀</a></li> <!-- 이전 블록으로 이동 -->
				               </c:if>
				               <c:forEach var="i" begin="${startPage}" end="${endPage}">
				                  <c:if test="${i == currentPage}">
				                     <li><span>${i}</span></li>
				                  </c:if>
				                  <c:if test="${i != currentPage}">
				                     <li><a class = "page_in"  href="/distribution_management/search_distribution_order/request_in_out_storage?goes=in&pageNum=${i}">${i}</a></li>
				                  </c:if>
				                  
				               </c:forEach>
				               <c:if test="${pageCount > endPage}">
				                  <li><a class = "page_in"  href="/distribution_management/search_distribution_order/request_in_out_storage?goes=in&pageNum=${startPage + pageBlock}">▶</a></li> <!-- 다음 블록으로 이동 -->
				                  <li><a class = "page_in"  href="/distribution_management/search_distribution_order/request_in_out_storage?goes=in&pageNum=${pageCount}">▶▶</a></li> <!-- 마지막 페이지로 이동 -->
				               </c:if>
				            </ul>
				         </div>
							</th>
						</tr>
						<tr>
							<th>구매번호</th>
							<th>상품명</th>
							<th>구매 수량</th>
							<th>입고일</th>
							<th>담당자명</th>
							<th>승인버튼</th>
						</tr>
					<c:forEach var = "dto" items = "${in_storageDtos}">
						<tr>
							<th>${dto.purchase_id}</th>	 
							<th>${dto.product_name}</th>	 
							<th>${dto.count_purchase}</th>
							<th>${dto.storage_in_date}</th>
							<th>${dto.employee_name}</th>	 
							<th>
								<button class="btn btn-primary" onclick = "storage_go('${dto.purchase_id}','in_storage','${dto.storage_in_date}')">입고완료</button>
							</th>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</div>
</div>
</c:if>


<c:if test = "${goes == 'storage_out_complete'}">
<div class="row">
<div class="col-xs-12">
	<div class="panel panel-primary">
		<div class="panel-heading distribution_view_heading">
			<h3 class="panel-title">출고완료요청</h3>
		</div>
<div class="panel-body distribution_view_content">
			<div class="table-responsive">
				<table class="table table-condensed">
					<tr>
						<th colspan = "13">
							<div class="text-center">
			            <ul class="pagination">
			            <input type = "hidden" value = "${currentPage}" id = "currentPage">
			               <c:if test="${startPage > pageBlock}">
			                  <li><a class = "page_out" href="/distribution_management/search_distribution_order/request_in_out_storage?goes=storage_out_complete">◀◀</a></li>  <!-- 첫 페이지로 이동 -->
			                  <li><a class = "page_out" href="/distribution_management/search_distribution_order/request_in_out_storage?goes=storage_out_complete&pageNum=${startPage - pageBlock}">◀</a></li> <!-- 이전 블록으로 이동 -->
			               </c:if>
			               <c:forEach var="i" begin="${startPage}" end="${endPage}">
			                  <c:if test="${i == currentPage}">
			                     <li><span>${i}</span></li>
			                  </c:if>
			                  <c:if test="${i != currentPage}">
			                     <li><a class = "page_out"  href="/distribution_management/search_distribution_order/request_in_out_storage?goes=storage_out_complete&pageNum=${i}">${i}</a></li>
			                  </c:if>
			                  
			               </c:forEach>
			               <c:if test="${pageCount > endPage}">
			                  <li><a class = "page_out"  href="/distribution_management/search_distribution_order/request_in_out_storage?goes=storage_out_complete&pageNum=${startPage + pageBlock}">▶</a></li> <!-- 다음 블록으로 이동 -->
			                  <li><a class = "page_out"  href="/distribution_management/search_distribution_order/request_in_out_storage?goes=storage_out_complete&pageNum=${pageCount}">▶▶</a></li> <!-- 마지막 페이지로 이동 -->
			               </c:if>
			            </ul>
			         </div>
						</th>
					</tr>
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
								<th>출고 대기</th>
								<th>${dto.storage_out_date}</th>
								<th><button class="btn btn-primary" onclick = "storage_comp_go('${dto.order_id}','storage_out_complete','${dto.storage_out_date}')">출고완료</button></th>
							</tr>
						</c:if>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</div>
</div>
</c:if>
</body>
</html>