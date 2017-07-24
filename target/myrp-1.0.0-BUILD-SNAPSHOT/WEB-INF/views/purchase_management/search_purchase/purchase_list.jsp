<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../setting.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


	<h2> 구매 리스트 페이지 : purchase_list.jsp</h2>
	
	
	
	<form action="#" name="purchase_list" onsubmit="return quick_search_load(1)" >
		<input type="text" name="search_str" placeholder="거래처명을 입력하세요." minlength="1">
		<input type="submit" value="검색">
		<input type="button" value="전체목록" onclick="return quick_search_load(1)">
		<input type="button" value="메인으로 이동" onclick="window.location='/'" >
	</form>
	<hr>
	<div id="list_page"></div>
	
	<div id="list_table">
		<p><h3> 구매 리스트를 볼 수 있는 페이지 입니다. </h3></p>
		<p> 거래처명을 이력후 검색을 누르면 해당 내역을 볼 수 있습니다. </p>
		<p> 전체 내역을 확인하고 싶으면 전체목록 버튼을 눌러주세요. </p>
		<p> 지금까지 거래된 내역을 표시하며 회사이름을 클릭하면 상세내역을 확인하거나 수정할 수 있습니다. </p>
	</div>

		
	<script src="//code.jquery.com/jquery.min.js"></script>
	<script>	
	
	function quick_search_load(param){
		
		var search_str = document.purchase_list.search_str.value;
		
		console.log(" search_str :" + search_str )
		console.log(" param :" + param )
		
		$('#list_table').load('/purchase_management/search_purchase/purchase_list_table?search_str='+search_str+'&pageNum='+param);
		$('#list_page').load('/purchase_management/search_purchase/purchase_list_page?search_str='+search_str+'&pageNum='+param);
		
		return false;
	}
	
	</script>
</body>
</html>