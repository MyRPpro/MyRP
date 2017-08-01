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
	
	$("#page16510_div01_toggle").bind("click", function(event) {
		$("#page16510_div01").slideToggle();
		return false;
	});
	
	$("#page16510_btn01").bind("click", function(event) {
		$("#page16510_div01").slideUp();
		$("#page16510_div02").slideUp();
		$("#page16510_div03").slideUp();
		$("#page16510_div04").slideDown();
		$("#page16510_div04").load("/hr_management/manage_salary/reg_salary_info");
		return false;
	});
	
	$("#page16510_btn02").bind("click", function(event) {
		$("#page16510_div01").slideUp();
		$("#page16510_div02").slideUp();
		$("#page16510_div03").slideUp();
		$("#page16510_div04").slideDown();
		$("#page16510_div04").load("/accounting_management/statement_management/make_statement");
		return false;
	});
	
	$("#page16510_btn03").bind("click", function(event) {
		$("#page16510_div01").slideUp();
		$("#page16510_div02").slideUp();
		$("#page16510_div03").slideUp();
		$("#page16510_div04").slideDown();
		$("#page16510_div04").load("/hr_management/manage_salary/salary_statement_search");
		return false;
	});
	
	$("#page16510_btn04").bind("click", function(event) {
		$("#page16510_div01").slideUp();
		$("#page16510_div02").slideUp();
		$("#page16510_div03").slideUp();
		$("#page16510_div04").slideDown();
		$("#page16510_div04").load("/hr_management/manage_salary/clear_salary_bank_account");
		return false;
	});
	
	$("form[name='page16510_form01']").on("submit", function(event) {
		var salary_register_name = document.page16510_form01.salary_register_name.value;
		var search_start = document.page16510_form01.search_start.value;
		var search_end = document.page16510_form01.search_end.value;
		$("#page16510_div01").slideDown();
		$("#page16510_div02").slideDown();
		$("#page16510_div03").slideDown();
		$("#page16510_div04").slideUp();
		$("#page16510_div02").load(
				"/hr_management/manage_salary/salary_register_nav"+
				"?salary_register_name="+salary_register_name+
				"&search_start="+search_start+
				"&search_end="+search_end);
		$("#page16510_div03").load(
				"/hr_management/manage_salary/salary_register_list"+
				"?salary_register_name="+salary_register_name+
				"&search_start="+search_start+
				"&search_end="+search_end);
		return false;
	});
	
	function fn_salary_register_nav(pageNum) {
		var salary_register_name = document.page16510_form01.salary_register_name.value;
		var search_start = document.page16510_form01.search_start.value;
		var search_end = document.page16510_form01.search_end.value;
		$("#page16510_div01").slideDown();
		$("#page16510_div02").slideDown();
		$("#page16510_div03").slideDown();
		$("#page16510_div04").slideUp();
		$("#page16510_div02").load(
				"/hr_management/manage_salary/salary_register_nav"+
				"?salary_register_name="+salary_register_name+
				"&search_start="+search_start+
				"&search_end="+search_end+
				"&pageNum="+pageNum);
		$("#page16510_div03").load(
				"/hr_management/manage_salary/salary_register_list"+
				"?salary_register_name="+salary_register_name+
				"&search_start="+search_start+
				"&search_end="+search_end+
				"&pageNum="+pageNum);
		return false;
	}
	
</script>
<body>
	<div class="panel panel-default" id="page16510">
		<div class="panel-heading">
			<a id="page16510_div01_toggle">[16510]salary_register.jsp</a>		
		</div>
			<div class="btn-group btn-group-justified" role="group" aria-label="...">
			 	<div class="btn-group" role="group">
					<button type="button" class="btn btn-default" id="page16510_btn01">급여대장 등록</button>
				</div>
				<div class="btn-group" role="group">
					<button type="button" class="btn btn-default" id="page16510_btn02">회계전표 등록</button>
				</div>
				<div class="btn-group" role="group">
					<button type="button" class="btn btn-default" id="page16510_btn03">회계전표조회</button>
				</div>
				<div class="btn-group" role="group">
					<button type="button" class="btn btn-default"  id="page16510_btn04">급여지급</button>
				</div>
			</div>
		<div class="panel-body" id="page16510_div01">
			<form class="form-inline" action="#" name="page16510_form01">
				<input class="form-control" type="date" name="search_start">~
				<input class="form-control" type="date" name="search_end">
				<div class="input-group">
					<select class="form-control" name="salary_register_name">
						<option value=0>급여구분 선택</option>
						<c:forEach var="vo" items="${hr_codeVos}">
							<option value="${vo.hr_code_id}">${vo.hr_code_name}</option>
						</c:forEach>
					</select>
					<span class="input-group-btn">
						<button class="btn btn-default" type="submit">검색</button>
						<button class="btn btn-default" type="reset">재작성</button>
					</span>
				</div>
			</form>
		</div>
		<div class="panel-body" id="page16510_div02"></div>
		<div class="panel-body" id="page16510_div03">
			<table class="table">
				<tr>
					<th>검색하실 급여대장의 급여구분이나 지급연월 범위를 검색창에 입력하세요.</th>
				</tr>
			</table>
		</div>
		<div class="panel-body" id="page16510_div04"></div>
	</div>
</body>
</html>