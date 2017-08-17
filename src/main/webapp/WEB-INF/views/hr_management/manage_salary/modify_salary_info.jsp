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
	
	$("#page16522_div01_toggle").bind("click", function(event) {
		$("#page16522_div01").slideToggle();
		return false;
	});
	
	$("#page16522_btn01").bind("click", function(event) {
		$("#page16522").slideUp();
		$("#page16510_div01").slideDown();
		$("#page16510_div02").slideDown();
		$("#page16510_div03").slideDown();
		return false;
	});
	
	$("#page16522_btn02").bind("click", function(event) {
		var $salary_register_id = $("form[name='page16522_form01'] input[name='salary_register_id']");
		$("#page16522_div01").slideUp();
		$("#page16522_div02").slideDown();
		$("#page16522_div02").load("/hr_management/manage_salary/calc_salary?salary_register_id="+$salary_register_id.val());
	});
	
	$("form[name='page16522_form01']").on("submit", function(event) {
		if($("form[name='page16522_form01'] input[name='total_pay']").val() == 0) {
			alert("급여계산이 필요합니다.");
			$("#page16522_btn02").focus();
			return false;
		}
		var data = $(this).serialize();
		$.ajax({
			data:		data,
			type:		'post',
			url:		'/hr_management/manage_salary/modify_salary_info_pro',
			success: function(response) {
				$("#page16522_div02").html(response);
			}
		});
		return false;
	});
	
</script>
<body>
	<div class="panel panel-primary" id="page16522">
		<div class="panel-heading">
			<!-- <a id="page16522_div01_toggle">[16522]modify_salary_info.jsp</a> -->
			<h3 class="panel-title">
				<span class="glyphicon glyphicon-user"></span>
				<a id="page16522_div01_toggle">급여정보 확정</a>
			</h3>
		</div>
		<div class="panel-body" id="page16522_div01">
			<form action="/hr_management/manage_salary/modify_salary_info_pro" name="page16522_form01">
				<div class="table-responsive">
					<table class="table">
						<tr>
							<th>급여대장 번호</th>
							<td><input class="form-control input-sm" type="text" name="salary_register_id"
							value="${salary_registerVo.salary_register_id}" readonly></td>
						</tr>
						<tr>
							<th>계정</th>
							<td><input class="form-control input-sm" type="text" name="account_id"
							value="${salary_registerVo.account_id}" readonly></td>
						</tr>
						<tr>
							<th>등록일</th>
							<td>
								<input class="form-control input-sm" type="month" name="reg_date" 
								value="<fmt:formatDate value='${salary_registerVo.reg_date}' pattern='yyyy-MM'/>" 
								required readonly>
							</td>
						</tr>
						<tr>
							<th>급여대장명</th>
							<td>
								<input class="form-control input-sm" type="text" name="salary_register_name"
								value="${salary_registerVo.salary_register_name}" readonly>
							</td>
						</tr>
						<tr>
							<th>지급일</th>
							<td>
								<input class="form-control input-sm" type="date" name="pay_date" 
								value="<fmt:formatDate value='${salary_registerVo.pay_date}' pattern='yyyy-MM-dd'/>" 
								required readonly>
							</td>
						</tr>
						<tr>
							<th>총 지급액</th>
							<td>
								<div class="input-group">
									<input class="form-control input-sm" type="number" name="total_pay"
									min="0" value="${salary_registerVo.total_pay}" required readonly>
									<span class="input-group-btn">
										<input class="btn btn-info btn-sm" type="button" value="급여계산" id="page16522_btn02">
									</span>
								</div>
							</td>
						</tr>
						<tr>
							<th>총 지급인원</th>
							<td>
								<input class="form-control input-sm" type="number" name="total_employee"
								min="0" value="${salary_registerVo.total_employee}" required readonly>
							</td>
						</tr>
						<tr>
							<th colspan="2">
								<div class="btn-group btn-group-default">
									<c:if test="${salary_registerVo.salary_state == 26450}">
										<input class="btn btn-primary btn-sm" type="submit" value="지급요청">
										<input class="btn btn-defaut btn-sm" type="reset"	value="재작성">
									</c:if>
									<input type="hidden" name="salary_state" value="${salary_registerVo.salary_state}">
									<input class="btn btn-defaut btn-sm" type="button" value="닫기" id="page16522_btn01">
								</div>
							</th>
						</tr>
					</table>
				</div>
			</form>
		</div>
		<div id="page16522_div02"></div>
	</div>
</body>
</html>