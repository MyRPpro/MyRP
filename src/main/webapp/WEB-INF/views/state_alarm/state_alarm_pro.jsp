<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
$(".mov").bind("click", function(event) {
	$("#main_screen").load($(this).attr("href"));
	return false;
});
</script>
<c:if test = "${goes == '1'}">
<c:if test = "${size == 0}">

<table class="table table-hover">
	<tr>
		<td><span class="text-center">알림을 모두 확인하셨습니다.</span></td>
	</tr>
</table>
</c:if>
<c:if test = "${size > 0}">
<table class="table table-hover">
<c:forEach var = "dto" items = "${state_alarmDtos}" begin="1" end = "5">
	<tr>
		<th style="vertical-align: middle;"><h5 class="label label-Success">${dto.from_dept}</h5></th>
		<th><a class = "mov" href = "${dto.state_addr}"><h5>${dto.state_msg}</h5></a></th>
	</tr>
</c:forEach>
</table>
</c:if>
</c:if>

<c:if test = "${goes == '2'}">
<span class="badge">${size}</span>
</c:if>