<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp" %>

<body>
	<div class="text-center">
		<ul class="pagination" style="margin:0 auto;">
			<c:if test="${startPage > pageBlock}">
				<li> <a href="javascript:search_list('1','${check}')">[◀◀] </a> </li> <!-- 첫 페이지로 이동 -->
				<li> <a href="javascript:search_list('${startPage - pageBlock}','${check}')">[◀]</a> </li> <!-- 이전 블록으로 이동 -->
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<c:if test="${i == currentPage}">
					<li> <span><b>[${i}]</b></span> </li>
				</c:if>
				<c:if test="${i != currentPage}">
					<li> <a href="javascript:search_list('${i}','${check}')"> [${i}]</a> </li>
				</c:if>
			</c:forEach>
			<c:if test="${pageCount > endPage}">
				<li> <a href="javascript:search_list('${startPage + pageBlock}','${check}')">[▶]</a> </li> <!-- 다음 블록으로 이동 -->
				<li> <a href="javascript:search_list('${pageCount}','${check}')">[▶▶]</a> </li> <!-- 마지막 페이지로 이동 -->
			</c:if>
		</ul>
	</div>
</body>
