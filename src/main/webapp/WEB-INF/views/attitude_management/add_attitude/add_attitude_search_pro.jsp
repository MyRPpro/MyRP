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
add_attitude_search_pro.jsp
<c:if test="${cnt == 1}">
	<script type="text/javascript">
		alert("휴가등록이 정상적으로 등록 되었습니다.");
		window.location = "/attitude_management/search_attitude/search_attitude_search";
	</script>
</c:if>
<c:if test="${cnt == 2}">
	<script type="text/javascript">
		alert("이미 승인 받은 휴가일입니다 다시 등록 해주세요.");
		window.location = "/attitude_management/search_attitude/search_attitude_search";
	</script>
</c:if>
<c:if test="${cnt == 0}">
	<script type="text/javascript">
		alert("휴가등록 에 실패 하였습니다.");
		window,history.back(-2);
	</script>
</c:if>

</body>
</html>