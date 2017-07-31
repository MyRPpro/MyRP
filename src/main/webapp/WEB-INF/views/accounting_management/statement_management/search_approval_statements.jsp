<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../../setting.jsp"%>
<script type="text/javascript">
$(function(){
	$('.page_nav a').bind("click",function(){
		$("#search_statements_list").load($(this).attr("href"));
		return false;
	});
});
</script>
<div class="panel panel-default" id="page16330">
	<div class="panel-heading">
		 승인 전표 조회 
	</div>
	<small>총 승인전표 개수 : ${cnt}</small>
<table class="table table-hover">
	<tr>
		<th> 전표번호 </th>
		<th> 전표종류 </th>
		<th> 연결ID </th>
		<th> 등록일 </th>
		<th> 승인 상태 </th>
	</tr>
	<c:if test="${cnt==0}">
	<tr>
		<th align="center" colspan="7">
			존재하는 승인 전표가 없습니다
		</th>
	</tr>
	</c:if>
	<c:forEach var="dto" items="${dtos}"> 
	<tr>
		<td> 
		<a href="javascript:void(0);" onclick="search_statement_detail(${dto.statement_id},
			<c:choose>
				<c:when test="${dto.sales_id!=null}">
					${dto.sales_id}, 1
				</c:when>
				<c:when test="${dto.purchase_id!=null}">
					${dto.purchase_id}, 2
				</c:when>
				<c:when test="${dto.salary_register_id!=null}">
					${dto.salary_register_id}, 3
				</c:when>
				<c:when test="${dto.sales_id==null&&dto.purchase_id==null&&dto.salary_register_id==null}">
					 tax , 4
				</c:when>
			</c:choose>	
		)"> ${dto.statement_id}</a>
		</td>
		<td>
			<c:if test="${dto.statement_type=='54101'}"> 매출전표 </c:if>
			<c:if test="${dto.statement_type=='54102'}"> 매입전표 </c:if>
			<c:if test="${dto.statement_type=='54104'}"> 입금전표 </c:if>
			<c:if test="${dto.statement_type=='54105'}"> 출금전표 </c:if>	
			<c:if test="${dto.statement_type=='54106'}"> 일반전표 </c:if>	
		</td>
		<td> 
			<c:if test="${salesCnt==1}">
			${dto.sales_id}
			</c:if>
			<c:if test="${purchaseCnt==1}">
			${dto.purchase_id}
			</c:if>
			<c:if test="${salaryCnt==1}">
			${dto.salary_register_id}
			</c:if>
			<c:if test="${taxCnt==1}">
			* tax_managing
			</c:if>
			
		</td>
		<td> <fmt:formatDate pattern = "yyyy/MM/dd" value="${dto.reg_date}"/></td>
		<td>
			<c:if test="${dto.approval_state=='25451'}"> 미승인 </c:if>
			<c:if test="${dto.approval_state=='25452'}"> 승인 </c:if> 
			<c:if test="${dto.approval_state=='25453'}"> 승인거절 </c:if> 
		</td>
	</tr>
	</c:forEach>
	</table>
	<!-- 페이지 내비게이션  -->
	<div class="page_nav">
		<table border="1">
			<tr>
				<th>
					<c:if test="${startPage > pageBlock}">
						<a href="/accounting_management/statement_management/search_approval_statements">[◀◀]</a> <!-- 첫 페이지로 이동 -->
						<a href="/accounting_management/statement_management/search_approval_statements?pageNum=${startPage - pageBlock}">[◀]</a> <!-- 이전 블록으로 이동 -->
					</c:if>
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<c:if test="${i == currentPage}">
							<span>[${i}]</span>
						</c:if>
						<c:if test="${i != currentPage}">
							<a href="/accounting_management/statement_management/search_approval_statements?pageNum=${i}">[${i}]</a>
						</c:if>
					</c:forEach>
					<c:if test="${pageCount > endPage}">
						<a href="/accounting_management/statement_management/search_approval_statements?pageNum=${startPage + pageBlock}">[▶]</a> <!-- 다음 블록으로 이동 -->
						<a href="/accounting_management/statement_management/search_approval_statements?pageNum=${pageCount}">[▶▶]</a> <!-- 마지막 페이지로 이동 -->
					</c:if>
				</th>
			</tr>
		</table>
	</div>
</div>