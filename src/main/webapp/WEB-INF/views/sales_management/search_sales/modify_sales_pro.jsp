<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:if test="${cnt > 0}">
		<script type="text/javascript">
			var cnt = '${cnt}';
			setTimeout(function(){
				alert( cnt+"건이 정상적으로 수정되었습니다.");
				window.location="/sales_management/search_sales/sales_list"
			}, 200);
		</script>
	</c:if>
	
	<c:if test="${cnt == 0}">
		<script type="text/javascript">
			alert("수정 중 오류가 발생하였습니다. ");
			window.history.back();
		</script>
	</c:if>


</body>
</html>