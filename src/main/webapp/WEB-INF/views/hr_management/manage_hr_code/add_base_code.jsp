<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../../setting.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">

	$("#page16150_div01_toggle").bind("click", function() {
		$("#page16150_div01").slideToggle();
	});
	
	$("form[name='page16150_form01'] input[name='hr_code_id']").on("change",function() {
		$("form[name='page16150_form01'] input[name='dupcheck']").val(0);
	});
	
	$("form[name='page16150_form01']").on("submit", function(event) {
		if($("form[name='page16150_form01'] input[name='dupcheck']").val() == 0) {
			alert("인사코드 번호의 중복체크가 필요합니다.");
			$("#page16150_btn02").focus();
			return false;
		}
		var data = $(this).serialize();
		$.ajax({
			data:	data,
			type:	'post',
			url:	"/hr_management/manage_hr_code/add_base_code_pro",
			success: function(response) {
				$("#page16150_div01").html(response);
			}
		});
		return false;
	});
	
	$("#page16150_btn02").on("click", function() {
		var $hr_code_group_id = $("form[name='page16150_form01'] input[name='hr_code_group_id']");
		var $hr_code_id = $("form[name='page16150_form01'] input[name='hr_code_id']");
		if(!$hr_code_id.val()) {
			alert("먼저 인사코드 번호에 값을 입력하세요.");
			$hr_code_id.focus();
			return false;
		}
		var url =	"/hr_management/manage_hr_code/add_base_code_dupCheck"+
					"?hr_code_group_id="+$hr_code_group_id.val()+
					"&hr_code_id="+$hr_code_id.val();
		$("#page16150_div01").slideUp();
		$("#page16150_div02").slideDown();
		$("#page16150_div02").load(url);
	});
	
	$("#page16150_btn01").bind("click", function(event) {
		$("#page16150").slideUp();
		$("#page16140_div01").slideDown();
		return false;		
	});
	
</script>
<body>
	<div class="panel panel-primary" id="page16150">
		<div class="panel-heading">
			<!-- <a id="page16150_div01_toggle">[16150]add_base_code.jsp</a> -->
			<h3 class="panel-title">
				<span class="glyphicon glyphicon-user"></span>
				<a id="page16150_div01_toggle">인사코드 등록</a>
			</h3>
		</div>		
		<div class="panel-body" id="page16150_div01">
			<form action="#" name="page16150_form01">
				<div class="table-responsive">
					<table class="table">
						<tr>
							<th>인사코드 그룹번호＊</th>
							<td>
								<input class="form-control input-sm" type="number" name="hr_code_group_id"
								value="${hr_code_group_id}" readonly>
							</td>
						</tr>
						<tr>
							<th>인사코드 번호＊</th>
							<td>
								<div class="input-group">
									<input class="form-control input-sm" type="number" name="hr_code_id" value="${hr_code_id}"
									min="1" max="999" step="1" required>
									<span class="input-group-btn">
										<input class="btn btn-info btn-sm"  type="button" value="중복확인" id="page16150_btn02">
									</span>
								</div>
							</td>
						</tr>
						<tr>
						<tr>
							<th>인사코드명＊</th>
							<td>
								<input class="form-control input-sm" type="text" name="hr_code_name" required>
							</td>
						</tr>
						<tr>
							<th>사용 상태＊</th>
							<td>
								<label for="used">사용</label>
								<input type="radio" name="use_state" id="used"
								value="Y" checked>
								<label for="unused">비사용</label>
								<input type="radio" name="use_state" id="unused" value="N">
							</td>
						</tr>
						<tr>
							<th colspan="2">
								<input type="hidden" name="dupcheck" 
								<c:if test="${dupcheck == null}">value="0"</c:if>
								<c:if test="${dupcheck == 1}">value="1"</c:if>>
								<div class="btn-group btn-group-default">
									<input	class="btn btn-primary btn-sm" type="submit" value="등록하기">
									<input class="btn btn-default btn-sm" type="reset"	value="재작성">
									<input class="btn btn-default btn-sm" type="button" value="닫기" id="page16150_btn01">							
								</div>
							</th>
						</tr>
					</table>				
				</div>
			</form>
		</div>
		<div id="page16150_div02"></div>
	</div>
</body>
</html>