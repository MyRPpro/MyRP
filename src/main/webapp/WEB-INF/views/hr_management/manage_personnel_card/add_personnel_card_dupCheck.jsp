<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../../setting.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">

	$("form[name='page16323_form01']").on("submit", function(event) {
		$("#page16323").slideUp();
		var $employee_id = $("form[name='page16323_form01'] input[name='employee_id']");
		$("#page16310_div04").load(
				"/hr_management/manage_personnel_card/add_personnel_card"+
				"?employee_id="+$employee_id.val()+
				"&dupcheck=1");
		return false;
	});

	$("form[name='page16323_form02']").on("submit", function(event) {
		$("#page16323").slideUp();
		var $employee_id = $("form[name='page16323_form02'] input[name='employee_id']");
		var url = "/hr_management/manage_personnel_card/add_personnel_card_dupCheck?employee_id="+$employee_id.val();
		$("#page16320_div01").slideUp();
		$("#page16320_div02").load(url);
		return false;
	});
	
	$("#page16323_btn01").bind("click", function() {
		$("#page16323").slideUp();
		$("#page16320_div01").slideDown();
		return false;
	});

</script>
<body>
	<div class="panel panel-default" id="page16323">
		<div class="panel-heading">
			[16323]add_personnel_card_dupCheck.jsp
		</div>
		<div class="panel-body">
			<c:if test="${cnt == 0}">
				<form action="#" name="page16323_form01">
					<table class="table">
						<tr>
							<th>선택하신 [${employee_id}]는 사용가능합니다.</th>
						</tr>
						<tr>
							<th>
								<input type="hidden" name="employee_id" value="${employee_id}">
								<input class="btn btn-default btn-xs" type="submit" value="확인" autofocus>
							</th>
						</tr>
					</table>
				</form>
			</c:if>
			<c:if test="${cnt == 1}">
				<form action="/hr_management/manage_personnel_card/add_personnel_card_dupCheck" name="page16323_form02">
					<table class="table">
						<tr>
							<th colspan="2">
								선택하신 [${employee_id}]는<br>
								[${dup_employee_name}]에 사용중입니다.<br>
								새로운 부서번호를 선택하세요.
							</th>
						</tr>
						<tr>
							<th>부서번호</th>
							<td>
								<input class="form-control input-sm" type="number" name="employee_id" 
								min="1" max="9999" step="1" required autofocus>
							</td>
						</tr>
						<tr>
							<th colspan="2">
								<input class="btn btn-default btn-xs" type="submit" value="중복확인">
								<input class="btn btn-default btn-xs" type="reset" value="재작성">
								<input class="btn btn-default btn-xs" type="button" value="닫기" id="page16323_btn01">
							</th>
						</tr>
					</table>
				</form>
			</c:if>
		</div>
	</div>
</body>
</html>