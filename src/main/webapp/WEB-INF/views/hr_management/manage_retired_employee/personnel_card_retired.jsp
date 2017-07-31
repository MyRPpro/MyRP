<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../../setting.jsp" %>
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
			<img alt="사진 이미지" src="/resources/images/picture_employee/${employee_id}.jpg"
			width="100" height="125">
		</th>
	</tr>
	<tr>
		<th>사원번호</th>
		<th>사원명</th>
		<th>부서명</th>
		<th>직급</th>
		<th>입사일</th>
		<th>퇴직일</th>
		<th>퇴직사유</th>
	</tr>
	<tr>
		<td>${dto.employee_id}</td>
		<td>${dto.employee_name}</td>
		<td>${dto.dept_name}</td>
		<td>${dto.hr_code_name}</td>
		<td>${dto.join_date}</td>
		<td>${dto.retired_date}</td>
		<td>${dto.retired_reason}</td>
	</tr>
</table>
</body>
</html>