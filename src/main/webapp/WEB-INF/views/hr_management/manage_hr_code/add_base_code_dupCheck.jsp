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

	$("#page16151_div01_toggle").bind("click", function(event) {
		$("#page16151_div01").slideToggle();
	});
	$("form[name='page16151_form01']").on("submit", function(event) {
		var hr_code_group_id = $("form[name='page16151_form01'] input[name='hr_code_group_id']").val();
		var hr_code_id = $("form[name='page16151_form01'] input[name='hr_code_id']").val();
		$("#page16151").slideUp();
		$("#page16140_div03").load("/hr_management/manage_hr_code/add_base_code"+
								"?hr_code_group_id="+hr_code_group_id+
								"&hr_code_id="+hr_code_id+
								"&dupcheck=1");
		return false;
	});
	
	$("form[name='page16151_form02']").on("submit", function(event) {
		var $hr_code_group_id = $("form[name='page16151_form02'] input[name='hr_code_group_id']");
		var $hr_code_id = $("form[name='page16151_form02'] input[name='hr_code_id']");
		var url =	"/hr_management/manage_hr_code/add_base_code_dupCheck"+
					"?hr_code_group_id="+$hr_code_group_id.val()+
					"&hr_code_id="+$hr_code_id.val();
		$("#page16150_div01").slideUp();
		$("#page16150_div02").slideDown();
		$("#page16150_div02").load(url);
		return false;
	});
	
	$("#page16151_btn01").bind("click", function(event) {
		$("#page16151").slideUp();
		$("#page16150_div01").slideDown();
		return false;
	});
	
</script>
<body>
	<div class="panel panel-primary" id="page16151">
		<div class="panel-heading">
			<!-- [16151]add_base_code_dupCheck.jsp -->
			<h3 class="panel-title">
				<span class="glyphicon glyphicon-user"></span>
				<a id="page16151_div01_toggle">중복 확인</a>
			</h3>
		</div>
		<div class="panel-body" id="page16151_div01">
			<c:if test="${cnt == 0}">
				<form action="#" name="page16151_form01">
					<div class="table-responsive">
						<table class="table">
							<tr>
								<th>선택하신 [${hr_code_id}]는 사용가능합니다.</th>
							</tr>
							<tr>
								<th>
									<input type="hidden" name="hr_code_group_id" value="${hr_code_group_id}">
									<input type="hidden" name="hr_code_id" value="${hr_code_id}">
									<input class="btn btn-default btn-sm" type="submit" value="확인">
								</th>
							</tr>
						</table>					
					</div>
				</form>
			</c:if>
			<c:if test="${cnt == 1}">
				<form action="#" name="page16151_form02">
					<div class="table-responsive">
						<table class="table">
							<tr>
								<th colspan="2">
									선택하신 [${hr_code_id}]는 이미 존재합니다.<br>
									새로운 인사코드를 선택하세요.
								</th>
							</tr>
							<tr>
								<th>인사코드 번호</th>
								<td>
									<input type="hidden" name="hr_code_group_id"
									value="${hr_code_group_id}">
									<input  class="form-control input-sm" type="number" name="hr_code_id"
									min="1" max="999" step="1" required>
								</td>
							</tr>
							<tr>
								<th colspan="2">
									<div class="btn-group btn-group-default">
										<input class="btn btn-primary btn-sm" type="submit" value="중복확인">
										<input class="btn btn-default btn-sm" type="reset" value="재작성">
										<input class="btn btn-default btn-sm" type="button" value="닫기" id="page16151_btn01">								
									</div>
								</th>
							</tr>
						</table>				
					</div>
				</form>
			</c:if>		
		</div>	
	</div>
</body>
</html>