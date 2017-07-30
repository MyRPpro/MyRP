<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp" %>

<body>

	<div class="text-center">
		<ul class="pagination">
			<c:if test="${startPage > pageBlock}">
				<li> <a href="javascript:search_lack_stock('1')"> ◀◀ </a> </li>
				<li> <a href="javascript:search_lack_stock('${startPage - pageBlock}')"> ◀ </a> </li>
			</c:if>
			
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<c:if test="${i == currentPage}">
					<li> <span> <b> ${i} </b> </span> </li>
				</c:if>
				<c:if test="${i != currentPage}">
					<li> <a href="javascript:search_lack_stock('${i}')"> ${i} </a> </li>
				</c:if>
			</c:forEach>
			
			<c:if test="${pageCount > endPage}">
				<li> <a href="javascript:search_lack_stock('${startPage + pageBlock}')"> ▶ </a> </li>
				<li> <a href="javascript:search_lack_stock('${pageCount}')"> ▶▶ </a> </li>
			</c:if>
			
		</ul>
	</div>
	
</body>
