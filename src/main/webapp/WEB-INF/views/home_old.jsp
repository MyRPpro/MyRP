<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %>
<html>
<head>
   <title>MyRP</title>
</head>
<body>
<h1>
   MyRP
</h1>

<P>  The time on the server is ${serverTime}. </P>
<%
   request.getSession().setAttribute("dest", null);
%>
<c:if test="${ROLE != null}">
   ${ROLE.employee_name}
   <input type="button" value="로그아웃" 
   onclick="window.location='/user/logout';">
</c:if>
<c:if test="${ROLE == null}">
   <input type="button" value="로그인"
   onclick="window.location='/user/login';">
</c:if>
<h3>알람센터</h3>
<a href="/state_alarm/state_alarm_main">알람센터</a><br>


<h3>기초등록</h3>
<a href="/base_registration/reg_company/company_list">기초등록-거래처등록</a><br>
<a href="/base_registration/reg_product/product_list">기초등록-상품등록</a><br>
<hr>

<h3>판매 관리</h3>
<a href="/sales_management/search_sales/sales_list">판매검색</a><br>
<a href="/sales_management/input_sales/reg_sales">판매입력</a><br>
<a href="/sales_management/status_sales/search_status_sales">판매현황</a><br>

<hr>


<h3>구매 관리</h3>
<a href="/purchase_management/search_purchase/purchase_list">구매검색</a><br>
<a href="/purchase_management/input_purchase/reg_purchase">구매입력</a><br>
<a href="/purchase_management/">구매현황</a><br>
<a href="/purchase_management/">거래처별 채무</a><br>
<hr>

<h3>물류 관리</h3>
<a href="/distribution_management/stock_condition/search_stock_condition">재고현황</a><br>
<a href="/distribution_management/stockpile/search_stockpile">재고수불부 검색</a><br>
<a href="/distribution_management/reg_warehouse/warehouse_list">창고 리스트</a><br>
<a href="/distribution_management/movement_warehouse/movement_list">창고 이동 전체 리스트</a><br>
<a href="/distribution_management/adjustment_inventory/adjustment_inventory_list">재고 조정 조회</a><br>
<a href="/distribution_management/search_distribution_order/statement_list">전체 전표 리스트</a>
<hr>

<h3>회계 관리</h3>
<a href="/accounting_management/financial_statements/search_balance_sheet">회계관리-재무상태표 조회</a><br>
<a href="/accounting_management/bank_account_registration/bank_account_list">회계관리-계좌리스트</a><br>
<a href="/accounting_management/account_management/search_account_list">회계관리 - 계정 목록 조회</a><br>
<a href="/accounting_management/statement_management/search_all_statements">회계관리-전체전표 조회</a><br>
<a href="/accounting_management/bond_debt_status/search_bond_debt">회계관리-채권/채무 조회</a><br>
<a href="/accounting_management/account_management/account_list">회계관리-계정목록 조회</a>
<hr>

<h3>인사 관리</h3>
<a href="/hr_management/manage_hr_code/base_code_group_list">인사관리-인사코드 관리</a><br>
<a href="/hr_management/manage_dept/dept_list">인사관리-부서 관리</a><br>
<a href="/hr_management/manage_personnel_card/personnel_card_search">인사관리-인사카드 관리</a><br>
<a href="/hr_management/manage_hr_appointment/hr_appointment_search">인사관리-인사발령 관리</a><br>
<a href="/hr_management/manage_retired_employee/retired_employee_search">인사관리-퇴사자 관리</a><br>
<a href="/hr_management/manage_salary/salary_register">인사관리-급여 관리</a><br>
<hr>

<h3>근태 관리</h3>
<a href="/attitude_management/search_attitude/search_attitude_search">근태관리-근태 조회</a>
</body>
</html>