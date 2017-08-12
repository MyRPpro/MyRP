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

	$("#page16221_div01_toggle").bind("click", function() {
		$("#page16221_div01").slideToggle();
		return false;
	});

	$("form[name='page16221_form01']").on("submit", function(event) {
		$("#page16221").slideUp();
		var $dept_id = $("form[name='page16221_form01'] input[name='dept_id']");
		$("#page16210_div02").load("/hr_management/manage_dept/add_dept"+
								"?dept_id="+$dept_id.val()+
								"&dupcheck=1");
		return false;
	});
	
	$("form[name='page16221_form02']").on("submit", function(event) {
		var $dept_id = $("form[name='page16221_form02'] input[name='dept_id']");
		$.ajax({
			data:		null,
			type:		'get',
			url:		'/hr_management/manage_dept/add_dept_dupCheck?dept_id='+$dept_id.val(),
			success: function(response) {
				$("#page16220_div02").html(response);
				$("form[name='page16221_form02'] input[name='dept_id']").focus();
			}
		});
		return false;
	});
	
	$("#page16221_btn01").bind("click", function(event) {
		$("#page16221").slideUp();
		$("#page16220_div01").slideDown();
		return false;		
	});
	
</script>
<body>
	<div class="panel panel-primary" id="page16221">
		<div class="panel-heading">
			<!-- [16221]add_dept_dupCheck.jsp -->
			<h3 class="panel-title">
				<span class="glyphicon glyphicon-user"></span>
				<a id="page16221_div01_toggle">중복 확인</a>
			</h3>
		</div>
		<div class="panel-body" id="page16221_div01">
			<c:if test="${cnt == 0}">
				<form action="#" name="page16221_form01">
					<table class="table table-responsive ">
						<tr>
							<th>선택하신 [${dept_id}]는 사용가능합니다.</th>
						</tr>
						<tr>
							<td>
								<input type="hidden" name="dept_id" value="${dept_id}">
								<input class="btn btn-default btn-sm" type="submit" value="확인">
							</td>
						</tr>
					</table>
				</form>
			</c:if>
			<c:if test="${cnt == 1}">
				<form action="#" name="page16221_form02">
					<div class="table-responsive">
						<table class="table">
							<tr>
								<th colspan="2">
									선택하신 [${dept_id}]는<br>
									[${dup_dept_name}]에 사용중입니다.<br>
									새로운 부서번호를 선택하세요.
								</th>
							<tr>
								<th>부서번호</th>
								<td>
									<input class="form-control input-sm" type="number" name="dept_id" 
									min="1" max="9999" step="1" required>
								</td>
							</tr>
							<tr>
								<th colspan="2">
									<div class="btn-group btn-gorup-default">
										<input class="btn btn-primary btn-sm" type="submit" value="중복확인">
										<input class="btn btn-default btn-sm" type="reset" value="재작성">
										<input class="btn btn-default btn-sm" type="button" value="닫기"
										id="page16221_btn01">								
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