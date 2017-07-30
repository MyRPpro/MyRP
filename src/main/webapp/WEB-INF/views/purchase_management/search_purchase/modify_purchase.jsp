<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
				
<body>

	<div class="row" id="row">
		<div class="col-xs-12">
			<div class="panel panel-primary">
				<div class="panel-heading" id="modify_purchase_heading">
					<h3 class="panel-title">
						<span class="glyphicon glyphicon-gift"></span> &emsp;
						구매번호" ${dtos.get(0).purchase_id}"의 상세 정보 입니다. 
					</h3>
				</div>	<!--  // panel-heading -->
				<div class="panel-body">
					<div class="table-responsive">
						<div class="form-group">
							<form class="form-inline-block" action="#" onsubmit="return modify_purchase()" method="get" role="form" >
								<table class="table table-condensed table-striped" id="modify_purchase_form2">
									<tr>
										<th>계정</th>
										<th>계정번호</th>
										<th>상품</th>
										<th>거래처</th>
									</tr>
					
									<tr>
										<th></th>
										<th></th>
										<th>
											<div class="form-group">
												<select id="reg_product" class="form-control input-sm "  >
													<option value="0">상품선택</option>
													<c:forEach var="product" items="${dtos_product}">
														<option value="${product.product_id}">${product.product_name}</option>
													</c:forEach>
												</select>
												 
											</div>
										</th>
										<th>
											<div class="form-group">
												<select id="reg_company"  class="form-control input-sm" >
													<option value="0">거래처선택</option>
													<c:forEach var="company" items="${dtos_company}">
														<option value="${company.company_id}">${company.company_name}</option>
													</c:forEach>
												</select>
											</div>
										</th>
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
										<th>
											<div class="form-group">
												<select id="reg_employee" class="form-control input-sm">
													<option value="0">담당자선택</option>
													<c:forEach var="employee" items="${dtos_employee}">
														<option value="${employee.employee_id}">${employee.employee_name}</option>
													</c:forEach>
												</select>
											</div>
										</th>
										<th>
											<div class="form-group">
												<c:set var="now" value="<%=new java.util.Date()%>" />
												<input type="date" id="reg_reg_date" class="form-control input-sm" value="<fmt:formatDate value='${now}' pattern='yyyy-MM-dd'/>" onchange="return check_date();">
											</div>
										</th>
										<th></th>
										<th>
											<div class="form-group">
												<c:set var="now" value="<%=new java.util.Date()%>" />
												<input type="date" id="reg_storage_in_date"	 class="form-control input-sm" value="<fmt:formatDate value='${now}' pattern='yyyy-MM-dd'/>" onchange="return check_date();">
											</div>
										</th>
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
										<th>
											<div class="form-group">
												<c:set var="reg_dto" value="${dtos[0]}" />
												<input type="number" id="reg_count_purchase" class="form-control input-sm"	 value="${reg_dto.count_purchase}" min="1" max="9999" required>
											</div>
										</th>
										<th>
											<div class="form-group">
												<input type="text" id="reg_supply_price" class="form-control input-sm"	 value="${reg_dto.supply_price}" min="1" max="999999999" required>
											</div>
										</th>
										<th>
											<div class="form-group">
												<input type="number" id="reg_condition_note_payable" class="form-control input-sm"	 value="${reg_dto.condition_note_payable}" min="1" max="12" onchange="return condition_check()" required>
											</div>
										</th>
										<th></th>
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
									<input type="button" class="btn btn-primary" id="btn-confirm" value="확인" >
									<input type=button class="btn btn-info"  id="btn-modify" value="수정하기" onclick="return modify_purchase();" >
									<input type="reset" class="btn btn-default" value="재작성">
								</center>
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
	
	
	function modify_purchase(){
		
		 var product_id = document.getElementById("product_id");
		 var company_id = document.getElementById("company_id");
		 var employee_id = document.getElementById("employee_id");
		 var reg_date = document.getElementById("reg_date");
		 var storage_in_date = document.getElementById("storage_in_date");
		 var count_purchase = document.getElementById("count_purchase");
		 var supply_price = document.getElementById("supply_price");
		 var purchase_state = document.getElementById("purchase_state");
		 var condition_note_payable = document.getElementById("condition_note_payable");
		 var order_id = document.getElementById("purchase_id");
		 
		 if( product_id.value == 0 ){
			 alert("상품이 선택되지 않았습니다. 원하는 상품을 선택해주세요.");		product_id.focus();		return false;
		 } else if ( company_id.value == 0 ){
			 alert("거래처가 선택되지 않았습니다. 원하는 거래처을 선택해주세요.");		company_id.focus();		return false;
		 } else if ( employee_id.value == 0 ){
			 alert("담당자가 선택되지 않았습니다. 해당 담당자을 선택해주세요.");		employee_id.focus();		return false;
		 } else if ( count_purchase.value == 0 ){
			 alert("수량이 입력되지 않았습니다. 원하는 상품을 선택해주세요.");		count_purchase.focus();		return false;
		 } else if ( supply_price.value == 0 ){
			 alert("가격이 선택되지 않았습니다. 원하는 가격을 선택해주세요.");		supply_price.focus();		return false;
		 } else if ( purchase_state.value == 0 ){
			 alert("거래상태가 선택되지 않았습니다. 원하는 상태을 선택해주세요.");		purchase_state.focus();		return false;
		 } else if ( condition_note_payable.value == "" ){
			 alert("어음기간이 입력되지 않았습니다. 일자를 입력해주세요.");		condition_note_payable.focus();		return false;
		 }
		 
		 $('#alert_pro').load('/purchase_management/search_purchase/modify_purchase_pro?product_id='+product_id.value
								+'&company_id='+company_id.value
								+'&employee_id='+employee_id.value 
								+'&reg_date='+reg_date.value
								+'&storage_in_date='+storage_in_date.value
								+'&count_purchase='+count_purchase.value
								+'&supply_price='+supply_price.value
								+'&purchase_state='+purchase_state.value
								+'&condition_note_payable='+condition_note_payable.value
								+'&purchase_id='+purchase_id.value
							 );	 
		 	return false;
		 }
		
	
	
	
	// 사원번호 자리수 제한 
	function employee_id_check(){
		var employee_id = document.getElementsByName("employee_id")[0];
		console.log( "employee_id.value.length : " + employee_id.value.length);
		if( employee_id.value.length > 4 ){
			alert("4자리 까지만 입력이 가능합니다.");
			employee_id.value = employee_id.value.substring(0,4);
		}
	}
	
	function condition_check(){
		var condition = document.getElementById("reg_condition_note_payable");
		console.log( "reg_condition_note_payable.value : " + reg_condition_note_payable.value);
		if( reg_condition_note_payable.value > 12 ){
			alert("12개월 이하로만 가능 합니다.");
			condition.value = 0;
		}
	}
	
	
	
	function date_format(date){
		var year = date.getFullYear();                
		var month = (1 + date.getMonth());           
		month = month >= 10 ? month : '0' + month;    
		var day = date.getDate();                     
		day = day >= 10 ? day : '0' + day;            
		return  year + '-' + month + '-' + day;
	}
	
	function check_date(){
		
		var now = new Date();
		now.setDate(now.getDate()-1);
		var in_date = new Date(document.getElementById("reg_storage_in_date").value);
		var reg_date = new Date(document.getElementById("reg_reg_date").value);
		
		if( in_date < now ){
			alert("입고일은 오늘부터 선택 가능합니다.");
			now.setDate(now.getDate()+1);
			document.getElementById("reg_storage_in_date").value = date_format(now);
		}
		
		if( reg_date > in_date ){
			alert("등록일은 입고일 이전으로 선택해주세요.");
			in_date = new Date(document.getElementById("reg_storage_in_date").value);
			reg_date.setDate(in_date.getDate()-1);
			document.getElementById("reg_reg_date").value = date_format( reg_date );
		}
		
	}
	
	
	
	$('#btn-confirm').bind('click',function(){
		$('#purchase_list_content').slideDown();
		$('#purchase_list_table_content').slideDown();
		$('#row').slideToggle();
	})
	
	$(function(){
		var reg_value="";
		$('#reg_product').change(function(){
			$('#reg_product option:selected').each(function(){
				$('input[name="product_name"]').val($(this).text());
				$('input[name="product_id"]').val($(this).val());
			})
		})
		$('#reg_company').change(function(){
			$('#reg_company option:selected').each(function(){
				$('input[name="company_name"]').val($(this).text());
				$('input[name="company_id"]').val($(this).val());
			})
		})
		$('#reg_employee').change(function(){
			$('#reg_employee option:selected').each(function(){
				$('input[name="employee_name"]').val($(this).text());
				$('input[name="employee_id"]').val($(this).val());
			})
		})
		$('#reg_reg_date').change(function(){
			$('input[name="reg_date"]').val($(this).val());
		})
		$('#reg_update_date').change(function(){
			$('input[name="update_date"]').val($(this).val());
		})
		$('#reg_storage_in_date').change(function(){
			$('input[name="storage_in_date"]').val($(this).val());
		})
		$('#reg_count_purchase').change(function(){
			$('input[name="count_purchase"]').val($(this).val());
		})
		var price, tax, sum = 0;
		$('#reg_supply_price').change(function(){
			price = Number($(this).val());
			tax = price/10;
			sum = price + tax;
			$('input[name="supply_price"]').eq(0).val(tax);
			$('input[name="supply_price"]').eq(1).val(price);
			$('input[name="supply_price"]').eq(2).val(sum);
		})
		
		$('#reg_condition_note_payable').change(function(){
			$('input[name="condition_note_payable"]').val($(this).val());
		})
	});
	
	

</script>
</body>
</html>

