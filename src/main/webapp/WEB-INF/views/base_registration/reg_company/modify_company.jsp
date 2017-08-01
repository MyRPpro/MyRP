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

	$("#page11130_div01_toggle").bind("click", function(event) {
		$("#page11130_div01").slideToggle();
		return false;
	});
	
	$("#page11130_btn01").bind("click", function(event) {
		$("#page11130").slideUp();
		$("#page11110_div01").slideDown();
		$("#page11110_div02").slideDown();
		return false;
	});
	
	$("form[name='page11130_form01']").on("submit", function(event) {
		var data = $(this).serialize();
		$.ajax({
			data:		data,
			type:		'post',
			url:		'/base_registration/reg_company/modify_company_pro',
			success: function(response) {
				$("#page11130_div02").html(response);
			}
		});
		return false;
	});
	
</script>
<body>
	<div class="panel panel-default" id="page11130">
		<div class="panel-heading">
			<a id="page11130_div01_toggle">[11130]modify_company.jsp</a>
		</div>
		<div class="panel-body" id="page11130_div01">
			<form action="#" name="page11130_form01">
				<table class="table">
					<tr>
						<th>거래처 번호</th>
						<td>
							<input class="form-control input-sm" type="text" name="company_id" value="${companyVo.company_id}" maxlength="10" readonly="readonly">
						</td>
					</tr>
					<tr>
						<th>거래처 명</th>
						<td>
							<input class="form-control input-sm" type="text" name="company_name" value="${companyVo.company_name}">
						</td>
					</tr>
					<tr>
						<th>사업자 등록번호</th>
						<td>
							<input class="form-control input-sm" type="text" name="biz_reg_no" value="${companyVo.biz_reg_no}" maxlength="12">
						</td>
					</tr>
					<tr>
						<th>대표자</th>
						<td>
							<input class="form-control input-sm" type="text" name="ceo_name" value="${companyVo.ceo_name}" maxlength="20">
						</td>
					</tr>
					<tr>
						<th>법인 등록번호</th>
						<td>
							<input class="form-control input-sm" type="text" name="corp_reg_no" value="${companyVo.corp_reg_no}" maxlength="14">
						</td>
					</tr>
					<tr>
						<th>주소</th>
						<td>
							<input class="form-control input-sm" type="text" name="address" value="${companyVo.address}">
						</td>
					</tr>
					<tr>
						<th>업태</th>
						<td>
							<input class="form-control input-sm" type="text" name="biz_type" value="${companyVo.biz_type}">
						</td>
					</tr>
					<tr>
						<th>업종</th>
						<td>
							<input class="form-control input-sm" type="text" name="biz_item" value="${companyVo.biz_item}">
						</td>
					</tr>
					<tr>
						<th>사용 상태</th>
						<td>
							<label for="used">사용</label>
							<input type="radio" name="use_state" id="used" value="Y"
							<c:if test="${companyVo.use_state == 'Y' }">checked</c:if>>
							<label for="unused">비사용</label>
							<input type="radio" name="use_state" id="unused" value="N"
							<c:if test="${companyVo.use_state == 'N' }">checked</c:if>>
						</td>
					</tr>
					<tr>
						<th>회사 유형</th>
						<td>
							<label for="supplier">supplier</label>
							<input type="radio" name="company_type" id="supplier" value="S" 
							<c:if test="${companyVo.company_type == 'S' }">checked</c:if>>
							<label for="customer">customer</label>
							<input type="radio" name="company_type" id="customer" value="C"
							<c:if test="${companyVo.company_type == 'C' }">checked</c:if>>
						</td>
					</tr>
					<tr>
						<th>등록일</th>
						<td><input class="form-control input-sm" type="date" name="reg_date" value="${companyVo.reg_date}"></td>
					</tr>
					<tr>
						<th colspan="2">
							<input class="btn btn-default btn-sm" type="submit" value="수정하기">
							<input class="btn btn-default btn-sm" type="reset"	value="재작성">
							<input class="btn btn-default btn-sm" type="button" value="닫기" id="page11130_btn01">
						</th>
					</tr>
				</table>
			</form>
		</div>
		<div id="page11130_div02"></div>
	</div>
</body>
</html>