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
	
	$("#page16310_div01_toggle").bind("click", function() {
		$("#page16310_div01").slideToggle();
	});
	
	$("form[name='page16310_form01']").on("submit", function() {
		var $searchStr = $("form[name='page16310_form01'] input[name='searchStr']");
		$("#page16310_div04").slideUp();
		$("#page16310_div02").slideDown();
		$("#page16310_div03").slideDown();
		$("#page16310_div02").load(
				"/hr_management/manage_personnel_card/personnel_card_nav?searchStr="+$searchStr.val());
		$("#page16310_div03").load(
				"/hr_management/manage_personnel_card/personnel_card_list?searchStr="+$searchStr.val());
		return false;
	});

	$("#page16310_btn01").bind("click", function(event) { //인사카드등록페이지 이동
		$("#page16310_div01").slideUp();
		$("#page16310_div02").slideUp();
		$("#page16310_div03").slideUp();
		$("#page16310_div04").slideDown();
		$("#page16310_div04").load("/hr_management/manage_personnel_card/add_personnel_card");
		return false;		
	});
	
	function fn_personnel_card_nav(pageNum) {
		var $searchStr = $("form[name='page16310_form01'] input[name='searchStr']");
		$("#page16310_div04").slideUp();
		$("#page16310_div02").slideDown();
		$("#page16310_div03").slideDown();
		$("#page16310_div02").load(
				"/hr_management/manage_personnel_card/personnel_card_nav?"
						+"searchStr="+$searchStr.val()
						+'&pageNum='+pageNum);
		$("#page16310_div03").load(
				"/hr_management/manage_personnel_card/personnel_card_list?"
						+"searchStr="+$searchStr.val()
						+'&pageNum='+pageNum);
		return false;
	}
	
</script>
<body>
	<div class="panel panel-default" id="page16310">
		<div class="panel-heading">
	  		<a id="page16310_div01_toggle">[16310]personnel_card_search.jsp</a>
		</div>
		<div class="panel-body" id="page16310_div01">
			<form class="form-inline" action="#" name="page16310_form01">
				<div class="input-group">
					<input type="text" class="form-control" name="searchStr" placeholder="사번,이름 검색">
					<span class="input-group-btn">
						<button class="btn btn-default" type="submit">검색</button>
						<button class="btn btn-default" type="reset">재작성</button>
						<button class="btn btn-default" type="button" id="page16310_btn01">인사카드 등록</button>
					</span>
				</div>
			</form>
		</div>
		<div class="panel-body" id="page16310_div02"></div>
		<div class="panel-body" id="page16310_div03">
			<table class="table">
				<tr>
					<th>검색하실 인사카드의 사번이나 사원명을 검색창에 입력하세요.</th>
				</tr>
			</table>
		</div>
		<div class="panel-body" id="page16310_div04"></div>
	</div>
</body>
</html>