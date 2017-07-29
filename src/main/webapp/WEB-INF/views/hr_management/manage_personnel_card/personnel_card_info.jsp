<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../../setting.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	function emailChk() {
		var form = document.page16332_form01;
		if(form.email3.value != 0) {
			form.email2.value = form.email3.value;
			form.email2.setAttribute("readonly",true);
		} else if(form.email3.value == 0) {
			form.email2.value = "";
			form.email2.removeAttribute("readonly");
			form.email2.focus();
		}	
	}

	$("#page16332_btn01").bind("click", function() {
		var $employee_id = $("form[name='page16332_form01'] input[name='employee_id']");
		var url = "/hr_management/manage_personnel_card/add_personnel_card_picture?employee_id="+$employee_id.val();
		$("#page16332_div01").slideUp();
		$("#page16332_div02").slideDown();
		$("#page16332_div02").load(url);
		return false;
	});
	
	$("#page16332_btn02").bind("click", function() {
		$("#page16332").slideUp();
		$("#page16310_div01").slideDown();
		$("#page16610_div01").slideDown();
	});
	
	$("form[name='page16332_form01']").on("submit", function(event) {
		var data = $(this).serialize();
		$.ajax({
			data:	data,
			type:	'post',
			url:	'/hr_management/manage_personnel_card/modify_personnel_card_pro',
			success: function(response) {
				$("#page16332_div02").html(response);
			}
		});
		return false;
	});
</script>
<body>
<div id="page16332">
	<div id="page16332_div01">
		<form action="#" name="page16332_form01">
			<table class="table">
				<tr>
					<th colspan="2" style="width:100px; height:130px;">
						<img alt="사진 이미지" src="/resources/images/picture_employee/${employee_id}.jpg"
						width="100" height="125">
					</th>
				</tr>
				<tr>
					<th>사원번호</th>
					<td>
						<input type="number" name="employee_id"
						value="${personnel_cardDto.employee_id}" readonly>
					</td>
				</tr>
				<tr>
					<th>사원명</th>
					<td>
						<input type="text" name="employee_name"
						value="${personnel_cardDto.employee_name}"
						maxlength="50" required>
					</td>
				</tr>
				<tr>
					<th>부서명</th>
					<td>
						<input type="hidden" name="dept_id"
						value="${personnel_cardDto.dept_id}">
						<input type="text" name="dept_name"
						value="${personnel_cardDto.dept_name}" readonly>
					</td>
				</tr>
				<tr>
					<th>직급</th>
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
					<th>주민등록번호</th>
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
					<th>입사일</th>
					<td>
						<input type="date" name="join_date" 
						value="<fmt:formatDate 
								value='${personnel_cardDto.join_date}'
								pattern='yyyy-MM-dd'/>" 
						required>
					</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>
						<input type="text" name="tel" 
						value="${personnel_cardDto.tel}"
						maxlength="30">
					</td>
				</tr>
				<tr>
					<th>휴대전화</th>
					<td>
						<input type="text" name="mobile_tel"
						value="${personnel_cardDto.mobile_tel}"
						maxlength="30">
					</td>
				</tr>
				<tr>
					<th>여권번호</th>
					<td>
						<input type="text" name="passport_no"
						value="${personnel_cardDto.passport_no}"
						maxlength="9">
					</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td>
						<input type="text" name="email1"
						value="${fn:split(personnel_cardDto.email,'@')[0]}"
						maxlength="20">
						@
						<input type="text" name="email2"
						value="${fn:split(personnel_cardDto.email,'@')[1]}"
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
					<th>주소</th>
					<td>
						<input type="text" name="address"
						value="${personnel_cardDto.address}">
					</td>
				</tr>
				<tr>
					<th>시급</th>
					<td>
						<input type="number" name="hourly_wage"
						value="${personnel_cardDto.hourly_wage}"
						min="0" max="999999" required>
					</td>
				</tr>
				<tr>
					<th>급여계좌</th>
					<td>
						<input type="text" name="salary_account"
						value="${personnel_cardDto.salary_account}"
						maxlength="20" required>
					</td>
				</tr>
				<tr>
					<th colspan="2">
						<input class="btn btn-default btn-xs" type="submit" value="수정하기">
						<input class="btn btn-default btn-xs" type="reset"	value="재작성">
						<input class="btn btn-default btn-xs" type="button" value="사진추가" id="page16332_btn01">
						<input class="btn btn-default btn-xs" type="button" value="닫기" id="page16332_btn02">
					</th>
				</tr>
			</table>
		</form>
	</div>
	<div id="page16332_div02"></div>
</div>	
</body>
</html>