<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../../setting.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
modify_company.jsp
<form action="/base_registration/reg_company/modify_company_pro"
name="modify_company_form1" method="post">
	<table border="1">
		<tr>
			<th>company_id</th>
			<td>
				<input type="text" name="company_id" value="${companyVo.company_id}" maxlength="10" readonly="readonly">
			</td>
		</tr>
		<tr>
			<th>company_name</th>
			<td>
				<input type="text" name="company_name" value="${companyVo.company_name}">
			</td>
		</tr>
		<tr>
			<th>biz_reg_no</th>
			<td>
				<input type="text" name="biz_reg_no" value="${companyVo.biz_reg_no}" maxlength="12">
			</td>
		</tr>
		<tr>
			<th>ceo_name</th>
			<td>
				<input type="text" name="ceo_name" value="${companyVo.ceo_name}" maxlength="20">
			</td>
		</tr>
		<tr>
			<th>corp_reg_no</th>
			<td>
				<input type="text" name="corp_reg_no" value="${companyVo.corp_reg_no}" maxlength="14">
			</td>
		</tr>
		<tr>
			<th>address</th>
			<td>
				<input type="text" name="address" value="${companyVo.address}">
			</td>
		</tr>
		<tr>
			<th>biz_type</th>
			<td>
				<input type="text" name="biz_type" value="${companyVo.biz_type}">
			</td>
		</tr>
		<tr>
			<th>biz_item</th>
			<td>
				<input type="text" name="biz_item" value="${companyVo.biz_item}">
			</td>
		</tr>
		<tr>
			<th>use_state</th>
			<td>
				<label for="used">사용</label>
				<input type="radio" name="use_state" id="used" value="Y"
				<c:if test="${companyVo.use_state == 'Y' }">checked</c:if>>
				<label for="unused">비사용</label>
				<input type="radio" name="use_state" id="unused" value="N"
				<c:if test="${companyVo.use_state == 'N' }">checked</c:if>>
			</td>
		</tr>
		<tr>
			<th>company_type</th>
			<td>
				<label for="supplier">supplier</label>
				<input type="radio" name="company_type" id="supplier" value="S" 
				<c:if test="${companyVo.company_type == 'S' }">checked</c:if>>
				<label for="customer">customer</label>
				<input type="radio" name="company_type" id="customer" value="C"
				<c:if test="${companyVo.company_type == 'C' }">checked</c:if>>
			</td>
		</tr>
		<tr>
			<th>reg_date</th>
			<td><input type="date" name="reg_date" value="${companyVo.reg_date}"></td>
		</tr>
		<tr>
			<th colspan="2">
				<input type="submit" value="수정하기">
				<input type="reset"	value="재작성">
				<input type="button" value="돌아가기"
				onclick="window.history.back();">
			</th>
		</tr>
	</table>
</form>
</body>
</html>