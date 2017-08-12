<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../../setting.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	
	$("#page17110_div01_toggle").bind("click", function(event) {
		$("#page17110_div01").slideToggle();
	});
	
	$("form[name='page17110_form01']").on("submit", function(event) {
		var $search = $("form[name='page17110_form01'] input[name='search']");
		$("#page17110_div04").slideUp();
		$("#page17110_div02").slideDown();
		$("#page17110_div03").slideDown();
		$("#page17110_div02").load(
				"/attitude_management/search_attitude/hr_attitude_nav?search="+$search.val());
		$("#page17110_div03").load(
				"/attitude_management/search_attitude/hr_attitude_list?search="+$search.val());
		return false;
	});
	
	$("#page17110_btn01").bind("click", function(event) {
		$("#page17110_div01").slideUp();
		$("#page17110_div02").slideUp();
		$("#page17110_div03").slideUp();
		$("#page17110_div04").slideDown();
		$("#page17110_div04").load("/attitude_management/add_attitude/add_attitude_search");
		return false;
	});
	
	function fn_hr_attitude_nav(pageNum) {
		var $search = $("form[name='page17110_form01'] input[name='search']");
		$("#page17110_div04").slideUp();
		$("#page17110_div02").slideDown();
		$("#page17110_div03").slideDown();
		$("#page17110_div02").load(
				"/attitude_management/search_attitude/hr_attitude_nav?"
				+"search="+$search.val()
				+'&pageNum='+pageNum);
		$("#page17110_div03").load(
				"/attitude_management/search_attitude/hr_attitude_list?"
				+"search="+$search.val()
				+'&pageNum='+pageNum);
		return false;
	}
	
</script>
</head>
<body>
	<div class="panel panel-primary" id="page17110">
		<div class="panel-heading">
			<!-- <a id="page17110_div01_toggle">[17110]search_attitude_search.jsp</a> -->
			<h3 class="panel-title">
				<span class="glyphicon glyphicon-calendar"></span>
				<a id="page17110_div01_toggle">근태 조회</a>
			</h3>
		</div>
		<div class="panel-body" id="page17110_div01">
			<form class="form-inline" action="#" name="page17110_form01">
				<div class="input-group">
					<input class="form-control" type="text" name="search" placeholder="사번,이름 검색">
					<span class="input-group-btn">
						<button class="btn btn-default" type="submit">검색</button>
						<button class="btn btn-default" type="reset">재작성</button>
						<button class="btn btn-info" type="button" id="page17110_btn01">휴가등록</button>
					</span>
				</div>
			</form>
		</div>
		<div class="panel-body" id="page17110_div02"></div>
		<div class="panel-body" id="page17110_div03">
			<table class="table">
				<tr>
					<th>검색하실 인사발령 정보의 사번이나 사원명을 검색창에 입력하세요.</th>
				</tr>
			</table>
		</div>
		<div class="panel-body" id="page17110_div04"></div>
		</div>
</body>
</html>