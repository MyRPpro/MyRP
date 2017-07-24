<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
add_attitude_search.jsp
<form action="add_attitude_search_pro" name="add_attitude_search_form" method="get"
	onsubmit="return fn_add_attitude_search()">
	<table>
		<tr>
			<td>
				<select name="" onchange="">
					<option>휴가선택</option>
				</select>
			</td>
			<td>
				<select name="employee_id">
					<option value=0>사원선택</option>
				</select>				
			</td>
			<td>
				<input type="submit" value="확인">
				<input type="reset" value="취소">
				<input type="button" value="돌아가기" onclick="window.history.back();">
			</td>
	</table>
</form>
</body>
</html>