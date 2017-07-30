<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file = "../../setting.jsp" %>
<script type="text/javascript">
$('.distribution_view_heading').bind("click",function(){  
	$('.distribution_view_content').slideToggle();
});
</script>
<c:if test = "${null eq product_name_list[0].product_id}">
<h3>상품 정보가 없습니다.</h3>
</c:if>

<c:if test = "${null ne product_name_list[0].product_id}">
<div class="row">
<div class="col-xs-12">
	<div class="panel panel-primary">
		<div class="panel-heading distribution_view_heading">
			<h3 class="panel-title">재고수불부 검색 결과</h3>
		</div>
		<div class="panel-body distribution_view_content">
			<div class="table-responsive">
				<c:forEach var = "pro" items ="${select_product}">
					<table class="table table-condensed">
						<tr>
							<td colspan = "5">기간 : ${start_day} ~ ${end_day}</td>
						</tr>
						<tr>
							<td colspan = "5">물품명 : ${pro.product_name}(${pro.product_id})</td>
						</tr>
						<tr>
							<th>날짜</th>
							<th>분류</th>
							<th>수량증가</th>
							<th>수량감소</th>
							<th>재고수량</th>
						</tr>
						<c:forEach var = "dto" items ="${select_stockpile_searchDtos}">
							<c:if test = "${pro.product_id == dto.product_id}">
							
							<c:set var = "minus_stock" value = "${minus_stock + dto.minus_stock}" />
							<c:set var = "plus_stock" value = "${plus_stock + dto.plus_stock}" />
							<tr>
								<td>${dto.sto_date}</td>
								<c:if test = "${fn:substring(dto.pro_id,0,4) == '4754'}">
								<td><a href = "?pro_id=${dto.pro_id}">판매</a></td>
								</c:if>
								<c:if test = "${fn:substring(dto.pro_id,0,4) == '4755'}">
								<td><a href = "?pro_id=${dto.pro_id}">구매</a></td>
								</c:if>
								<c:if test = "${fn:substring(dto.pro_id,0,4) == '4753'}">
								<td><a href = "adjustment_inventory/adjustment_inventory_list?pro_id=${dto.pro_id}">재고조정</a></td>
								</c:if>
								<td>${dto.plus_stock}</td>
								<td>${dto.minus_stock}</td>
								<td>${dto.stock_amount}</td>
							</tr>
							</c:if>
						</c:forEach>
					</table>
				</c:forEach>
			</div>
		</div>
		<br>
		<div class="panel-body distribution_view_content">
			<div class="table-responsive">
				<table class="table table-condensed">
					<tr>
						<th>총 수량증가</th>
						<th>총 수량감소</th>
						<th>총 재고수량</th>
					</tr>
						<tr>
							<th>${plus_stock}</th>
							<th>${minus_stock}</th>
							<th>${add_stock}</th>
						</tr>
				</table>
			</div>
		</div>
	</div>
</div>
</div>
</c:if>
</body>
</html>