<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp" %>

<body>
	<c:if test="${cnt == -1}">
	<script type="text/javascript">
		setTimeout(function(){
			alert("검색내역이 없습니다. 판매입력을 해주세요.");
			$('#main_screen').load("/sales_management/input_sales/reg_sales");
			return false;
		}, 200);
	</script>
	</c:if>
	
	
		<div class="panel panel-primary" id="page2420">
		<div class="panel-heading">
	  		 <h4 class="panel-title">
	  		 	<a id="page2420_div01_toggle"><span class="glyphicon glyphicon-triangle-right"></span> &nbsp;
	  			판내 현황 검색 페이지 Search_Status_Sales_Table 검색결과 : ${cnt} 개 
	  			</a>
	  		</h4>
		</div>
		<div class="panel-body" id="page2420_div01">
			<!-- ----------------------------------------------------- -->
	
			<div class="table-responsive">
				<form action="#" method="get" onsubmit="return reg_sales();">
					<div class="form-group">
						<table class="table table-condensed table-striped" id="reg_sales_table">
						
							<tr>
								<th>순서</th>
								<th>판매번호</th>
								<th>계정이름</th>
								<th>상품</th>
								<th>거래처</th>
								<th>금액</th>
								<th>판매상태</th>
							</tr>
							
							<!-- ----------------------------------------------------- -->
							
							<c:forEach var="dto" items="${SalesDTOs}">
								<tr>
									<!-- 판매번호를 눌렀을 때 이동 -->
								
								
									<td> 
										${dto.rnum}
									</td>
									<td>
										<a href="javascript:detail_status_page('${dto.sales_id},${dto.account_id}')">
											${dto.sales_id}
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
										<fmt:formatNumber value="${dto.selling_price}" type="currency"/> 
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
		<br>	
		<div id="page2420_div02"></div>
	</div>	<!-- // panel -->
		
	<!-- ------------------------------------------------------------------------------------- -->

	<script type="text/javascript">	
	
		$('#page2420_div01_toggle').click(function(){
			$('#page2420_div01').slideToggle();
			return false;
		});
		
		function detail_status_page(param){
			$('#page2410_div01').slideUp();
			$('#page2420_div01').slideUp();
			$('#page2420_div02').slideDown();
			param = param.split(',');
			$('#page2420_div02').load('/sales_management/status_sales/search_status_sales_detail?sales_id='+param[0]
			+'&account_id='+param[1] );
			return false;
	}
	
	</script>
	
	
</body>
</html>