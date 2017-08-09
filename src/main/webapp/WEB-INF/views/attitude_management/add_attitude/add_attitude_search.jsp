<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../../setting.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	
	$("#page17210_div01_toggle").bind("click", function(event) {
		$("#page17210_div01").slideToggle();
		return false;
	});
	
	$("#page17210_btn01").bind("click", function(event) {
		$("#page17210").slideUp();
		$("#page17110_div01").slideDown();
		$("#page17110_div02").slideDown();
		$("#page17110_div03").slideDown();
		return false;
	});
	
	$("form[name='page17210_form01'] select[name='dept_id']").on("change", function(event) {
		var $dept_id = $("form[name='page17210_form01'] select[name='dept_id']");
		$.getJSON("/hr_management/manage_hr_appointment/select_dept/"+$dept_id.val(), function(data) {
			var str = "<option value=0>사원 선택</option>";
			$(data).each(function() {
				if(this.employee_name != "") {
					str += "<option value='" + this.employee_id+ "'>" +this.employee_name + "</option>"
				}
			});
			$("form[name='page17210_form01'] select[name='employee_id']").html(str);
		});
		
		return false;
	});
	
	$("form[name='page17210_form01']").on("submit", function(event) {
		var $dept_id = $("form[name='page17210_form01'] select[name='dept_id']"); 
		var $employee_id = $("form[name='page17210_form01'] select[name='employee_id']"); 
		if($dept_id.val() == 0 || $employee_id.val() == 0) {
			alert("부서와 사원을 선택해 주세요.");
			$dept_id.focus();
			return false;
		}
		$("#page17210_div01").slideUp();
		$("#page17210_div02").load("attitude_management/add_attitude/attitude_form"
				+"?employee_id="+$employee_id.val());
		return false;
	});
	
</script>

</head>
<body>
	<div class="panel panel-primary" id="page17210">
		<div class="panel-heading">
			<!-- <a id="page17210_div01_toggle">[17210]add_attitude_search.jsp</a> -->
			<h3 class="panel-title">
				<span class="glyphicon glyphicon-calendar"></span>
				<a id="page17210_div01_toggle">근태등록 사원 조회</a>
			</h3>
		</div>
		<div class="panel-body" id="page17210_div01">
			<form class="form-inline" action="#" name="page17210_form01">
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
					<button class="btn btn-primary" type="submit">확인</button>
					<button class="btn btn-default" type="reset">재작성</button>
					<button class="btn btn-default" type="button" id="page17210_btn01">닫기</button>
				</span>
			</div>
		</form>
	</div>
	<div id="page17210_div02"></div>
</div>
</body>
</html>