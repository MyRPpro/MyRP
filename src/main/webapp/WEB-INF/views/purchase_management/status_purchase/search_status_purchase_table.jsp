<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp" %>

<body>

		<c:if test="${cnt == -1}">
	<script type="text/javascript">
		setTimeout(function(){
			alert("검색내역이 없습니다. 구매입력을 해주세요.");
			$('#main_screen').load("/purchase_management/input_purchase/reg_purchase");
			return false;
		}, 200);
	</script>
	</c:if>
	
	<%-- check : ${check} --%>
	
	<div class="text-center" id="page3320_page">
		<ul class="pagination">
			<c:if test="${startPage > pageBlock}">
				<li> <a href="javascript:list_table('1','${check}')">◀◀ </a> </li>
				<li> <a href="javascript:list_table('${startPage - pageBlock}','${check}')">◀ </a> </li>
			</c:if>
			
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<c:if test="${i == currentPage}">
					<li> <span> <b> ${i} </b> </span> </li>
				</c:if>
				<c:if test="${i != currentPage}">
					<li> <a href="javascript:list_table('${i}','${check}')"> ${i} </a> </li>
				</c:if>
			</c:forEach>
			
			<c:if test="${pageCount > endPage}">
				<li> <a href="javascript:list_table('${startPage + pageBlock}','${check}')"> ▶ </a> </li>
				<li> <a href="javascript:list_table('${pageCount}','${check}')">▶▶ </a> </li>
			</c:if>
			
		</ul>
	</div>
	
	<div class="panel panel-primary" id="page3320_panel">
		<div class="panel-heading">
	  		 <h4 class="panel-title">
	  		 	<a id="page3320_div01_toggle"><span class="glyphicon glyphicon-shopping-cart"></span> &nbsp;
	  			구매 현황 검색 페이지,  검색결과 : ${cnt} 개 
	  			</a>
	  		</h4>
		</div>
		<div class="panel-body" id="page3320_div01">
			
			<!-- ----------------------------------------------------- -->
	
			<div class="table-responsive">
				<form action="#" method="get" onsubmit="return reg_sales();">
					<div class="form-group">
						<table class="table table-condensed table-striped" id="reg_sales_table">
						
							<tr>
								<th>순서</th>
								<th>구매번호</th>
								<th>계정이름</th>
								<th>상품</th>
								<th>거래처</th>
								<th>금액</th>
								<th>구매상태</th>
							</tr>
							
							<!-- ----------------------------------------------------- -->
							
							<c:forEach var="dto" items="${PurchaseDTOs}">
								<tr>
									<!-- 구매번호를 눌렀을 때 이동 -->
								
								
									<td> 
										${dto.rnum}
									</td>
									<td>
										<a href="javascript:detail_status_page('${dto.purchase_id},${dto.account_id}')">
											${dto.purchase_id}
										</a>
									</td>
									<td>
										${dto.account_name}
									</td>
									<td>
										${dto.product_name}
									</td>
									<td>
										${dto.company_name}
									</td>
									<td> 
										<fmt:formatNumber value="${dto.supply_price}" type="currency"/> 
									</td>
									<td>
										${dto.state_name} 
									</td>
								</tr>
							</c:forEach>
							
						</table>
					</div>
				</form>
			</div>

			<!-- ----------------------------------------------------- -->
				
		</div>	<!-- // panel-body -->
	</div>	<!-- // panel -->
	<div id="page3320_div02"></div>
	
	<!-- ------------------------------------------------------------------------------------- -->

	<script type="text/javascript">	
	
		$('#page3320_div01_toggle').click(function(){
			$('#page3320_div01').slideToggle();
			$('#page3320_page').slideToggle();
			return false;
		});
		
		function detail_status_page(param){
			$('#page3310_div01').slideUp();
			$('#page3320_div02').slideDown();
			
			param = param.split(',');
			$('#page3320_div02').load('/purchase_management/status_purchase/search_status_purchase_detail?purchase_id='+param[0]
				+'&account_id='+param[1] );
				return false;
		};
	
	</script>
	
	
</body>
</html>