<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "../../setting.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
base_code_list.jsp
<table border="1">
	<tr>
		<th>hr_code_group_id</th>
		<th>hr_code_group_name</th>
		<th>use_state</th>
	</tr>
	<c:forEach var="vo" items="${hr_code_groupVos}">
	<tr>
		<td>${vo.hr_code_group_id}</td>
		<td>
			<a href="/hr_management/manage_hr_code/base_code_list?hr_code_group_id=${vo.hr_code_group_id}">
				${vo.hr_code_group_name}
			</a>
		</td>
		<td>${vo.use_state}</td>
	</tr>
	</c:forEach>
</table>
<form action="/hr_management/manage_hr_code/add_base_code_group" method="get" name="base_code_group_list_form1">
	<input type="submit" value="인사코드 그룹 등록">
	<input type="button" value="돌아가기" onclick="window.location='/';">
</form>
</body>
</html>