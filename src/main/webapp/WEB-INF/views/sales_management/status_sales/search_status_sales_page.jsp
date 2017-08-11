<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp" %>
<body>
	${check}
	<div class="text-center">
		<ul class="pagination" style="margin-bottom: 0px;">
			<c:if test="${startPage > pageBlock}">
				<li> <a href="javascript:list_table('1','${check}')">◀◀ </a> </li>
				<li> <a href="javascript:list_table('${startPage - pageBlock}','${check}')">◀ </a> </li>
			</c:if>
			
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<c:if test="${i == currentPage}">
					<li> <span> <b> ${i} </b> </span> </li>
				</c:if>
				<c:if test="${i != currentPage}">
					<li> <a href="javascript:list_table('${i}','${check}')"> ${i} </a> </li>
				</c:if>
			</c:forEach>
			
			<c:if test="${pageCount > endPage}">
				<li> <a href="javascript:list_table('${startPage + pageBlock}','${check}')"> ▶ </a> </li>
				<li> <a href="javascript:list_table('${pageCount}','${check}')">▶▶ </a> </li>
			</c:if>
		</ul>
	</div>
</body>
