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
modify_product_pro.jsp
<c:if test="${cnt == 1}">
	<script type="text/javascript">
		alert("상품 정보가 수정되었습니다.");
		$("#main_screen").load("/base_registration/reg_product/product_list");
	</script>
</c:if>
<c:if test="${cnt == 0}">
	<script type="text/javascript">
		alert("상품 정보 수정을 실패하였습니다.");
		$("#page11210_div02").load("/base_registration/reg_product/modify_product"+
				"?product_id="+${product_id});
	</script>
</c:if>
</body>
</html>