<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../../setting.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">

	$("#page11110_div01_toggle").bind("click", function(event) {
		$("#page11110_div01").slideToggle();
		$("#page11110_div02").slideToggle();
		return false;	
	});
	
	$("#page11110_div01 .pagination a").bind("click", function(event) { 
		$("#main_screen").load($(this).attr("href"));
		return false;
	});
	
	$("#page11110_div02 a").bind("click", function(event) {
		$("#page11110_div01").slideUp();
		$("#page11110_div02").slideUp();
		$("#page11110_div03").slideDown();
		$("#page11110_div03").load($(this).attr("href"));
		return false;
	});
	
	$("#page11110_btn01").bind("click", function(event) {
		$("#page11110_div01").slideUp();
		$("#page11110_div02").slideUp();
		$("#page11110_div03").slideDown();
		$("#page11110_div03").load("/base_registration/reg_company/add_company");
		return false;
	});
	
</script>
<body>
	<div class="panel panel-default" id="page11110">
		<div class="panel-heading">
			<a id="page11110_div01_toggle">[11110]company_list.jsp</a>
		</div>
		<div class="panel-body" id="page11110_div01">
			<c:if test="${pageCount > 1}">
				<div class="text-center">
					<ul class="pagination pagination-sm"  style="margin-top: 0px;">
						<c:if test="${startPage > pageBlock}">
							<li><a href="/base_registration/reg_company/company_list">◀◀</a></li>  <!-- 첫 페이지로 이동 -->
							<li><a href="/base_registration/reg_company/company_list?pageNum=${startPage - pageBlock}">◀</a></li> <!-- 이전 블록으로 이동 -->
						</c:if>
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<c:if test="${i == currentPage}">
								<li><span>${i}</span></li>
							</c:if>
							<c:if test="${i != currentPage}">
								<li><a href="/base_registration/reg_company/company_list?pageNum=${i}">${i}</a></li>
							</c:if>
						</c:forEach>
						<c:if test="${pageCount > endPage}">
							<li><a href="/base_registration/reg_company/company_list?pageNum=${startPage + pageBlock}">▶</a></li> <!-- 다음 블록으로 이동 -->
							<li><a href="/base_registration/reg_company/company_list?pageNum=${pageCount}">▶▶</a></li> <!-- 마지막 페이지로 이동 -->
						</c:if>
					</ul>
				</div>
			</c:if>
		</div>
		<div class="panel-body" id="page11110_div02">
			<table class="table">
				<tr>
					<th>거래처 번호</th>
					<th>거래처 명</th>
					<th>대표자</th>
					<th>업태</th>
					<th>업종</th>
					<th>사용 상태</th>
					<th>회사 유형</th>
					<th>등록일</th>
				</tr>
				<c:forEach var="vo" items="${companyVos}">
				<tr>
					<td>${vo.company_id}</td>
					<td>
						<a href="/base_registration/reg_company/modify_company?company_id=${vo.company_id}">
							${vo.company_name}
						</a>
					</td>
					<td>${vo.ceo_name}</td>
					<td>${vo.biz_type}</td>
					<td>${vo.biz_item}</td>
					<td>${vo.use_state}</td>
					<td>${vo.company_type}</td>
					<td>${vo.reg_date}</td>
				</tr>
				</c:forEach>
				<tr>
					<td colspan="8">
						<input class="btn btn-default btn-sm" type="button" value="거래처 등록" id="page11110_btn01">
					</td>
				</tr>
			</table>
		</div>
		<div class="panel-body" id="page11110_div03"></div>
	</div>
</body>
</html>