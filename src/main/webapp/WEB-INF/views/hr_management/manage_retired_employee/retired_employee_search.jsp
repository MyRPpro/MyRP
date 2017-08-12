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
	
	$("#page16710_div01_toggle").bind("click", function(event) {
		$("#page16710_div01").slideToggle();
		return false;
	});

	$("#page16710_btn01").bind("click", function(evnet) {
		$("#page16710_div01").slideUp();
		$("#page16710_div02").slideUp();
		$("#page16710_div03").slideUp();
		$("#page16710_div04").slideDown();
		$("#page16710_div04").load("/hr_management/manage_retired_employee/add_retired_employee");
		return false;
	});
	
	$("form[name='page16710_form01']").on("submit", function(event) {
		var searchStr = document.page16710_form01.searchStr.value;
		$("#page16710_div04").slideUp();
		$("#page16710_div02").slideDown();
		$("#page16710_div03").slideDown();
		$("#page16710_div02").load(
				"/hr_management/manage_retired_employee/retired_employee_nav?searchStr="+searchStr);
		$("#page16710_div03").load(
				"/hr_management/manage_retired_employee/retired_employee_list?searchStr="+searchStr);
		return false;
	});
	
	function fn_retired_employee_nav(pageNum) {
		var searchStr = document.page16710_form01.searchStr.value;
		$("#page16710_div04").slideUp();
		$("#page16710_div02").slideDown();
		$("#page16710_div03").slideDown();
		$("#page16710_div02").load(
				"/hr_management/manage_retired_employee/retired_employee_nav?"
						+"searchStr="+searchStr
						+'&pageNum='+pageNum);
		$("#page16710_div03").load(
				"/hr_management/manage_retired_employee/retired_employee_list?"
						+"searchStr="+searchStr
						+'&pageNum='+pageNum);
		return false;
	}
	
</script>
<body>
	<div class="panel panel-primary" id="page16710">
		<div class="panel-heading">
			<!-- <a id="page16710_div01_toggle">[16710]retired_employee_search.jsp</a> -->
			<h3 class="panel-title">
				<span class="glyphicon glyphicon-user"></span>
				<a id="page16710_div01_toggle">퇴사자 조회</a>
			</h3>
		</div>
		<div class="panel-body" id="page16710_div01">
			<form class="form-inline" action="#" name="page16710_form01">
				<div class="input-group">
					<input class="form-control" type="text" name="searchStr" placeholder="사번,이름 검색">
					<span class="input-group-btn">
						<button class="btn btn-default" type="submit">검색</button>
						<button class="btn btn-default" type="reset">재작성</button>
						<button class="btn btn-info" type="button" id="page16710_btn01">퇴사자 등록</button>
					</span>
				</div>
			</form>
		</div>
		<div class="panel-body" id="page16710_div02"></div>
		<div class="panel-body" id="page16710_div03">
			<div class="table-responsive">
				<table class="table">
					<tr>
						<th>검색하실 퇴사자 정보의 사번이나 사원명을 검색창에 입력하세요.</th>
					</tr>
				</table>			
			</div>
		</div>
	</div>
	<div id="page16710_div04"></div>
</body>
</html>