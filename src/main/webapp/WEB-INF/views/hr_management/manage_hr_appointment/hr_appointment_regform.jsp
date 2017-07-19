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
	function fn_appointment_reg() {
		var pre_rank = document.hr_appointment_regform1.pre_rank;
		var post_rank = document.hr_appointment_regform1.post_rank;
		if(post_rank.value == 0) {
			alert("발령 직급을 선택하세요.");
			post_rank.focus();
			return false;
		} else if(post_rank.value < pre_rank.value) {
			alert("이전 직급보다 낮은 직급을 선택하셨습니다.");
			post_rank.focus();
			return false;
		}
		var post_dept = document.hr_appointment_regform1.post_dept;
		if(post_dept.value == 0) {
			alert("발령 부서를 선택하세요.");
			post_dept.focus();
			return false;
		}	
	}
</script>
<body>
hr_appointment_regform.jsp<br>
<form action="/hr_management/manage_hr_appointment/add_hr_appointment_pro"
name="hr_appointment_regform1" method="post"
onsubmit="return fn_appointment_reg();">
	<table border="1">
		<tr>
			<th colspan="2">Personnel_appointmentVO</th>
		</tr>
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
				required onchange="fn_appointment_date_change();">
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
				<input type="submit" value="발령하기">
				<input type="reset"	value="재작성">
				<input type="button" value="돌아가기"
				onclick="window.history.back();">
			</th>
		</tr>
	</table>
</form>
</body>
</html>