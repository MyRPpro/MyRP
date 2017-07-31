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

	$("#page11120_div01_toggle").bind("click", function(event) {
		$("#page11120_div01").slideToggle();
		return false;
	});
	
	$("#page11120_btn02").bind("click", function(event) {
		$("#page11120").slideUp();
		$("#page11110_div01").slideDown();
		$("#page11110_div02").slideDown();
		return false;
	});
	
	$("form[name='page11120_form01'] input[name='company_id']").on("change", function(event) {
		$("form[name='page11120_form01'] input[name='dupcheck']").val(0);
		return false;
	});
	
	$("#page11120_btn01").bind("click", function(event) {
		var $company_id = $("form[name='page11120_form01'] input[name='company_id']");
		if(!$company_id.val()) {
			alert("먼저 거래처 번호에 값을 입력하세요.")
			$company_id.focus();
			return false;
		}
		var url ="/base_registration/reg_company/add_company_dupCheck?company_id="+$company_id.val();
		$("#page11120_div01").slideUp();
		$("#page11120_div02").slideDown();
		$("#page11120_div02").load(url);
		return false;
	});
	
	$("form[name='page11120_form01']").on("submit", function(event) {
		var $dupcheck = $("form[name='page11120_form01'] input[name='dupcheck']");
		if($dupcheck.val() == 0) {
			alert("거래처 번호의 중복체크가 필요합니다.");			
			$("#page11120_btn01").focus();
			return false;
		}
		var data = $(this).serialize();
		$.ajax({
			data:		data,
			type:		'post',
			url:		'/base_registration/reg_company/add_company_pro',
			success: function(response) {
				$("#page11120_div02").html(response);
			}
		});
		return false;
	});
	
</script>
<body>
	<div class="panel panel-default" id="page11120">
		<div class="panel-heading">
			<a id="page11120_div01_toggle">[11120]reg_company.jsp</a>
		</div>
		<div class="panel-body" id="page11120_div01">
			<form action="/base_registration/reg_company/add_company_pro" name="page11120_form01">
				<table class="table">
					<tr>
						<th>거래처 번호</th>
						<td>
							<div class="input-group">
								<input class="form-control input-sm" type="text" name="company_id"
								value="${company_id}" maxlength="10" required autofocus>
								<span class="input-group-btn">
									<input class="btn btn-default btn-sm" type="button"
									value="중복확인" id="page11120_btn01">
								</span>
							</div>
						</td>
					</tr>
					<tr>
						<th>거래처 명</th>
						<td>
							<input class="form-control input-sm" type="text" name="company_name">
						</td>
					</tr>
					<tr>
						<th>사업자 등록번호</th>
						<td>
							<input class="form-control input-sm" type="text" name="biz_reg_no" maxlength="12">
						</td>
					</tr>
					<tr>
						<th>대표자</th>
						<td>
							<input class="form-control input-sm" type="text" name="ceo_name" maxlength="6">
						</td>
					</tr>
					<tr>
						<th>법인 등록번호</th>
						<td>
							<input class="form-control input-sm" type="text" name="corp_reg_no" maxlength="14">
						</td>
					</tr>
					<tr>
						<th>주소</th>
						<td>
							<input class="form-control input-sm" type="text" name="address">
						</td>
					</tr>
					<tr>
						<th>업태</th>
						<td>
							<input class="form-control input-sm" type="text" name="biz_type">
						</td>
					</tr>
					<tr>
						<th>업종</th>
						<td>
							<input class="form-control input-sm" type="text" name="biz_item">
						</td>
					</tr>
					<tr>
						<th>사용 상태</th>
						<td>
							<label for="used">사용</label>
							<input type="radio" name="use_state" id="used" value="Y" checked>
							<label for="unused">비사용</label>
							<input type="radio" name="use_state" id="unused" value="N">
						</td>
					</tr>
					<tr>
						<th>회사 유형</th>
						<td>
							<label for="supplier">공급사</label>
							<input type="radio" name="company_type" id="supplier" value="S" checked>
							<label for="customer">고객사</label>
							<input type="radio" name="company_type" id="customer" value="C">
						</td>
					</tr>
					<tr>
						<th>등록일</th>
						<td>
							<c:set var="now" value="<%= new java.util.Date() %>"/>
							<input class="form-control input-sm" type="date" name="reg_date"
							value="<fmt:formatDate value='${now}' pattern='yyyy-MM-dd'/>">
						</td>
					</tr>
					<tr>
						<th colspan="2">
							<input type="hidden" name="dupcheck"
							<c:if test="${dupcheck == null}">value="0"</c:if>
							<c:if test="${dupcheck == 1}">value="1"</c:if>>
							<input class="btn btn-default btn-sm" type="submit" value="등록하기">
							<input class="btn btn-default btn-sm" type="reset"	value="재작성">
							<input class="btn btn-default btn-sm" type="button" value="닫기" id="page11120_btn02">
						</th>
					</tr>
				</table>
			</form>
		</div>
		<div id="page11120_div02"></div>
	</div>
</body>
</html>