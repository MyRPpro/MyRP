<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp" %>

검색개수 : ${cnt}
<br>검색종류 : 
<c:choose>

	<c:when test="${check==1}">
		검색어 검색
	</c:when>
	
	<c:when test="${check==2}">
		전표승인 조회
	</c:when>
	
	<c:when test="${check==3}">
		출고완료 조회
	</c:when>
	
	<c:when test="${check==4}">
		미승인 판매 조회
	</c:when>
	
	
	<c:otherwise>
		전체검색
	</c:otherwise>

</c:choose>

<body>

	<c:if test="${startPage > pageBlock}">
		<a href="javascript:search_list('1','${check}')">[◀◀]</a> <!-- 첫 페이지로 이동 -->
		
		<a href="javascript:search_list('${startPage - pageBlock}','${check}')">[◀]</a> <!-- 이전 블록으로 이동 -->
	</c:if>
	<c:forEach var="i" begin="${startPage}" end="${endPage}">
		<c:if test="${i == currentPage}">
			<span>[${i}]</span>
		</c:if>
		<c:if test="${i != currentPage}">
			<a href="javascript:search_list('${i}','${check}')"> [${i}]</a>
		</c:if>
	</c:forEach>
	<c:if test="${pageCount > endPage}">
		<a href="javascript:search_list('${startPage + pageBlock}','${check}')">[▶]</a> <!-- 다음 블록으로 이동 -->
		<a href="javascript:search_list('${pageCount}','${check}')">[▶▶]</a> <!-- 마지막 페이지로 이동 -->
	</c:if>
	

</body>
