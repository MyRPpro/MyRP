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
<script type="text/javascript">
	function autofocus() {
		document.add_personnel_card_form1.employee_id.focus();
	}
	
	function validate_form() {
		if(document.add_personnel_card_form1.dupcheck.value == 0) {
			alert("사원 번호의 중복체크가 필요합니다.");			
			document.add_personnel_card_form1.dup_check_btn.focus();
			return false;
		}
		if(document.add_personnel_card_form1.dept_id.value == 0) {
			alert("부서는 반드시 선택해야 합니다.");
			document.add_personnel_card_form1.dept_id.focus();
			return false;
		}
		if(document.add_personnel_card_form1.hr_code_id.value == 0) {
			alert("직급은 반드시 선택해야 합니다.");
			document.add_personnel_card_form1.hr_code_id.focus();
			return false;
		}
		
		var reg_name = /^[가-힣]{2,5}$/; //이름 유효성검사
		var employee_name = document.add_personnel_card_form1.employee_name;
		var result_name = reg_name.test(employee_name.value);
		if(!result_name) {
			alert("이릅은 2~5자의 한글로 입력해야 합니다.");
			employee_name.value = "";
			employee_name.focus();
			return false;
		}
		
		var reg_sId1 = /^\d{6}$/; //주민번호 유효성 검사
		var reg_sId2 = /^(1|2|3|4)\d{6}$/;
		var residence_reg_no1 = document.add_personnel_card_form1.residence_reg_no1;
		var residence_reg_no2 = document.add_personnel_card_form1.residence_reg_no2;
		var result_sId1 = reg_sId1.test(residence_reg_no1.value);
		var result_sId2 = reg_sId2.test(residence_reg_no2.value);
		if(!result_sId1) {
			alert("생년월일이 잘못입력되었습니다.")
			residence_reg_no1.value= "";
			residence_reg_no1.focus();
			return false;
		} else if(!result_sId2) {
			alert("7자리의 값을 정확하게 입력해야 합니다.");
			residence_reg_no2.value = "";
			residence_reg_no2.focus();
			return false;
		}
	}
	
	function check_dup() {
		if(!document.add_personnel_card_form1.employee_id.value) {
			alert("먼저 사원 번호에 값을 입력하세요.")
			document.add_personnel_card_form1.employee_id.focus();
			return false;
		}
		var employee_id = document.add_personnel_card_form1.employee_id.value;
		var url ="/hr_management/manage_personnel_card/add_personnel_card_dupCheck?employee_id="+employee_id;
		window.open(url, "dupCheck", "menubar=no, width=300, height=200");
	}
	
	function check_change() {
		document.add_personnel_card_form1.dupcheck.value = 0;
	}
	
	function emailChk(formId) {
		var form = document.add_personnel_card_form1;
		if(form.email3.value != 0) {
			form.email2.value = form.email3.value;
			form.email2.setAttribute("disabled",true);
		} else if(form.email3.value == 0) {
			form.email2.value = "";
			form.email2.removeAttribute("disabled");
			form.email2.focus();
		}	
	}
	
	function addPicture() {
		if(document.add_personnel_card_form1.dupcheck.value == 0) {
			alert("사원번호 중복확인을 완료 후 사진 등록이 가능합니다.");
			document.add_personnel_card_form1.dup_check_btn.focus();
			return false;
		}
		var employee_id = document.add_personnel_card_form1.employee_id.value;
		var url = "/hr_management/manage_personnel_card/add_personnel_card_picture?employee_id="+employee_id;
		window.open(url, "addPicture", "menubar=no, width=500, height=300");
	}
</script>
<body onload="autofocus();">
add_personnel_card.jsp
<form action="/hr_management/manage_personnel_card/add_personnel_card_pro"
method="post" name="add_personnel_card_form1"
onsubmit="return validate_form();">
	<div id="employee_picture_div">
	</div>
	<table border="1">
		<tr>
			<th>employee_id</th>
			<td>
				<input type="number" name="employee_id"
				min="1" max="9999" required onchange="return check_change();">
				<input type="button" name="dup_check_btn"
				value="중복확인" onclick="return check_dup();">
			</td>
		</tr>
		<tr>
			<th>employee_name</th>
			<td>
				<input type="text" name="employee_name"
				maxlength="50" required>
			</td>
		</tr>
		<tr>
			<th>dept_name</th>
			<td>
				<select name="dept_id">
					<option value=0 selected>부서 선택</option>
					<c:forEach var="dept" items="${deptVos}">
						<option value="${dept.dept_id}">
							${dept.dept_name}
						</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<th>hr_code_name</th>
			<td>
				<select name="hr_code_id">
					<option value=0 selected>직급 선택</option>
					<c:forEach var="hr_code" items="${hr_codeVos}">
						<option value="${hr_code.hr_code_id}">
							${hr_code.hr_code_name}
						</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<th>residence_reg_no</th>
			<td>
				<input type="text" name="residence_reg_no1"
				maxlength="6" required>
				-
				<input type="text" name="residence_reg_no2"
				maxlength="7" required>
			</td>
		</tr>
		<tr>
			<th>join_date</th>
			<td>
				<c:set var="now" value="<%= new java.util.Date() %>"/>
				<input type="date" name="join_date" 
				value="<fmt:formatDate 
						value='${now}' pattern='yyyy-MM-dd'/>" 
				required>
			</td>
		</tr>
		<tr>
			<th>tel</th>
			<td>
				<input type="text" name="tel" maxlength="30">
			</td>
		</tr>
		<tr>
			<th>mobile_tel</th>
			<td>
				<input type="text" name="mobile_tel" maxlength="30">
			</td>
		</tr>
		<tr>
			<th>passport_no</th>
			<td>
				<input type="text" name="passport_no" maxlength="9">
			</td>
		</tr>
		<tr>
			<td>email</td>
			<td>
				<input type="text" name="email1"
				maxlength="20">
				@
				<input type="text" name="email2"
				maxlength="19">
				<select name="email3"
				onchange="emailChk();">
					<option value="0" selected>직접 입력</option>
					<option value="gmail.com">gmail.com</option>
					<option value="naver.com">naver.com</option>
					<option value="daum.net">daum.net</option>
					<option value="nate.com">nate.com</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>address</th>
			<td>
				<input type="text" name="address">
			</td>
		</tr>
		<tr>
			<th>hourly_wage</th>
			<td>
				<input type="number" name="hourly_wage"
				min="0" max="999999" required>
			</td>
		</tr>
		<tr>
			<th>salary_account</th>
			<td>
				<input type="text" name="salary_account"
				value="0" maxlength="20" required>
			</td>
		</tr>
		<tr>
			<th colspan="2">
				<input type="submit" value="등록하기">
				<input type="reset"	value="재작성">
				<input type="button" value="사진추가"
				onclick="addPicture();">
				<input type="button" value="돌아가기"
				onclick="window.history.back();">
			</th>
		</tr>
	</table>
	<input type="hidden" name="dupcheck" value="0">
</form>
</body>
</html>