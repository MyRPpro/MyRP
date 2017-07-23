<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../../setting.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
company_list.jsp

<table border="1">
	<tr>
		<th>company_id</th>
		<th>company_name</th>
		<th>biz_reg_no</th>
		<th>ceo_name</th>
		<th>corp_reg_no</th>
		<th>address</th>
		<th>biz_type</th>
		<th>biz_item</th>
		<th>use_state</th>
		<th>company_type</th>
		<th>reg_date</th>
	</tr>
	<c:forEach var="vo" items="${companyVos}">
	<tr>
		<td>${vo.company_id}</td>
		<td>
			<a href="/base_registration/reg_company/modify_company?company_id=${vo.company_id}">
				${vo.company_name}
			</a>
		</td>
		<td>${vo.biz_reg_no}</td>
		<td>${vo.ceo_name}</td>
		<td>${vo.corp_reg_no}</td>
		<td>${vo.address}</td>
		<td>${vo.biz_type}</td>
		<td>${vo.biz_item}</td>
		<td>${vo.use_state}</td>
		<td>${vo.company_type}</td>
		<td>${vo.reg_date}</td>
	</tr>
	</c:forEach>
</table>
<div class="page_nav">
<table>
	<tr>
		<th>
			<c:if test="${startPage > pageBlock}">
				<a href="/base_registration/reg_company/company_list">[◀◀]</a> <!-- 첫 페이지로 이동 -->
				<a href="/base_registration/reg_company/company_list?pageNum=${startPage - pageBlock}">[◀]</a> <!-- 이전 블록으로 이동 -->
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<c:if test="${i == currentPage}">
					<span>[${i}]</span>
				</c:if>
				<c:if test="${i != currentPage}">
					<a href="/base_registration/reg_company/company_list?pageNum=${i}">[${i}]</a>
				</c:if>
			</c:forEach>
			<c:if test="${pageCount > endPage}">
				<a href="/base_registration/reg_company/company_list?pageNum=${startPage + pageBlock}">[▶]</a> <!-- 다음 블록으로 이동 -->
				<a href="/base_registration/reg_company/company_list?pageNum=${pageCount}">[▶▶]</a> <!-- 마지막 페이지로 이동 -->
			</c:if>
		</th>
	</tr>
</table>
</div>
<form action="/base_registration/reg_company/add_company" method="get" name="company_list_form1">
	<input type="submit" value="거래처 등록">
	<input type="button" value="돌아가기" onclick="window.location='/';">
</form>
</body>
</html>