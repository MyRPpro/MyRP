<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../../setting.jsp" %>
<c:forEach var = "dto" items = "${search_stockpile_searchDtos}">
<c:if test = "${dto.product_id != null}">
<input name = "checked" type = "checkbox" value = "${dto.product_id}">${dto.product_id}&nbsp;${dto.product_name}<br>
</c:if>
<c:if test = "${dto.warehouse_id != null}">
<input name = "checked" type = "checkbox" value = "${dto.warehouse_id}">${dto.warehouse_id}&nbsp;${dto.warehouse_name}<br>
</c:if>
</c:forEach>

<c:if test = "${search_stockpile_searchDtos.get(0).warehouse_id != null}">
<button onclick = "go('warehouse')">확인</button>
</c:if>
<c:if test = "${search_stockpile_searchDtos.get(0).product_id != null}">
<button onclick = "go('product')">확인</button>
</c:if>