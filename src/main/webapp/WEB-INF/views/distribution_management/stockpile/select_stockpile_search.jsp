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

<c:if test = "${null eq product_name_list[0].product_id}">
<h3>상품 정보가 없습니다.</h3>
</c:if>

<c:if test = "${null ne product_name_list[0].product_id}">
	<h3>재고수불부</h3>
	<c:forEach var = "pro" items ="${select_product}">
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
		
		<c:set var = "minus_stock" value = "${minus_stock + dto.minus_stock}" />
		<c:set var = "plus_stock" value = "${plus_stock + dto.plus_stock}" />
		<tr>
			<td>${dto.sto_date}</td>
			<c:if test = "${fn:substring(dto.pro_id,0,1) == '2'}">
			<td><a href = "?pro_id=${dto.pro_id}">판매</a></td>
			</c:if>
			<c:if test = "${fn:substring(dto.pro_id,0,1) == '3'}">
			<td><a href = "?pro_id=${dto.pro_id}">구매</a></td>
			</c:if>
			<c:if test = "${fn:substring(dto.pro_id,0,1) == '4'}">
			<td><a href = "?pro_id=${dto.pro_id}">재고조정</a></td>
			</c:if>
			<td>${dto.plus_stock}</td>
			<td>${dto.minus_stock}</td>
			<td>${dto.stock_amount}</td>
		</tr>
		</c:if>
		
		</c:forEach>
	
		</table>
		</c:forEach>
		<br>
	<table border = "1">
	<tr>
		<th>수량증가</th>
		<th>수량감소</th>
		<th>재고수량</th>
	</tr>
		<tr>
			<th>${plus_stock}</th>
			<th>${minus_stock}</th>
			<th>${add_stock}</th>
		</tr>
	</table>
	</c:if>
</body>
</html>