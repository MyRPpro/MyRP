<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
reg_company.jsp
<form action="/base_registration/reg_company_pro"
name="reg_company_form1" method="post">
	<table border="1">
		<tr>
			<th>company_id</th>
			<td>
				<input type="text" name="company_id" maxlength="10">
			</td>
		</tr>
		<tr>
			<th>company_name</th>
			<td>
				<input type="text" name="company_name">
			</td>
		</tr>
		<tr>
			<th>biz_reg_no</th>
			<td>
				<input type="text" name="biz_reg_no" maxlength="12">
			</td>
		</tr>
		<tr>
			<th>ceo_name</th>
			<td>
				<input type="text" name="ceo_name" maxlength="20">
			</td>
		</tr>
		<tr>
			<th>corp_reg_no</th>
			<td>
				<input type="text" name="corp_reg_no" maxlength="14">
			</td>
		</tr>
		<tr>
			<th>address</th>
			<td>
				<input type="text" name="address">
			</td>
		</tr>
		<tr>
			<th>biz_type</th>
			<td>
				<input type="text" name="biz_type">
			</td>
		</tr>
		<tr>
			<th>biz_item</th>
			<td>
				<input type="text" name="biz_item">
			</td>
		</tr>
		<tr>
			<th>use_state</th>
			<td>
				<label for="used">사용</label>
				<input type="radio" name="use_state" id="used" value="Y" checked>
				<label for="unused">비사용</label>
				<input type="radio" name="use_state" id="unused" value="N">
			</td>
		</tr>
		<tr>
			<th>company_type</th>
			<td>
				<label for="supplier">supplier</label>
				<input type="radio" name="company_type" id="supplier" value="S" checked>
				<label for="customer">customer</label>
				<input type="radio" name="company_type" id="customer" value="C">
			</td>
		</tr>
		<tr>
			<th>reg_date</th>
			<td><input type="date" name="reg_date"></td>
		</tr>
		<tr>
			<th colspan="2">
				<input type="submit" value="등록하기">
				<input type="reset"	value="재작성">
				<input type="button" value="돌아가기"
				onclick="window.history.back();">
			</th>
		</tr>
	</table>
</form>
</body>
</html>