<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../../setting.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src = "/resources/accounting_management/accounting_management_script.js"></script>
</head>
<body>
	<input type="button" value="sales" onclick="window.location='/accounting_management/statement_management/call_connected_id?select_connection=1'">
	<input type="button" value="purchase" onclick="window.location='/accounting_management/statement_management/call_connected_id?select_connection=2'">
	<input type="button" value="salary" onclick="window.location='/accounting_management/statement_management/call_connected_id?select_connection=3'">
	<input type="button" value="tax" onclick="window.location='/accounting_management/statement_management/call_connected_id?select_connection=4'">
	
	<table border="1">
		<c:if test="${param.select_connection==1}">
		<tr>
				<th> sales_id </th>
				<th> account_id </th>
				<th> account_name </th>
				<th> account_value </th>
				<th> reg_date </th>
		</tr>
		</c:if>
		<c:if test="${param.select_connection==2}">
		<tr>
				<th> purchase_id </th>
				<th> account_id </th>
				<th> account_name </th>
				<th> account_value </th>
				<th> reg_date </th>
		</tr>
		</c:if>
		<c:if test="${param.select_connection==3}">
		<tr>
				<th> salary_register </th>
				<th> account_id </th>
				<th> account_name </th>
				<th> account_value </th>
				<th> reg_date </th>
		</tr>
		</c:if>
		<c:if test="${param.select_connection==4}">
		<tr>
			<th> account_id </th>
			<th> account_name </th>
			<th> account_balance </th>
		</tr>
		</c:if>
	<c:if test="${param.select_connection==1}"> <!-- sales -->
		<c:forEach var="dto" items="${sales_dtos}">
		<tr>
			<td> ${dto.sales_id} </td>
			<td><a href="javascript:void(0);" onclick="set_connected_id(${dto.sales_id},${dto.account_id},'${dto.account_name}', ${dto.account_value},1);"> 
					${dto.account_id}
				</a> 
			</td>
			<td>
			${dto.account_name}</td>
			<td> ${dto.account_value}</td>
			<td> ${dto.reg_date}</td>
		</tr>
		</c:forEach>	
	</c:if>
	<c:if test="${param.select_connection==2}"> <!-- purchase -->
		<c:forEach var="dto" items="${purchase_dtos}">
		<tr>
			<td> ${dto.purchase_id} </td>
			<td><a href="javascript:void(0);" onclick="set_connected_id(${dto.purchase_id},${dto.account_id},'${dto.account_name}', ${dto.account_value},2)">
					${dto.account_id}
				 </a> 
			</td>
			<td>
			${dto.account_name}</td>
			<td> ${dto.account_value}</td>
			<td> ${dto.reg_date}</td>
		</tr>
		</c:forEach>
	</c:if>
	<c:if test="${param.select_connection==3}"> <!-- salary -->
		<c:forEach var="dto" items="${salary_dtos}">
		<tr>
			<td> ${dto.salary_register_id} </td>
			<td><a href="javascript:void(0);" onclick="set_connected_id(${dto.salary_register_id},${dto.account_id},'${dto.account_name}', ${dto.account_value},3)">
					${dto.account_id}
				 </a> 
			</td>
			<td>
			${dto.account_name}</td>
			<td> ${dto.account_value}</td>
			<td> ${dto.reg_date}</td>
		</tr>
		</c:forEach>
	</c:if>
	<c:if test="${param.select_connection==4}">  <!-- tax -->
		<c:forEach var="dto" items="${tax_dtos}">
		<tr>
			<td>
				<a href="javascript:void(0);" onclick="set_account_id(${dto.account_id},'${dto.account_name}', ${dto.account_value},4)">
				${dto.account_id}
				</a>
			</td>
			<td>
				${dto.account_name}
			</td>
			<td>
				${dto.account_value}
			</td>
		</tr>
		</c:forEach>
	</c:if>
	
	</table>
</body>
</html>