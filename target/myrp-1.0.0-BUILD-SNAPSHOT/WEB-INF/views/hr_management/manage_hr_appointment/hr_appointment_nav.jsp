<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../../setting.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
hr_appointment_nav.jsp
<c:if test="${pageCount > 1}">
	<div class="page_nav">
	<table>
		<tr>
			<th>
				<c:if test="${startPage > pageBlock}">
					<a href="javascript:fn_hr_appointment_nav('1')">[◀◀]</a> <!-- 첫 페이지로 이동 -->
					<a href="javascript:fn_hr_appointment_nav('${startPage - pageBlock}')">[◀]</a> <!-- 이전 블록으로 이동 -->
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<c:if test="${i == currentPage}">
						<span>[${i}]</span>
					</c:if>
					<c:if test="${i != currentPage}">
						<a href="javascript:fn_hr_appointment_nav('${i}')">[${i}]</a>
					</c:if>
				</c:forEach>
				<c:if test="${pageCount > endPage}">
					<a href="javascript:fn_hr_appointment_nav('${startPage + pageBlock}')">[▶]</a> <!-- 다음 블록으로 이동 -->
					<a href="javascript:fn_hr_appointment_nav('${pageCount}')">[▶▶]</a> <!-- 마지막 페이지로 이동 -->
				</c:if>
			</th>
		</tr>
	</table>
</c:if>
</body>
</html>