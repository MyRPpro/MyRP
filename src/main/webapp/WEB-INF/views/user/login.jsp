<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../setting.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	function autofocus() {
		document.login_form1.employee_name.focus();
	}
	
	function fn_login_check() {
		var employee_name = document.login_form1.employee_name;
		var employee_id = document.login_form1.employee_id;
		if(employee_name.value == "") {
			alert("성명을 입력하세요");
			employee_name.focus();
			return false;
		}
		if(employee_id.value == "") {
			alert("사번을 입력하세요.");
			employee_id.focus();
			return false;
		}
	}
</script>
<body onload="autofocus();">

login.jsp
<form action="/user/loginPost" method="post" name="login_form1"
onsubmit="return fn_login_check();">
	<table border="1">
		<tr>
			<th>employee_name</th>
			<td>
				<input type="text" name="employee_name">
			</td>
		</tr>
		<tr>
			<th>employee_id</th>
			<td>
				<input type="number" name="employee_id">
			</td>
		</tr>
		<tr>
			<th colspan="2">
				<input type="submit" value="로그인">
				<input type="reset" value="재작성">
				<input type="button" value="돌아가기" onclick="window.location='/';">
			</th>
		</tr>
	</table>
</form>
</body>
</html>