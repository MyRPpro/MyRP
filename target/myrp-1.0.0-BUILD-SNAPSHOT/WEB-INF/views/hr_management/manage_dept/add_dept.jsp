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

	$("#page16220_div01_toggle").bind("click", function(event) {
		$("#page16220_div01").slideToggle();
		return false;
	});

	$("form[name='page16220_form01'] input[name='dept_id']").on("change", function() {
		$("form[name='page16220_form01'] input[name='dupcheck']").val(0);
	});

	$("form[name='page16220_form01']").on("submit", function(event) {
		var $dupcheck = $("form[name='page16220_form01'] input[name='dupcheck']");
		if($dupcheck.val() == 0) {
			alert("부서번호의 중복체크가 필요합니다.");
			$("#page16220_btn01").focus();
			return false;
		}
		var data = $(this).serialize();
		$.ajax({
			data:	data,
			type: 	'post',
			url:	'/hr_management/manage_dept/add_dept_pro',
			success: function(response) {
				$("#page16220_div01").html(response);
			}
		});
		return false;
	});
	
	$("#page16220_btn01").bind("click", function() {
		var $dept_id = $("form[name='page16220_form01'] input[name='dept_id']");
		if(!$dept_id.val()) {
			alert("먼저 부서번호에 값을 입력하세요.");
			$dept_id.focus();
			return false;
		}
		$("#page16220_div01").slideUp();
		$("#page16220_div02").slideDown();
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
	
	$("#page16220_btn02").bind("click", function(event) {
		$("#page16220").slideUp();
		$("#page16210_div01").slideDown();
		return false;		
	});
	
</script>
<body>
<div class="panel panel-primary" id="page16220">
	<div class="panel-heading">
		<!-- <a id="page16220_div01_toggle">[16220]add_dept.jsp</a> -->
		<h3 class="panel-title">
			<span class="glyphicon glyphicon-user"></span>
			<a id="page16220_div01_toggle">부서 등록</a>
		</h3>
	</div>
	<div class="panel-body" id="page16220_div01">
		<form action="#" name="page16220_form01">
			<table class="table">
				<tr>
					<th>부서번호＊</th>
					<td>
						<div class="input-group">
							<input class="form-control input-sm" type="number" name="dept_id" value="${dept_id}"
							min="1" max="9999" step="1" required>
							<span class="input-group-btn">
								<input class="btn btn-info btn-sm" type="button" value="중복확인" id="page16220_btn01">
							</span>
						</div>
					</td>
				</tr>
				<tr>
					<th>부서명＊</th>
					<td>
						<input class="form-control input-sm" type="text" name="dept_name" maxlength="255" required>
					</td>
				</tr>
				<tr>
					<th>접근권한</th>
					<td>
						<input class="form-control input-sm" type="text" name="access_role" maxlength="255" required>
					</td>
				</tr>
				<tr>
					<th>사용 상태＊</th>
					<td>
						<label for="used">사용</label>
						<input type="radio" name="use_state" id="used" value="Y" checked>
						<label for="unused">비사용</label>
						<input type="radio" name="use_state" id="unused" value="N">
					</td>
				</tr>
				<tr>
					<th colspan="2">
						<input type="hidden" name="dupcheck"
						<c:if test="${dupcheck == null}">value="0"</c:if>
						<c:if test="${dupcheck == 1}">value="1"</c:if>>
						<div class="btn-group btn-group-default">
							<input class="btn btn-primary btn-sm" type="submit" value="등록하기">
							<input class="btn btn-default btn-sm" type="reset"	value="재작성">
							<input class="btn btn-default btn-sm" type="button" value="닫기"
							id="page16220_btn02">						
						</div>
					</th>
				</tr>
			</table>
		</form>
	</div>
	<div id="page16220_div02"></div>
</div>
</body>
</html>