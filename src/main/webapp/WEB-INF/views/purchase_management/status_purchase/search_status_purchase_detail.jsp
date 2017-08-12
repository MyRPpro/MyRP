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
	

	<div class="panel panel-primary" id="page3330_panel">
		<div class="panel-heading">
	  		 <h4 class="panel-title">
	  		 	<a id="page3330_div01_toggle"><span class="glyphicon glyphicon-shopping-cart"></span> &nbsp;
	  				검색한 내용의 세부내용을 표시합니다.
	  			</a>
	  		</h4>
		</div>
		<div class="panel-body" id="page3330_div01">
			
			<!-- ----------------------------------------------------- -->
			
			<div class="table-responsive">
				<form action="#" method="get"">
					<div class="form-group">
						<table class="table table-condensed table-striped">
							<tr>
								<th>계정</th>
								<th>계정번호</th>
								<th>상품</th>
								<th>거래처</th>
							</tr>
							
							<tr>
								<td>
									<div class="form-group">
										<c:forEach var="dto" items="${dtos}">
											<input type="hidden" name="account_id" id="account_id" value="${dto.account_id}" readonly>
											<input type="text" name="account_name" id="account_name" class="form-control input-sm" value="${dto.account_name} 계정" readonly required>
										</c:forEach>
									</div>
								</td>
			
								<td>
									<div class="form-group">
										<c:forEach var="dto" items="${dtos}">
											<input type="text" name="order_id" id="order_id" class="form-control input-sm"  value="${dto.account_id}" readonly>
										</c:forEach>
									</div>
								</td>
			
								<td>
									<div class="form-group">
										<c:forEach var="dto" items="${dtos}">
											<input type="hidden" name="product_id" id="product_id" value="${dto.product_id}" readonly>
											<input type="text" name="product_name" id="product_name" class="form-control input-sm" value="${dto.product_name}" readonly required>
										</c:forEach>
									</div>
								</td>
			
								<td>
									<div class="form-group">
										<c:forEach var="dto" items="${dtos}">
											<input type="hidden" name="company_id"  id="company_id" value="${dto.company_id}" readonly>
											<input type="text" name="company_name" id="company_name" class="form-control input-sm" class="form-control input-sm" value="${dto.company_name}" readonly required>
										</c:forEach>
									</div>
								</td>
							</tr>
							
							<!-- ----------------------------------------------------- -->
							
							<tr>
								<th>담당자</th>
								<th>등록일</th>
								<th>최근수정일</th>
								<th>출고일</th>
							</tr>
							
							<tr>
								<td>
									<div class="form-group">
										<c:forEach var="dto" items="${dtos}">
											<input type="hidden" name="employee_id" id="employee_id" value="${dto.employee_id}" readonly>
											<input type="text" name="employee_name" id="employee_name" class="form-control input-sm" value="${dto.employee_name}" readonly required>
										</c:forEach>
									</div>
								</td>
								<td>
									<div class="form-group">
										<c:forEach var="dto" items="${dtos}">
											<input type="date" name="reg_date" id="reg_date" class="form-control input-sm" value="${dto.reg_date}" readonly required>
										</c:forEach>
									</div>
								</td>
	
								<td>
									<div class="form-group">
										<c:forEach var="dto" items="${dtos}">
											<input type="date" name="update_date" id="update_date" class="form-control input-sm" value="${dto.update_date}" readonly required>
										</c:forEach>
									</div>
								</td>
	
								<td>
									<div class="form-group">
										<c:forEach var="dto" items="${dtos}">
											<input type="date" name="storage_in_date" id="storage_in_date" class="form-control input-sm"	value="${dto.storage_in_date}" readonly required>
										</c:forEach>
									</div>
								</td>
							</tr>
							
							
							<!-- ----------------------------------------------------- -->
							
							<tr>
								<th>수량</th>
								<th>공급가</th>
								<th>어음기간</th>
								<th>구매상태</th>
							</tr>
							
							<tr>
								<td>
									<div class="form-group">
										<c:forEach var="dto" items="${dtos}">
											<input type="number" name="count_purchase" id="count_purchase" class="form-control input-sm" value="${dto.count_purchase}"  min="1" max="9999" readonly required>
										</c:forEach>
									</div>
								</td>
	
	
								<td><div class="form-group">
										<c:forEach var="dto" items="${dtos}">
											<input type="text" name="supply_price" id="supply_price" class="form-control input-sm" value="<fmt:formatNumber value="${dto.supply_price}" type="currency" currencySymbol="￦" />" min="1" max="999999999"  readonly required>
										</c:forEach>
										
									</div>
									</td>
								<td> 
									<div class="form-group">
										<c:forEach var="dto" items="${dtos}">
											<input type="number" name="condition_note_payable" id="condition_note_payable" class="form-control input-sm" value="${dto.condition_note_payable}" min="1" max="12" readonly required>
										</c:forEach>
									</div>
								</td>
								<td>
									<div class="form-group">
										<c:forEach var="dto" items="${dtos}">
											<input type="hidden" name="purchase_state" id="purchase_state" value="${dto.purchase_state}" readonly required>
											<input type="text" name="state_name" id="state_name" class="form-control input-sm" value="${dto.state_name}" readonly required>
										</c:forEach>
									</div>
								</td>
							</tr>
						</table>
						<div class="btn-group" align="center">
							<span class="input-group-btn">
								<input type="button" class="btn btn-primary" name="btn_confirm" id="page3330_btn01" value="확인" >
							</span>
						</div>	<!-- // btn-group -->
					</div>
				</form>
			</div>
			
			<!-- ----------------------------------------------------- -->
					
		</div>	<!-- // panel-body -->
	</div>	<!-- // panel -->
	
	<!-- ------------------------------------------------------------------------------------- -->
	
	<script type="text/javascript">
		$('#page3330_div01_toggle').click(function(){
			$('#page3330_div01').slideToggle();
			return false;
		});
		
		$('#page3330_btn01').click(function(){
			$('#page3310_div01').slideDown();
			$('#page3320_div01').slideDown();
			$('#page3330_panel').slideUp();
			return false;
		});
		
	</script>
	
</body>
</html>