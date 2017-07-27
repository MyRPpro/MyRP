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
modify_base_code_pro.jsp
<c:if test="${cnt == 1}">
	<script type="text/javascript">
		alert("인사코드가 정상적으로 수정 되었습니다.");
		$("#page16110_div02").load(
				"/hr_management/manage_hr_code/base_code_list"+
				"?hr_code_group_id="+${hr_code_group_id});
		$("#page16140_div01").slideDown();
	</script>
</c:if>
<c:if test="${cnt == 0}">
	<script type="text/javascript">
		alert("인사코드의 수정에 실패하였습니다.");
		$("#page16110_div02").load(
				"/hr_management/manage_hr_code/base_code_list"+
				"?hr_code_group_id="+${hr_code_group_id});
		$("#page16140_div01").slideDown();
	</script>
</c:if>
</body>
</html>