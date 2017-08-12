<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../../setting.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	function fn_clear_payment(salary_register_id,account_id,pay_date) {
		var now = new Date();
		var year= now.getFullYear();
	    var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
		var today = year + mon + "-" +  (now.getDate());
		if(pay_date.replace("-","") > today) {
			alert("지급예정일 이후로만 급여지급이 가능합니다.");
			return false;
		}
		var url	=	"/hr_management/manage_salary/clear_salary_bank_account_pro"+
					"?salary_register_id="+salary_register_id+
					"&account_id="+account_id;
		$("#page16514_div02").load(url);
		return false;
		
	}
	
	$("#page16514_div01_toggle").bind("click", function(event) {
		$("#page16514_div01").slideToggle();
		return false;
	});
	
	$("#page16514_btn01").bind("click", function(event) {
		$("#page16514").slideUp();
		$("#page16510_div01").slideDown();
		$("#page16510_div02").slideDown();
		$("#page16510_div03").slideDown();
		return false;
	});
	
	$("#page16514_btn02").bind("click", function(event) {
		$("#page16514").slideUp();
		$("#page16510_div01").slideDown();
		$("#page16510_div02").slideDown();
		$("#page16510_div03").slideDown();
		return false;
	});
	
</script>
<body>
	<div class="panel panel-primary" id="page16514">
		<div class="panel-heading">
			<!-- <a id="page16514_div01_toggle">[16514]clear_salary_bank_account.jsp</a> -->
			<h3 class="panel-title">
				<span class="glyphicon glyphicon-user"></span>
				<a id="page16514_div01_toggle">급여 지급</a>
			</h3>
		</div>
		<div class="panel-body" id="page16514_div01">
			<div class="table-responsive">
				<c:if test="${cnt == 0}">
					<table class="table">
						<tr>
							<th>지급대기 중인 급여가 없습니다.</th>
						</tr>
						<tr>
							<td>
								<input class="btn btn-default btn-sm" type="button" value="닫기" id="page16514_btn01">			
							</td>
						</tr>
					</table>
				</c:if>
				<c:if test="${cnt != 0}">
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
							<th>급여지급</th>
						</tr>
						<c:forEach var="vo" items="${vos}">
							<tr>
								<td>${vo.salary_register_id}</td>
								<td>${vo.account_id}</td>
								<td>${vo.reg_date}</td>
								<td>${vo.salary_register_name}</td>
								<td>${vo.pay_date}</td>
								<td><fmt:formatNumber value="${vo.total_pay}" type="number"/></td>
								<td>${vo.total_employee}</td>
								<td>${vo.salary_state_name}</td>
								<td>
									<input class="btn btn-info btn-sm" type="button" value="급여지급"
									onclick="return fn_clear_payment(${vo.salary_register_id},${vo.account_id},'${vo.pay_date}');">
								</td>
							</tr>
						</c:forEach>
						<tr>
							<td colspan="9">
								<input class="btn btn-default btn-sm" type="button" value="닫기" id="page16514_btn02">			
							</td>
						</tr>
					</table>
				</c:if>		
			</div>
		</div>
		<div id="page16514_div02"></div>
	</div>
</body>
</html>