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

	$("#page16230_div01_toggle").bind("click", function(event) {
		$("#page16230_div01").slideToggle();
		return false;
	});

	$("#page16230_btn01").bind("click", function(event) {
		$("#page16230").slideUp();
		$("#page16210_div01").slideDown();
		return false;		
	});
	
	$("form[name='page16230_form01']").on("submit", function(event) {
		var data = $(this).serialize();
		$.ajax({
			data:	data,
			type:	'post',
			url:	'/hr_management/manage_dept/modify_dept_pro',
			success: function(response) {
				$("#page16230").html(response);
				$("#page16230").slideUp();
			}
		});
		return false;
	});
	
</script>
<body>
	<div class="panel panel-primary" id="page16230">
		<div class="panel-heading">
			<!-- [16230]modify_dept.jsp -->
			<h3 class="panel-title">
				<span class="glyphicon glyphicon-user"></span>
				<a id="page16230_div01_toggle">부서정보 수정</a>
			</h3>
		</div>
		<div class="panel-body" id="page16230_div01">
			<form action="#" name="page16230_form01">
				<table class="table">
					<tr>
						<th>부서번호</th>
						<td>
							<input class="form-control input-sm" type="text" name="dept_id"
							value="${deptVo.dept_id}" readonly>
						</td>
					</tr>
					<tr>
						<th>부서명＊</th>
						<td>
							<input class="form-control input-sm" type="text" name="dept_name"
							value="${deptVo.dept_name}" required>
						</td>
					</tr>
					<tr>
						<th>접근권한</th>
						<td>
							<input class="form-control input-sm" type="text" name="access_role"
							value="${deptVo.access_role}" required>
						</td>
					</tr>
					<tr>
						<th>사용 상태＊</th>
						<td>
							<label for="used">사용</label>
							<input type="radio" name="use_state" id="used" value="Y"
							<c:if test="${deptVo.use_state == 'Y'}">checked</c:if>>
							<label for="unused">비사용</label>
							<input type="radio" name="use_state" id="unused" value="N"
							<c:if test="${deptVo.use_state == 'N'}">checked</c:if>>
						</td>
					</tr>
					<tr>
						<th colspan="2">
							<div class="btn-group btn-group-default">
								<input class="btn btn-primary btn-sm" type="submit" value="수정하기">
								<input class="btn btn-default btn-sm" type="reset"	value="재작성">
								<input class="btn btn-default btn-sm" type="button"
								value="닫기" id="page16230_btn01">							
							</div>
						</th>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>