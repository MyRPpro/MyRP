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
	
	$("#page11221_btn01").bind("click", function(event) {
		$("#page11221").slideUp();
		$("#page11220_div01").slideDown();
		return false;
	});
	
	$("form[name='page11221_form01']").on("submit", function(event) {
		$("#page11221").slideUp();
		var $product_id = $("form[name='page11221_form01'] input[name='product_id']");
		$("#page11210_div03").load("/base_registration/reg_product/add_product"+
				"?product_id="+$product_id.val()+
				"&dupcheck=1");
		return false;
	});
	
	$("form[name='page11221_form02']").on("submit", function(event) {
		var $product_id = $("form[name='page11221_form02'] input[name='product_id']");
		$("#page11220_div02").load("/base_registration/reg_product/add_product_dupCheck"+
				"?product_id="+$product_id.val());
		return false;
	});
</script>
<body>
	<div class="panel panel-default" id="page11221">
		<div class="panel-heading">
			<a id="page11221_div01_toggle">[11221]add_product_dupCheck.jsp</a>
		</div>
		<div class="panel-body" id="page11221_div01">
			<c:if test="${cnt == 0}">
				<form action="#" name="page11221_form01">
					<table class="table">
						<tr>
							<th>선택하신 [${product_id}]는 사용가능합니다.</th>
						</tr>
						<tr>
							<th>
								<input type="hidden" name="product_id" value="${product_id}">
								<input class="btn btn-defalut btn-sm" type="submit" value="확인">
							</th>
						</tr>
					</table>
				</form>
			</c:if>
			<c:if test="${cnt == 1}">
				<form action="#" name="page11221_form02">
					<table class="table">
						<tr>
							<th colspan="2">
								선택하신 [${product_id}]는<br>
								[${dup_product_name}]에 사용중입니다.<br>
								새로운 상품번호를 선택하세요.
							</th>
						</tr>
						<tr>
							<th>product_id</th>
							<td>
								<input class="form-control input-sm" type="text" name="product_id" 
								maxlength="10" required autofocus>
							</td>
						</tr>
						<tr>
							<th colspan="2">
								<input class="btn btn-defalut btn-sm" type="submit" value="중복확인">
								<input class="btn btn-defalut btn-sm" type="reset" value="재작성">
								<input class="btn btn-defalut btn-sm" type="button" value="닫기" id="page11221_btn01">
							</th>
						</tr>
					</table>
				</form>
			</c:if>
		</div>
	</div>
</body>
</html>