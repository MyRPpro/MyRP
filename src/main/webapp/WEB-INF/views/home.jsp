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
<h3>물류 관리</h3>
<a href="/distribution_management/stock_condition/search_stock_condition">재고현황</a>
<br>
	<a href="/distribution_management/stockpile/search_stockpile">재고수불부 검색</a>
<br>
	<a href="/distribution_management/reg_warehouse/warehouse_list">창고 리스트</a>
	
<br>
	<a href="/distribution_management/movement_warehouse/movement_all_list">창고 이동 전체 리스트</a>
	
<br>
	<a href="/distribution_management/adjustment_inventory/adjustment_inventory_list">재고 조정 조회</a>
	
<br>
	<a href="/distribution_management/search_distribution_order/all_statement_list">전체 전표 리스트</a>
	
	

<hr>
</body>
</html>
