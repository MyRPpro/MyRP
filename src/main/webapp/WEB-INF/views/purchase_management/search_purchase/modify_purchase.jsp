<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<style>
    table {
        table-layout: fixed;
    }
    tr td {
        text-overflow: ellipsis;
        overflow: hidden;
    }
    table tr:hover {  
        background: #f3f3f3;
    }
</style>

<body>

	<h3> 구매내역 수정 페이지 : modify_purchase.jsp</h3>

	<form action="/purchase_management/search_purchase/modify_purchase_pro"
		id="modify_purchase_form1" method="get	">
		
		
		<table id="modify_purchase_form2" border="1" width="2000px" >
		
			<tr>
				<!-- 1  --> <th>purchase</th>
				<!-- 2  --> <th>account</th>
				<!-- 3  --> <th>order</th>
				<!-- 4  --> <th>product</th>
				<!-- 5  --> <th>company</th>
				<!-- 6  --> <th>employee</th>
				<!-- 7  --> <th>reg_date</th>
				<!-- 8  --> <th>update_date</th>
				<!-- 9  --> <th>STORAGE_IN_DATE</th>
				<!-- 10 --> <th>count_purchase</th>
				<!-- 11 --> <th>suppoly_price</th>
				<!-- 12 --> <th>purchase_state</th>
				<!-- 13 --> <th>condition_note_payable</th>
			</tr>
			
			
			<tr>
				<!-- 1  --> <th> </th>
				<!-- 2  --> <th> </th>
				<!-- 3  --> <th> </th>
				<!-- 4  --> <th>
							<select id="reg_product" >
								<option value="0">상품선택</option>
								<c:forEach var="product" items="${dtos_product}">
									<option value="${product.product_id}">${product.product_name}</option>
								</c:forEach>
							</select>
							</th>
				<!-- 5  --> <th>
							<select id="reg_company" >
								<option value="0">거래처선택</option>
								<c:forEach var="company" items="${dtos_company}">
									<option value="${company.company_id}">${company.company_name}</option>
								</c:forEach>
							</select>
							</th>
				<!-- 6  --> <th>
							<select id="reg_employee" >
								<option value="0">담당자선택</option>
								<c:forEach var="employee" items="${dtos_employee}">
									<option value="${employee.employee_id}">${employee.employee_name}</option>
								</c:forEach>
							</select>
							</th>
				<!-- 7  --> <th>
							<c:set var="now" value="<%= new java.util.Date() %>"/>
								<input type="date" id="reg_reg_date" value="<fmt:formatDate value='${now}' pattern='yyyy-MM-dd'/>">
							</th>
				<!-- 8  --> <th>
							<c:set var="now" value="<%= new java.util.Date() %>"/>
								<input type="date" id="reg_update_date" value="<fmt:formatDate value='${now}' pattern='yyyy-MM-dd'/>">
							</th>
				<!-- 9  --> <th>
								<c:set var="now" value="<%= new java.util.Date() %>"/>
								<input type="date" id="reg_storage_in_date" value="<fmt:formatDate value='${now}' pattern='yyyy-MM-dd'/>">
							</th>
				<!-- 10 --> <th>
								<c:set var="reg_dto" value="${dtos[0]}"/>
								<input type="number" id="reg_count_purchase" value="${reg_dto.count_purchase}" min="1" max="9999" required >
							</th>
				<!-- 11 --> <th>
								<input type="text" id="reg_supply_price" value="${reg_dto.supply_price}" min="1" max="999999999" required>
								<!-- onchange="return this.value = SetComma3(this.value)"  -->
								 
							</th>
				<!-- 12 --> <th> </th>
				<!-- 13 --> <th>
								<input type="number" id="reg_condition_note_payable" value="${reg_dto.condition_note_payable}" min="1" max="12" required>
							</th>
			</tr>
			
			
			
			<tr>	
				<td>
					<c:forEach var="dto" items="${dtos}">
						<input type="text" name="purchase_id" 	value="${dto.purchase_id}" maxlength="10" readonly required >
					</c:forEach>
				</td>
				
				<td>
					<c:forEach var="dto" items="${dtos}">
						<input type="hidden" name="account_id" value="${dto.account_id}" readonly >
						<input type="text" name="account_name" value="${dto.account_name} 계정" readonly required >
					</c:forEach>
				</td>
				
				<td>
					<c:forEach var="dto" items="${dtos}">
						<input type="text" name="order_id" value="${dto.order_id}" readonly >
					</c:forEach>
				</td>
				
				<td>
					<c:forEach var="dto" items="${dtos}">
						<input type="hidden" name="product_id" value="${dto.product_id}"  readonly >
						<input type="text" name="product_name" value="${dto.product_name}"  readonly required >
					</c:forEach>
				</td>
				
				<td>
					<c:forEach var="dto" items="${dtos}">
						<input type="hidden" name="company_id" value="${dto.company_id}" readonly >
						<input type="text" name="company_name" value="${dto.company_name}" readonly required >
					</c:forEach>
				</td>
				
				<td>
					<c:forEach var="dto" items="${dtos}">
						<input type="hidden" name="employee_id" value="${dto.employee_id}"readonly >
						<input type="text" name="employee_name" value="${dto.employee_name}" readonly required >
					</c:forEach>
				</td>
				
				<td>
					<c:forEach var="dto" items="${dtos}">
						<input type="date" name="reg_date" value="${dto.reg_date}" readonly required >
					</c:forEach>
				</td>
				
				<td>
					<c:forEach var="dto" items="${dtos}">
						<input type="date" name="update_date" value="${dto.update_date}" readonly required >
					</c:forEach>
				</td>
				
				<td>
					<c:forEach var="dto" items="${dtos}">
						<input type="date" name="storage_in_date" value="${dto.storage_in_date}" readonly required >
					</c:forEach>
				</td>
				
				<td>
					<c:forEach var="dto" items="${dtos}">
						<input type="number" name="count_purchase" value="${dto.count_purchase}" readonly required >
					</c:forEach>
				</td>
				
				<td>
					<c:forEach var="dto" items="${dtos}">
						<input type="number" name="supply_price" id="supply_price" 
						value="${dto.supply_price}" readonly required  >
					</c:forEach>
					<%-- <fmt:formatNumber value="${dto.supply_price}" type="currency" currencySymbol="￦" />" --%>
				</td>
				
				<td>
					<c:forEach var="dto" items="${dtos}">
						<input type="hidden" name="purchase_state" value="${dto.purchase_state}"  readonly required>
						<input type="text" name="state_name" value="${dto.state_name}"  readonly required>
					</c:forEach>
				</td>
				
				<td>
					<c:forEach var="dto" items="${dtos}">
						<input type="number" name="condition_note_payable" value="${dto.condition_note_payable}" readonly required >
					</c:forEach>
				</td>
				
			</tr>
			
		</table>
		
		<table>
			<tr>
				<th colspan="2">
					<input type="submit" value="수정하기">
					<input type="reset"	value="재작성">
					(
					<input type="button" value="견적승인">
					<input type="button" value="승인취소">
					: 승인권자 메뉴)
				</th>
			</tr>
		</table>
			
	</form>	
	
	
			
	<script type="text/javascript">
	
	
		// 사원번호 자리수 제한 
		function employee_id_check(){
			var employee_id = document.getElementsByName("employee_id")[0];
			console.log( "employee_id.value.length : " + employee_id.value.length);
			if( employee_id.value.length > 4 ){
				alert("4자리 까지만 입력이 가능합니다.");
				employee_id.value = employee_id.value.substring(0,4);
			}
		}
		
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