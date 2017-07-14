<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


	<h3> 판매 리스트 페이지 : purchase_list.jsp</h3>

	<table border="1">
	
		<tr>
			<th>purchase_id</th>
			<th>account_id</th>
			<th>order_id</th>
			<th>product_id</th>
			<th>company_name</th>
			<th>employee_id</th>
			<th>reg_date</th>
			<th>update_date</th>
			<th>storage_in_date</th>
			<th>count_purchase</th>
			<th>supply_price</th>
			<th>purchase_state</th>
			<th>condition_note_payable</th>
		</tr>
		
		<c:forEach var="vo" items="${purchaseVOs}">
		
		<tr>
			<td>${vo.purchase_id}</td>
			<td>${vo.account_id}</td>
			<td>${vo.order_id}</td>
			<td>${vo.product_id}</td>
			
			<td>
				<a href="/purchase_management/detail_purchase?company_id=${vo.company_id}">
					${vo.company_name}
				</a>
			</td>
			
			<td>${vo.employee_id}</td>
			<td>${vo.reg_date}</td>
			<td>${vo.update_date}</td>
			<td>${vo.storage_in_date}</td>
			<td> <fmt:formatNumber value="${vo.count_purchase}" type="number"/> </td>
			<td> <fmt:formatNumber value="${vo.supply_price}" type="currency"/> </td>
			<td> <fmt:formatNumber value="${vo.purchase_state}" type="number"/> </td>
			<td>${vo.condition_note_payable}</td>
			
		</tr>
		</c:forEach>
		
	</table>
	<div class="page_nav">
	<table>
		<tr>
			<th>
				<c:if test="${startPage > pageBlock}">
					<a href="/purchase_management/purchase_list">[◀◀]</a> <!-- 첫 페이지로 이동 -->
					<a href="/purchase_management/purchase_list?pageNum=${startPage - pageBlock}">[◀]</a> <!-- 이전 블록으로 이동 -->
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<c:if test="${i == currentPage}">
						<span>[${i}]</span>
					</c:if>
					<c:if test="${i != currentPage}">
						<a href="/purchase_management/purchase_list?pageNum=${i}">[${i}]</a>
					</c:if>
				</c:forEach>
				<c:if test="${pageCount > endPage}">
					<a href="/purchase_management/purchase_list?pageNum=${startPage + pageBlock}">[▶]</a> <!-- 다음 블록으로 이동 -->
					<a href="/purchase_management/purchase_list?pageNum=${pageCount}">[▶▶]</a> <!-- 마지막 페이지로 이동 -->
				</c:if>
			</th>
		</tr>
	</table>
	</div>
	<form action="/purchase_management/reg_purchase" method="get" name="company_list_form1">
		<input type="submit" value="거래처 등록">
	</form>
	
</body>
</html>