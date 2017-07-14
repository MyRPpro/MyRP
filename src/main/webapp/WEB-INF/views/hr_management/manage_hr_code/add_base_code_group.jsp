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
	function autofocus() {
		document.add_base_code_group_form1.hr_code_group_id.focus();
	}
	
	function validate_form() {
		if(document.add_base_code_group_form1.dupcheck.value == 0) {
			alert("인사코드 그룹 번호의 중복체크가 필요합니다.");			
			document.add_base_code_group_form1.dup_check_btn.focus();
			return false;
		}
	}
	
	function check_dup() {
		if(!document.add_base_code_group_form1.hr_code_group_id.value) {
			alert("먼저 인사코드 그룹 번호에 값을 입력하세요.")
			document.add_base_code_group_form1.hr_code_group_id.focus();
			return false;
		}
		var hr_code_group_id = document.add_base_code_group_form1.hr_code_group_id.value;
		var url ="/hr_management/manage_hr_code/add_base_code_group_dupCheck?hr_code_group_id="+hr_code_group_id;
		
		window.open(url, "dupCheck", "menubar=no, width=300, height=200");
	}
	
</script>
<body onload="autofocus();">
add_base_code_group.jsp
<form action="/hr_management/manage_hr_code/add_base_code_group_pro"
name="add_base_code_group_form1" method="post" onsubmit="return validate_form();">
	<table border="1">
		<tr>
			<th>hr_code_group_id</th>
			<td>
				<input type="number" name="hr_code_group_id" min="1" max="9" step="1" required>
				<input type="button" name="dup_check_btn" value="중복확인"
				onclick="return check_dup();">
			</td>
		</tr>
		<tr>
			<th>hr_code_group_name</th>
			<td>
				<input type="text" name="hr_code_group_name" maxlength="255" required>
			</td>
		</tr>
		<tr>
			<th>use_state</th>
			<td>
				<label for="used">사용</label>
				<input type="radio" name="use_state" id="used" value="Y" checked>
				<label for="unused">비사용</label>
				<input type="radio" name="use_state" id="unused" value="N">
			</td>
		</tr>
		<tr>
			<th colspan="2">
				<input type="submit" value="등록하기">
				<input type="reset"	value="재작성">
				<input type="button" value="돌아가기"
				onclick="window.history.back();">
			</th>
		</tr>
	</table>
	<input type="hidden" name="dupcheck" value="0">
</form>
</body>
</html>