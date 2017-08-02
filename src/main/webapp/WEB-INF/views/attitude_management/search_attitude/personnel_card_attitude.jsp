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
				<img alt="사진 이미지" src="/resources/images/picture_employee/${employee_id}.jpg"
						width="100" height="125">
			</th>
		</tr>
		<tr>
			<th>사원번호</th>
			<th>사원이름</th>
			<th>휴가시작일</th>
			<th>휴가명</th>
			<th>휴가일수</th>
			<th>휴가사유명</th>
		</tr>
		<c:forEach var="dto" items="${dtos}">
			<tr>
				<td>${dto.employee_id}</td>
				<td>${dto.employee_name}</td>
				<td>${dto.attitude_date}</td>
				<td>${dto.leave_code_name}</td>
				<td>${dto.attitude_period}</td>
				<td>${dto.attitude_reason_name}</td>
			</tr>
			</c:forEach>
	</table>
</body>
</html>