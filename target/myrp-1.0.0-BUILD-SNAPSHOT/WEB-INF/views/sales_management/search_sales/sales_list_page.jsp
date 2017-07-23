<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp" %>


<body>
	<table>
		<tr>
			<th>
				<c:if test="${startPage > pageBlock}">
					<a href="javascript:quick_search_load('1')">[◀◀]</a> <!-- 첫 페이지로 이동 -->
					
					<a href="javascript:quick_search_load('${startPage - pageBlock}')">[◀]</a> <!-- 이전 블록으로 이동 -->
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<c:if test="${i == currentPage}">
						<span>[${i}]</span>
					</c:if>
					<c:if test="${i != currentPage}">
						<a href="javascript:quick_search_load('${i}')"> [${i}]</a>
					</c:if>
				</c:forEach>
				<c:if test="${pageCount > endPage}">
					<a href="javascript:quick_search_load('${startPage + pageBlock}')">[▶]</a> <!-- 다음 블록으로 이동 -->
					<a href="javascript:quick_search_load('${pageCount}')">[▶▶]</a> <!-- 마지막 페이지로 이동 -->
				</c:if>
			</th>
		</tr>
	</table>

</body>
