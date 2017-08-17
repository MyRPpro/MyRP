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

	$("#page16711_div01_toggle").bind("click", function(event) {
		$("#page16711_div01").slideToggle();
		return false;
	});
	
	$("#page16711_div01 a").on("click", function(event) {
		$("#page16710_div01").slideUp();
		$("#page16710_div02").slideUp();
		$("#page16710_div03").slideUp();
		$("#page16710_div04").slideDown();
		$("#page16710_div04").load($(this).attr("href"));
		return false;
	});
	
</script>
<body>
	<div class="panel panel-primary" id="page16711">
		<div class="panel-heading">
			<!-- <a id="page16711_div01_toggle">[16711]retired_employee_list.jsp</a> -->
			<h3 class="panel-title">
				<span class="glyphicon glyphicon-user"></span>
				<a id="page16711_div01_toggle">퇴사자 발령 목록</a>
			</h3>
		</div>
		<div class="panel-body" id="page16711_div01">
			<div class="table-responsive">
				<table class="table">
					<tr>
						<th>사원번호</th>
						<th>사원명</th>
						<th>부서명</th>
						<th>직급</th>
						<th>입사일</th>
						<th>퇴직일</th>
					</tr>
					<c:forEach var="dto" items="${retired_employeeDto}">
					<tr>
						<td>${dto.employee_id}</td>
						<td>
							<a href="/hr_management/manage_personnel_card/modify_personnel_card?employee_id=${dto.employee_id}&select_tab=retired">
								${dto.employee_name}
							</a>
						</td>
						<td>${dto.dept_name}</td>
						<td>${dto.hr_code_name}</td>
						<td>${dto.join_date}</td>
						<td>${dto.retired_date}</td>	
					</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		<div id="page16711_div02"></div>
	</div>
</body>
</html>