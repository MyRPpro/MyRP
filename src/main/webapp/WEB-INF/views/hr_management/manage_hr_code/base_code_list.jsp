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
function control_code() {
	$("#modify_base_code_group_div").load("/hr_management/manage_hr_code/modify_base_code_group?hr_code_group_id=${hr_code_groupVo.hr_code_group_id}");
}
</script>
<body onload="control_code();">
base_code_list.jsp
<div id="modify_base_code_group_div">

</div>
<c:if test="${hr_code_groupVo.use_state == 'Y'}">
	<table border="1">
		<tr>
			<th colspan="5">${hr_code_groupVo.hr_code_group_name}</th>
		</tr>
		<tr>
			<th>hr_code_group_id</th>
			<th>hr_code_id</th>
			<th>hr_code_name</th>
			<th>use_state</th>
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
	</table>
	<form action="/hr_management/manage_hr_code/add_base_code" method="get" name="base_code_list_form1">
		<input type="hidden" name="hr_code_group_id" value="${hr_code_groupVo.hr_code_group_id}">
		<input type="submit" value="인사코드  등록">
		<input type="button" value="돌아가기" onclick="window.location='/hr_management/manage_hr_code/base_code_group_list';">
	</form>
</c:if>
<c:if test="${hr_code_groupVo.use_state == 'N'}">
	<table border="1">
		<tr>
			<th>${hr_code_groupVo.hr_code_group_name} 는 비사용 상태입니다.</th>
		</tr>
	</table>
	<form action="/hr_management/manage_hr_code/add_base_code" method="get" name="base_code_list_form1">
		<input type="button" value="돌아가기" onclick="window.location='/hr_management/manage_hr_code/base_code_group_list';">
	</form>
</c:if>
</body>
</html>