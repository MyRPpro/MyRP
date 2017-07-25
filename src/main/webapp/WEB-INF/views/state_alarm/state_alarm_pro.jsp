<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../setting.jsp" %>
<c:if test = "${size == 0}">
알림을 모두 확인하셨습니다.
</c:if>

<c:if test = "${size > 0}">
<table border = "1">
<tr>
<th>상태코드</th>
<th>한글명</th>
<th>영어명</th>
<th>Msg</th>
<c:forEach var = "dto" items = "${state_alarmDtos}">
<tr>
	<th><a href = "${dto.state_addr}">${dto.order_state}</a></th>
	<th>${dto.kor_name}</th>
	<th>${dto.eng_name}</th>
	<th>${dto.state_msg}</th>
</c:forEach>
</table>
</c:if>
