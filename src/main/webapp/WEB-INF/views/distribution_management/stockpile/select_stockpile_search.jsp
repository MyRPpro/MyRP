<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file = "../../setting.jsp" %>
<%@ include file = "../../distribution_management_setting.jsp" %>
<c:if test = "${null eq product_name_list[0].product_id}">
<h3>상품 정보가 없습니다.</h3>
</c:if>
<c:if test = "${null ne product_name_list[0].product_id}">
<h3>재고수불부</h3>
<c:forEach var = "pro" items ="${product_name_list}">
기간 : ${start_day} ~ ${end_day}
물품명 : ${pro.product_name}(${pro.product_id})<br>

<table border = "1">
	<tr>
		<th>날짜</th>
		<th>분류</th>
		<th>수량증가</th>
		<th>수량감소</th>
		<th>재고수량</th>
	</tr>
<c:forEach var = "dto" items ="${select_stockpile_searchDtos}">
<c:if test = "${pro.product_id == dto.product_id}">
<c:set var = "stock" value = "${dto.stock_amount}" />

<c:if test = "${select_stockplie == 'sales_order'}"><!-- 판매 -->
<input type = "hidden" value = "${dto.sales_id}">
<tr>
	<td>${dto.storage_out_date}</td>
	<td><a href = "?sales_id=${dto.sales_id}">판매</a></td>
	<td>-</td>
	<td>${dto.count_sales}</td>
	<td>${stock - dto.count_sales}</td>
</tr>
</c:if>


<c:if test = "${select_stockplie == 'purchase_order'}"><!-- 구매-->
<input type = "hidden" value = "${dto.purchase_id}">
<tr>
	<td>${dto.update_date}</td>
	<td><a href = "?purchase_id=${dto.purchase_id}">구매</a></td>
	<td>${dto.count_purchase}</td>
	<td>-</td>
	<td>${stock + dto.count_purchase}</td>
</tr>
</c:if>
<c:if test = "${select_stockplie == 'adjustment_inventory'}"><!-- 재고조정-->
<c:set var = "minus_stock" value = "${minus_stock + dto.deleted_stock}" />
<tr>
	<td>${dto.update_date}</td>
	<td><a href = "?stock_order_id=${dto.stock_order_id}">재고조정</a></td>
	<td>-</td>
	<td>${dto.deleted_stock}</td>
	<td>${stock}</td>
</tr>
</c:if>
<c:if test = "${select_stockplie == 'defective_warehouse'}"><!-- 불량-->
<input type = "hidden" value = "${dto.sales_id}">
<tr>
	<td>${dto.update_date}</td>
	<td><td><a href = "?sales_id=${dto.sales_id}">불량처리</a></td>
	<td>-</td>
	<td>${dto.count_sales}</td>
	<td>${stock - dto.count_sales}</td>
</tr>

</c:if>
</c:if>
</c:forEach>
</table>
<br>
</c:forEach>
<table border = "1">
<tr>
	<th>수량증가</th>
	<th>수량감소</th>
	<th>재고수량</th>
</tr>
	<tr>
		<th>${add_plus_stock}</th>
		<th>${minus_stock}</th>
		<th>${add_stock}</th>
	</tr>
</table>
</c:if>
</body>
</html>