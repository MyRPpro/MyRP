<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
bank_account.jsp

<table border="1">
	<tr>
		<th>bank_account_id</th>
		<th>bank_account_name</th>
		<th>bank_account_number</th>
		<th>bank_account_balance</th>
		<th>bank_account_type</th>
		<th>bank_name</th>
		<th>use_state</th>
		<th>reg_date</th>
	</tr>
	<c:forEach var="vo" items="${bankAccountVos}">
	<tr>
		<td>${vo.bank_account_id}</td>
		<td>
			<a href="/accounting_management/bank_account_registration/modify_bank_account?bank_account_id=${vo.bank_account_id}">
				${vo.bank_account_name}
			</a>
		</td>
		<td>${vo.bank_account_number}</td>
		<td>${vo.bank_account_balance}</td>
		<td>${vo.bank_account_type}</td>
		<td>${vo.bank_name}</td>
		<td>${vo.use_state}</td>
		<td>${vo.reg_date}</td>
	</tr>		
	</c:forEach>
</table>

<!-- 페이지 내비게이션  -->
<div class="page_nav">
<table border="1">
	<tr>
		<th>
			<c:if test="${startPage > pageBlock}">
				<a href="/accounting_management/bank_account_registration/bank_account_list">[◀◀]</a> <!-- 첫 페이지로 이동 -->
				<a href="/accounting_management/bank_account_registration/bank_account_list?pageNum=${startPage - pageBlock}">[◀]</a> <!-- 이전 블록으로 이동 -->
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<c:if test="${i == currentPage}">
					<span>[${i}]</span>
				</c:if>
				<c:if test="${i != currentPage}">
					<a href="/accounting_management/bank_account_registration/bank_account_list?pageNum=${i}">[${i}]</a>
				</c:if>
			</c:forEach>
			<c:if test="${pageCount > endPage}">
				<a href="/accounting_management/bank_account_registration/bank_account_list?pageNum=${startPage + pageBlock}">[▶]</a> <!-- 다음 블록으로 이동 -->
				<a href="/accounting_management/bank_account_registration/bank_account_list?pageNum=${pageCount}">[▶▶]</a> <!-- 마지막 페이지로 이동 -->
			</c:if>
		</th>
	</tr>
</table>
</div>
<form action="/accounting_management/bank_account_registration/register_bank_account" method="get" name="bank_account_list_form1">
	<input type="submit" value="계좌 등록">
</form>

</body>
</html>