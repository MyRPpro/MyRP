<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>MyRP</title>
</head>
<body>
<h1>
	MyRP
</h1>

<P>  The time on the server is ${serverTime}. </P>
<h3>기초등록</h3>
<a href="/base_registration/reg_company/company_list">기초등록-거래처등록</a><br>
<a href="/base_registration/reg_product/product_list">기초등록-상품등록</a><br>
<hr>
<h3>인사 관리</h3>
<a href="/hr_management/manage_hr_code/base_code_group_list">인사관리-인사코드 관리</a><br>
<a href="/hr_management/manage_dept/dept_list">인사관리-부서 관리</a><br>
<a href="/hr_management/manage_personnel_card/personnel_card_list">인사관리-인사카드 관리</a><br>
<a href="/hr_management/manage_service_attitude/search_attendance_absence">인사관리-근태 관리</a><br>
<a href="/hr_management/manage_salary/salary_register">인사관리-급여 관리</a><br>
<hr>
<h3>물류 관리</h3>
<a href="/distribution_management/stock_condition/search_stock_condition">재고현황</a><br>
<a href="/distribution_management/stockpile/search_stockpile">재고수불부 검색</a><br>
<a href="/distribution_management/reg_warehouse/warehouse_list">창고 리스트</a><br>
<a href="/distribution_management/movement_warehouse/movement_all_list">창고 이동 전체 리스트</a><br>
<a href="/distribution_management/adjustment_inventory/adjustment_inventory_list">재고 조정 조회</a><br>
<a href="/distribution_management/search_distribution_order/all_statement_list">전체 전표 리스트</a>
<hr>
</body>
</html>
