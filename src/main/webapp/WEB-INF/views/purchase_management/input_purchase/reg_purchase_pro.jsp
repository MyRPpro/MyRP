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

	<c:if test="${cnt == 1}">
		<script type="text/javascript">
			setTimeout(function(){
				alert("정상적으로 입력되었습니다.");
				window.location="/purchase_management/input_purchase/reg_purchase"
			}, 500);
		</script>
	</c:if>
	
	<c:if test="${cnt != 1}">
		<script type="text/javascript">
			alert("입력작업중 오류가 발생했습니다.");
			window.history.back();
			
		</script>
	</c:if>
	
</body>
</html>