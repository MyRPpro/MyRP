<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<c:if test="${cnt == 0}">
		<script type="text/javascript">
			alert("수금가능 내역이 없습니다.");
		</script>
	</c:if>
	
	<c:if test="${cnt > 0}">
		<script type="text/javascript">
			setTimeout(function(){
				var cnt = '${cnt}';
				alert(cnt+"건의 전표를 정상적으로 생성하였습니다. ");
			}, 200);
			
			$('#reg_state').click(function(){
				$('#main_screen').load("/accounting_management/statement_management/make_statement");
				return false;
			});
		</script>
		
		<form action="#" name="reg_purchase_table_form" method="get">
			<div class="table-responsive">
				<div class="form-group">


					<table class="table table-condensed table-striped">
						<tr>
							<th>구매번호</th>
							<!-- 1 -->
							<th>계정이름</th>
							<!-- 2 -->
							<th>등록일</th>
							<!-- 3 -->
							<th>수량</th>
							<!-- 4 -->
							<th>가격</th>
							<!-- 5 -->
						</tr>

						<c:forEach var="dto" items="${dtos}">
							<tr>

								<td id="sales_id">${dto.sales_id}</td>

								<td>${dto.state_name}</td>

								<td>${dto.reg_date}</td>

								<td><fmt:formatNumber value="${dto.count_sales}"
										type="number" /></td>

								<td><fmt:formatNumber value="${dto.selling_price}"
										type="currency" /></td>

							</tr>
						</c:forEach>
					</table>
				</div><!-- // form-group -->

				<input type="button" name="reg_state" id="reg_state" value="전표입력하기" class="btn btn-primary"">
			</div><!-- // table-responsive -->
		</form>
	</c:if>
	
</body>
</html>