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
			<div class="panel panel-primary" id="page2130_panel">
				<div class="panel-heading" >
					<h4 class="panel-title">
						<a id="page2130_div01_togle"> <span class="glyphicon glyphicon-tags"></span> &emsp;
						판매번호" ${dtos.get(0).sales_id}"의 상세 정보 입니다. 
						</a>
					</h4>
				</div>	<!--  // panel-heading -->
				<div class="panel-body" id="page2130_div01">
					<div class="table-responsive">
						<div class="form-group">
							<form class="form-inline-block" onsubmit="return modify_sales();" action="#" method="get"  >
								<table class="table table-condensed table-striped">
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
											<select id="reg_product" class="form-control input-sm">
												<option value="0">상품선택</option>
												<c:forEach var="product" items="${dtos_product}">
													<option value="${product.product_id}">${product.product_name}</option>
												</c:forEach>
											</select>
										</th>
										<th>
											<select id="reg_company" class="form-control input-sm">
												<option value="0">거래처선택</option>
												<c:forEach var="company" items="${dtos_company}">
													<option value="${company.company_id}">${company.company_name}</option>
												</c:forEach>
											</select>
										</th>
									</tr>
									<tr>
										<td>
											<c:forEach var="dto" items="${dtos}" >
												<input type="number" name="account_id" id="account_id" class="form-control input-sm" value="${dto.account_id}" readonly required>
											</c:forEach>
										</td>
										<td>
											<c:forEach var="dto" items="${dtos}" >
												<input type="text" name="account_name" id="account_name"  class="form-control input-sm" value="${dto.account_name} 계정" readonly >
											</c:forEach>
										</td>
										<td>
											<c:forEach var="dto" items="${dtos}" >
												<input type="hidden" name="product_id" id="product_id" value="${dto.product_id}" readonly>
												<input type="text" name="product_name" id="name="product_name"" class="form-control input-sm" value="${dto.product_name}" readonly required>
											</c:forEach>
										</td>
										<td>
											<c:forEach var="dto" items="${dtos}" >
												<input type="hidden" name="company_id" id="company_id" value="${dto.company_id}" readonly>
												<input type="text" name="company_name" id="company_name" class="form-control input-sm" value="${dto.company_name}" readonly required>
											</c:forEach>
										</td>
									</tr>


									<!-- ---------------------------------------------------------------------------------------------------------- -->
					
									<tr>
										<th>담당자</th>
										<th>등록일</th>
										<th>최근수정일</th>
										<th>입고일</th>
									</tr>
									<tr>
										<th>
											<select id="reg_employee" class="form-control input-sm">
												<option value="0">담당자선택</option>
													<c:forEach var="employee" items="${dtos_employee}">
														<option value="${employee.employee_id}">${employee.employee_name}</option>
													</c:forEach>
											</select>
										</th>
										<th>
											<c:set var="now" value="<%=new java.util.Date()%>" />
											<input type="date" id="reg_reg_date" name="reg_reg_date" class="form-control input-sm" onchange="return check_date();" value="<fmt:formatDate value='${now}' pattern='yyyy-MM-dd'/>">
										</th>
										<th>
											<%-- <c:set var="now" value="<%=new java.util.Date()%>" />
											<input type="date" id="reg_update_date" class="form-control input-sm" value="<fmt:formatDate value='${now}' pattern='yyyy-MM-dd'/>"> --%>
										</th> 
										<th><c:set var="now" value="<%=new java.util.Date()%>" />
											<input type="date" id="reg_storage_out_date" name="reg_storage_out_date" class="form-control input-sm" onchange="return check_date();" value="<fmt:formatDate value='${now}' pattern='yyyy-MM-dd'/>">
										</th>
									</tr>
									<tr>
										<td>
											<c:forEach var="dto" items="${dtos}">
												<input type="hidden" name="employee_id" id="employee_id" value="${dto.employee_id}" readonly>
												<input type="text" name="employee_name" id="employee_name" class="form-control input-sm" value="${dto.employee_name}" readonly required>
											</c:forEach>
										</td>

										<td>
											<c:forEach var="dto" items="${dtos}">
												<input type="date" name="reg_date" id="reg_date"  class="form-control input-sm" value="${dto.reg_date}" readonly required>
											</c:forEach>
										</td>

										<td>
											<c:forEach var="dto" items="${dtos}">
												<input type="date" name="update_date" id="update_date"  class="form-control input-sm" value="${dto.update_date}" readonly required>
											</c:forEach>
										</td>

										<td>
											<c:forEach var="dto" items="${dtos}">
												<input type="date" name="storage_out_date" id="storage_out_date" class="form-control input-sm" value="${dto.storage_out_date}" readonly required>
											</c:forEach>
										</td>
									</tr>

									<!-- ---------------------------------------------------------------------------------------------------------- -->
								
									<tr>
										<th>수량</th>
										<th>공급가</th>
										<th>어음기간</th>
										<th>구매상태</th>
									</tr>

									<tr>
										<th>
											<c:set var="reg_dto" value="${dtos[0]}"/> 
											<input type="number" id="reg_count_sales" name="reg_count_sales" class="form-control input-sm" value="${reg_dto.count_sales}" min="1" max="9999" required>
										</th>
										<th>
											<input type="text" id="reg_selling_price" name="reg_selling_price" class="form-control input-sm" value="${reg_dto.selling_price}" min="1" max="999999999" required>

										</th>
										<th>
											<input type="number" id="reg_condition_note_receivable" name="reg_condition_note_receivable" class="form-control input-sm" value="${reg_dto.condition_note_receivable}" min="0" max="12" required>
										</th>
										<th></th>
									</tr>
									<tr>
										<td>
											<c:forEach var="dto" items="${dtos}">
												<input type="text" name="count_sales"  id="count_sales" class="form-control input-sm" value="<fmt:formatNumber value="${dto.count_sales}" type="number"/>" readonly required >
											</c:forEach>
										</td>
										<td>
											<c:forEach var="dto" items="${dtos}">
												<input type="text" name="selling_price" id="selling_price"  class="form-control input-sm" id="selling_price" value="<fmt:formatNumber value="${dto.selling_price}" type="currency" currencySymbol="￦"/>"  readonly required  >
											</c:forEach>
											
										</td>
										<td>
											<c:forEach var="dto" items="${dtos}">
												<input type="number" name="condition_note_receivable" id="condition_note_receivable" class="form-control input-sm" value="${dto.condition_note_receivable}" readonly required >
											</c:forEach>
										</td>
										<td>
											<c:forEach var="dto" items="${dtos}">
												<input type="hidden" name="sales_state" id="sales_state" value="${dto.sales_state}"  readonly required>
												<input type="text" name="state_name" id="state_name" class="form-control input-sm" value="${dto.state_name}"  readonly required>
											</c:forEach>
										</td>
									</tr>
								</table>
								<br>
								<div class="btn-group" align="center">
									<span class="input-group-btn">
										<input type="button" name="btn_confirm" id="btn_confirm" class="btn btn-primary"  value="확인" >
										<input type=submit name="btn_modify"  id="btn_submit"  class="btn btn-default" value="수정하기" >
										<input type="reset" name="btn_reset" class="btn btn-default" value="재작성">
									</span>
								</div>
								
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

	$('#btn_confirm').click(function(){
		$('#page2120_div01').slideDown();	// 테이블 본문
		$('#page2110_div02').slideDown();	// 페이징
		$('#page2130_panel').slideUp();		// 세부페이지 본문
		return false;
	});
	
	$('#page2130_div01_togle').click(function(){
		$('#page2130_div01').slideToggle();
		return false;
	});
	
	function modify_sales(){
		
		var sales_id = '${dtos.get(0).sales_id}';
		var product_id = document.getElementById("product_id");
		var account_id = document.getElementById("account_id");
		var company_id = document.getElementById("company_id");
		var employee_id = document.getElementById("employee_id");
		var reg_date = document.getElementById("reg_date");
		var storage_out_date = document.getElementById("storage_out_date");
		var count_sales = document.getElementById("count_sales");
		var selling_price = document.getElementById("selling_price");
		var sales_state = document.getElementById("sales_state");
		var condition_note_receivable = document.getElementById("condition_note_receivable");
		
		if (sales_id.value == 0) {
			alert("상품이 선택되지 않았습니다. 원하는 상품을 선택해주세요.");
			sales_id.focus();
			return false;
		} else if (company_id.value == 0) {
			alert("거래처가 선택되지 않았습니다. 원하는 거래처을 선택해주세요.");
			company_id.focus();
			return false;
		} else if (employee_id.value == 0) {
			alert("담당자가 선택되지 않았습니다. 해당 담당자을 선택해주세요.");
			employee_id.focus();
			return false;
		} else if (count_sales.value == 0) {
			alert("수량이 입력되지 않았습니다. 원하는 상품을 선택해주세요.");
			count_sales.focus();
			return false;
		} else if (selling_price.value == 0) {
			alert("가격이 선택되지 않았습니다. 원하는 가격을 선택해주세요.");
			selling_price.focus();
			return false;
		} else if (sales_state.value == 0) {
			alert("거래상태가 선택되지 않았습니다. 원하는 상태을 선택해주세요.");
			sales_state.focus();
			return false;
		} else if (condition_note_receivable.value == "") {
			alert("어음기간이 입력되지 않았습니다. 일자를 입력해주세요.");
			condition_note_receivable.focus();
			return false;
		}
		
		 $('#alert_pro').load('/sales_management/search_sales/modify_sales_pro?product_id='+product_id.value
					+'&company_id='+company_id.value
					+'&employee_id='+employee_id .value
					+'&reg_date='+reg_date.value
					+'&storage_out_date='+storage_out_date.value
					+'&count_sales='+count_sales.value
					+'&selling_price='+selling_price.value
					+'&sales_state='+sales_state.value
					+'&condition_note_receivable='+condition_note_receivable.value
					+'&sales_id='+sales_id
					+'&account_id='+account_id.value
				 );	 
		return false;
	};
	
	
	
	
	
	
	
	$(document).ready(
			function() {
				var reg_value = "";
				$('#reg_product').change(
						function() {
							$('#reg_product option:selected').each(
									function() {
										$('input[name="product_name"]')
												.val($(this).text());
										$('input[name="product_id"]').val(
												$(this).val());
									})
									return false;
						});
				$('#reg_company').change(
						function() {
							$('#reg_company option:selected').each(
									function() {
										$('input[name="company_name"]')
												.val($(this).text());
										$('input[name="company_id"]').val(
												$(this).val());
									})
									return false;
						});
				$('#reg_employee').change(
						function() {
							$('#reg_employee option:selected').each(
									function() {
										$('input[name="employee_name"]')
												.val($(this).text());
										$('input[name="employee_id"]').val(
												$(this).val());
									})
									return false;
						});
				$('#reg_reg_date').change(function() {
					$('input[name="reg_date"]').val($(this).val());
					return false;
				});
				$('#reg_update_date').change(function() {
					$('input[name="update_date"]').val($(this).val());
					return false;
				});
				$('#reg_storage_out_date').change(function() {
					$('input[name="storage_out_date"]').val($(this).val());
					return false;
				});
				$('#reg_count_sales').change(function() {
					$('input[name="count_sales"]').val($(this).val());
					return false;
				});
				var price, tax, sum = 0;
				$('#reg_selling_price').change(function() {
					price = Number($(this).val());
					tax = price / 10;
					sum = price + tax;
					$('input[name="selling_price"]').eq(0).val(tax);
					$('input[name="selling_price"]').eq(1).val(price);
					$('input[name="selling_price"]').eq(2).val(sum);
					return false;
				});

				$('#reg_condition_note_receivable').change(function() {
							$('input[name="condition_note_receivable"]')
									.val($(this).val());
							return false;
				});
			});

		// 자리수 제한 
		function input_check() {
			var count_sales = document.getElementById("reg_count_sales");
			var selling_price = document.getElementById("reg_selling_price");
			var condition_note_receivable = document
					.getElementById("reg_condition_note_receivable");

			if (count_sales.value == 0) {
				alert("수량이 입력되지 않았습니다. 원하는 상품을 선택해주세요.");
				count_sales.focus();
				return false;
			} else if (selling_price.value == 0) {
				alert("가격이 선택되지 않았습니다. 원하는 가격을 선택해주세요.");
				selling_price.focus();
				return false;
			} else if (condition_note_receivable.value == 0) {
				alert("어음기간이 입력되지 않았습니다. 기간를 입력해주세요.");
				condition_note_receivable.focus();
				return false;
			}
		};

		function date_format(date) {
			var year = date.getFullYear();
			var month = (1 + date.getMonth());
			month = month >= 10 ? month : '0' + month;
			var day = date.getDate();
			day = day >= 10 ? day : '0' + day;
			return year + '-' + month + '-' + day;
		};

		function check_date() {

			var now = new Date();
			now.setDate(now.getDate() - 1);

			var out_date = new Date(document
					.getElementById("reg_storage_out_date").value);
			var reg_date = new Date(
					document.getElementById("reg_reg_date").value);
			var out_date_temp = null;

			if (out_date < now) {
				alert("출고일은 오늘이후부터 선택 가능합니다.");
				out_date_temp = new Date(document.getElementById("reg_storage_out_date").value);
				now.setDate(now.getDate() + 1);
				document.getElementById("reg_storage_out_date").value = date_format(now);
				return false;
			}

			if (reg_date > out_date) {
				alert("등록일은 출고일 이전으로 선택가능합니다.");
				out_date = new Date(document.getElementById("reg_storage_out_date").value)
				reg_date.setDate(out_date.getDay() - 1);
				document.getElementById("reg_reg_date").value = date_format(reg_date);
				return false;
			}
		};
		
		
		 
	</script>
	
	 
</body>
</html>

