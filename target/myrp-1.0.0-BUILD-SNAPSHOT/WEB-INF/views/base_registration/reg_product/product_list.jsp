<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../../setting.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
product_list.jsp
<table border="1">
	<tr>
		<th>product_id</th>
		<th>product_name</th>
		<th>purchase_unit_price</th>
		<th>sale_unit_price</th>
		<th>use_state</th>
		<th>reg_date</th>
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
</table>
<div class="page_nav">
<table>
	<tr>
		<th>
			<c:if test="${startPage > pageBlock}">
				<a href="/base_registration/reg_product/product_list">[◀◀]</a> <!-- 첫 페이지로 이동 -->
				<a href="/base_registration/reg_product/product_list?pageNum=${startPage - pageBlock}">[◀]</a> <!-- 이전 블록으로 이동 -->
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<c:if test="${i == currentPage}">
					<span>[${i}]</span>
				</c:if>
				<c:if test="${i != currentPage}">
					<a href="/base_registration/reg_product/product_list?pageNum=${i}">[${i}]</a>
				</c:if>
			</c:forEach>
			<c:if test="${pageCount > endPage}">
				<a href="/base_registration/reg_product/product_list?pageNum=${startPage + pageBlock}">[▶]</a> <!-- 다음 블록으로 이동 -->
				<a href="/base_registration/reg_product/product_list?pageNum=${pageCount}">[▶▶]</a> <!-- 마지막 페이지로 이동 -->
			</c:if>
		</th>
	</tr>
</table>
</div>
<form action="/base_registration/reg_product/add_product" method="get" name="product_list_form1">
	<input type="submit" value="상품 등록">
	<input type="button" value="돌아가기" onclick="window.location='/';">
</form>
</body>
</html>