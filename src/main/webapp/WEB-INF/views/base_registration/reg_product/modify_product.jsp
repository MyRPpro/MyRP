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

	$("#page11230_btn01").bind("click", function(event) {
		$("#page11230").slideUp();
		$("#page11210_div01").slideDown();
		$("#page11210_div02").slideDown();
		return false;
	});
	
	$("#page11230_div01_toggle").bind("click", function(event) {
		$("#page11230_div01").slideToggle();
		return false;
	});
	
	$("form[name='page11230_form01']").on("submit", function(event) {
		var data = $(this).serialize();
		$.ajax({
			data:		data,
			type:		'post',
			url:		'/base_registration/reg_product/modify_product_pro',
			success: function(response) {
				$("#page11230_div02").html(response);
			}
		});
		return false;
	});
	
</script>

<body>
	<div class="panel panel-default" id="page11230">
		<div class="panel-heading">
			<a id="page11230_div01_toggle">[11230]modify_product.jsp</a>
		</div>
		<div class="panel-body" id="page11230_div01">
			<form action="#" name="page11230_form01">
				<table class="table">
					<tr>
						<th>상품 번호</th>
						<td>
							<input class="form-control input-sm" type="text" name="product_id"
							value="${productVo.product_id}" readonly>
						</td>
					</tr>
					<tr>
						<th>상품 명＊</th>
						<td>
							<input class="form-control input-sm" type="text" name="product_name"
							value="${productVo.product_name}" required>
						</td>
					</tr>
					<tr>
						<th>구매 단가＊</th>
						<td>
							
							<input class="form-control input-sm" type="number" name="purchase_unit_price"
							min="0" max="9999999999"
							value="${productVo.purchase_unit_price}" required>
						</td>
					</tr>
					<tr>
						<th>판매 단가＊</th>
						<td>
							<input class="form-control input-sm" type="number" name="sale_unit_price"
							min="0" max="9999999999"
							value="${productVo.sale_unit_price}" required>
						</td>
					</tr>
					<tr>
						<th>사용 상태</th>
						<td>
							<label for="used">사용</label>
							<input type="radio" name="use_state" id="used" value="Y"
							<c:if test="${productVo.use_state == 'Y'}">checked</c:if>>
							<label for="unused">비사용</label>
							<input type="radio" name="use_state" id="unused" value="N"
							<c:if test="${productVo.use_state == 'N'}">checked</c:if>>
						</td>
					</tr>
					<tr>
						<th>등록일</th>
						<td>
							<input class="form-control input-sm" type="date" name="reg_date" 
							value="<fmt:formatDate 
									value='${productVo.reg_date}' pattern='yyyy-MM-dd'/>" 
							required>
						</td>
					</tr>
					<tr>
						<th colspan="2">
							<input class="btn btn-default btn-sm" type="submit" value="수정하기">
							<input class="btn btn-default btn-sm" type="reset"	value="재작성">
							<input class="btn btn-default btn-sm" type="button" value="닫기" id="page11230_btn01">
						</th>
					</tr>
				</table>
			</form>
		</div>
		<div id="page11230_div02"></div>
	</div>
</body>
</html>