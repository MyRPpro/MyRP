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
	
	$("#page16610_div01_toggle").bind("click", function(event) {
		$("#page16610_div01").slideToggle();
	});
	
	$("form[name='page16610_form01']").on("submit", function(event) {
		var $searchStr = $("form[name='page16610_form01'] input[name='searchStr']");
		$("#page16610_div04").slideUp();
		$("#page16610_div02").slideDown();
		$("#page16610_div03").slideDown();
		$("#page16610_div02").load(
				"/hr_management/manage_hr_appointment/hr_appointment_nav?searchStr="+$searchStr.val());
		$("#page16610_div03").load(
				"/hr_management/manage_hr_appointment/hr_appointment_list?searchStr="+$searchStr.val());
		return false;
	});
	
	$("#page16610_btn01").bind("click", function(event) {
		$("#page16610_div01").slideUp();
		$("#page16610_div02").slideUp();
		$("#page16610_div03").slideUp();
		$("#page16610_div04").slideDown();
		$("#page16610_div04").load("/hr_management/manage_hr_appointment/add_hr_appointment");
		return false;
	});
	
	function fn_hr_appointment_nav(pageNum) {
		var $searchStr = $("form[name='page16610_form01'] input[name='searchStr']");
		$("#page16610_div04").slideUp();
		$("#page16610_div02").slideDown();
		$("#page16610_div03").slideDown();
		$("#page16610_div02").load(
				"/hr_management/manage_hr_appointment/hr_appointment_nav?"
						+"searchStr="+$searchStr.val()
						+'&pageNum='+pageNum);
		$("#page16610_div03").load(
				"/hr_management/manage_hr_appointment/hr_appointment_list?"
						+"searchStr="+$searchStr.val()
						+'&pageNum='+pageNum);
		return false;
	}
	
</script>
<body>
	<div class="panel panel-primary" id="page16610">
		<div class="panel-heading">
			<!-- <a id="page16610_div01_toggle">[16610]hr_appointment_search.jsp</a> -->
			<h3 class="panel-title">
				<span class="glyphicon glyphicon-user"></span>
				<a id="page16610_div01_toggle">인사발령 조회</a>	
			</h3>
		</div>
		<div class="panel-body" id="page16610_div01">
			<form class="form-inline" action="#" name="page16610_form01">
				<div class="input-group">
					<input class="form-control" type="text" name="searchStr" placeholder="사번,이름 검색">
					<span class="input-group-btn">
						<button class="btn btn-default" type="submit">검색</button>
						<button class="btn btn-default" type="reset">재작성</button>
						<button class="btn btn-info" type="button" id="page16610_btn01">인사발령 등록</button>
					</span>
				</div>
			</form>
		</div>
		<div class="panel-body" id="page16610_div02"></div>
		<div class="panel-body" id="page16610_div03">
			<table class="table">
				<tr>
					<th>검색하실 인사발령 정보의 사번이나 사원명을 검색창에 입력하세요.</th>
				</tr>
			</table>
		</div>
		<div class="panel-body" id="page16610_div04"></div>
	</div>
</body>
</html>