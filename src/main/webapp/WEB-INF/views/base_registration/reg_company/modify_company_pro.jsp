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
modify_company_pro.jsp
<c:if test="${cnt == 1}">
	<script type="text/javascript">
		alert("거래처 정보가 수정되었습니다.");
		$("#main_screen").load("/base_registration/reg_company/company_list");
	</script>
</c:if>
<c:if test="${cnt == 0}">
	<script type="text/javascript">
		alert("거래처 정보 수정을 실패하였습니다.");
		$("#page11110_div02").load("/base_registration/reg_company/modify_company"+
				"?company_id="+${company_id});
	</script>
</c:if>
</body>
</html>