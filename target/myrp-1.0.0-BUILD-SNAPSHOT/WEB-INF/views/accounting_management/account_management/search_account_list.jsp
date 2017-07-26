<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../../setting.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script src = "/resources/accounting_management/accounting_management_script.js"></script>
<body>
<h3> 전체 계정 조회 </h3>
총 계정 개수 : ${cnt}
<button onclick="window.location='/'"> 홈으로 </button>

<table border="1">
	<tr>
		<th> account_id </th>
		<th> account_name </th>
		<th> account_balance </th>
	</tr>
	<c:if test="${cnt==0}">
	<tr>
		<th align="center" colspan="3">
			존재하는 계정이 없습니다
		</th>
	</tr>
	</c:if>
	<c:forEach var="vo" items="${accountVos}"> 
	<tr>
		<td> 
			${vo.account_id}
		</td>
		<td>
		<a href="/accounting_management/account_management/modify_account?account_id=${vo.account_id}"> 
			${vo.account_name}
		</a>
		</td>
		<td> 
			${vo.account_balance}
		</td>
	</tr>
	</c:forEach>
	</table>
	
	<!-- 페이지 내비게이션  -->
	<div class="page_nav">
		<table border="1">
			<tr>
				<th>
					<c:if test="${startPage > pageBlock}">
						<a href="/accounting_management/account_management/search_account_list">[◀◀]</a> <!-- 첫 페이지로 이동 -->
						<a href="/accounting_management/account_management/search_account_list?pageNum=${startPage - pageBlock}">[◀]</a> <!-- 이전 블록으로 이동 -->
					</c:if>
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<c:if test="${i == currentPage}">
							<span>[${i}]</span>
						</c:if>
						<c:if test="${i != currentPage}">
							<a href="/accounting_management/account_management/search_account_list?pageNum=${i}">[${i}]</a>
						</c:if>
					</c:forEach>
					<c:if test="${pageCount > endPage}">
						<a href="/accounting_management/account_management/search_account_list?pageNum=${startPage + pageBlock}">[▶]</a> <!-- 다음 블록으로 이동 -->
						<a href="/accounting_management/account_management/search_account_list?pageNum=${pageCount}">[▶▶]</a> <!-- 마지막 페이지로 이동 -->
					</c:if>
				</th>
			</tr>
		</table>
	</div>
	
	<form action="/accounting_management/account_management/add_account" method="get" name="statement_list_form1">
	<input type="submit" value="계정 추가">	
	</form>
</body>
</html>