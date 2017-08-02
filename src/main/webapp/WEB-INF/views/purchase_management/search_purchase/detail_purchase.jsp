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
			<div class="panel panel-primary">
				<div class="panel-heading" id="detail_purchase_heading">
					<h3 class="panel-title">
						<span class="glyphicon glyphicon-euro"></span> &emsp;
						구매번호" ${dtos.get(0).purchase_id}"의 상세 정보 입니다. 
					</h3>
				</div>	<!--  // panel-heading -->
				<div class="panel-body">
					<div class="table-responsive">
						<div class="form-group">
							<form class="form-inline-block" role="form"  action="#" method="get" >
								<table class="table table-condensed table-striped" id="modify_purchase_form2">
									
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
										<th>입고일</th>
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
								<br>
								<input type="hidden" name="purchase_id" id="purchase_id" value="${dtos.get(0).purchase_id}">
								<center>
									dtos.get(0): ${dtos.get(0).account_id}<br>
									dtos.get(1): ${dtos.get(1).account_id}<br>
									dtos.get(2): ${dtos.get(2).account_id}<br>
									<!-- ---------------------------------------------------------------------------------------------------------- -->									
									
									<c:if test="${purchase_state == 22213 }">
										<input type="button" name="reg_state" id="button_reg_state" class="btn btn-primary" value="회계전표 입력하기 " >	
									</c:if>
									
									<!-- ---------------------------------------------------------------------------------------------------------- -->									
									
									<c:if test="${purchase_state == 23203 and account_id == 500011050000 }"> <!-- 상품매입시 -->
										<input type="button" name="req_storage_in"  id="btn_req_storage_in" class="btn btn-primary" value="입고 요청 하기">
									</c:if>
									
									<!-- ---------------------------------------------------------------------------------------------------------- -->									
									
									<c:if test="${purchase_state == 23203 and account_id == 500012010000 }"> <!-- 상품매입시 -->
										<div class="col-xs-9" style="display: inline;" >
											<div class="input-group">
												<input type="text" id="text_req_repay" name="req_repay" class="form-control" value="" placeholder="남은 기간" disabled="true" >
												<span class="input-group-btn">
													<button id="btn_req_repay" class="btn btn-info" type="button" disabled="true">채무 상환 하기</button>
												</span>
											</div>
										</div>
									</c:if>
									
									<!-- ---------------------------------------------------------------------------------------------------------- -->									
									
									<c:if test="${purchase_state == 23203 and account_id == 500011050000 }"> <!-- 상품매입시 -->
										<input type="button" name="req_storage_in"  id="btn_req_storage_in" class="btn btn-primary" value="입고 요청 하기">
									</c:if>
									
									<!-- ---------------------------------------------------------------------------------------------------------- -->									
									
									<input type="button" name="btn_confirm" class="btn btn-primary" id="btn-confirm" value="확인" >
								</center>
								<br>
								<div id="alert_pro">
								</div>
							</form>
						</div>	<!-- // form-group -->
					</div> <!-- // table-responsive -->
				</div>	<!-- // panel-body -->
			</div>	<!-- // panel panel-primary -->
		</div>	<!-- // col-xs-12 -->
	</div>	<!-- // row -->


	
	<script type="text/javascript">
	
	
	$('#alert_pro').ready(function(){
		$('#alert_pro').slideUp();
	})
	
	$('#btn-confirm').bind('click',function(){
		$('#purchase_list_content').slideDown();
		$('#purchase_list_table_content').slideDown();
		$('#row').slideToggle();
	})
	
	$('#button_reg_state').click(function(){
		$('#main_screen').load('/accounting_management/statement_management/search_all_statements');
	});
	$('#btn_req_storage_in').click(function(){
		var purchase_id = $('#purchase_id').val();
		$('#alert_pro').load('/purchase_management/search_purchase/detail_purchase_pro'+"?req_kind=storage_in&purchase_id="+purchase_id);
	});
	
	$('#btn_req_repay').ready(function(){
		var purchase_id = $('#purchase_id').val();
		$('#alert_pro').load('/purchase_management/search_purchase/detail_purchase_pro'+"?req_kind=pay_date&purchase_id="+purchase_id);
	})
	$('#btn_req_repay').click(function(){
		var purchase_id = $('#purchase_id').val();
		var price = $('#supply_price').val();
		price = price.replace(/[^0-9]/g,'');
		/* console.log("supply_price : " + price); */
		$('#alert_pro').slideDown(500);
		$('#alert_pro').load('/purchase_management/search_purchase/detail_purchase_pro'+"?req_kind=req_pay&purchase_id="+purchase_id+"&supply_price="+price);
	});
	
	function date_format(date){
      var year = date.getFullYear();                //yyyy
      var month = (1 + date.getMonth());            //M
      month = month >= 10 ? month : '0' + month;    // month 두자리로 저장
      var day = date.getDate();                     //d
      day = day >= 10 ? day : '0' + day;            //day 두자리로 저장
      return  year + '-' + month + '-' + day;
   }
	
	function req_storage_in(){
		var purchase_id = document.getElementById("purchase_id").value;
		/* console.log( " sned purchase_id : " + purchase_id ); */

		window.location="/purchase_management/search_purchase/detail_purchase_pro"
						+"?req_kind=storage_in&purchase_id="+purchase_id;
						
	}
	
	</script>
	

	


</body>
</html>