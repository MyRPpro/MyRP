<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp" %>



<body>
	<table>
		<tr>
			<th>
				<c:if test="${startPage > pageBlock}">
					<a href="javascript:quick_search_load('1')">[◀◀]</a> <!-- 첫 페이지로 이동 -->
					
					<a href="javascript:quick_search_load('${startPage - pageBlock}')">[◀]</a> <!-- 이전 블록으로 이동 -->
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<c:if test="${i == currentPage}">
						<span>[${i}]</span>
					</c:if>
					<c:if test="${i != currentPage}">
						<a href="javascript:quick_search_load('${i}')"> [${i}]</a>
					</c:if>
				</c:forEach>
				<c:if test="${pageCount > endPage}">
					<a href="javascript:quick_search_load('${startPage + pageBlock}')">[▶]</a> <!-- 다음 블록으로 이동 -->
					<a href="javascript:quick_search_load('${pageCount}')">[▶▶]</a> <!-- 마지막 페이지로 이동 -->
				</c:if>
			</th>
		</tr>
	</table>
	
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
						<a href="/purchase_management/search_purchase/purchase_list_table?pageNum=${i}"> [${i}]</a>
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

<%-- 
<script type="text/javascript">
	
	function navStocklist(pageNum) {

		$('#nav_stocklist').load('/purchase_management/search_purchase/purchase_list_page?searchTitleAuthor='
								+'&pageNum='+pageNum);
		return false;
	}

</script>







<body>


	<table>
		<tr>
			<th>
				<c:if test="${startPage > pageBlock}">
					<a href="javascript:nav_Table_list('1')">[◀◀]</a> <!-- 첫 페이지로 이동 -->
					<a href="javascript:?nav_Table_list('${startPage - pageBlock}')">[◀]</a> <!-- 이전 블록으로 이동 -->
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<c:if test="${i == currentPage}">
						<span>[${i}]</span>
					</c:if>
					<c:if test="${i != currentPage}">
						<a href="javascript:nav_Table_list('${i}')">[${i}]</a>
					</c:if>
				</c:forEach>
				<c:if test="${pageCount > endPage}">
					<a href="javascript:nav_Table_list('${startPage + pageBlock}')">[▶]</a> <!-- 다음 블록으로 이동 -->
					<a href="javascript:nav_Table_list('${pageCount}')">[▶▶]</a> <!-- 마지막 페이지로 이동 -->
				</c:if>
			</th>
		</tr>
	</table>
	 --%>
	
	
	
	
	
	
	
	<%-- 
	
	<script type="text/javascript">
	
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
	
	</script>
	
	
	
	
	

	<table>
		<tr>
			<th>
				<c:if test="${startPage > pageBlock}">
					<a href="/purchase_management/search_purchase/purchase_list"  
						onclick="/purchase_management/search_purchase/purchase_list_page" >[◀◀]</a> <!-- 첫 페이지로 이동 -->
					
					<a href="/purchase_management/search_purchase/purchase_list_page?pageNum=${startPage - pageBlock}">[◀]</a> <!-- 이전 블록으로 이동 -->
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<c:if test="${i == currentPage}">
						<span>[${i}]</span>
					</c:if>
					<c:if test="${i != currentPage}">
						<a href="/purchase_management/search_purchase/purchase_list?pageNum=${i}"
						onclick="/purchase_management/search_purchase/purchase_list_page" >
						[${i}]</a>
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
