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
<h3>재고현황</h3>
<table border = "1" >
	<tr>
		<th>상품코드</th>
		<th>상품명</th>
		<th>창고번호</th>
		<th>사용상태코드</th>
		<th>등록일자</th>
		<th>구입단가</th>
		<th>판매단가</th>
		<th>재고수량</th>
		<th>구입금액</th>
		<th>판매금액</th>
	</tr>
	
	<c:if test = "${stock_conditionDtos != null}">
		<c:forEach var = "dto" items = "${stock_conditionDtos}">
			<tr>
				<td>${dto.product_id}</td>
				<td>${dto.product_name}</td>
				<td>${dto.warehouse_id}</td>
				<td>${dto.use_state}</td>
				<td>${dto.reg_date}</td>
				<td>${dto.purchase_unit_price}</td>
				<td>${dto.sale_unit_price}</td>
				<td>${dto.stock_amount}</td>
				<td>${dto.stock_amount * dto.purchase_unit_price}</td>
				<td>${dto.stock_amount * dto.sale_unit_price}</td>
				
			</tr>
		</c:forEach>
	</c:if>
	<c:if test = "${stock_conditionDtos == null}">
	<tr>
		<th>재고가 없습니다.</th>
	</tr>
	</c:if>
	<tr>
		<th colspan = "5">합계</th>
		<td>${purchase_unit_price}</td>
		<td>${sale_unit_price}</td>
		<td>${stock_amount}</td>
		<td><fmt:formatNumber value="${stock_purchase_sum}" type = "number" /></td>
		<td><fmt:formatNumber value="${sale_unit_price_sum}" type = "number" /></td>
	</tr>
 </table>
</body>
</html>