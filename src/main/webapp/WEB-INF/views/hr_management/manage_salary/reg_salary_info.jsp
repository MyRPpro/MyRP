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
	
	$("#page16520_div01_toggle").bind("click", function(event) {
		$("#page16520_div01").slideToggle();
		return false;
	});
	
	$("#page16520_btn01").bind("click", function(event) {
		$("#page16520").slideUp();
		$("#page16510_div01").slideDown();
		$("#page16510_div02").slideDown();
		$("#page16510_div03").slideDown();
		return false;
	});
	
	$("form[name='page16520_form01']").on("submit", function(event) {
		var data = $(this).serialize();
		$.ajax({
			data:	data,
			type:	'post',
			url:	'/hr_management/manage_salary/reg_salary_info_pro',
			success: function(response) {
				$("#page16520_div02").html(response);
			}
		});
		return false;	
	});
	
</script>
<body>
	<div class="panel panel-default" id="page16520">
		<div class="panel-heading">
			<a id="page16520_div01_toggle">[16520]reg_salary_info.jsp</a>
		</div>
		<div class="panel-body" id="page16520_div01">
			<form action="#" name="page16520_form01">
				<table class="table">
					<tr>
						<th>등록일</th>
						<td>
							<c:set var="now" value="<%= new java.util.Date() %>"/>
							<input type="month" name="reg_date" 
							value="<fmt:formatDate value='${now}' pattern='yyyy-MM'/>" 
							required>
						</td>
					</tr>
					<tr>
						<th>급여대장명</th>
						<td>
							<select name="salary_register_name">
								<option value=0>급여구분 선택</option>
								<c:forEach var="vo" items="${hr_codeVos}">
									<option value="${vo.hr_code_id}">${vo.hr_code_name}</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<th>지급일</th>
						<td>
							<c:set var="now" value="<%= new java.util.Date() %>"/>
							<input type="date" name="pay_date" 
							value="<fmt:formatDate value='${now}' pattern='yyyy-MM-dd'/>" 
							required>
						</td>
					</tr>
					<tr>
						<th>총 지급액</th>
						<td>
							<input type="number" name="total_pay"
							min="0" required>
						</td>
					</tr>
					<tr>
						<th>총 지급인원</th>
						<td>
							<input type="number" name="total_employee"
							min="0" required>
						</td>
					</tr>
					<tr>
						<th colspan="2">
							<input class="btn btn-default btn-xs" type="submit" value="등록하기">
							<input class="btn btn-default btn-xs" type="reset"	value="재작성">
							<input class="btn btn-default btn-xs" type="button" value="닫기" id="page16520_btn01">
						</th>
					</tr>
				</table>
			</form>
		</div>
		<div id="page16520_div02"></div>
	</div>
</body>
</html>