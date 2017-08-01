<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../../setting.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<script type="text/javascript">
	$(document).ready(function(){
		$("#page16140_div02").load(
		"/hr_management/manage_hr_code/modify_base_code_group?hr_code_group_id=${hr_code_groupVo.hr_code_group_id}");
	});
	
	$("#page16140_div01_toggle").bind("click", function(event) {
		$("#page16140_div01").slideToggle();
		return false;
	});
	
	$("#page16140_div01 a").bind("click", function(event) {
		$("#page16140_div01").slideUp();
		$("#page16140_div03").slideDown();
		$("#page16140_div03").load($(this).attr("href"));
		return false;
	});
	
	$("form[name='page16140_form01']").on("submit", function(event) {
		var hr_code_group_id = $("form[name='page16140_form01'] input[name='hr_code_group_id']");
		$("#page16140_div01").slideUp();
		$("#page16140_div03").slideDown();
		$.ajax({
			data:		null,
			type:		'get',
			url:		'/hr_management/manage_hr_code/add_base_code?hr_code_group_id='+hr_code_group_id.val(),
			success: function(response) {
				$("#page16140_div03").html(response);
				$("form[name='page16150_form01'] input[name='hr_code_id']").focus();
			}
		});
		return false;		
	});
	
	$("#page16140_btn01").bind("click", function(event) {
		$("#page16140").slideUp();
		$("#page16110_div01").slideDown();
		
		return false;		
	});
</script>

<body>
	<div class="panel panel-default" id="page16140">
		<div class="panel-heading">
			<a id="page16140_div01_toggle">[16140]base_code_list.jsp</a>
		</div>
		<div class="panel-body" id="page16140_div01">
			<div id="page16140_div02"></div>
			<c:if test="${hr_code_groupVo.use_state == 'Y'}">
				<table class="table">
					<tr>
						<th colspan="5">${hr_code_groupVo.hr_code_group_name}</th>
					</tr>
					<tr>
						<th>인사코드 그룹번호</th>
						<th>인사코드 번호</th>
						<th>인사코드 명</th>
						<th>사용 상태</th>
					</tr>
					<c:forEach var="vo" items="${hr_codeVos}">
					<tr>
						<td>${vo.hr_code_group_id}</td>
						<td>${vo.hr_code_id}</td>
						<td>
							<a href="/hr_management/manage_hr_code/modify_base_code?hr_code_id=${vo.hr_code_id}&hr_code_group_id=${vo.hr_code_group_id}">
								${vo.hr_code_name}
							</a>
						</td>
						<td>${vo.use_state}</td>
					</c:forEach>
					<tr>
						<td colspan="4">
							<form action="/hr_management/manage_hr_code/add_base_code" name="page16140_form01">
								<input type="hidden" name="hr_code_group_id" value="${hr_code_groupVo.hr_code_group_id}">
								<input class="btn btn-default btn-sm" type="submit" value="인사코드  등록">
								<input class="btn btn-default btn-sm" type="button" value="닫기" id="page16140_btn01">
							</form>
						</td>
					</tr>
				</table>
			</c:if>
			<c:if test="${hr_code_groupVo.use_state == 'N'}">
				<table class="table">
					<tr>
						<th>${hr_code_groupVo.hr_code_group_name} 는 비사용 상태입니다.</th>
					</tr>
					<tr>
						<td>
							<input class="btn btn-default btn-sm" type="button" value="닫기" id="page16140_btn01">
						</td>
					</tr>
				</table>

			</c:if>
		</div>
		<div id="page16140_div03"></div>
	</div>
</body>
</html>