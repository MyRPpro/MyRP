<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "../../setting.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>재고현황</h1>
<table border = "1">
	<tr>
		<th>상품코드</th>
		<th>상품명</th>
		<th>재고수량</th>
		<th>구입단가</th>
		<th>금액</th>
	</tr>
	
	<c:if test = "${stock_conditionDtos != null}">
		<c:forEach var = "dto" items = "${stock_conditionDtos}">
			<tr>
				<td>${dto.product_id}</td>
				<td>${dto.product_name}</td>
				<td>${dto.stock_amount}</td>
				<td>${dto.purchase_unit_price}</td>
				<td>${dto.stock_amount * dto.purchase_unit_price}</td>
			</tr>
		</c:forEach>
	</c:if>
	<c:if test = "${stock_conditionDtos == null}">
	<tr>
		<th>재고가 없습니다.</th>
	</tr>
	</c:if>
	<tr>
		<th colspan = "2">합계</th>
		<td>${stock_amount}</td>
		<td>${purchase_unit_price}</td>
		<td>${stock_purchase_sum}</td>
	</tr>
 </table>
</body>
</html>