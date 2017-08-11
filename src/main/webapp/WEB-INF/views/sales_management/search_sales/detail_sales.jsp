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
	
	<div class="row" id="row">
		<div class="col-xs-12">
			<div class="panel panel-primary" id="page2140_panel">
				<div class="panel-heading" >
					<h4 class="panel-title" >
						<a href="page2140_dvi01_toggle"><span class="glyphicon glyphicon-tags"></span> &emsp;
						판매번호" ${dtos.get(0).sales_id}"의 상세 정보 입니다. 
						</a>
					</h4>
				</div>	<!--  // panel-heading -->
				<div class="panel-body" id="page2140_dvi01" >
					<div class="table-responsive">
						<div class="form-group">
						
							<form class="form-inline-block"   action="#" method="get" >
								<table class="table table-condensed table-striped" id="detail_sales_form">
										
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
													<input type="date" name="storage_out_date" id="storage_out_date" class="form-control input-sm"	value="${dto.storage_out_date}" readonly required>
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
													<input type="number" name="count_sales" id="count_sales" class="form-control input-sm" value="${dto.count_sales}"  min="1" max="9999" readonly required>
												</c:forEach>
											</div>
										</td>
	
	
										<td><div class="form-group">
												<c:forEach var="dto" items="${dtos}">
													<input type="text" name="selling_price" id="selling_price" class="form-control input-sm" value="<fmt:formatNumber value="${dto.selling_price}" type="currency" currencySymbol="￦" />" min="1" max="999999999"  readonly required>
												</c:forEach>
												
											</div>
											</td>
										<td> 
											<div class="form-group">
												<c:forEach var="dto" items="${dtos}">
													<input type="number" name="condition_note_receivable" id="condition_note_receivable" class="form-control input-sm" value="${dto.condition_note_receivable}" min="1" max="12" readonly required>
												</c:forEach>
											</div>
										</td>
										<td>
											<div class="form-group">
												<c:forEach var="dto" items="${dtos}">
													<input type="hidden" name="sales_state" id="sales_state" value="${dto.sales_state}" readonly required>
													<input type="text" name="state_name" id="state_name" class="form-control input-sm" value="${dto.state_name}" readonly required>
												</c:forEach>
											</div>
										</td>
									</tr>
								</table>
							</form>
							<div class="btn-group" align="center">
								<span class="input-group-btn">
									<c:if test="${sales_state == 22213 }">
										<input type="button" class="btn btn-primary" id="reg_sales_state" value="회계전표 입력하기 ">
									</c:if>
									<c:if test="${sales_state == 22214 and account_id == '500014030000'}">
										<input type="button" class="btn btn-primary"  value="출고요청하기" name="req_storage_out" onclick="req_storage_out();">
									</c:if>
									<c:if test="${sales_state == 22223 and account_id == '500014030000'}">
										<button type="button" class="btn btn-primary"  onclick="return req_receive();">채권회수요청</button>
									</c:if>
									<button type="button" class="btn btn-primary" id="page2140_dvi02"> 확인 </button>
								</span>
							</div>
						</div>	<!-- // form-group -->
					</div> <!-- // table-responsive -->
				</div>	<!-- // panel-body -->
				<div id="alert_pro"></div>
			</div>	<!-- // panel panel-primary -->
		</div>	<!-- // col-xs-12 -->
	</div>	<!-- // row -->
	
	

	
	<script type="text/javascript">
	
	
	function req_storage_out(){
		 var sales_id = '${dtos.get(0).sales_id}';
		$('#alert_pro').load("/sales_management/search_sales/detail_sales_pro"+"?req_kind=storage_out&sales_id="+sales_id);
	}
	
	function req_receive(){
		var sales_id = '${dtos.get(0).sales_id}';
		$('#alert_pro').load("/sales_management/search_sales/req_receive"+"?sales_id="+sales_id);
	}
	
	$('#reg_sales_state').click(function(){
		$('#main_screen').load("/accounting_management/statement_management/search_statements");
		return false;
	});
	
	$('#page2140_dvi01_toggle').click(function(){
		$('#page2140_dvi01').slideToggle();
	});
	
	$('#page2140_dvi02').click(function(){	// 확인 버튼 클릭시
		$('#page2120_div01').slideDown();	// 테이블 본문
		$('#page2110_div02').slideDown();	// 페이징
		$('#page2140_panel').slideUp();
		
	});
	
	
	
	</script>
	
	
	
</body>
</html>


