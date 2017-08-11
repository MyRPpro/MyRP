<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
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
	
	
	<div class="text-center">
		<ul class="pagination" style="margin:0 auto;">
			<c:if test="${startPage > pageBlock}">
				<li> <a href="javascript:list_approval_pay_table('1')">◀◀ </a> </li> <!-- 첫 페이지로 이동 -->
				<li> <a href="javascript:list_approval_pay_table('${startPage - pageBlock}')">◀</a> </li> <!-- 이전 블록으로 이동 -->
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<c:if test="${i == currentPage}">
					<li> <span><b>${i}</b></span> </li>
				</c:if>
				<c:if test="${i != currentPage}">
					<li> <a href="javascript:list_approval_pay_table('${i}')"> ${i}</a> </li>
				</c:if>
			</c:forEach>
			<c:if test="${pageCount > endPage}">
				<li> <a href="javascript:list_approval_pay_table('${startPage + pageBlock}')">▶</a> </li> <!-- 다음 블록으로 이동 -->
				<li> <a href="javascript:list_approval_pay_table('${pageCount}')">▶▶</a> </li> <!-- 마지막 페이지로 이동 -->
			</c:if>
		</ul>
	</div>
	<br>
	
	
	<div class="panel panel-primary">
		<div class="panel-heading" id="list_approval_pay_table_heading">
			<h3 class="panel-title">
				<span class="glyphicon glyphicon-shopping-cart"></span> 
				상환 승인 검색 목록 조회 &emsp; 검색개수 : 총 ${cnt}개 
			</h3>
		</div>	<!-- // panel-title -->
		
		<div class="panel-body" id="list_approval_pay_table_content">
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
					
				</div>	<!-- // table-responsive -->
			</div>	<!-- // form-group -->
		</div>	<!-- // panel-body -->
		<div >
			<div id="list_dateil"></div>
		</div>
	</div>	<!-- // panel panel-primary -->
	
	<script type="text/javascript">	
	
		$('#list_approval_pay_table_heading').click(function(){
			$('#list_approval_pay_table_content').slideToggle();
		});
		
		function detail_page(param) {

			param = param.split(',');
			var state = param[1];
			
			// purchase_list 접기
			$('#list_approval_pay_content').slideUp();
			 
			// list_approval_pay_table 접기
			$('#list_approval_pay_table_content').slideUp();
			
			$('#list_dateil').slideDown(500);
			$('#list_dateil').load(
					'/purchase_management/search_purchase/detail_purchase?purchase_id='
							+ param[0] + '&purchase_state=' + param[1]
							+ '&account_id=' + param[2] );
	
				return false;
			}
		
	</script>
	
	
	
</body>
</html>