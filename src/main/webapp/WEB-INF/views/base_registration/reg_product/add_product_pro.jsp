<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../../setting.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
add_product_pro.jsp
<c:if test="${cnt == 1}">
	<script type="text/javascript">
		alert("상품이 정상적으로 등록 되었습니다.");
		$("#main_screen").load("/base_registration/reg_product/product_list");
	</script>
</c:if>
<c:if test="${cnt == 0}">
	<script type="text/javascript">
		alert("상품의 등록을 실패하였습니다.");
		$("#page11210_div02").load("/base_registration/reg_product/add_product");
	</script>
</c:if>
</body>
</html>