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

	function emailChk(formId) {
		var form = document.page16320_form01;
		if(form.email3.value != 0) {
			form.email2.value = form.email3.value;
			form.email2.setAttribute("readonly",true);
		} else if(form.email3.value == 0) {
			form.email2.value = "";
			form.email2.removeAttribute("readonly");
			form.email2.focus();
		}	
	}
	
	$("#page16320_btn02").bind("click", function() {
		var dupcheck = $("form[name='page16320_form01'] input[name='dupcheck']");
		if(dupcheck.val() == 0) {
			alert("사원번호 중복확인을 완료 후 사진 등록이 가능합니다.");
			$("#page16320_btn01").focus();
			return false;
		}
		var $employee_id = $("form[name='page16320_form01'] input[name='employee_id']");
		var url = "/hr_management/manage_personnel_card/add_personnel_card_picture?employee_id="+$employee_id.val();
		$("#page16320_div01").slideUp();
		$("#page16320_div02").slideDown();
		$("#page16320_div02").load(url);
		return false;
	});
	
	
	$("#page16320_div01_toggle").bind("click", function() {
		$("#page16320_div01").slideToggle();
		return false;
	});
	
	$("#page16320_btn03").bind("click", function() {
		$("#page16320").slideUp();
		$("#page16310_div01").slideDown();
		return false;
	});
	
	$("#page16320_btn01").bind("click", function() {
		var $employee_id = $("form[name='page16320_form01'] input[name='employee_id']");
		if(!$employee_id.val()) {
			alert("먼저 사원 번호에 값을 입력하세요.");
			$employee_id.focus();
			return false;
		}
		$("#page16320_div01").slideUp();
		$.ajax({
			data:		null,
			type:		'get',
			url:		'/hr_management/manage_personnel_card/add_personnel_card_dupCheck?employee_id='+$employee_id.val(),
			success: function(response) {
				$("#page16320_div02").html(response);
				$("form[name='page16323_form02'] input[name='employee_id']").focus();
			}
		});
		return false;
	});

	$("form[name='page16320_form01'] input[name='employee_id']").on("change", function() {
		$("form[name='page16320_form01'] input[name='dupcheck']").val(0);
		return false;
	});
	
	$("form[name='page16320_form01']").on("submit", function() {
		if(document.page16320_form01.dupcheck.value == 0) {
			alert("사원 번호의 중복체크가 필요합니다.");			
			$("#page16320_btn01").focus();
			return false;
		}
		if(document.page16320_form01.dept_id.value == 0) {
			alert("부서는 반드시 선택해야 합니다.");
			document.page16320_form01.dept_id.focus();
			return false;
		}
		if(document.page16320_form01.hr_code_id.value == 0) {
			alert("직급은 반드시 선택해야 합니다.");
			document.page16320_form01.hr_code_id.focus();
			return false;
		}
		var reg_name = /^[가-힣]{2,6}$/; //이름 유효성검사
		var employee_name = document.page16320_form01.employee_name;
		var result_name = reg_name.test(employee_name.value);
		if(!result_name) {
			alert("이릅은 2~6자의 한글로 입력해야 합니다.");
			employee_name.value = "";
			employee_name.focus();
			return false;
		}
		var reg_sId1 = /^\d{6}$/; //주민번호 유효성 검사
		var reg_sId2 = /^(1|2|3|4)\d{6}$/;
		var residence_reg_no1 = document.page16320_form01.residence_reg_no1;
		var residence_reg_no2 = document.page16320_form01.residence_reg_no2;
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
		var data = $(this).serialize();
		$.ajax({
			data:	data,
			type:	'post',
			url:	'/hr_management/manage_personnel_card/add_personnel_card_pro',
			success: function(response) {
				$("#page16320_div02").html(response);
			} 
		});
		return false;
	});
