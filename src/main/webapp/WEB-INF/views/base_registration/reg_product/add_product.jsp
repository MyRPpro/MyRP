<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../../setting.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	function onload() {
		document.add_product_form1.product_id.focus();
	}
	
	function validate_form() {
		if(document.add_product_form1.dupcheck.value == 0) {
			alert("상품 번호의 중복체크가 필요합니다.");			
			document.add_product_form1.dup_check_btn.focus();
			return false;
		}
	}
	
	function check_dup() {
		if(!document.add_product_form1.product_id.value) {
			alert("먼저 상품 번호에 값을 입력하세요.")
			document.add_product_form1.product_id.focus();
			return false;
		}
		var product_id = document.add_product_form1.product_id.value;
		var url ="/base_registration/reg_product/add_product_dupCheck?product_id="+product_id;
		
		window.open(url, "dupCheck", "menubar=no, width=300, height=200");

	}
	
	function check_change() {
		document.add_product_form1.dupcheck.value = 0;
	}
</script>
<body onload="onload();">
add_product.jsp
<form action="/base_registration/reg_product/add_product_pro"
name="add_product_form1" method="post" onsubmit="return validate_form();">
	<table border="1">
		<tr>
			<th>product_id</th>
			<td>
				<input type="text" name="product_id"
				maxlength="10" required
				onchange="return check_change();">
				<input type="button" name="dup_check_btn" value="중복확인"
				onclick="return check_dup();">
			</td>
		</tr>
		<tr>
			<th>product_name</th>
			<td>
				<input type="text" name="product_name" required>
			</td>
		</tr>
		<tr>
			<th>purchase_unit_price</th>
			<td>
				<input type="number" name="purchase_unit_price"
				min="0" max="9999999999" value="0" required>
			</td>
		</tr>
		<tr>
			<th>sale_unit_price</th>
			<td>
				<input type="number" name="sale_unit_price"
				min="0" max="9999999999" value="0" required>
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
			<th>reg_date</th>
			<td>
				<c:set var="now" value="<%= new java.util.Date() %>"/>
				<input type="date" name="reg_date" 
				value="<fmt:formatDate 
						value='${now}' pattern='yyyy-MM-dd'/>" 
				required>
			</td>
		</tr>
		<tr>
			<th colspan="2">
				<input type="submit" value="등록하기">
				<input type="reset"	value="재작성">
				<input type="button" value="돌아가기"
				onclick="window.location='/base_registration/reg_product/product_list';">
			</th>
		</tr>
	</table>
	<input type="hidden" name="dupcheck" value="0">
</form>
</body>
</html>