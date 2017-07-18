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
modify_personnel_card.jsp
<form action="/hr_management/manage_personnel_card/modify_personnel_card_pro"
method="post" name="modify_personnel_card_form1"
onsubmit="return validate_form();">
	<div id="employee_picture_div">
	</div>
	<table border="1">
		<tr>
			<th>employee_id</th>
			<td>
				<input type="number" name="employee_id"
				value="${personnel_cardDto.employee_id}" readonly>
			</td>
		</tr>
		<tr>
			<th>employee_name</th>
			<td>
				<input type="text" name="employee_name"
				value="${personnel_cardDto.employee_name}"
				maxlength="50" required>
			</td>
		</tr>
		<tr>
			<th>dept_name</th>
			<td>
				<input type="hidden" name="dept_id"
				value="${personnel_cardDto.dept_id}">
				<input type="text" name="dept_name"
				value="${personnel_cardDto.dept_name}" readonly>
			</td>
		</tr>
		<tr>
			<th>hr_code_name</th>
			<td>
				<input type="hidden" name="hr_code_group_rank"
				value="${personnel_cardDto.hr_code_group_rank}">
				<input type="hidden" name="rank_code"
				value="${personnel_cardDto.rank_code}">
				<input type="text" name="hr_code_name"
				value="${personnel_cardDto.hr_code_name}" readonly>
			</td>
		</tr>
		<tr>
			<th>residence_reg_no</th>
			<td>
				<input type="text" name="residence_reg_no1"
				value="${fn:substring(personnel_cardDto.residence_reg_no,0,6)}"
				maxlength="6" required>
				-
				<input type="text" name="residence_reg_no2"
				value="${fn:substring(personnel_cardDto.residence_reg_no,6,13)}"
				maxlength="7" required>
			</td>
		</tr>
		<tr>
			<th>join_date</th>
			<td>
				<input type="date" name="join_date" 
				value="<fmt:formatDate 
						value='${personnel_cardDto.join_date}'
						pattern='yyyy-MM-dd'/>" 
				required>
			</td>
		</tr>
		<tr>
			<th>tel</th>
			<td>
				<input type="text" name="tel" 
				value="${personnel_cardDto.tel}"
				maxlength="30">
			</td>
		</tr>
		<tr>
			<th>mobile_tel</th>
			<td>
				<input type="text" name="mobile_tel"
				value="${personnel_cardDto.mobile_tel}"
				maxlength="30">
			</td>
		</tr>
		<tr>
			<th>passport_no</th>
			<td>
				<input type="text" name="passport_no"
				value="${personnel_cardDto.passport_no}"
				maxlength="9">
			</td>
		</tr>
		<tr>
			<td>email</td>
			<td>
				<input type="text" name="email1"
				value="${fn:split(personnel_cardDto.email,'@')[1]}"
				maxlength="20">
				@
				<input type="text" name="email2"
				value="${fn:split(personnel_cardDto.email,'@')[2]}"
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
				<input type="text" name="address"
				value="${personnel_cardDto.address}">
			</td>
		</tr>
		<tr>
			<th>hourly_wage</th>
			<td>
				<input type="number" name="hourly_wage"
				value="${personnel_cardDto.hourly_wage}"
				min="0" max="999999" required>
			</td>
		</tr>
		<tr>
			<th>salary_account</th>
			<td>
				<input type="text" name="salary_account"
				value="${personnel_cardDto.salary_account}"
				maxlength="20" required>
			</td>
		</tr>
		<tr>
			<th colspan="2">
				<input type="submit" value="수정하기">
				<input type="reset"	value="재작성">
				<input type="button" value="사진추가"
				onclick="addPicture();">
				<input type="button" value="돌아가기"
				onclick="window.history.back();">
			</th>
		</tr>
	</table>
</form>
</body>
</html>