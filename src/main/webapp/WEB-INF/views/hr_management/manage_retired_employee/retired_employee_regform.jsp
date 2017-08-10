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
	
	$("#page16721_div01_toggle").bind("click", function(event) {
		$("#page16721_div01").slideToggle();
		return false;
	});
	
	$("#page16721_btn01").bind("click", function(event) {
		$("#page16721").slideUp();
		$("#page16720_div01").slideDown();
		return false;
	});
	
	$("form[name='page16721_form01']").on("submit", function(event) {
		var retired_date = document.page16721_form01.retired_date;
		var now = new Date();
		var select_date = new Date(retired_date.value); 
		if(select_date < now) {
			alert("퇴사일은 금일 이후로만 선택가능합니다.");
			retired_date.focus();
			return false;			
		}
		
		var data = $(this).serialize();
		$.ajax({
			data:	data,
			type:	'post',
			url:	'/hr_management/manage_retired_employee/add_retired_employee_pro',
			success: function(response) {
				$("#page16721_div02").html(response);
			}
		});
		return false;
	});

</script>
<body>
	<div class="panel panel-primary" id="page16721">
		<div class="panel-heading">
			<!-- <a id="page16721_div01_toggle">[16721]retired_employee_regform.jsp</a> -->
			<h3 class="panel-title">
				<span class="glyphicon glyphicon-user"></span>
				<a id="page16721_div01_toggle">퇴사자 등록 양식</a>
			</h3>
		</div>
		<div class="panel-body" id="page16721_div01">
			<form action="#" name="page16721_form01">
				<table class="table">
					<tr>
						<th>사원번호</th>
						<td>${dto.employee_id}</td>
					</tr>
					<tr>
						<th>사원명</th>
						<td>${dto.employee_name}</td>
					</tr>
					<tr>
						<th>부서명</th>
						<td>${dto.dept_name}</td>
					</tr>
					<tr>
						<th>직급</th>
						<td>${dto.hr_code_name}</td>
					</tr>
					<tr>
						<th>입사일</th>
						<td>${dto.join_date}</td>
					</tr>
					<tr>
						<th>퇴직일＊</th>
						<td>
							<c:set var="now" value="<%= new java.util.Date() %>"/>
							<input class="form-control input-sm" type="date" name="retired_date"
							value="<fmt:formatDate value='${now}' pattern='yyyy-MM-dd'/>"
							required>
						</td>
					</tr>
					<tr>
						<th>퇴직사유＊</th>
						<td>
							<textarea class="form-control input-sm" rows="5" name="retired_reason">사유를 작성하세요.</textarea>
						</td>
					</tr>
					<tr>
						<th colspan="2">
							<input type="hidden" name="employee_id" value="${dto.employee_id}">
							<div class="btn-group btn-group-default">
								<input class="btn btn-primary btn-sm" type="submit" value="퇴사자 등록">
								<input class="btn btn-default btn-sm" type="reset" value="재작성">
								<input class="btn btn-default btn-sm" type="button" value="닫기" id="page16721_btn01">							
							</div>
						</th>
					</tr>
				</table>
			</form>
		</div>
		<div id="page16721_div02"></div>
	</div>
</body>
</html>