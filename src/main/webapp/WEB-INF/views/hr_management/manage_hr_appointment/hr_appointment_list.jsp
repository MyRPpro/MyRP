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

	$("#page16611_div01_toggel").bind("click", function(event) {
		$("#page16611_div01").slideToggle();
		return false;
	});
	
	$("#page16611_div01 a").on("click", function(event) {
		$("#page16610_div01").slideUp();
		$("#page16610_div02").slideUp();
		$("#page16610_div03").slideUp();
		$("#page16610_div04").slideDown();
		$("#page16610_div04").load($(this).attr("href"));
		return false;
	});
</script>
<body>
	<div class="panel panel-default" id="page16611">
		<div class="panel-heading">
			<a id="page16611_div01_toggel">[16611]hr_appointment_list.jsp</a>
		</div>
		<div class="panel-body" id="page16611_div01">
			<table class="table">
				<tr>
					<th>발령일</th>
					<th>사원번호</th>
					<th>사원명</th>
					<th>이전직급명</th>
					<th>발령직급명</th>
					<th>이전부서명</th>
					<th>발령부서명</th>
				</tr>
				<c:forEach var="dto" items="${hr_appointment_listDtos}">
				<tr>
					<td>${dto.appointment_date}</td>
					<td>${dto.employee_id}</td>
					<td>
						<a href="/hr_management/manage_personnel_card/modify_personnel_card?employee_id=${dto.employee_id}&select_tab=appoint">
							${dto.employee_name}
						</a>
					</td>
					<td>${dto.pre_rank_name}</td>
					<td>${dto.post_rank_name}</td>
					<td>${dto.pre_dept_name}</td>
					<td>${dto.post_dept_name}</td>	
				</tr>
				</c:forEach>
			</table>
		</div>
		<div id="page16611_div02"></div>
	</div>
</body>
</html>