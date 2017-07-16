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
	function fn_personnel_card_search() {
		var searchStr = document.personnel_card_search_form1.searchStr.value;
		$("#personnel_card_list_div").load("/hr_management/manage_personnel_card/personnel_card_list?searchStr="+searchStr);
		$("#personnel_card_nav_div").load("/hr_management/manage_personnel_card/personnel_card_nav?searchStr="+searchStr);
		return false;
	}
	function fn_personnel_card_nav(pageNum) {
		var searchStr = document.personnel_card_search_form1.searchStr.value;
		$("#personnel_card_list_div").load(
				"/hr_management/manage_personnel_card/personnel_card_list?"
						+"searchStr="+searchStr
						+'&pageNum='+pageNum);
		$("#personnel_card_nav_div").load(
				"/hr_management/manage_personnel_card/personnel_card_nav?"
						+"searchStr="+searchStr
						+'&pageNum='+pageNum);
		return false;
	}
</script>
<body>
personnel_card_search.jsp
<div>
<form action="#" name="personnel_card_search_form1" method="get"
onsubmit="return fn_personnel_card_search();">
	<input type="text" name="searchStr" placeholder="사번,이름 검색">
	<input type="submit" value="검색">
	<input type="reset" value="재작성">
	<input type="button" value="인사카드 등록"
	onclick="window.location='/hr_management/manage_personnel_card/add_personnel_card';">
	<input type="button" value="돌아가기" onclick="window.location='/';">
</form>
</div>
<div id="personnel_card_nav_div">
</div>
<hr>
<div id="personnel_card_list_div">
<table border="1">
	<tr>
		<th>검색하실 인사카드의 사번이나 사원명을 검색창에 입력하세요.</th>
	</tr>
</table>
</div>
</body>
</html>