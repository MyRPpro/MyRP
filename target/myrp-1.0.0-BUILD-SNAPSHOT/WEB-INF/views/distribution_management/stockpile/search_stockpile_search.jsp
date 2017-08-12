<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../../setting.jsp" %>
<br>
<table class="table table-condensed">
<tr>
	<td>선택</td><td>상품번호</td><td>상품명</td>
</tr>
<c:forEach var = "dto" items = "${search_stockpile_searchDtos}">
	<tr>
		<td><input name = "checked" type = "checkbox" value = "${dto.product_id}"></td>
		<td>${dto.product_id}</td>
		<td>${dto.product_name}</td>
	</tr>
</c:forEach>
<tr>
	<td colspan = "3">
		<button onclick = "go('product')" class="btn btn-sm btn-primary" data-dismiss = "modal">확인</button>
	</td>
</tr>
</table>
