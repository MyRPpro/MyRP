<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
<a href="/base_registration/company_list">기초등록-거래처등록</a><br>
<hr>
<a href="/accounting_management/bank_account_list">회계관리-계좌리스트</a><br>

<hr>
<a href="/hr_management/reg_hr_code/base_code_group_list">인사관리-인사코드 등록</a>

</body>
</html>
