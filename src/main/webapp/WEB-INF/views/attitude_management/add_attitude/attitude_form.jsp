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
	
	$("#page17220_div01_toggle").bind("click", function(event) {
		$("#page17220_div01").slideToggle();
		return false;
	});
	
	$("#page17220_btn01").bind("click", function(event) {
		$("#page17220").slideUp();
		$("#page17210_div01").slideDown();
		return false;
	});
	
	$("form[name='page17220_form01']").on("submit", function(event) {
		var pre_rank = document.page17220_form01.pre_rank;
		var leave_code = document.page17220_form01.leave_code;
		if(leave_code.value == 0) {
			alert("휴가 종류를  선택하세요.");
			leave_code.focus();
			return false;
		} 
		
		var attitude_reason = document.page17220_form01.attitude_reason;
		if(attitude_reason.value == 0) {
			alert("휴가 사유를 선택하세요.");
			attitude_reason.focus();
			return false;
		}
		
		var last_date = new Date("${last_date}");
		last_date.setTime(last_date*1+1000*60*60*24);
		var select_date = new Date(document.page17220_form01.attitude_date1.value);
		if(select_date < last_date) {
			alert("이미 승인 받은 휴가기간 입니다 다시 등록 해주세요.");
			document.page17220_form01.attitude_date1.focus();
			return false;
		}
	
		var data = $(this).serialize();
		$.ajax({
			data:	data,
			type:	'post',
			url:	'/attitude_management/add_attitude/add_attitude_search_pro',
			success: function(response) {
				$("#page17220_div02").html(response);
			}
		});
		return false;
	});

</script>
</head>
<body>
	<div class="panel panel-primary" id="page17220">
		<div class="panel-heading">
			<!-- <a class="page17220_div_toggle">[17220]attitude_form.jsp</a> -->
			<h3 class="panel-title">
				<span class="glyphicon glyphicon-calendar"></span>
				<a class="page17220_div_toggle">근태등록 양식</a>
			</h3>
		</div>	
	<div class="panel-body" id="page17220_div01">
	<form action="#" name="page17220_form01">
		<table class="table">
			<tr>
				<th>사원번호</th>
				<td>
					<input class="form-control input-sm" type="text" name="employee_id" value="${employeeVo.employee_id}" readonly>
				</td>
			</tr>
			<tr>
				<th>사원명</th>
				<td>
					<input class="form-control input-sm" type="text" name="employee_name" value="${employeeVo.employee_name}" readonly>
				</td>
			</tr>
			<tr>
				<th>부서이름</th>
				<td>
					<input type="hidden" name="hr_code_group_rank" value="2">
					<input type="hidden" name="pre_rank" value="${dept_id}">
					<input class="form-control input-sm" type="text" name="dept_name" value="${dept_name}" readonly>
				</td>
			</tr>
			<tr>
				<th>휴가선택</th>
				<td>
					<input type="hidden" name="hr_code_group_rank" value="3">
					<select class="form-control input-sm" name="leave_code">
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
				<th>휴가기간 선택</th>
				<td>
					<input class="form-control input-sm" type="date" name="attitude_date1" value="<fmt:formatDate value='${appointment_date1}' pattern='yyyy-MM-dd'/>">
					<input class="form-control input-sm" type="date" name="attitude_date2" value="<fmt:formatDate value='${appointment_date2}' pattern='yyyy-MM-dd'/>">
				</td>
			</tr>
			<tr>
				<th>휴가사유</th>
				<td>
					<input type="hidden" name="hr_code_group_rank" value="8">
						<select class="form-control input-sm" name="attitude_reason">
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
					<div class="btn-group btn-group-default">
						<input class="btn btn-primary btn-sm" type="submit" value="휴가신청">
						<input class="btn btn-default btn-sm" type="reset"	value="재작성">
						<input class="btn btn-default btn-sm" type="button" value="닫기"id="page17220_btn01">
					</div>
				</th>
			</tr>
		</table>	
	</form>
	</div>
	<div id="page17220_div02"></div>
</div>
</body>
</html>