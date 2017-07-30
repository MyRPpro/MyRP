<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../../setting.jsp" %>
<c:forEach var = "dto" items = "${search_stockpile_searchDtos}">
<input name = "checked" type = "checkbox" value = "${dto.product_id}">${dto.product_id}&nbsp;${dto.product_name}<br>
</c:forEach>

<button onclick = "go('product')" class="btn btn-success" data-dismiss = "modal">확인</button>
