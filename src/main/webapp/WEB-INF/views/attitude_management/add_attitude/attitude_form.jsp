<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../../setting.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function fn_attitudeform() {
		var pre_rank = document.attitude_form.pre_rank;
		var leave_code = document.attitude_form.leave_code;
		if(leave_code.value == 0) {
			alert("휴가 종류를  선택하세요.");
			leave_code.focus();
			return false;
		} 
		
		var attitude_reason = document.attitude_form.attitude_reason;
		if(attitude_reason.value == 0) {
			alert("휴가 사유를 선택하세요.");
			attitude_reason.focus();
			return false;
		}
		var last_date = new Date("${last_date}");
		last_date.setTime(last_date*1+1000*60*60*24);
		var select_date = new Date(document.hr_appointment_regform1.appointment_date.value);
		if(select_date < last_date) {
			alert("마지막 휴가일자 이후로만 선택이 가능합니다.");
			document.hr_appointment_regform1.appointment_date.focus();
			return false;
		}
	}

</script>
</head>
<body>
attitude_form.jsp
<form action="/attitude_management/add_attitude/add_attitude_search_pro" name="attitude_form" method="get"
	onsubmit="return fn_attitudeform();">
	<table border="1">
		<tr>
			<th colspan="2">Service_attitudeVO</th>
		</tr>
		<tr>
			<th>employee_id</th>
			<td>
				<input type="text" name="employee_id" value="${employeeVo.employee_id}" readonly>
			</td>
		</tr>
		<tr>
			<th>employee_name</th>
			<td>
				<input type="text" name="employee_name" value="${employeeVo.employee_name}" readonly>
			</td>
		</tr>
		<tr>
			<th>dept_name</th>
			<td>
				<input type="hidden" name="hr_code_group_rank" value="2">
				<input type="hidden" name="pre_rank" value="${dept_id}">
				<input type="text" name="dept_name" value="${dept_name}" readonly>
			</td>
		</tr>
		<tr>
			<th>holiday_kind</th>
			<td>
				<input type="hidden" name="hr_code_group_rank" value="3">
				<select name="leave_code">
					<option value=0>휴가선택</option>
						<c:forEach var="vo" items="${hr_codeVos}" >
							<option value="${vo.hr_code_id}" >
								${vo.hr_code_name}
							</option>
						</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<th>holiday</th>
			<td>
				<input type="date" name="attitude_date1" value="<fmt:formatDate value='${appointment_date1}' pattern='yyyy-MM-dd'/>">
				<input type="date" name="attitude_date2" value="<fmt:formatDate value='${appointment_date2}' pattern='yyyy-MM-dd'/>">
			</td>
		</tr>
		<tr>
			<th>attitude_reason</th>
			<td>
				<input type="hidden" name="hr_code_group_rank" value="8">
					<select name="attitude_reason">
						<option value=0>휴가사유 선택</option>
							<c:forEach var="vo" items="${codeVos}">
								<option value="${vo.hr_code_id}">
									${vo.hr_code_name}
								</option>
							</c:forEach>
					</select>
			</td>
		</tr>
		<tr>
			<th colspan="2">
				<input type="submit" value="휴가신청">
				<input type="reset"	value="재작성">
				<input type="button" value="돌아가기"
					onclick="window.history.back();">
			</th>
		</tr>
	</table>	
</form>
</body>
</html>