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
reg_salary_info_pro.jsp
<c:if test="${cnt == 1}">
	<script type="text/javascript">
		alert("급여대장이 정상적으로 등록 되었습니다.");
		$("#main_screen").load("/hr_management/manage_salary/salary_register_search");
	</script>
</c:if>
<c:if test="${cnt == 0}">
	<script type="text/javascript">
		alert("급여대장 등록을 실패하였습니다.");
		$("#page16520").slideUp;
		$("#page16510_div01").slideDown();
		$("#page16510_div02").slideDown();
		$("#page16510_div03").slideDown();
	</script>
</c:if>
</body>
</html>