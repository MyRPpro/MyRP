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
	
	$("#page16511_div01_toggle").bind("click", function(event) {
		$("#page16511_div01").slideToggle();
		return false;
	});
	
	$("#page16511_div01 a").bind("click", function(event) {
		$("#page16510_div01").slideUp();
		$("#page16510_div02").slideUp();
		$("#page16510_div03").slideUp();
		$("#page16510_div04").slideDown();
		$("#page16510_div04").load($(this).attr("href"));
		return false;
	});
</script>
<body>
	<div class="panel panel-default" id="page16511">
		<div class="panel-heading">
			<a id="page16511_div01_toggle">[16511]salary_register_list.jsp</a>
		</div>
		<div class="panel-body" id="page16511_div01">
			<table class="table">
				<tr>
					<th>급여대장 번호</th>
					<th>계정</th>
					<th>등록일</th>
					<th>급여대장명</th>
					<th>지급일</th>
					<th>총 지급액</th>
					<th>총 지급인원</th>
					<th>급여상태</th>		
				</tr>
				<c:forEach var="vo" items="${salary_registerVos}">
				<tr>
					<td>${vo.salary_register_id}</td>
					<td>${vo.account_id}</td>
					<td>${vo.reg_date}</td>
					<td>
						<a href="/hr_management/manage_salary/modify_salary_info?salary_register_id=${vo.salary_register_id}&account_id=${vo.account_id}">
							${vo.salary_register_name}
						</a>
					</td>
					<td>${vo.pay_date}</td>
					<td>${vo.total_pay}</td>
					<td>${vo.total_employee}</td>
					<td>${vo.salary_state_name}</td>
				</tr>
				</c:forEach>
			</table>		
		</div>
	</div>
</body>
</html>