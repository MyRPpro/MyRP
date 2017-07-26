<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../setting.jsp" %>
<c:if test = "${size == 0}">

<table class="table table-hover">
	<tr>
		<td><span class="text-center">알림을 모두 확인하셨습니다.</span></td>
	</tr>
</table>
</c:if>
<c:if test = "${size > 0}">
<table class="table table-hover">
<c:forEach var = "dto" items = "${state_alarmDtos}">
	<tr>
		<th style="vertical-align: middle;"><h5 class="label label-Success">${dto.from_dept}</h5></th>
		<th><a href = "${dto.state_addr}"><h5>${dto.state_msg}</h5></a></th>
	</tr>
</c:forEach>
</table>
</c:if>
