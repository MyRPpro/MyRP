<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../../setting.jsp" %>
<html>
<head>
</head>
<body>
<img src="/resources/images/${employee_id}.jsp">
<script type="text/javascript">
	var msg = "${msg}";
	parent.showPicture(msg);
</script>
</body>
</html>