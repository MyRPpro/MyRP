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
	
	$("#page16720_div01_toggle").bind("click", function(event) {
		$("#page16720_div01").slideToggle();
		return false;
	});
	
	$("#page16720_btn01").bind("click", function(event) {
		$("#page16720").slideUp();
		$("#page16710_div01").slideDown();
		$("#page16710_div02").slideDown();
		$("#page16710_div03").slideDown();
		return false;
	});
	
	$("form[name='page16720_form01'] select[name='dept_id']").on("change", function(event) {
		var $dept_id = $("form[name='page16720_form01'] select[name='dept_id']"); 
		$.getJSON("/hr_management/manage_hr_appointment/select_dept/"+$dept_id.val(), function(data) {
			var str = "<option value=0>사원 선택</option>";
			$(data).each(function() {
				if(this.employee_name != "") {
					str += "<option value='" +this.employee_id+ "'>" + this.employee_name + "</option>"					
				}
			});
			$("form[name='page16720_form01'] select[name='employee_id']").html(str);
		});
		return false;
	});
	
	$("form[name='page16720_form01']").on("submit", function(event) {
		var $dept_id = $("form[name='page16720_form01'] select[name='dept_id']"); 
		var $employee_id = $("form[name='page16720_form01'] select[name='employee_id']"); 
		if($dept_id.val() == 0 || $employee_id.val() == 0) {
			alert("부서와 사원을 선택해 주세요.");
			$dept_id.focus();
			return false;
		}
		$("#page16720_div01").slideUp();
		$("#page16720_div02").load("/hr_management/manage_retired_employee/retired_employee_regform"
				+"?employee_id="+$employee_id.val());
		return false;
	});
	
</script>
<body>
	<div class="panel panel-default" id="page16720">
		<div class="panel-heading">
			<a id="page16720_div01_toggle">[16720]add_retired_employee.jsp</a>
		</div>
		<div class="panel-body" id="page16720_div01">
			<form class="form-inline" action="#" name="page16720_form01">
				<select class="form-control" name="dept_id">
					<option value=0>부서 선택</option>
					<c:forEach var="vo" items="${deptVos}">
						<option value="${vo.dept_id}">${vo.dept_name}</option>
					</c:forEach>
				</select>
				<div class="input-group">
					<select class="form-control" name="employee_id">
						<option value=0>사원 선택</option>
					</select>
					<span class="input-group-btn">
						<button class="btn btn-default" type="submit">확인</button>
						<button class="btn btn-default" type="reset">재작성</button>
						<button class="btn btn-default" type="button" id="page16720_btn01">닫기</button>
					</span>
				</div>
			</form>
		</div>
		<div id="page16720_div02"></div>
	</div>
</body>
</html>