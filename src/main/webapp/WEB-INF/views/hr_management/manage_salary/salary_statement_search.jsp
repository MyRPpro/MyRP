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

	$("#page16513_div01_toggel").bind("click", function(event) {
		$("#page16531_div01").slideToggle();
		return false;
	});
	
	$("#page16531_btn01").bind("click", function(event) {
		$("#page16513").slideUp();
		$("#page16510_div01").slideDown();
		$("#page16510_div02").slideDown();
		$("#page16510_div03").slideDown();
		return false;
	});
	
	$("#page16513_btn02").bind("click", function(event) {
		$("#page16513").slideUp();
		$("#page16510_div01").slideDown();
		$("#page16510_div02").slideDown();
		$("#page16510_div03").slideDown();
		return false;
	});

</script>
<body>
	<div class="panel panel-default" id="page16513">
		<div class="panel-heading">
			<a id="page16513_div01_toggel">[16513]salary_statement_search.jsp</a>		
		</div>
		<div class="panel-body" id="page16531_div01">
			<c:if test="${cnt == 0}">
				<table class="table">
					<tr>
						<th>새로 승인완료된 전표가 없습니다.</th>
					</tr>
					<tr>
						<td>
							<input class="btn btn-default btn-xs" type="button" value="닫기" id="page16531_btn01">			
						</td>
					</tr>
				</table>
			</c:if>
			<c:if test="${cnt != 0}">
				<table class="table">
					<tr>
						<th colspan="8">Salary_registerVO</th>
					</tr>
					<tr>
						<th>급여대장 번호</th>
						<th>계정</th>
						<th>등록일</th>
						<th>급여대장명</th>
						<th>지급일</th>
						<th>총 지급액</th>
						<th>총 지급인원</th>
						<th>급여상태</th>
						<th></th>
					</tr>
					<c:forEach var="vo" items="${vos}">
						<tr>
							<td>${vo.salary_register_id}</td>
							<td>${vo.account_id}</td>
							<td>${vo.reg_date}</td>
							<td>${vo.salary_register_name}</td>
							<td>${vo.pay_date}</td>
							<td>${vo.total_pay}</td>
							<td>${vo.total_employee}</td>
							<td>${vo.salary_state}</td>
							<td></td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="8">
							<input class="btn btn-default btn-xs" type="button" value="닫기" id="page16513_btn02">			
						</td>
					</tr>
				</table>
			</c:if>
		</div>
	</div>
</body>
</html>