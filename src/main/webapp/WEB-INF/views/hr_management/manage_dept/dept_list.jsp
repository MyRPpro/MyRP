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
	$("#page16210_div01_toggle").bind("click", function(event) { //페이지 토글
		$("#page16210_div01").slideToggle();
		return false;
	});
	
	$("#page16210_div01 .pagination a").bind("click", function(event) { 
		$("#main_screen").load($(this).attr("href"));
		return false;
	});
	
	$("#page16210_div01 table a").bind("click", function(event) { 
		$("#page16210_div01").slideUp();
		$("#page16210_div02").slideDown();
		$("#page16210_div02").load($(this).attr("href"));
		return false;
	});
	
	$("#page16210_btn01").bind("click", function(event) { //부서등록페이지 이동
		$("#page16210_div01").slideUp();
		$("#page16210_div02").slideDown();
		$.ajax({
			data:		null,
			type:		'get',
			url:		'/hr_management/manage_dept/add_dept',
			success: function(response) {
				$("#page16210_div02").html(response);
				$("form[name='page16220_form01'] input[name='dept_id']").focus();
			}
		});
		return false;		
	});
	
</script>
<body>
	<div class="panel panel-default" id="page16210">
		<div class="panel-heading">
			<a id="page16210_div01_toggle">[16210]dept_list.jsp</a>
		</div>
		<div class="panel-body" id="page16210_div01">
			<c:if test="${pageCount > 1}">
				<div class="text-center">
					<ul class="pagination pagination-sm"  style="margin-top: 0px;">
						<c:if test="${startPage > pageBlock}">
							<li><a href="/hr_management/manage_dept/dept_list">◀◀</a></li>  <!-- 첫 페이지로 이동 -->
							<li><a href="/hr_management/manage_dept/dept_list?pageNum=${startPage - pageBlock}">◀</a></li> <!-- 이전 블록으로 이동 -->
						</c:if>
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<c:if test="${i == currentPage}">
								<li><span>${i}</span></li>
							</c:if>
							<c:if test="${i != currentPage}">
								<li><a href="/hr_management/manage_dept/dept_list?pageNum=${i}">${i}</a></li>
							</c:if>
						</c:forEach>
						<c:if test="${pageCount > endPage}">
							<li><a href="/hr_management/manage_dept/dept_list?pageNum=${startPage + pageBlock}">▶</a></li> <!-- 다음 블록으로 이동 -->
							<li><a href="/hr_management/manage_dept/dept_list?pageNum=${pageCount}">▶▶</a></li> <!-- 마지막 페이지로 이동 -->
						</c:if>
					</ul>
				</div>
			</c:if>
			<table class="table">
				<tr>
					<th>부서번호</th>
					<th>부서명</th>
					<th>접근권한</th>
					<th>사용 상태</th>
				</tr>
				<c:forEach var="vo" items="${deptVos}">
				<tr>
					<td>${vo.dept_id}</td>
					<td>
						<a href="/hr_management/manage_dept/modify_dept?dept_id=${vo.dept_id}">
							${vo.dept_name}
						</a>
					</td>
					<td>${vo.access_role}</td>
					<td>${vo.use_state}</td>
				</tr>
				</c:forEach>
				<tr>
					<td colspan="4">
						<input class="btn btn-default btn-sm" type="button" value="부서 등록" id="page16210_btn01">
					</td>
				</tr>
			</table>
		</div>
		<div class="panel-body" id="page16210_div02"></div>
	</div>
</body>
</html>