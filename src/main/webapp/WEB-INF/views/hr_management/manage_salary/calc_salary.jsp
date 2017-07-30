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
	
	$("#page16540_div01_toggle").bind("click", function(event) {
		$("#page16540_div01").slideToggle();
		return false;
	});
	
	$("#page16540_btn01").bind("click", function(event) {
		var $salary_register_id = $("input[name='salary_register_id']");
		$("#page16540_div01").slideUp();
		$("#page16540_div02").slideDown();
		$("#page16540_div02").load("/hr_management/manage_salary/fix_salary?salary_register_id="+$salary_register_id.val());
	});
	
	$(".btn_fix_salary").bind("click", function(event) {
		var $each_salary = $(this).parent().parent();
		if($each_salary.find("input[name='base_worktime']").val() <= 0) {
			alert("근무시간을 입력한 후에 확정이 가능합니다.");
			$each_salary.find("input[name='base_worktime']").focus();
			return false;
		}
		
		var $salary_register_id = $("input[name='salary_register_id']");
		var $bonus_ratio = $("input[name='bonus_ratio']");
		var $night_overtime_ratio = $("input[name='night_overtime_ratio']");
		var $weekend_overtime_ratio = $("input[name='weekend_overtime_ratio']");
		var $employee_id = $each_salary.find("input[name='employee_id']");
		var $base_worktime = $each_salary.find("input[name='base_worktime']");
		var $night_overtime = $each_salary.find("input[name='night_overtime']");
		var $weekend_overtime = $each_salary.find("input[name='weekend_overtime']");
		
		var data = {
			salary_register_id:		$salary_register_id.val(),
			employee_id:			$employee_id.val(),
			bonus_ratio:			$bonus_ratio.val(),
			night_overtime_ratio:	$night_overtime_ratio.val(),
			weekend_overtime_ratio:	$weekend_overtime_ratio.val(),
			base_worktime:			$base_worktime.val(),
			night_overtime:			$night_overtime.val(),
			weekend_overtime:		$weekend_overtime.val()
		}
		
		$.ajax({
			data:		data,
			type:		'post',
			url:		'/hr_management/manage_salary/calc_salary_pro',
			success:	function(response) {
				$("#page16540_div02").html(response);
			}
		});
		
		$each_salary.find("input").attr("readonly", true);
		$(this).removeClass("btn-default");
		$(this).addClass("btn-success");
		$(this).unbind("click");
		$("#page16540_div02").hide();
		return false;
	});
	
	
	$("#page16540_div01 a").on("click", function(event) {		
		$("#page16522").slideUp();
		$("#page16510_div01").slideUp();
		$("#page16510_div02").slideDown();
		$("#page16510_div02").load($(this).attr("href"));
		return false;
	});
	
</script>
<body>
	<div class="panle panel-default" id="page16540">
		<div class="panel-heading">
			<a id="page16540_div01_toggle">[16540]calc_salary.jsp</a>
		</div>
		<div class="panel-body" id="page16540_div01">
			<table class="table">
				<tr>
					<th>급여대장 번호</th>
					<th>상여금 비율</th>
					<th>야근수당 비율</th>
					<th>주말근무수당 비율</th>
					<th>급여 계산</th>
				</tr>
				<tr>
					<td>${salary_register_id}</td>
					<td>
						<div class="input-group">
							<span class="input-group-addon"><small>x</small></span>
							<input class="form-control input-sm" type="number"
							name="bonus_ratio" min="0" max="1" step="0.01" value="0">		
						</div>
					</td>
					<td>
						<div class="input-group">
							<span class="input-group-addon"><small>x</small></span>
							<input class="form-control input-sm" type="number"
							name="night_overtime_ratio" min="1" max="2" step="0.01" value="1">		
						</div>
					</td>
					<td>
						<div class="input-group">
							<span class="input-group-addon"><small>x</small></span>
							<input class="form-control input-sm" type="number"
							name="weekend_overtime_ratio" min="1" max="2" step="0.01" value="1">		
						</div>
					</td>
					<td>
						<input class="form-control input-sm" type="button" value="결과 보기" id="page16540_btn01">
					</td>
				</tr>
			</table>
			<table class="table">
				<tr>
					<th>부서</th>
					<th>사원번호</th>
					<th>사원명</th>
					<th>기본 시간</th>
					<th>야근 시간</th>
					<th>주말 시간</th>
					<th>확정</th>
				</tr>
				<c:forEach var="dto" items="${dtos}">
				<tr>
					<td>${dto.dept_name}</td>
					<td>${dto.employee_id}</td>
					<td>
						<a href="/hr_management/manage_personnel_card/modify_personnel_card?employee_id=${dto.employee_id}&select_tab=salary"">
							${dto.employee_name}
						</a>
					</td>
					<td>
						<div class="input-group">
							<input class="form-control input-sm" type="number"
							name="base_worktime" min="0" max="240" step="1"
							<c:if test="${dto.fixed}">readonly</c:if>>
							<span class="input-group-addon"><small>hr</small></span>
						</div>
					</td>
					<td>
						<div class="input-group">
							<input class="form-control input-sm" type="number"
							name="night_overtime" min="0" max="240" step="1"
							<c:if test="${dto.fixed}">readonly</c:if>>
							<span class="input-group-addon"><small>hr</small></span>
						</div>
					</td>
					<td>
						<div class="input-group">
							<input class="form-control input-sm" type="number"
							name="weekend_overtime" min="0" max="240" step="1"
							<c:if test="${dto.fixed}">readonly</c:if>>
							<span class="input-group-addon"><small>hr</small></span>
						</div>
					</td>
					<td>
						<input type="hidden" name="salary_register_id" value="${salary_register_id}">
						<input type="hidden" name="employee_id" value="${dto.employee_id}">
				    	<input class="btn btn-sm 
				    	<c:if test="${!dto.fixed}">btn-default btn_fix_salary</c:if>
				    	<c:if test="${dto.fixed}">btn-success</c:if>
				    	" type="button" value="확정">
					</td>
				</tr>
				</c:forEach>
			</table>
		</div>
		<div id="page16540_div02"></div>
	</div>
</body>
</html>