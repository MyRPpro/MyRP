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
			setTimeout(function(){
				alert("정상적으로 수정되었습니다.");
				/* window.location="/purchase_management/search_purchase/purchase_list" */
			}, 200);
		</script>
	</c:if>
	
	<c:if test="${cnt == 0}">
		<script type="text/javascript">
			setTimeout(function(){
				alert("변경된 내용이 없습니다.");
			},200);
		</script>
	</c:if>


</body>
</html>