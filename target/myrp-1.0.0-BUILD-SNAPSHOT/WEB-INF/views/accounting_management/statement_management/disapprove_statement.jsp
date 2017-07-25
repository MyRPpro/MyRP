<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../../setting.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src = "/resources/accounting_management/accounting_management_script.js"></script>
</head>
<body onunload=reload()>
	<c:if test="${scnt == cnt}"> 
		
			<c:if test="${typeCnt == 4}">
				<script type="text/javascript">
					window.onload = complete_disapproval(${statement_id});
				</script>
			</c:if>
			<c:if test="${typeCnt != 4 }">
				<script type="text/javascript">
				window.onload = complete_disapproval(${statement_id}, ${connected_id}, ${typeCnt});
				</script>
			</c:if>
			}
	</c:if>
</body>
</html>