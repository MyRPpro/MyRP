<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../../setting.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body >

	<form action="#" name="search_reg_purchase_form" method="get">
		
	<div class="panel panel-primary">
	<div class="panel-heading">	
		<h3 class="panel-title"> 
		<span class="glyphicon glyphicon-gift"></span> 
		&nbsp; &nbsp; 부족 재고 목록 조회 search_reg_purchase 
		&emsp;  검색개수 : 총 ${cnt} 개
		</h3>
	</div>	<!-- // panel-heading -->
	
	<div class="panel-body">
		<div class="table-responsive">
		<div class="form-group" >
	
		<table class="table table-condensed table-striped">
			<tr>
				<th>등록</th>		<!-- 1 -->
				<th>순서</th>		<!-- 2 -->
				<th>주문번호</th>	<!-- 3 -->
				<th>부족수량</th>	<!-- 4 -->
				<th>상품</th>		<!-- 5 -->
				<th>등록일</th>	<!-- 6 -->
			</tr>

			<c:forEach var="dto" items="${dtos}">
			<tr>
			
				<td> 
					<button type="button" class="btn btn-default btn-sm" onclick="return reg_purchase(${dto.rnum});" >
					  <span class="glyphicon glyphicon-check btn-xs"></span> 등록
					</button>
				</td> 
				
				<td> 
					${dto.rnum}
				</td> 
				
				<td> 
					${dto.stock_order_id}
					<input type="hidden" id="${dto.rnum}" value="${dto.stock_order_id}">
				</td> 
				
				<td> 
					<fmt:formatNumber value="${dto.lack_stock}" type="number"/>
					<input type="hidden" name="lack_stock" value="${dto.lack_stock}">
				</td> 
				
				<td> 
					<input type="hidden" name="product_id" value="${dto.product_id}" >
					${dto.product_name}
				</td> 
				
				<td> 
					<input type="hidden" name="reg_date" value="${dto.reg_date}" >
					${dto.reg_date}
				</td> 
				
				
				<%-- 
				<td> 
					<input type="hidden" name="employee_id" value="${dto.employee_id}" >
					${dto.employee_name}
				</td> 
				<td> 
					<input type="hidden" name="state_name" value="${dto.state_name}" >
					${dto.state_name}
				</td> 
				 --%>
			</tr>
			</c:forEach>
			
		</table>
		
		<div id="reg_table_page"></div>
			
		</div>	<!-- // form-group -->
		</div>	<!-- // table-responsive -->
	</div>	<!-- // panel-body -->
	</div>	<!-- // panel panel-primary -->
	</form>
	
	<script type="text/javascript">
	
	/* 
	$(document).ready(function() {
		
		var pagenum = '${pageNum}';
		console.log("pageNum : " + pagenum);
		$.ajax({
			data : pagenum,
			type : 'get',
			url: "/purchase_management/input_purchase/search_reg_purchase_page",
			success: function(response){
				$('#reg_table_page').html(response);
			}
		})
	});
	 */
	 
	function reg_purchase(num){
		
		var stock_order_id = document.getElementById(num).value;
		console.log("선택한 오더 번호 :" + stock_order_id);
		/* alert(stock_order_id); */
		$('#main_screen').load("/purchase_management/input_purchase/search_reg_purchase_pro?stock_order_id="+stock_order_id);
		
	}
	
	
	
	/* 
	function search_lack_stock(pagenum){
		var pagenum = pagenum
		 $('#reg_table').load("/purchase_management/input_purchase/search_reg_purchase_table?pageNum="+pagenum);
		 $('#reg_table_page').load("/purchase_management/input_purchase/search_reg_purchase_page?pagenum="+pagenum);
		return false;
	}
	 */
	
	</script>
	
</body>
</html>