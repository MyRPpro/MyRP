<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../../setting.jsp"%>
<script type="text/javascript">
function slideUp(){
		$("#search_account_list_content").slideUp(); 
}
$(function(){
	$("#add_account_button").bind("click",function(){
		$("#search_account_list_content").slideUp(); 
		$("#account_list_stage").slideDown();
		$("#account_list_stage").load("/accounting_management/account_management/add_account");
	});
});
$(function(){
	$("#search_account_list a").bind("click", function(){
		$("#search_account_list_content").slideDown(); 
	})
})
$(function(){
	$('#account_list_table a').bind("click",function(){
		$("#search_account_list_content").slideUp();
		$("#account_list_stage").slideDown();
		$("#account_list_stage").load($(this).attr("href"));
		return false;
	});
});
$(function(){
	$('.page_nav a').bind("click",function(){
		$("#search_account_list").load($(this).attr("href"));
		return false;
	});
});
</script>

	<div id="search_account_list" class="panel panel-default">
		<div class="panel-heading">
			<a>전체 계정 조회</a>
		</div>
		<div  id="search_account_list_content">
		<div class="panel-body">
		<c:if test="${cnt>10}">
		<!-- 페이지 내비게이션  -->
			<div class="page_nav">
				<div class="text-center">
						<ul class="pagination pagination-sm" style="margin: 0px;">
						<c:if test="${startPage > pageBlock}">
							<li><a href="/accounting_management/account_management/search_account_list">◀◀</a></li> <!-- 첫 페이지로 이동 -->
							<li><a href="/accounting_management/account_management/search_account_list?pageNum=${startPage - pageBlock}">◀</a></li> <!-- 이전 블록으로 이동 -->
						</c:if>
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<c:if test="${i == currentPage}">
								<li><span>${i}</span></li>
							</c:if>
							<c:if test="${i != currentPage}">
								<li><a href="/accounting_management/account_management/search_account_list?pageNum=${i}">${i}</a></li>
							</c:if>
						</c:forEach>
						<c:if test="${pageCount > endPage}">
							<li><a href="/accounting_management/account_management/search_account_list?pageNum=${startPage + pageBlock}">▶</a></li> <!-- 다음 블록으로 이동 -->
							<li><a href="/accounting_management/account_management/search_account_list?pageNum=${pageCount}">▶▶</a></li> <!-- 마지막 페이지로 이동 -->
						</c:if>
						</ul>
				</div>
			</div>
		</c:if>
		</div>
		<div class="panel-body">
		<table id="account_list_table" class="table table-hover">
		<tr>
			<th> 계정명 </th>
			<th> 계정금액 </th>
		</tr>
		<c:if test="${cnt==0}">
		<tr>
			<th align="center" colspan="2">
				존재하는 계정이 없습니다
			</th>
		</tr>
		</c:if>
		<c:forEach var="vo" items="${accountVos}"> 
		<tr>
			<td>
			<a href="/accounting_management/account_management/modify_account?account_id=${vo.account_id}"> 
				${vo.account_name}
			</a>
			</td>
			<td> 
				${vo.account_balance}
			</td>
		</tr>
		</c:forEach>
		 <tr>
		 	<td colspan="2">
		 		<span class="glyphicon glyphicon-menu-up" aria-hidden="true" onclick="slideUp()"></span>
		 	</td>
		 </tr>
		</table>
		</div>
		</div>
	</div>