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
	
	$("#page16311_div01 a").bind("click", function(event) {
		$("#page16310_div01").slideUp();
		$("#page16310_div02").slideUp();
		$("#page16310_div03").slideUp();
		$("#page16310_div04").slideDown();
		$("#page16310_div04").load($(this).attr("href"));
		return false;
	});
</script>

<body>
	<div class="panel panel-primary" id="page16311">
		<div class="panel-heading">
			<!-- <a id="page16311_div01_toggle">[16311]personnel_card_list.jsp</a> -->
			<h3 class="panel-title">
				<span class="glyphicon glyphicon-user"></span>
				<a id="page16311_div01_toggle">인사카드 목록</a>
			</h3>
		</div>
		<div class="panel-body" id="page16311_div01">
			<table class="table">
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
						<a href="/hr_management/manage_personnel_card/modify_personnel_card?employee_id=${dto.employee_id}&select_tab=info">
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