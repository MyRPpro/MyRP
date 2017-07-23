<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../../setting.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
modify_product.jsp
<form action="/base_registration/reg_product/modify_product_pro"
name="modify_product_form1" method="post">
	<table border="1">
		<tr>
			<th>product_id</th>
			<td>
				<input type="text" name="product_id"
				value="${productVo.product_id}" readonly>
			</td>
		</tr>
		<tr>
			<th>product_name</th>
			<td>
				<input type="text" name="product_name"
				value="${productVo.product_name}" required>
			</td>
		</tr>
		<tr>
			<th>purchase_unit_price</th>
			<td>
				
				<input type="number" name="purchase_unit_price"
				min="0" max="9999999999"
				value="${productVo.purchase_unit_price}" required>
			</td>
		</tr>
		<tr>
			<th>sale_unit_price</th>
			<td>
				<input type="number" name="sale_unit_price"
				min="0" max="9999999999"
				value="${productVo.sale_unit_price}" required>
			</td>
		</tr>
		<tr>
			<th>use_state</th>
			<td>
				<label for="used">사용</label>
				<input type="radio" name="use_state" id="used" value="Y"
				<c:if test="${productVo.use_state == 'Y'}">checked</c:if>>
				<label for="unused">비사용</label>
				<input type="radio" name="use_state" id="unused" value="N"
				<c:if test="${productVo.use_state == 'N'}">checked</c:if>>
			</td>
		</tr>
		<tr>
			<th>reg_date</th>
			<td>
				<input type="date" name="reg_date" 
				value="<fmt:formatDate 
						value='${productVo.reg_date}' pattern='yyyy-MM-dd'/>" 
				required>
			</td>
		</tr>
		<tr>
			<th colspan="2">
				<input type="submit" value="수정하기">
				<input type="reset"	value="재작성">
				<input type="button" value="돌아가기"
				onclick="window.location='/base_registration/reg_product/product_list';">
			</th>
		</tr>
	</table>
</form>
</body>
</html>