<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../../setting.jsp"%>
<script type="text/javascript">
$(function(){
	$("#register_bank_account").bind("click",function(){
	/* var bank_account_reg_on = "<c:out value='${bank_account_reg_on}' />";
		if(bank_account_reg_on==1){ //계좌등록페이지 띄우기 */
			$('#bank_account_list_stage').slideDown();
			$("#bank_account_list_stage").load("/accounting_management/bank_account_registration/register_bank_account");
			document.getElementById("bank_account_name").focus();
		/* }else{
			return false;
		} */
	})
});


$(function(){
	$('#bank_account_list_table a').bind("click",function(){
		$('#bank_account_list_stage').slideDown();
		$("#bank_account_list_stage").load($(this).attr("href"));
		return false;
	});
});
</script>
<div class="panel panel-primary" id="bank_account_list">
	<div class="panel-heading">
		<h3 class="panel-title">
		<span class="glyphicon glyphicon-usd" aria-hidden="true"></span>
		 계좌 관리
		 </h3>
	</div>
<div class="panel-body" style="text-align: center;">
	<table id="bank_account_list_table" class="table table-hover">
		<tr>
			<th>계좌명</th>
			<th>계좌번호</th>
			<th>잔액</th>
			<th>개설목적</th>
			<th>은행</th>
			<th>사용상태</th>
			<th>등록일</th>
		</tr>
		<c:forEach var="vo" items="${bankAccountVos}">
		<tr>
			<td>
				<a href="/accounting_management/bank_account_registration/modify_bank_account?bank_account_id=${vo.bank_account_id}">
					${vo.bank_account_name}
				</a>
			</td>
			<td>${vo.bank_account_number}</td>
			<td>${vo.bank_account_balance}</td>
			<td>${vo.bank_account_type}</td>
			<td>${vo.bank_name}</td>
			<td>${vo.use_state}</td>
			<td>${vo.reg_date}</td>
		</tr>		
		</c:forEach>
	</table>

	<!-- 페이지 내비게이션  -->
	<c:if test="${cnt>5}">
		<div class="page_nav">
			<div class="text-center">
					<ul class="pagination pagination-sm" style="margin: 0px;">
					<c:if test="${startPage > pageBlock}">
						<li><a href="/accounting_management/bank_account_registration/bank_account_list">[◀◀]</a></li> <!-- 첫 페이지로 이동 -->
						<li><a href="/accounting_management/bank_account_registration/bank_account_list?pageNum=${startPage - pageBlock}">[◀]</a></li> <!-- 이전 블록으로 이동 -->
					</c:if>
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<c:if test="${i == currentPage}">
							<li><span>[${i}]</span></li>
						</c:if>
						<c:if test="${i != currentPage}">
							<li><a href="/accounting_management/bank_account_registration/bank_account_list?pageNum=${i}">[${i}]</a></li>
						</c:if>
					</c:forEach>
					<c:if test="${pageCount > endPage}">
						<li><a href="/accounting_management/bank_account_registration/bank_account_list?pageNum=${startPage + pageBlock}">[▶]</a></li> <!-- 다음 블록으로 이동 -->
						<li><a href="/accounting_management/bank_account_registration/bank_account_list?pageNum=${pageCount}">[▶▶]</a></li> <!-- 마지막 페이지로 이동 -->
					</c:if>
					</ul>
			</div>
		</div>
	</c:if>
		<div id="bank_account_list_form_for_register" style="text-align: center;">
			<input type="submit" value="계좌 등록"  class="btn btn-primary btn-sm" id="register_bank_account">
		</div>
</div>
	<div id="bank_account_list_stage">
	
	</div>
</div>
