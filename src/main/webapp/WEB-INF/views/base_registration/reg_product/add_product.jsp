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
	
	$("#page11220_div01_toggle").bind("click", function(event) {
		$("#page11220_div01").slideToggle();
		return false;
	});
	
	$("#page11220_btn02").bind("click", function(event) {
		$("#page11220").slideUp();
		$("#page11210_div01").slideDown();
		$("#page11210_div02").slideDown();
		return false;
	});
	
	$("form[name='page11220_form01'] input[name='product_id']").on("change", function() {
		$("form[name='page11220_form01'] input[name='dupcheck']").val(0);
		return false;
	});
	
	$("#page11220_btn01").bind("click", function(event) {
		var $product_id = $("form[name='page11220_form01'] input[name='product_id']");
		if(!$product_id.val()) {
			alert("먼저 상품 번호에 값을 입력하세요.")
			$product_id.focus();
			return false;
		}
		var url ="/base_registration/reg_product/add_product_dupCheck?product_id="+$product_id.val();
		$("#page11220_div01").slideUp();
		$("#page11220_div02").slideDown();
		$("#page11220_div02").load(url);
		return false;
	});
	
	$("form[name='page11220_form01']").on("submit", function(event) {
		var $dupcheck = $("form[name='page11220_form01'] input[name='dupcheck']");
		if($dupcheck.val() == 0) {
			alert("상품 번호의 중복체크가 필요합니다.");			
			$("#page11220_btn01").focus();
			return false;
		}
		var data = $(this).serialize();
		$.ajax({
			data:		data,
			type:		'post',
			url:		'/base_registration/reg_product/add_product_pro',
			success: function(response) {
				$("#page11220_div02").html(response);
			}
		});
		return false;
	});
	
</script>
<body>
	<div class="panel panel-default" id="page11220">
		<div class="panel-heading">
			<a id="page11220_div01_toggle">[11220]add_product.jsp</a>		
		</div>
		<div class="panel-body" id="page11220_div01">
			<form action="#" name="page11220_form01">
				<table class="table">
					<tr>
						<th>상품번호＊</th>
						<td>
							<div class="input-group">
								<input class="form-control input-sm" type="text" name="product_id" value="${product_id}"
								maxlength="10" required autofocus>
								<span class="input-group-btn">
									<input class="btn btn-default btn-sm" type="button" value="중복확인" id="page11220_btn01">
								</span>
							</div>
						</td>
					</tr>
					<tr>
						<th>상품명＊</th>
						<td>
							<input class="form-control input-sm" type="text" name="product_name" required>
						</td>
					</tr>
					<tr>
						<th>구매단가＊</th>
						<td>
							<input class="form-control input-sm" type="number" name="purchase_unit_price"
							min="0" max="9999999999" value="0" required>
						</td>
					</tr>
					<tr>
						<th>판매단가＊</th>
						<td>
							<input class="form-control input-sm" type="number" name="sale_unit_price"
							min="0" max="9999999999" value="0" required>
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
						<th>등록일</th>
						<td>
							<c:set var="now" value="<%= new java.util.Date() %>"/>
							<input class="form-control input-sm" type="date" name="reg_date" 
							value="<fmt:formatDate 
									value='${now}' pattern='yyyy-MM-dd'/>" 
							required>
						</td>
					</tr>
					<tr>
						<th colspan="2">
							<input type="hidden" name="dupcheck"
							<c:if test="${dupcheck == null}">value="0"</c:if>
							<c:if test="${dupcheck == 1}">value="1"</c:if>>
							<input class="btn btn-default btn-sm" type="submit" value="등록하기">
							<input class="btn btn-default btn-sm" type="reset"	value="재작성">
							<input class="btn btn-default btn-sm" type="button" value="닫기" id="page11220_btn02">
						</th>
					</tr>
				</table>
			</form>
		</div>
		<div id="page11220_div02"></div>
	</div>
</body>
</html>