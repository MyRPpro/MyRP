<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="../../setting.jsp" %>
<body>

	<c:if test="${cnt==-1}">
		<script type="text/javascript">
			setTimeout(function(){
				alert("구매내역이 없습니다. 새로운 구매내역을 입력해주세요.");
				$('#main_screen').load("/purchase_management/input_purchase/reg_purchase");
			}, 200);
		</script>
	</c:if>
	
	<c:if test="${cnt==0}">
		<script type="text/javascript">
			setTimeout(function(){
				alert("검색결과가 없습니다. 전체내역을 표시합니다.");
				search_list(1,0);
			}, 200);
		</script>
	</c:if>
	<div class="row">
		<div class="col-xs-12">
			<div class="panel panel-primary">
				<div class="panel-heading" >
					<h3 class="panel-title">
						<a id="page3120_div01_toggle"><span class="glyphicon glyphicon-shopping-cart"></span> &nbsp; 
						
						<c:choose>
							<c:when test="${check==0}">
								전체검색
							</c:when>
							<c:when test="${check==1}">
								검색어 검색
							</c:when>
							<c:when test="${check==2}">
								전표승인 조회
							</c:when>
							<c:when test="${check==3}">
								입고완료 조회
							</c:when>
							<c:when test="${check==4}">
								미승인 판매 조회
							</c:when>
							<c:otherwise>
								입력값 오류
							</c:otherwise>
						</c:choose>
						검색 목록 조회 , 검색개수 : 총 ${cnt} 개 
						</a>
					</h3> 
				</div>	<!-- // panel-title -->
				
				<div class="panel-body" id="page3120_div01">
					<div class="table-responsive">
						<div class="form-group" >
							<table class="table table-condensed table-striped">
								<tr>
									<th>순서</th>		<!-- 1 -->
									<th>구매번호</th>		<!-- 7 -->
									<th>계정이름</th>	<!-- 2 -->
									<th>상품</th>		<!-- 3 -->
									<th>거래처</th>	<!-- 4 -->
									<th>금액</th>		<!-- 5 -->
									<th>구매상태</th>	<!-- 6 -->
								</tr>
								<c:forEach var="dto" items="${dtos}">
									<tr>
										<td>${dto.rnum}</td>
										<td>
											<a href="javascript:detail_page('${dto.purchase_id},${dto.purchase_state},${dto.account_id}')">
												${dto.purchase_id}
											</a>
										</td>
										<td>${dto.account_name}</td>
										<td>${dto.product_name}</td>
										<td>${dto.company_name}</td>
										<td><fmt:formatNumber value="${dto.supply_price}" type="currency" currencySymbol="￦"/></td>
										<td>${dto.state_name}</td>
									</tr>
								</c:forEach>
							</table>
							
						</div>	<!-- // form-group -->	
					</div>	<!-- // table-responsive -->
				</div>	<!-- // panel-body -->
			</div>	<!-- // panel panel-primary -->
			<div id="page3120_table"></div>
		</div>
	</div>
	<script type="text/javascript">	
	
		$('#page3120_div01_toggle').click(function(){
			$('#page3120_div01').slideToggle();
			$('#page3110_page').slideToggle();
			return false;
		});
		
		function detail_page(param) {

			/* console.log(" param :" + param) */

			param = param.split(',');
			/* console.log(" purchase_id :" + param[0]);
			console.log(" purchase_state :" + param[1]);
			console.log(" order_id :" + param[2]); */

			var state = param[1];
			
			$('#page3110_div01').slideUp();
			$('#page3110_page').slideUp();
			$('#page3120_div01').slideUp();
			 
			if (state == "23202") {
				$('#page3120_table').slideDown();
				$('#page3120_table').load(
						'/purchase_management/search_purchase/modify_purchase?purchase_id='
								+ param[0] + '&purchase_state=' + param[1]);
				return false;

			} else {
				$('#page3120_table').slideDown();
				$('#page3120_table').load(
						'/purchase_management/search_purchase/detail_purchase?purchase_id='
								+ param[0] + '&purchase_state=' + param[1]
								+ '&account_id=' + param[2]
						);
				return false;
			}
		}
	</script>
	
</body>
</html>