<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../../setting.jsp"%>
<script type="text/javascript">
$(function(){
	$("form[name='account_list_form1']").on("submit",function(){
		$("#account_list_stage").slideDown();
		
		$("#account_list_stage").load("/accounting_management/account_management/add_account");
	});
	
	
});

$(function(){
	$('#account_list_table a').bind("click",function(){
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
		전체 계정 조회
	</div>
<table id="account_list_table" class="table table-hover">
	<tr><td colspan="2" style="text-align:right;">
			<form action="#" method="get" name="account_list_form1">
			 <small>총 계정 개수 : ${cnt}</small>
			<input type="submit" value="계정 추가" class="btn btn-default">	
			</form>
	</td>
	</tr>
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
	</table>
	
	<c:if test="${cnt>10}">
	<!-- 페이지 내비게이션  -->
	<div class="page_nav">
		<table border="1">
			<tr>
				<th>
					<c:if test="${startPage > pageBlock}">
						<a href="/accounting_management/account_management/search_account_list">[◀◀]</a> <!-- 첫 페이지로 이동 -->
						<a href="/accounting_management/account_management/search_account_list?pageNum=${startPage - pageBlock}">[◀]</a> <!-- 이전 블록으로 이동 -->
					</c:if>
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<c:if test="${i == currentPage}">
							<span>[${i}]</span>
						</c:if>
						<c:if test="${i != currentPage}">
							<a href="/accounting_management/account_management/search_account_list?pageNum=${i}">[${i}]</a>
						</c:if>
					</c:forEach>
					<c:if test="${pageCount > endPage}">
						<a href="/accounting_management/account_management/search_account_list?pageNum=${startPage + pageBlock}">[▶]</a> <!-- 다음 블록으로 이동 -->
						<a href="/accounting_management/account_management/search_account_list?pageNum=${pageCount}">[▶▶]</a> <!-- 마지막 페이지로 이동 -->
					</c:if>
				</th>
			</tr>
		</table>
	</div>
	</c:if>

	<div id="account_list_stage">
	
	</div>
</div>