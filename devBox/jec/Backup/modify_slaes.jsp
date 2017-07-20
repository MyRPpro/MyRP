<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h3> 판매 내역 수정 페이지 : modify_slaes.jsp</h3>
	
	<form action="/sales_management/modify_sales_pro"
	name="modify_sales_form" method="post">
	
		<table border="1">
			<tr>
				<th>sales_id</th>
				<td>
					<input type="text" name="sales_id" 	value="${salesVo.sales_id}" maxlength="10" readonly="readonly">
				</td>
			</tr>
			<tr>
				<th>order_id</th>
				<td>
					<input type="text" name="account_id" value="${salesVo.order_id}" readonly >
					
				</td>
			</tr>
			<tr>
				<th>account_id</th>
				<td>
					<input type="text" name="order_id" value="${salesVo.account_id}" maxlength="12" readonly >
				</td>
			</tr>
			<tr>
				<th>product_id</th>
				<td>
					<input type="text" name="product_id" value="${salesVo.product_id}" maxlength="20" readonly >
				</td>
			</tr>
			<tr>
				<th>company_name</th>
				<td>
					<input type="text" name="company_name" value="${salesVo.company_name}">
				</td>
			</tr>
			<tr>
				<th>employee_id</th>
				<td>
					<input type="text" name="employee_id" value="${salesVo.employee_id}">
				</td>
			</tr>
			<tr>
				<th>reg_date</th>
				<td>
					<input type="date" name="reg_date" value="${salesVo.reg_date}">
				</td>
			</tr>
			
			<tr>
				<th>update_date</th>
				<td>
					<input type="date" name="biz_item" value="${salesVo.update_date}">
				</td>
			</tr>
			<tr>
				<th>storage_out_date</th>
				<td>
					<input type="date" name="update_date" value="${salesVo.storage_out_date}">
				</td>
			</tr>
			<tr>
				<th>count_sales</th>
				<td>
					<input type="number" name="count_sales" value="${salesVo.count_sales}">
				</td>
			</tr>
			<tr>
				<th>selling_price</th>
				<td>
					<input type="number" name="selling_price" value="${salesVo.selling_price}">
				</td>
			</tr>
			<tr>
				<th>sales_state</th>
				<td>
					<input type="number" name="sales_state" value="${salesVo.sales_state}">
				</td>
			</tr>
			<tr>
				<th>condition_note_receivable</th>
				<td>
					<input type="number" name="condition_note_receivable" value="${salesVo.condition_note_receivable}">
				</td>
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