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
	function autofocus() {
		document.add_product_dupCheck_form1.product_id.focus();
	}
	
	function setId(id) {
		opener.document.add_product_form1.product_id.value = id;
		opener.document.add_product_form1.dupcheck.value = 1;
		self.close();
	}
</script>
<body onload="autofocus();">
add_product_dupCheck.jsp
<c:if test="${cnt == 0}">
	<table border="1">
		<tr>
			<th>선택하신 [${product_id}]는 사용가능합니다.</th>
		</tr>
		<tr>
			<th>
				<input type="button" value="확인"
				onclick="setId('${product_id}');">
			</th>
		</tr>
	</table>
</c:if>
<c:if test="${cnt == 1}">
	<form action="/base_registration/reg_product/add_product_dupCheck" 
	name="add_product_dupCheck_form1" method="get">
		<table border="1">
			<tr>
				<th colspan="2">
					선택하신 [${product_id}]는<br>
					[${dup_product_name}]에 사용중입니다.<br>
					새로운 상품번호를 선택하세요.
				</th>
			</tr>
			<tr>
				<th>product_id</th>
				<td>
					<input type="text" name="product_id" 
					maxlength="10" required>
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="submit" value="중복확인">
					<input type="reset" value="재작성">
					<input type="button" value="닫기"
					onclick="self.close()">
				</th>
			</tr>
		</table>
	</form>
</c:if>
</body>
</html>