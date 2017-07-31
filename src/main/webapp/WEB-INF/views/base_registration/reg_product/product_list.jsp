<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../../setting.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	
	$("#page11210_div01_toggle").bind("click", function(event) {
		$("#page11210_div01").slideToggle();
		$("#page11210_div02").slideToggle();
		return false;
	});
	
	$("#page11210_div01 .pagination a").bind("click", function(event) { 
		$("#main_screen").load($(this).attr("href"));
		return false;
	});
	
	$("#page11210_div02 a").bind("click", function(event) {
		$("#page11210_div01").slideUp();
		$("#page11210_div02").slideUp();
		$("#page11210_div03").slideDown();
		$("#page11210_div03").load($(this).attr("href"));
		return false;
	});
	
	$("#page11210_btn01").bind("click", function(event) {
		$("#page11210_div01").slideUp();
		$("#page11210_div02").slideUp();
		$("#page11210_div03").slideDown();
		$("#page11210_div03").load("/base_registration/reg_product/add_product");
		return false;
	});
	
</script>
<body>
	<div class="panel panel-default" id="page11210">
		<div class="panel-heading">
			<a id="page11210_div01_toggle">[11210]product_list.jsp</a>
		</div>
		<div class="panel-body" id="page11210_div01">
			<c:if test="${pageCount > 1}">
				<div class="text-center">
					<ul class="pagination pagination-sm"  style="margin-top: 0px;">
						<c:if test="${startPage > pageBlock}">
							<li><a href="/base_registration/reg_product/product_list">◀◀</a></li>  <!-- 첫 페이지로 이동 -->
							<li><a href="/base_registration/reg_product/product_list?pageNum=${startPage - pageBlock}">◀</a></li> <!-- 이전 블록으로 이동 -->
						</c:if>
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<c:if test="${i == currentPage}">
								<li><span>${i}</span></li>
							</c:if>
							<c:if test="${i != currentPage}">
								<li><a href="/base_registration/reg_product/product_list?pageNum=${i}">${i}</a></li>
							</c:if>
						</c:forEach>
						<c:if test="${pageCount > endPage}">
							<li><a href="/base_registration/reg_product/product_list?pageNum=${startPage + pageBlock}">▶</a></li> <!-- 다음 블록으로 이동 -->
							<li><a href="/base_registration/reg_product/product_list?pageNum=${pageCount}">▶▶</a></li> <!-- 마지막 페이지로 이동 -->
						</c:if>
					</ul>
				</div>
			</c:if>
		</div>
		<div class="panel-body" id="page11210_div02">
			<table class="table">
				<tr>
					<th>상품번호</th>
					<th>상품명</th>
					<th>구매단가</th>
					<th>판매단가</th>
					<th>사용 상태</th>
					<th>등록일</th>
				</tr>
				<c:forEach var="vo" items="${productVos}">
				<tr>
					<td>${vo.product_id}</td>
					<td>
						<a href="/base_registration/reg_product/modify_product?product_id=${vo.product_id}">
							${vo.product_name}
						</a>
					</td>
					<td><fmt:formatNumber value="${vo.purchase_unit_price}" type="number"/></td>
					<td><fmt:formatNumber value="${vo.sale_unit_price}" type="number"/></td>
					<td>${vo.use_state}</td>
					<td>${vo.reg_date}</td>
				</tr>
				</c:forEach>
				<tr>
					<td colspan="6">
						<input class="btn btn-default btn-sm" type="button" value="상품 등록" id="page11210_btn01">
					</td>
				</tr>
			</table>
		</div>
		<div class="panel-body" id="page11210_div03"></div>
	</div>
</body>
</html>