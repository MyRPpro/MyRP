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
	
	$("#page16311_div01_toggle").bind("click", function() {
		$("#page16311_div01").slideToggle();
	});
</script>

<body>
	<div id="page16311">
		<a id="page16311_div01_toggle">[16311]personnel_card_list.jsp</a>
		<div id="page16311_div01">
			<table class="table">
			<tr>
				<th colspan="10">Personnel_card_listDTO</th>
			</tr>
			<tr>
				<th>사원번호</th>
				<th>부서명</th>
				<th>직급</th>
				<th>사원명</th>
				<th>주민등록번호</th>
				<th>입사일</th>
			</tr>
			<c:forEach var="dto" items="${presonnel_card_listDtos}">
			<tr>
				<td>${dto.employee_id}</td>
				<td>${dto.dept_name}</td>
				<td>${dto.hr_code_name}</td>
				<td>
					<a href="/hr_management/manage_personnel_card/modify_personnel_card?employee_id=${dto.employee_id}">
						${dto.employee_name}
					</a>
				</td>
				<td>${dto.residence_reg_no}</td>
				<td>${dto.join_date}</td>
			</tr>
			</c:forEach>
		</table>
		</div>
	</div>
</body>
</html>