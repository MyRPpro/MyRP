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
<div id="page16612">
	<c:if test="${pageCount > 1}">
		<div class="text-center">
			<ul class="pagination pagination-sm" style="margin: 0px;">
				<c:if test="${startPage > pageBlock}">
					<li><a href="javascript:fn_hr_appointment_nav('1')">◀◀</a></li>  <!-- 첫 페이지로 이동 -->
					<li><a href="javascript:fn_hr_appointment_nav('${startPage - pageBlock}')">◀</a></li> <!-- 이전 블록으로 이동 -->
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<c:if test="${i == currentPage}">
						<li><span>${i}</span></li>
					</c:if>
					<c:if test="${i != currentPage}">
						<li><a href="javascript:fn_hr_appointment_nav('${i}')">${i}</a></li>
					</c:if>
				</c:forEach>
				<c:if test="${pageCount > endPage}">
					<li><a href="javascript:fn_hr_appointment_nav('${startPage + pageBlock}')">▶</a></li> <!-- 다음 블록으로 이동 -->
					<li><a href="javascript:fn_hr_appointment_nav('${pageCount}')">▶▶</a></li> <!-- 마지막 페이지로 이동 -->
				</c:if>
			</ul>
		</div>
	</c:if>
</div>
</body>
</html>