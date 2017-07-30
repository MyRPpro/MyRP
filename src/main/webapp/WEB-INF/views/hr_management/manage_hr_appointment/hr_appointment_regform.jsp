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

	$("#page16621_div01_toggle").bind("click", function(event) {
		$("#page16621_div01").slideToggle();
		return false;
	});
	
	$("#page16621_btn01").bind("click", function(event) {
		$("#page16621").slideUp();
		$("#page16620_div01").slideDown();
		return false;
	});
	
	$("form[name='page16621_form01']").on("submit", function(event) {
		var pre_rank = document.page16621_form01.pre_rank;
		var post_rank = document.page16621_form01.post_rank;
		if(post_rank.value == 0) {
			alert("발령 직급을 선택하세요.");
			post_rank.focus();
			return false;
		} else if(post_rank.value < pre_rank.value) {
			alert("이전 직급보다 낮은 직급을 선택하셨습니다.");
			post_rank.focus();
			return false;
		}
		var post_dept = document.page16621_form01.post_dept;
		if(post_dept.value == 0) {
			alert("발령 부서를 선택하세요.");
			post_dept.focus();
			return false;
		}
		var last_date = new Date("${last_date}");
		last_date.setTime(last_date*1+1000*60*60*24);
		var select_date = new Date(document.page16621_form01.appointment_date.value);
		if(select_date < last_date) {
			alert("마지막 발령일자 이후로만 선택이 가능합니다.");
			document.page16621_form01.appointment_date.focus();
			return false;
		}
		
		var data = $(this).serialize();
		$.ajax({
			data:	data,
			type:	'post',
			url:	'/hr_management/manage_hr_appointment/add_hr_appointment_pro',
			success: function(response) {
				$("#page16621_div02").html(response);
			}
		});
		return false;
	});
	
</script>
<body>
<div class="panel panel-default" id="page16621">
	<div class="panel-heading">
		<a id="page16621_div01_toggle">[16621]hr_appointment_regform.jsp</a>	
	</div>
	<div class="panel-body" id="page16621_div01">
		<form action="#" name="page16621_form01">
			<table class="table">
				<tr>
					<th>employee_id</th>
					<td><input type="text" name="employee_id"
					value="${employeeVo.employee_id}" readonly></td>
				</tr>
				<tr>
					<th>employee_name</th>
					<td><input type="text" name="employee_name"
					value="${employeeVo.employee_name}" readonly></td>
				</tr>
				<tr>
					<th>appointment_date</th>
					<td>
						<input type="date" name="appointment_date"
						value="<fmt:formatDate value='${appointment_date}' pattern='yyyy-MM-dd'/>"
						required>
					</td>
				</tr>
				<tr>
					<th>pre_rank</th>
					<td>
						<input type="hidden" name="hr_code_group_rank"
						value="2">
						<input type="hidden" name="pre_rank" 
						value="${hr_code_id}">
						<input type="text" name="pre_rank_name"
						value="${rank_name}" readonly>
					</td>
				</tr>
				<tr>
					<th>post_rank</th>
					<td>
						<select name="post_rank">
							<option value=0>발령 직급 선택</option>
							<c:forEach var="vo" items="${hr_codeVos}">
								<option value="${vo.hr_code_id}">
									${vo.hr_code_name}
								</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<th>pre_dept</th>
					<td>
						<input type="hidden" name="pre_dept" 
						value="${dept_id}">
						<input type="text" name="pre_dept_name"
						value="${dept_name}" readonly>
					</td>
				</tr>
				<tr>
					<th>post_dept</th>
					<td>
						<select name="post_dept">
							<option value=0>발령 부서 선택</option>
							<c:forEach var="vo" items="${deptVos}">
								<option value="${vo.dept_id}">
									${vo.dept_name}
								</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<th colspan="2">
						<input class="btn btn-default btn-xs" type="submit" value="발령하기">
						<input class="btn btn-default btn-xs" type="reset"	value="재작성">
						<input class="btn btn-default btn-xs" type="button" value="닫기" id="page16621_btn01">
					</th>
				</tr>
			</table>
		</form>
	</div>
	<div id="page16621_div02"></div>
</div>
</body>
</html>