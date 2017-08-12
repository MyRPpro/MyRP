<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "../../setting.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	
	$("#page16110_div01_toggle").bind("click", function(event) {
		$("#page16110_div01").slideToggle();
		return false;
	});
	
	$("#page16110_btn01").bind("click", function(event) {
		$("#page16110_div01").slideUp();
		$("#page16110_div02").slideDown();
		$.ajax({
			data:		null,
			type:		'get',
			url:		'/hr_management/manage_hr_code/add_base_code_group',
			success: function(response) {
				$("#page16110_div02").html(response);
				$("form[name='page16120_form01'] input[name='hr_code_group_id']").focus();
			}
		});
		return false;		
	});
	
	$("#page16110_div01 a").bind("click", function(event) {
		$("#page16110_div01").slideUp();
		$("#page16110_div02").slideDown();
		$("#page16110_div02").load($(this).attr("href"));
		return false;
	});
	
</script>
<body>
	<div class="panel panel-primary" id="page16110">
		<div class="panel-heading">
			<!-- <a id="page16110_div01_toggle">[16110]base_code_group_list.jsp</a> -->
			<h3 class="panel-title">
				<span class="glyphicon glyphicon-user"></span>
				<a id="page16110_div01_toggle">인사코드 그룹 목록</a>
			</h3>
		</div>
		<div class="panel-body" id="page16110_div01">
			<div class="table-responsive">
				<table class="table">
					<tr>
						<td>인사코드 그룹번호</td>
						<td>인사코드 그룹명</td>
						<td>사용 상태</td>
					</tr>
					<c:forEach var="vo" items="${hr_code_groupVos}">
					<tr>
						<td>${vo.hr_code_group_id}</td>
						<td>
							<a href="/hr_management/manage_hr_code/base_code_list?hr_code_group_id=${vo.hr_code_group_id}">
								${vo.hr_code_group_name}
							</a>
						</td>
						<td>${vo.use_state}</td>
					</tr>
					</c:forEach>
					<tr>
						<td colspan="3">
							<input class="btn btn-default btn-sm" type="button" value="등록하기" id="page16110_btn01">
						</td>
					</tr>
				</table>			
			</div>
		</div>
		<div class="panel-body" id="page16110_div02"></div>
	</div>
</body>
</html>