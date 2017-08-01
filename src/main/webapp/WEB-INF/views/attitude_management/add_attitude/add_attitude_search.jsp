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
	function fn_select_dept() {
		var dept_id = document.attitude_search_form.dept_id.value; 
		$.getJSON("/hr_management/manage_hr_appointment/select_dept/"+dept_id, function(data) {
			var str = "<option value=0>사원 선택</option>";
			$(data).each(function() {
				if(this.employee_name != "") {
					str += "<option value='" +this.employee_id+ "'>" + this.employee_name + "</option>"					
				}
			});
			document.attitude_search_form.employee_id.innerHTML = str;
		});
	}
	
	function fn_attitude_form() {
		
		var dept_id = attitude_search_form.dept_id;
		var employee_id = attitude_search_form.employee_id;
		if(dept_id.value == 0 || employee_id.value == 0) {
			alert("부서와 사원을 선택해 주세요.");
			return false;
		}
		
		var employee_id = document.attitude_search_form.employee_id.value;
		$("#attitude_form_div").load("/attitude_management/add_attitude/attitude_form"
				+"?employee_id="+employee_id);
		return false;
	}
</script>


</head>
<body>
add_attitude_search.jsp
<div>
<form action="" name="attitude_search_form"
onsubmit="return fn_attitude_form();">
	<table>
		<tr>
			<td>
				<select name="dept_id" onchange="fn_select_dept();">
					<option value=0>부서 선택</option>
					<c:forEach var="vo" items="${deptVos}">
						<option value="${vo.dept_id}">${vo.dept_name}</option>
					</c:forEach>
				</select>
			</td>
			<td>
				<select name="employee_id">
					<option value=0>사원 선택</option>
				</select>
			</td>
			<td>
				<input type="submit" value="확인">
				<input type="reset" value="재작성">
				<input type="button" value="돌아가기" onclick="window.history.back();">
			</td>
		</tr>
	</table>
</form>
</div>
<div id="attitude_form_div">
</div>
</body>
</html>