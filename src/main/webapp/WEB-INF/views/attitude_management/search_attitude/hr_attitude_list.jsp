<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../../setting.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	$("#page17130_div_toggel").bind("click", function(event){
		$("#page17130_div01").slideToggle();
	});
	$("#page17130_div01 a").on("click", function(event) {
		$("#page17110_div01").slideUp();
		$("#page17110_div02").slideUp();
		$("#page17110_div03").slideUp();
		$("#page17110_div04").slideDown();
		$("#page17110_div04").load($(this).attr("href"));
		return false;
	});

</script>
</head>
<body>
	<div class="panel panel-default" id="page17130">
		<div class="panel-heading">
			<a id="page17130_div_toggel">hr_attitude_list.jsp</a>
		</div>
		<div class="panel-body" id="page17130_div01">
		<table class="table">

				<tr>
					<th>사원번호</th>
					<th>사원이름</th>
					<th>휴가시작일</th>
					<th>휴가명</th>
					<th>휴가일</th>
					<th>휴가사유명</th>
				</tr>
				<c:forEach var="dto" items="${hr_attitude_listDtos}">
				<tr>
					<td>${dto.employee_id}</td>
					<td>
						<a href="/hr_management/manage_personnel_card/modify_personnel_card?employee_id=${dto.employee_id}&select_tab=attitude">
							${dto.employee_name}
						</a>
					</td>
					<td>${dto.attitude_date}</td>
					<td>${dto.leave_code_name}</td>
					<td>${dto.attitude_period}</td>
					<td>${dto.attitude_reason_name}</td>
				</tr>
				</c:forEach>
			</table>
		</div>
		<div id="page17130_div02"></div>
	</div>
</body>
</html>