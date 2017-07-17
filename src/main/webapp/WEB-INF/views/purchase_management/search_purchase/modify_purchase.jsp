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
	
	
	<c:if test="${cnt == 1}">
		<script type="text/javascript">
			setTimeout(function(){
				alert("정상적으로 수정되었습니다.");
				window.location="/purchase_management/search_purchase/purchase_list"
			}, 500);
		</script>
	</c:if>
	
	<c:if test="${cnt != 1}">
		<script type="text/javascript">
			alert("수정작업중 오류가 발생했습니다.");
			window.history.back();
			
		</script>
	</c:if>
	
</body>
</html>