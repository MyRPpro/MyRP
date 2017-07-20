<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h3> 판매 리스트 페이지 : sales_list.jsp</h3>
	
	<table border="1">
		
		<tr>
			
			<td>sales_id : </td>
			<td><fmt:formatNumber value="${salesVo.sales_id}" type="number"/></td>
			
		</tr>	
		
		<tr>
			<td>order_id : </td>
			<td><fmt:formatNumber value="${salesVo.order_id}" type="number"/></td>
		</tr>	
		
		<tr>
			<td>account_id : </td>
			<td><fmt:formatNumber value="${salesVo.account_id}" type="number"/></td>
		</tr>	
		
		<tr>
			<td>product_id : </td>
			<td><fmt:formatNumber value="${salesVo.product_id}" type="number"/></td>
		</tr>	
		
		
		<tr>
			<td>company_id : </td>
			<td><fmt:formatNumber value="${salesVo.company_id}" type="number"/></td>
		</tr>	
		
		
		<tr>
			<td>employee_id : </td>
			<td>${salesVo.employee_id}</td>
		</tr>	
		
		
		<tr>
			<td>reg_date : </td>
			<td>${salesVo.reg_date}</td>
		</tr>	
		
		
		<tr>
			<td>update_date : </td>
			<td>${salesVo.update_date}</td>
		</tr>	
		
		
		<tr>
			<td>storage_out_date : </td>
			<td>${salesVo.storage_out_date}</td>
		</tr>	
		
		<tr>
			<td>count_sales : </td>
			<td>${salesVo.count_sales}</td>
		</tr>	
		
		
		<tr>
			<td>count_sales : </td>
			<td>${salesVo.count_sales}</td>
		</tr>	
		
		
		<tr>
			<td>selling_price : </td>
			<td><fmt:formatNumber value="${salesVo.selling_price}" type="currency"/></td>
		</tr>
			
		<tr>
			<td>condition_note_receivable : </td>
			<td>${salesVo.condition_note_receivable}</td>
		</tr>	
		
		
		<tr>
			<td>sales_state : </td>
			<td><fmt:formatNumber value="${salesVo.sales_state}" type="number"/></td>
		</tr>
		
	</table>
	
	<input type="submit" value="수정하기"> 
	
	<input type="button" value="뒤로" onclick="window.history.back();"> 
	
	
</body>
</html>