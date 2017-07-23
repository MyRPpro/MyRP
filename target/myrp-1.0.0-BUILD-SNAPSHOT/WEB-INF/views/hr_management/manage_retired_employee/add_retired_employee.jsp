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
	function fn_select_dept() {
		var dept_id = document.add_retired_employee_form1.dept_id.value; 
		$.getJSON("/hr_management/manage_hr_appointment/select_dept/"+dept_id, function(data) {
			var str = "<option value=0>사원 선택</option>";
			$(data).each(function() {
				if(this.employee_name != "") {
					str += "<option value='" +this.employee_id+ "'>" + this.employee_name + "</option>"					
				}
			});
			document.add_retired_employee_form1.employee_id.innerHTML = str;
		});
	}
	
	function fn_add_retired_employee_regform() {
		
		var dept_id = add_retired_employee_form1.dept_id;
		var employee_id = add_retired_employee_form1.employee_id;
		if(dept_id.value == 0 || employee_id.value == 0) {
			alert("부서와 사원을 선택해 주세요.");
			return false;
		}
		
		var employee_id = document.add_retired_employee_form1.employee_id.value;
		$("#add_retired_employee_regform_div").load("/hr_management/manage_retired_employee/retired_employee_regform"
				+"?employee_id="+employee_id);
		return false;
	}
</script>
<body>
add_retired_employee.jsp
<div>
<form action="" name="add_retired_employee_form1"
onsubmit="return fn_add_retired_employee_regform()">
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
				<input type="button" value="돌아가기" onclick="window.location='/';">
			</td>
		</tr>
	</table>
</form>
</div>
<div id="add_retired_employee_regform_div">
</div>
</body>
</html>