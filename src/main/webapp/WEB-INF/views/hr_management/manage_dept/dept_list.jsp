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
dept_list.jsp
<table border="1">
	<tr>
		<th>dept_id</th>
		<th>dept_name</th>
		<th>access_role</th>
		<th>use_state</th>
	</tr>
	<c:forEach var="vo" items="${deptVos}">
	<tr>
		<td>${vo.dept_id}</td>
		<td>
			<a href="/hr_management/manage_dept/modify_dept?dept_id=${vo.dept_id}">
				${vo.dept_name}
			</a>
		</td>
		<td>${vo.access_role}</td>
		<td>${vo.use_state}</td>
	</tr>
	</c:forEach>
</table>
<c:if test="${pageCount > 1}">
	<div class="page_nav">
	<table>
		<tr>
			<th>
				<c:if test="${startPage > pageBlock}">
					<a href="/hr_management/manage_dept/dept_list">[◀◀]</a> <!-- 첫 페이지로 이동 -->
					<a href="/hr_management/manage_dept/dept_list?pageNum=${startPage - pageBlock}">[◀]</a> <!-- 이전 블록으로 이동 -->
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<c:if test="${i == currentPage}">
						<span>[${i}]</span>
					</c:if>
					<c:if test="${i != currentPage}">
						<a href="/hr_management/manage_dept/dept_list?pageNum=${i}">[${i}]</a>
					</c:if>
				</c:forEach>
				<c:if test="${pageCount > endPage}">
					<a href="/hr_management/manage_dept/dept_list?pageNum=${startPage + pageBlock}">[▶]</a> <!-- 다음 블록으로 이동 -->
					<a href="/hr_management/manage_dept/dept_list?pageNum=${pageCount}">[▶▶]</a> <!-- 마지막 페이지로 이동 -->
				</c:if>
			</th>
		</tr>
	</table>
</c:if>
<form action="/hr_management/manage_dept/add_dept" method="get" name="dept_list_form1">
	<input type="submit" value="부서 등록">
	<input type="button" value="돌아가기" onclick="window.location='/';">
</form>
</body>
</html>