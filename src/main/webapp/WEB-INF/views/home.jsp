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
<a href="/hr_management/manage_hr_code/base_code_group_list">인사관리-인사코드 관리</a><br>
<a href="/hr_management/manage_dept/dept_list">인사관리-부서 관리</a><br>
<a href="/hr_management/manage_personnel_card/personnel_card_list">인사관리-인사카드 관리</a><br>
<a href="/hr_management/manage_service_attitude/search_attendance_absence">인사관리-근태 관리</a><br>
<a href="/hr_management/manage_salary/salary_register">인사관리-급여 관리</a><br>
<hr>

</body>
</html>
