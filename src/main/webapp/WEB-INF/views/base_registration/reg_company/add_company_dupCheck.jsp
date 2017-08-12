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
	
	$("#page11121_btn01").bind("click", function(event) {
		$("#page11121").slideUp();
		$("#page11120_div01").slideDown();
		return false;
	});
	
	$("form[name='page11121_form01']").on("submit", function(event) {
		$("#page11121").slideUp();
		var $company_id = $("form[name='page11121_form01'] input[name='company_id']");
		$("#page11110_div03").load("/base_registration/reg_company/add_company"+
				"?company_id="+$company_id.val()+
				"&dupcheck=1");
		return false;
	});
	
	$("form[name='page11121_form02']").on("submit", function(event) {
		var $company_id = $("form[name='page11121_form02'] input[name='company_id']");
		$("#page11120_div02").load("/base_registration/reg_company/add_company_dupCheck"+
				"?company_id="+$company_id.val());
		return false;
	});
</script>
<body>
	<div class="panel panel-primary" id="page11121">
		<div class="panel-heading">
			<!-- <a id="page11121_div01_toggle">[11121]add_company_pro.jsp.jsp</a> -->
			<h3 class="panel-title">
				<span class="glyphicon glyphicon-ok"></span>
				<a id="page11121_div01_toggle">중복 확인</a>
			</h3>
		</div>
		<div class="panel-body" id="page11121_div01">
			<c:if test="${cnt == 0}">
				<form action="#" name="page11121_form01">
					<table class="table">
						<tr>
							<th>선택하신 [${company_id}]는 사용가능합니다.</th>
						</tr>
						<tr>
							<th>
								<input type="hidden" name="company_id" value="${company_id}">
								<input class="btn btn-defalut btn-sm" type="submit" value="확인">
							</th>
						</tr>
					</table>
				</form>
			</c:if>
			<c:if test="${cnt == 1}">
				<form action="#" name="page11121_form02">
					<table class="table">
						<tr>
							<th colspan="2">
								선택하신 [${company_id}]는<br>
								[${dup_company_name}]에 사용중입니다.<br>
								새로운 거래처번호를 선택하세요.
							</th>
						</tr>
						<tr>
							<th>company_id</th>
							<td>
								<input class="form-control input-sm" type="text" name="company_id" 
								maxlength="10" required autofocus>
							</td>
						</tr>
						<tr>
							<th colspan="2">
								<div class="btn-group btn-group-default">
									<input class="btn btn-primary btn-sm" type="submit" value="중복확인">
									<input class="btn btn-defalut btn-sm" type="reset" value="재작성">
									<input class="btn btn-defalut btn-sm" type="button" value="닫기" id="page11121_btn01">
								</div>
							</th>
						</tr>
					</table>
				</form>
			</c:if>
		</div>
	</div>
</body>
</body>
</html>