</script>
<body>
<div class="panel panel-default" id="page16320">
	<div class="panel-heading">
		<a id="page16320_div01_toggle">[16320]add_personnel_card.jsp</a>
	</div>
	<div  class="panel-body" id="page16320_div01">
		<form action="#" name="page16320_form01">
			<div id="employee_picture_div">
			</div>
			<table class="table">
				<tr>
					<th>사원번호＊</th>
					<td colspan="3">
						<div class="input-group">
							<input class="form-control input-sm" type="number" name="employee_id" value="${employee_id}"
							min="1" max="9999" required>
							<span class="input-group-btn">
								<input class="btn btn-default btn-sm" type="button"
								value="중복확인" id="page16320_btn01">
							</span>
						</div>
					</td>
				</tr>
				<tr>
					<th>사원명＊</th>
					<td colspan="3">
						<input class="form-control input-sm" type="text" name="employee_name"
						maxlength="50" required>
					</td>
				</tr>
				<tr>
					<th>부서명＊</th>
					<td colspan="3">
						<select class="form-control input-sm" name="dept_id">
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
					<th>직급＊</th>
					<td colspan="3">
						<select class="form-control input-sm" name="hr_code_id">
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
					<th>주민번호＊</th>
					<td>
						<input class="form-control input-sm" type="text" name="residence_reg_no1" maxlength="6" required>
					</td>
					<td>-</td>
					<td>
						<input class="form-control input-sm" type="text" name="residence_reg_no2"
						maxlength="7" required>
					</td>
				</tr>
				<tr>
					<th>입사일＊</th>
					<td colspan="3">
						<c:set var="now" value="<%= new java.util.Date() %>"/>
						<input class="form-control input-sm" type="date" name="join_date" 
						value="<fmt:formatDate value='${now}' pattern='yyyy-MM-dd'/>" 
						required>
					</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td colspan="3">
						<input class="form-control input-sm" type="text" name="tel" maxlength="30">
					</td>
				</tr>
				<tr>
					<th>휴대전화</th>
					<td colspan="3">
						<input class="form-control input-sm" type="text" name="mobile_tel" maxlength="30">
					</td>
				</tr>
				<tr>
					<th>여권번호</th>
					<td colspan="3">
						<input class="form-control input-sm" type="text" name="passport_no" maxlength="9">
					</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td>
						<input class="form-control input-sm" type="text" name="email1" maxlength="20">
					</td>
					<td>@</td>
					<td>
						<div class="input-group">
							<input class="form-control input-sm" type="text" name="email2" maxlength="19">
							<span class="input-group-btn">
								<select class="btn btn-default btn-sm" name="email3" onchange="emailChk();">
									<option value="0" selected>직접 입력</option>
									<option value="gmail.com">gmail.com</option>
									<option value="naver.com">naver.com</option>
									<option value="daum.net">daum.net</option>
									<option value="nate.com">nate.com</option>
								</select>
							</span>
						</div>
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td colspan="3">
						<input class="form-control input-sm" type="text" name="address">
					</td>
				</tr>
				<tr>
					<th>시급＊</th>
					<td colspan="3">
						<input class="form-control input-sm" type="number" name="hourly_wage"
						min="0" max="999999" required>
					</td>
				</tr>
				<tr>
					<th>급여계좌</th>
					<td colspan="3">
						<input class="form-control input-sm" type="text" name="salary_account"
						maxlength="20">
					</td>
				</tr>
				<tr>
					<th colspan="4">
						<input type="hidden" name="dupcheck"
						<c:if test="${dupcheck == null}">value="0"</c:if>
						<c:if test="${dupcheck == 1}">value="1"</c:if>>
						<input class="btn btn-default btn-sm" type="submit" value="등록하기">
						<input class="btn btn-default btn-sm" type="reset"	value="재작성">
						<input class="btn btn-default btn-sm" type="button" value="사진추가" id="page16320_btn02">
						<input class="btn btn-default btn-sm" type="button" value="닫기" id="page16320_btn03">
					</th>
				</tr>
			</table>
		</form>
	</div>
	<div id="page16320_div02"></div>
</div>
</body>
</html>