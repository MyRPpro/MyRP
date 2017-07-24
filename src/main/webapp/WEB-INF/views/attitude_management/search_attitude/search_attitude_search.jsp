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
<body>
search_attitude_search.jsp
<form action="#" name="search_attitude_search" method="get"
	onsubmit="return search_attitude_search();">
	<input type="text" name="search" placeholder="사번,이름 검색">
	<input type="submit" value="검색">
	<input type="reset" value="재작성">
	<input type="button" value="휴가등록"
		onclick="window.location='/attitude_management/add_attitude/add_attitude_search';">
	<input type="button" value="돌아가기" onclick="window.location='/';">
</form>
<table border="1">
		<tr>
			<th>검색하실 인사발령 정보의 사번이나 사원명을 검색창에 입력하세요.</th>
		</tr>
	</table>
</body>
</html>