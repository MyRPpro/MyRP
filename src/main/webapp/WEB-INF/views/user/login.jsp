<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../setting.jsp" %>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
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
<form class="form-horizontal" action="/user/loginPost" method="post" name="login_form1"
onsubmit="return fn_login_check();">
	<div class="form-group">
		<label for="employee_name">NAME</label>
		<input type="text" class="form-control" id="employee_name" name="employee_name" placeholder="성명" autofocus required>
	</div>
	<div class="form-group">
		<label for="employee_id">EMPLOYEE ID</label>
		<input type="number" class="form-control" id="employee_id" name="employee_id" placeholder="사원번호" required>
	</div>
	<button type="submit" class="btn btn-default">LOGIN</button>
	<button type="reset" class="btn btn-default">RESET</button>
	<button type="button" class="btn btn-default" onclick="window.location='/';">BACK</button>
</form>
</body>
</html>