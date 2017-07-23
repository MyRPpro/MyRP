<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp" %>
<%-- 페이지 체크 : ${date_check} --%>
<body>
	<table>
		<tr>
			<th>
				<c:if test="${startPage > pageBlock}">
					<a href="javascript:list_table('1','${date_check}')">[◀◀]</a> <!-- 첫 페이지로 이동 -->
					
					<a href="javascript:list_table('${startPage - pageBlock}','${date_check}')">[◀]</a> <!-- 이전 블록으로 이동 -->
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<c:if test="${i == currentPage}">
						<span>[${i}]</span>
					</c:if>
					<c:if test="${i != currentPage}">
						<a href="javascript:list_table('${i}','${date_check}')"> [${i}]</a>
					</c:if>
				</c:forEach>
				<c:if test="${pageCount > endPage}">
					<a href="javascript:list_table('${startPage + pageBlock}','${date_check}')">[▶]</a> <!-- 다음 블록으로 이동 -->
					<a href="javascript:list_table('${pageCount}','${date_check}')">[▶▶]</a> <!-- 마지막 페이지로 이동 -->
				</c:if>
			</th>
		</tr>
	</table>

</body>
