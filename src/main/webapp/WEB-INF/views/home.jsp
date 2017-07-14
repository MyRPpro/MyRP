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
<a href="/hr_management/reg_hr_code/base_code_group_list">인사관리-인사코드 등록</a>


<hr>
<a href="/sales_management/sales_list">판매검색-판매 리스트</a>


</body>
</html>
