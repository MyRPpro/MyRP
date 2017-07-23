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
	function fn_retired_employee_search() {
		var searchStr = document.retired_employee_search_form1.searchStr.value;
		$("#retired_employee_nav_div").load("/hr_management/manage_retired_employee/retired_employee_nav?searchStr="+searchStr);
		$("#retired_employee_div").load("/hr_management/manage_retired_employee/retired_employee_list?searchStr="+searchStr);
		return false;
	}
	
	function fn_retired_employee_nav(pageNum) {
		var searchStr = document.retired_employee_search_form1.searchStr.value;
		$("#retired_employee_nav_div").load(
				"/hr_management/manage_retired_employee/retired_employee_nav?"
						+"searchStr="+searchStr
						+'&pageNum='+pageNum);
		$("#retired_employee_div").load(
				"/hr_management/manage_retired_employee/retired_employee_list?"
						+"searchStr="+searchStr
						+'&pageNum='+pageNum);
		return false;
	}
</script>
<body>
retired_employee_search.jsp
<div>
<form action="#" name="retired_employee_search_form1" method="get"
onsubmit="return fn_retired_employee_search();">
	<input type="text" name="searchStr" placeholder="사번,이름 검색">
	<input type="submit" value="검색">
	<input type="reset" value="재작성">
	<input type="button" value="퇴사자 등록"
	onclick="window.location='/hr_management/manage_retired_employee/add_retired_employee';">
	<input type="button" value="돌아가기" onclick="window.location='/';">
</form>
</div>
<hr>
<div id="retired_employee_nav_div">
</div>
<hr>
<div id="retired_employee_div">
<table border="1">
	<tr>
		<th>검색하실 퇴사자 정보의 사번이나 사원명을 검색창에 입력하세요.</th>
	</tr>
</table>
</div>
</body>
</html>