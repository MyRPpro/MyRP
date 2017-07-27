<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "../../setting.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<!-- 
	page16110		:	base_code_group_list.jsp
	_div01			:	기본 코드 그룹 목록
	_div02			:	하위 항목 [기본 코드 그룹 등록 화면, 기본 코드 그룹 수정 및 하부 코드 목록]
	_div01_toggle 	:	div01을 슬라이드 업/다운할 수 있는 토글
	_btn01			:	기본 코드 그룹 등록 버튼
	_btn02			:	메인으로 돌아가기 버튼
 -->
<script type="text/javascript">
	
	$("#page16110_div01_toggle").bind("click", function(event) {
		$("#page16110_div01").slideToggle();
		return false;
	});
	
	$("#page16110_btn01").bind("click", function(event) {
		$("#page16110 div").slideUp();
		$("#page16110_div02").slideDown();
		$("#page16110_div02").load("/hr_management/manage_hr_code/add_base_code_group");
		return false;		
	});
	
	$("#page16110_div01 a").bind("click", function(event) {
		$("#page16110 div").slideUp();
		$("#page16110_div02").slideDown();
		$("#page16110_div02").load($(this).attr("href"));
		return false;
	});
	
	$("#page16110_btn02").bind("click", function(event) {
		window.location="/";
		return false;
	});
</script>
<body>
<div id="page16110">
	<a id="page16110_div01_toggle">[16110]base_code_group_list.jsp</a>
	<div id="page16110_div01">
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
					<input class="btn btn-default btn-xs" type="button" value="등록하기" id="page16110_btn01">
					<input class="btn btn-default btn-xs" type="button" value="홈페이지" id="page16110_btn02">	
				</td>
			</tr>
		</table>
	</div>
	<div id="page16110_div02"></div>
</div>
</body>
</html>