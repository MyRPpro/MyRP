<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "../../setting.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">

	function autofocus(formName) {
		document.add_base_code_group_dupCheck_form1.hr_code_group_id.focus();
	}
	
	function setId(id) {
		opener.document.add_base_code_group_form1.hr_code_group_id.value = id;
		opener.document.add_base_code_group_form1.dupcheck.value = 1;
		self.close();
	}
	
</script>
<body onload="autofocus()">
add_base_code_group_dupCheck.jsp
<c:if test="${cnt == 0}">
	<table border="1">
		<tr>
			<th>선택하신 [${hr_code_group_id}]는 사용가능합니다.</th>
		</tr>
		<tr>
			<th>
				<input type="button" value="확인" 
				onclick="setId('${hr_code_group_id}')";>
			</th>
		</tr>
	</table>
</c:if>
<c:if test="${cnt == 1}">
	<form action="/hr_management/manage_hr_code/add_base_code_group_dupCheck"
	name="add_base_code_group_dupCheck_form1" method="get">
		<table border="1">
			<tr>
				<th colspan="2">
					선택하신 [${hr_code_group_id}]는 이미 존재합니다.<br>
					새로운 인사코드를 선택하세요.
				</th>
			</tr>
			<tr>
				<th>hr_code_group_id</th>
				<td>
					<input type="number" name="hr_code_group_id"
					min="1" max="9" step="1" required>
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="submit" value="중복확인">
					<input type="reset" value="재작성">
					<input type="button" value="닫기"
					onclick="self.close()">
				</th>
			</tr>
		</table>
	</form>
</c:if>
</body>
</html>