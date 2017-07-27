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
	
	$("form[name='page16120_form02']").on("submit", function(event) {
		var hr_code_group_id = $("form[name='page16120_form02'] input[name='hr_code_group_id']").val();
		$("#page16120_div02").slideUp();
		$("#page16110_div02").load("/hr_management/manage_hr_code/add_base_code_group"+
								"?hr_code_group_id="+hr_code_group_id+
								"&dupcheck=1");
		$("#page16120_div02").html("");
		return false;
	});
	
	$("form[name='page16120_form03']").on("submit", function(event) {
		var hr_code_group_id = $("form[name='page16120_form03'] input[name='hr_code_group_id']").val();
		$("#page16120_div02").load("/hr_management/manage_hr_code/add_base_code_group_dupCheck?hr_code_group_id="+hr_code_group_id);
		return false;
	});
	
</script>
<body>
add_base_code_group_dupCheck.jsp
	<c:if test="${cnt == 0}">
		<form action="#" name="page16120_form02">
			<table class="tablde text-center">
				<tr>
					<td>선택하신 [${hr_code_group_id}]는 사용가능합니다.</td>
				</tr>
				<tr>
					<th>
						<input type="hidden" name="hr_code_group_id" value="${hr_code_group_id}">
						<input class="btn btn-default" type="submit" value="확인">
					</th>
				</tr>
			</table>
		</form>
	</c:if>
	<c:if test="${cnt == 1}">
		<form action="#" name="page16120_form03">
			<table class="table text-center">
				<tr>
					<th colspan="2">
						선택하신 [${hr_code_group_id}]는 이미 존재합니다.	새로운 인사코드를 선택하세요.
					</th>
				</tr>
				<tr>
					<th>인사코드 그룹번호</th>
					<td>
						<input type="number" name="hr_code_group_id"
						min="1" max="9" step="1" required autofocus()>
					</td>
				</tr>
				<tr>
					<th colspan="2">
						<input class="btn btn-default" type="submit" value="중복확인">
						<input class="btn btn-default" type="reset" value="재작성">
						<input class="btn btn-default" type="button" value="닫기" id="page16120_btn02">
					</th>
				</tr>
			</table>
		</form>
	</c:if>
</body>
</html>