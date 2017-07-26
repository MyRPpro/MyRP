<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
    table {
        table-layout: fixed;
    }
    th{
    	background: LightGrey;
    }
    th tr td {
    	text-align: center;
        text-overflow: ellipsis;
        overflow: hidden;
    }
    table tr:hover {  
        background: #f3f3f3;
    }
</style>
</head>
 
<body>

	<h3> 판매내역 수정 페이지 : modify_sales.jsp</h3>

	<form action="/sales_management/search_sales/modify_sales_pro"
		id="modify_sales_form1" method="post" onsubmit="return input_check();" >
		
		<table id="modify_sales_form2" border="1" width="1000px">
		
			<tr>
				<!-- 1  --> <th rowspan="2">판매번호</th>
				<!-- 2  --> <th rowspan="2">계정</th>
				<!-- 6  --> <th rowspan="2">주문번호</th>
				<!-- 3  --> <th>상품</th>
				<!-- 4  --> <th>거래처</th>
				<!-- 5  --> <th>담당자</th>
			</tr>
			
			<tr>

				<!-- 3  --> <th>
							<select id="reg_product" >
								<option value="0">상품선택</option>
								<c:forEach var="product" items="${dtos_product}">
									<option value="${product.product_id}">${product.product_name}</option>
								</c:forEach>
							</select>
							</th>
				<!-- 4  --> <th>
							<select id="reg_company" >
								<option value="0">거래처선택</option>
								<c:forEach var="company" items="${dtos_company}">
									<option value="${company.company_id}">${company.company_name}</option>
								</c:forEach>
							</select>
							</th>
				<!-- 5  --> <th>
							<select id="reg_employee" >
								<option value="0">담당자선택</option>
								<c:forEach var="employee" items="${dtos_employee}">
									<option value="${employee.employee_id}">${employee.employee_name}</option>
								</c:forEach>
							</select>
							</th>
			</tr>
			
			
			<tr>
				<tr>	
				<td>
					<c:forEach var="dto" items="${dtos}">
						<input type="text" name="sales_id"  value="${dto.sales_id}" maxlength="10" readonly required >
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
			</tr>			
			
			
			
			<tr>	
				<!-- 6  --> <th>등록일</th>
				 <!-- 7  <th>수정일</th> --> 
				<!-- 8  --> <th>출고일</th>
				<!-- 9 --> <th>수량</th>
				<!-- 10 --> <th>공급가</th>
				<!-- 12 --> <th>어음기간</th>
				<!-- 11 --> <th rowspan="2"> 판매상태</th>
				
			</tr>
			
			<tr>				
							
				<!-- 6  --> <th>
							<c:set var="now" value="<%= new java.util.Date() %>"/>
								<input type="date" id="reg_reg_date" onchange="return check_date();" 
								value="<fmt:formatDate value='${now}' pattern='yyyy-MM-dd'/>">
							</th>
				<%-- 
				<!-- 7  --> <th>
							<c:set var="now" value="<%= new java.util.Date() %>"/>
								<input type="date" id="reg_update_date" value="<fmt:formatDate value='${now}' pattern='yyyy-MM-dd'/>">
							</th>
							 --%>
							 
				<!-- 8  --> <th>
								<c:set var="now" value="<%= new java.util.Date() %>"/>
								<input type="date" id="reg_storage_out_date" onchange="return check_date();" 
								value="<fmt:formatDate value='${now}' pattern='yyyy-MM-dd'/>">
							</th>
				<!-- 9 --> <th>
								<c:set var="reg_dto" value="${dtos[0]}"/>
								<input type="number" id="reg_count_sales" value="${reg_dto.count_sales}" min="1" max="9999" required >
							</th>
				<!-- 10 --> <th>
								<input type="number" id="reg_selling_price" value="${reg_dto.selling_price}" min="1" max="999999999" required>
								<!-- onchange="return this.value = SetComma3(this.value)"  -->
								 
							</th>
				<!-- 11 --> <th>
								<input type="number" id="reg_condition_note_receivable" value="${reg_dto.condition_note_receivable}" min="1" max="12" required>
							</th>
							
			</tr>
			
			
			<tr>
				<td>
					<c:forEach var="dto" items="${dtos}">
						<input type="date" name="reg_date" value="${dto.reg_date}" readonly required >
					</c:forEach>
				</td>
				<%-- 
				<td>
					<c:forEach var="dto" items="${dtos}">
						<input type="date" name="update_date" value="${dto.update_date}" readonly required >
					</c:forEach>
				</td>
				 --%>
				<td>
					<c:forEach var="dto" items="${dtos}">
						<input type="date" name="storage_out_date" value="${dto.storage_out_date}"  readonly required >
					</c:forEach>
				</td>
				
				<td>
					<c:forEach var="dto" items="${dtos}">
						<input type="number" name="count_sales" value="${dto.count_sales}" readonly required >
					</c:forEach>
				</td>
				
				<td>
					<c:forEach var="dto" items="${dtos}">
						<input type="text" name="selling_price" id="selling_price" 
						value=" ${dto.selling_price}" readonly required  >
					</c:forEach>
					
				</td>
				
				<td>
					<c:forEach var="dto" items="${dtos}">
						<input type="number" name="condition_note_receivable" value="${dto.condition_note_receivable}" readonly required >
					</c:forEach>
				</td>
				
				<td>
					<c:forEach var="dto" items="${dtos}">
						<input type="hidden" name="sales_state" value="${dto.sales_state}"  readonly required>
						<input type="text" name="state_name" value="${dto.state_name}"  readonly required>
					</c:forEach>
				</td>
				
			</tr>
			
			
			
		</table>
		
		<input type="submit" value="수정하기">
		<input type="reset"	value="재작성">
		(
		<input type="button" value="견적승인">
		<input type="button" value="승인취소"> : 승인권자 메뉴)
		
		
			
	</form>	
			
	<script type="text/javascript">
	
		// 사원번호 자리수 제한 
		function input_check(){
			 var count_sales 	= document.getElementById("reg_count_sales");
			 var selling_price 	= document.getElementById("reg_selling_price");
			 var condition_note_receivable = document.getElementById("reg_condition_note_receivable");
			 
			 if ( count_sales.value == 0 ){
				 alert("수량이 입력되지 않았습니다. 원하는 상품을 선택해주세요.");		count_sales.focus();		return false;
			 } else if ( selling_price.value == 0 ){
				 alert("가격이 선택되지 않았습니다. 원하는 가격을 선택해주세요.");		selling_price.focus();		return false;
			 }  else if ( condition_note_receivable.value == 0 ){
				 alert("어음기간이 입력되지 않았습니다. 기간를 입력해주세요.");		condition_note_receivable.focus();		return false;
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
			var out_date = new Date(document.getElementById("reg_storage_out_date").value);
			var reg_date = new Date(document.getElementById("reg_reg_date").value);
			
			if( out_date < now ){
				alert("출고일은 오늘부터 선택 가능합니다.");
				document.getElementById("reg_storage_out_date").value = date_format(now);
			}
			
			if( reg_date > out_date ){
				alert("등록일은 출고일 이전으로 선택가능합니다.");
				reg_date = new Date(document.getElementById("reg_reg_date").value);
				out_date.setDate(reg_date.getDate()+7);
				document.getElementById("reg_storage_out_date").value = date_format( out_date );
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
			$('#reg_storage_out_date').change(function(){
				$('input[name="storage_out_date"]').val($(this).val());
			})
			$('#reg_count_sales').change(function(){
				$('input[name="count_sales"]').val($(this).val());
			})
			var price, tax, sum = 0;
			$('#reg_selling_price').change(function(){
				price = Number($(this).val());
				tax = price/10;
				sum = price + tax;
				$('input[name="selling_price"]').eq(0).val(tax);
				$('input[name="selling_price"]').eq(1).val(price);
				$('input[name="selling_price"]').eq(2).val(sum);
			})
			
			$('#reg_condition_note_receivable').change(function(){
				$('input[name="condition_note_receivable"]').val($(this).val());
			})
		});
		
	</script>
</body>
</html>

