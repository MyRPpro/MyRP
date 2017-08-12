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
	
	$("#page16520_div01_toggle").bind("click", function(event) {
		$("#page16520_div01").slideToggle();
		return false;
	});
	
	$("#page16520_btn01").bind("click", function(event) {
		$("#page16520").slideUp();
		$("#page16510_div01").slideDown();
		$("#page16510_div02").slideDown();
		$("#page16510_div03").slideDown();
		return false;
	});
	
	$("form[name='page16520_form01']").on("submit", function(event) {
		var salary_register_name = $("form[name='page16520_form01'] select[name='salary_register_name']");
		if(salary_register_name.val() == 0) {
			alert("급여대장명을 선택하세요.");
			salary_register_name.focus();
			return false;
		}
		var data = $(this).serialize();
		$.ajax({
			data:	data,
			type:	'post',
			url:	'/hr_management/manage_salary/reg_salary_info_pro',
			success: function(response) {
				$("#page16520_div02").html(response);
			}
		});
		return false;	
	});
	
	$("#page16520_btn02").bind("click", function(event) {
		$("form[name='page16520_form01'] input[name='salary_state']").val("26450");
		$("form[name='page16520_form01'] input[name='total_pay']").val("0");
		$("form[name='page16520_form01'] input[name='total_employee']").val("0");
		$("form[name='page16520_form01'] input[name='total_pay']").attr("readonly", true);
		$("form[name='page16520_form01'] input[name='total_employee']").attr("readonly", true);
		return false;
	});
	
</script>
<body>
	<div class="panel panel-primary" id="page16520">
		<div class="panel-heading">
			<!-- <a id="page16520_div01_toggle">[16520]reg_salary_info.jsp</a> -->
			<h3 class="panel-title">
				<span class="glyphicon glyphicon-user"></span>
				<a id="page16520_div01_toggle">급여대장 등록</a>
			</h3>
		</div>
		<div class="panel-body" id="page16520_div01">
			<form action="#" name="page16520_form01">
				<div class="table-responsive">
					<table class="table">
						<tr>
							<th>등록일</th>
							<td>
								<c:set var="now" value="<%= new java.util.Date() %>"/>
								<input class="form-control input-sm" type="month" name="reg_date" 
								value="<fmt:formatDate value='${now}' pattern='yyyy-MM'/>" 
								required>
							</td>
						</tr>
						<tr>
							<th>급여대장명＊</th>
							<td>
								<select class="form-control input-sm" name="salary_register_name" required>
									<option value=0>급여구분 선택</option>
									<c:forEach var="vo" items="${hr_codeVos}">
										<option value="${vo.hr_code_id}">${vo.hr_code_name}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th>지급일</th>
							<td>
								<c:set var="now" value="<%= new java.util.Date() %>"/>
								<input class="form-control input-sm" type="date" name="pay_date" 
								value="<fmt:formatDate value='${now}' pattern='yyyy-MM-dd'/>" 
								required>
							</td>
						</tr>
						<tr>
							<th>총 지급액＊</th>
							<td>
								<div class="input-group">
									<input class="form-control input-sm" type="number" name="total_pay"
									min="0" required>
									<span class="input-group-btn">
										<button class="btn btn-info btn-sm" id="page16520_btn02">급여 계산</button>							
									</span>
								</div>
							</td>
						</tr>
						<tr>
							<th>총 지급인원＊</th>
							<td>
								<input class="form-control" type="number" name="total_employee"
								min="0" required>
							</td>
						</tr>
						<tr>
							<th colspan="2">
								<input type="hidden" name="salary_state" value="26451">
								<div class="btn-group btn-group-default">
									<input class="btn btn-primary btn-sm" type="submit" value="등록하기">
									<input class="btn btn-default btn-sm" type="reset"	value="재작성">
									<input class="btn btn-default btn-sm" type="button" value="닫기" id="page16520_btn01">							
								</div>
							</th>
						</tr>
					</table>
				</div>
			</form>
		</div>
		<div id="page16520_div02"></div>
	</div>
</body>
</html>