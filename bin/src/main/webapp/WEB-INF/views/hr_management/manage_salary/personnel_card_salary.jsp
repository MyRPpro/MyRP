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
<table class="table">
	<tr>
		<th colspan="12" style="width:100px; height:130px;">
			<img alt="사진 이미지" src="/resources/images/picture_employee/${pic_uid}"
			width="100" height="125">
		</th>
	</tr>
	<tr>
		<th>급여대장 번호</th>
		<th>급여대장명</th>
		<th>등록일</th>
		<th>기본급</th>
		<th>상여금</th>
		<th>수당</th>
		<th>경비</th>
		<th>지급액</th>
		<th>공제금액</th>
		<th>수령액</th>
	</tr>
	<c:forEach var="dto" items="${dtos}">
	<tr>
		<td>${dto.salary_register_id}</td>
		<td>${dto.salary_register_name}</td>
		<td>${dto.reg_date}</td>
		<td>${dto.base_pay}</td>
		<td>${dto.bonus}</td>
		<td>${dto.benefit}</td>
		<td>${dto.cost}</td>
		<td>${dto.total_pay}</td>
		<td>${dto.deduction_cost}</td>
		<td>${dto.takehome_pay}</td>
	</tr>
	</c:forEach>
</table>
</body>
</html>