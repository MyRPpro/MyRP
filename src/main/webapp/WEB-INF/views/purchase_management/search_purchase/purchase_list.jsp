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
	
	<form action="#" name="purchase_list" onsubmit="return search_list(1,1)" >
		<input type="text" name="search_str" placeholder="구매번호를 입력하세요." minlength="1">
		<input type="submit" value="검색">
		<input type="button" value="전체목록" onclick="return search_list(1,0)">
		<input type="button" value="메인으로 이동" onclick="window.location='/'" >
		<br>
		<input type="button" value="구매등록" onclick="window.location='/purchase_management/input_purchase/reg_purchase'">
		<input type="button" value="구매승인" onclick="return search_list(1,4)">
		<input type="button" value="전표등록" onclick="window.location='/accounting_management/statement_management/search_all_statements'" >
		<input type="button" value="전표승인조회" onclick="return search_list(1,2)">
		<input type="button" value="입고요청" onclick="window.location='/distribution_management/search_distribution_order/statement_list'" >
		<input type="button" value="입고완료조회" onclick="return search_list(1,3)">

	</form>
	<hr>
	<div id="list_page"></div>
	
	<div id="list_table">
		<p><h3> 구매 리스트를 볼 수 있는 페이지 입니다. </h3></p>
		<p> 구배번호를 입력후 검색을 누르면 해당 내역을 볼 수 있습니다. </p>
		<p> 전체 내역을 확인하고 싶으면 전체목록 버튼을 눌러주세요. </p>
		<p> 지금까지 거래된 내역을 표시하며 회사이름을 클릭하면 상세내역을 확인하거나 수정할 수 있습니다. </p>
	</div>

		
	<script src="//code.jquery.com/jquery.min.js"></script>
	<script>	
	
	function search_list(pagenum,check){

		var check = check;
		var pagenum = pagenum;
		var search_str = null;
		console.log(" pagenum :" + pagenum )
		
		// 전체 검색
		if ( check == 0 ){
			search_str = "all";
			
		// 검색어 검색
		} else if ( check == 1 ){
			search_str = document.purchase_list.search_str.value;
			if ( !search_str ){
				search_str = "all";
			}
		
		// 전표승인 검색
		} else if (check == 2 ){
			search_str = "account";
		
		// 출고완료 검색
		} else if (check == 3 ){
			search_str = "stock";
			
		} else if (check == 4 ){
			search_str = "check";
		}
		
		console.log(" search_str :" + search_str );
		$('#list_table').load('/purchase_management/search_purchase/purchase_list_table?search_str='+search_str+'&pageNum='+pagenum);
		$('#list_page').load('/purchase_management/search_purchase/purchase_list_page?search_str='+search_str+'&pageNum='+pagenum);
		
		return false;
	}
	
	</script>
</body>
</html>