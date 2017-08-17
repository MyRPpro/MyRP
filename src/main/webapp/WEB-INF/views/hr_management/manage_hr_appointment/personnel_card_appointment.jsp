<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../../setting.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="table-responsive">
	<table class="table">
		<tr>
			<th colspan="12" style="width:100px; height:130px;">
				<img alt="사진 이미지" src="/resources/images/picture_employee/${pic_uid}"
				width="100" height="125">
			</th>
		</tr>
		<tr>
			<th>사원번호</th>
			<th>사원명</th>
			<th>발령일</th>
			<th>이전직급명</th>
			<th>발령직급명</th>
			<th>이전부서명</th>
			<th>발령부서명</th>
		</tr>
		<c:forEach var="dto" items="${dtos}">
		<tr>
			<td>${dto.employee_id}</td>
			<td>${dto.employee_name}</td>
			<td>${dto.appointment_date}</td>
			<td>${dto.pre_rank_name}</td>
			<td>${dto.post_rank_name}</td>
			<td>${dto.pre_dept_name}</td>
			<td>${dto.post_dept_name}</td>
		</tr>
		</c:forEach>
	</table>
</div>
</body>
</html>