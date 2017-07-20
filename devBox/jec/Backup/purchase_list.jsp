<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- <%@ include file="../../setting.jsp" %> --%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


	<h3> 구매 리스트 페이지 : purchase_list.jsp</h3>
	
	<%-- 
	<c:if test="${purchaseVOs eq null}">
		<script type="text/javascript">
			alert("검색된 내용이 없습니다.");
			window.history.back();
		</script>
	</c:if>
	 --%>
	
	

	<!-- <form action="/purchase_management/search_purchase/quick_serch_purchase"> -->
	
	<form action="#" name="purchase_list" onsubmit="return quick_search_load(1)" >
		<input type="text" name="search_str" placeholder="거래처명을 입력하세요." minlength="1">
		<input type="submit" value="검색">
		<input type="button" value="전체목록" onclick="return quick_search_load(1)">
	</form>
	
	<p><h5> 구매 리스트를 볼 수 있는 페이지 입니다. </h5></p>
	<p> 지금까지 거래된 내역을 표시하며 회사이름을 클릭하면 상세내역을 확인하거나 수정할 수 있습니다. </p>
	
	<div id="list_table"></div>
	<div id="list_page"></div>
	
	
	 <!-- onclick="quick_search();" --> 
	 <%-- <input type="hidden" name="pageNum" value="${pageNum}"> --%>
	 
	<!-- /////////////////////////////////////////////////////////////////// -->
		
		
	<script src="//code.jquery.com/jquery.min.js"></script>
	<script>
		
		function quick_search_load(pageNum){
			
			var search_str = document.purchase_list.search_str.value;
			/* var search_str = document.getElementsBy */
			
			
			console.log(" search_str :" + search_str )
			console.log(" pageNum :" + pageNum )
			
			$('#list_table').load('/purchase_management/search_purchase/purchase_list_table?search_str='+search_str+'&pageNum='+pageNum);
			$('#list_page').load('/purchase_management/search_purchase/purchase_list_page?search_str='+search_str+'&pageNum='+pageNum);
			
			return false;
		}
	
		/* 
		function quick_search_table(){
		
		
			var keyword = new Object();
			keyword["search_str"]  = $("input[name=search_str]").val(); 
			keyword["pageNum"]  = $("input[name=pageNum]").val(); 
			console.log("  -> param :"+param["search_str"]);
			
				
			$.ajax({
			     url: "/purchase_management/search_purchase/purchase_list_table"
			   	,data: keyword
			    ,type: 'get'
			    ,success:function(res_table){
			        $('#list_table').html(res_table);
			    }
			}); 
			
			$.ajax({
			     url: "/purchase_management/search_purchase/purchase_list_page"
			     ,data: keyword  
			    ,type: 'get'
			    ,success:function(res_pagenum){
			        $('#list_page').html(res_pagenum);
			    }
			}); 
			
		}
		 */
		
	/* 
		function quick_search_page(){		
			
			var keyword = new Object();
			keyword["search_str"]  = $("input[name=search_str]").val(); 
			console.log("  -> search_str :"+keyword["search_str"]);
			
			$.ajax({
			     url: "/purchase_management/search_purchase/purchase_list_page"
			    ,data: keyword 
			    ,type: 'get'
			    ,success:function(res_pagenum){
			        $('#page_nav').html(res_pagenum);
			    }
			}); 
		} 
 */
		
	</script>
	
	
	<!-- /////////////////////////////////////////////////////////////////// -->
	
	
	
	
	
	<!-- /////////////////////////////////////////////////////////////////// -->
	
	
	<%-- 
	<table>
		<tr>
			<th>
				<c:if test="${startPage > pageBlock}">
					<a href="/purchase_management/search_purchase/purchase_list">[◀◀]</a> <!-- 첫 페이지로 이동 -->
					
					<a href="/purchase_management/search_purchase/purchase_list?pageNum=${startPage - pageBlock}">[◀]</a> <!-- 이전 블록으로 이동 -->
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<c:if test="${i == currentPage}">
						<span>[${i}]</span>
					</c:if>
					<c:if test="${i != currentPage}">
						<a href="/purchase_management/search_purchase/purchase_list?pageNum=${i}"> [${i}]</a>
					</c:if>
				</c:forEach>
				<c:if test="${pageCount > endPage}">
					<a href="/purchase_management/search_purchase/purchase_list_page?pageNum=${startPage + pageBlock}">[▶]</a> <!-- 다음 블록으로 이동 -->
					<a href="/purchase_management/search_purchase/purchase_list_page?pageNum=${pageCount}">[▶▶]</a> <!-- 마지막 페이지로 이동 -->
				</c:if>
			</th>
		</tr>
	</table>
	
	 --%>
	
	
	
</body>
</html>