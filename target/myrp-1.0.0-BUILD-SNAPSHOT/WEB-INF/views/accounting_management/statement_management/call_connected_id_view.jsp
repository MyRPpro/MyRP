<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<input type="button" value="sales" onclick="window.location='/accounting_management/statement_management/call_connected_id?select_connection=1'">
	<input type="button" value="purchase" onclick="window.location='/accounting_management/statement_management/call_connected_id?select_connection=2'">
	<input type="button" value="salary" onclick="window.location='/accounting_management/statement_management/call_connected_id?select_connection=3'">
	<input type="button" value="tax" onclick="window.location='/accounting_management/statement_management/call_connected_id?select_connection=4'">
</body>
</html>