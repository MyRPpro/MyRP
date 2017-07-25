
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../../setting.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>



<body>
	
	<h2> 구매 입력 페이지 : reg_purchase.jsp</h2>
	
	
	<script src="//code.jquery.com/jquery.min.js"></script>
	<script>	
	function reg_purchase(){
	 var product_id = document.getElementById("product_id");
	 var company_id = document.getElementById("company_id");
	 var employee_id = document.getElementById("employee_id");
	 var reg_date = document.getElementById("reg_date");
	 var storage_in_date = document.getElementById("storage_in_date");
	 var count_purchase = document.getElementById("count_purchase");
	 var supply_price = document.getElementById("supply_price");
	 var purchase_state = document.getElementById("purchase_state");
	 var condition_note_payable = document.getElementById("condition_note_payable");
	 
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
	 
	 $('#reg_table').load('/purchase_management/input_purchase/reg_purchase_table?product_id='+product_id.value
							+'&company_id='+company_id.value
							+'&employee_id='+employee_id.value 
							+'&reg_date='+reg_date.value
							+'&storage_in_date='+storage_in_date.value
							+'&count_purchase='+count_purchase.value
							+'&supply_price='+supply_price.value
							+'&purchase_state='+purchase_state.value
							+'&condition_note_payable='+condition_note_payable.value
						 );	 
	 return false;
	 }
	
	
	function search_lack_stock(){
		 $('#reg_table').load('/purchase_management/input_purchase/search_reg_purchase');
		return false;
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
		var in_date = new Date(document.getElementById("storage_in_date").value);
		if( in_date < now  ){
			alert("입고일은 오늘날짜부터 입력할 수 잇습니다.");
			document.getElementById("storage_in_date").valueAsDate = new Date();
		} 
	}
	</script>
	
	
	<form action="#" name="reg_table_form" method="get" 
		onsubmit="return reg_purchase();">
	
		<input type="submit" value="등록하기" >
		<input type="reset" value="재설정">

		<input type="button" value="부족재고조회" onclick="return search_lack_stock()" >
		<input type="button" value="새로입력하기" onclick="window.location='/purchase_management/input_purchase/reg_purchase'" >
		&emsp;
		<input type="button" value="메인으로 이동" onclick="window.location='/'" >
		<input type="button" value="검색으로 이동" onclick="window.location='/purchase_management/search_purchase/purchase_list'" >

	
		
		<hr>
		
		<c:if test="${cnt == 0 }">
			<script type="text/javascript">
				setTimeout(function(){
					alert("재고부족 목록이 없습니다.");
					window.location="window.location='/purchase_management/input_purchase/reg_purchase";
				},200);
			</script>
		</c:if>
		
		
		<c:if test="${dto != null }">
		<table border="1" id="lack_stock_table" >
			<tr>
				<th>product_id</th>
				<th>company_name</th>
				<th>employee_id</th>
				<th>reg_date</th>
				<th>storage_in_date</th>
			</tr>
			
			<tr>
				<td>
					<input type="hidden" value="${dto.product_id}" id="product_id" >
					<input type="text" value="${dto.product_name}" readonly>
				</td>
				
				<td>
					<input type="hidden" value="${dto.company_id}" id="product_id" >
					<input type="text" value="${dto.company_name}" readonly>
				</td>
				
				<td>
					<input type="hidden" value="${dto.employee_id}" id="product_id" >
					<input type="text" value="${dto.employee_name}" readonly>
				</td>
				
				<td>
					<input type="date" value="${dto.reg_date}" readonly>
				</td>
				
				<td>
					<c:set var="now" value="<%= new java.util.Date() %>"/>
					<input type="date" id="storage_in_date" onchange="return check_date()"
					value="<fmt:formatDate value='${now}' pattern='yyy-MM-dd'/>" >
				</td>
					
				
			</tr>
			
			<tr>
				<th>count_purchase</th>
				<th>supply_price</th>
				<th>purchase_state</th>
				<th>condition_note_payable</th>
			</tr>
			
			<tr>
				<td>
					<input type="number" id="count_purchase" value="${dto.lack_stock}" min="1" max="${dto.lack_stock}" placeholder="구매 수량" requiered  >
				</td>
				
				<td>
					<input type="number" id="supply_price" value="${dto.purchase_unit_price}" min="1" max="999999999" placeholder="구매단가" requiered   >
				</td>
				
				<td>
					<input type="hidden" name="purchase_state" id="purchase_state" value="23203">
					<input type="text" value="구매전표승인요청" requiered >
				</td>
				
				<td>
					<input type="number" id="condition_note_payable" placeholder="채무 기간" min="1" max="12" >
				</td>
				
			</tr>
		</table>
		</c:if>
		
		
		<c:if test="${dto == null}">
		<table border="1" id="reg_table"  >
			
			<tr>
				<th>product_id</th>
				<th>company_name</th>
				<th>employee_id</th>
				<th>reg_date</th>
				<th>storage_in_date</th>
			</tr>
			
			<tr>
				<td> 
					<!-- 1 product_name -->
					<select name="product_id" id="product_id">
					  	<option value="0" selected> 상품선택 </option>
					  	<c:forEach var="product" items="${product_ids}">
					  		<option value="${product.product_id}">${product.product_name}</option>
					  	</c:forEach>
					  </select>
				</td>
				
				<!-- 5 company_name -->
				<td> 
					<select name="company_id" id="company_id" required >
					  <option value="0" selected> 거래처선택 </option>
					   <c:forEach var="company" items="${company_ids}">
					  		<option value="${company.company_id}">${company.company_name} </option>
					  	</c:forEach>
					  </select>
				</td>
				
				<!-- 6 employee_id -->
				<td>
					<select name="employee_id" id="employee_id" required >
					   <option value="0" selected> 담당자선택 </option>
					   <c:forEach var="employee" items="${employee_ids}">
					  		<option value="${employee.employee_id}">${employee.employee_name} </option>
					  	</c:forEach>
					  </select>
				</td>
				
				<!-- 7  reg_date -->
				<td> 
				<c:set var="now" value="<%= new java.util.Date() %>"/>
				
				<input type="date" name="reg_date" id="reg_date" required
					placeholder="등록일을 입력하세요." value="<fmt:formatDate value='${now}' pattern='yyy-MM-dd'/>" > 
				</td>
				
				<!-- 8 update_date : 자동으로 현재날짜 입력 -->	
				
				
				<!-- 9 storage_in_date -->
				<td> <input type="date" id="storage_in_date" name="storage_in_date" onchange="return check_date()" 
					placeholder="입고일" value="<fmt:formatDate value='${now}' pattern='yyy-MM-dd'/>" > 
				</td>
				
			</tr>
			
			<tr>
				<th>count_purchase</th>
				<th>supply_price</th>
				<th>purchase_state</th>
				<th colspan="2"> condition_note_payable</th>
			</tr>
			
			
			<tr>
				<!-- 10 count_purchase -->
				<td> <input type="number" id="count_purchase" name="count_purchase" min="1" max="9999" 
				placeholder="구매 수량" requiered > </td>
				
				<!-- 11 supply_price -->
				<td> <input type="number"  id="supply_price" name="supply_price" min="1" max="999999999" 
				placeholder="구매단가" requiered  ></td>
				
				<!-- 12 purchase_state : 입력할 때는 미승인 상태로 -->
				<td> 
					<input type="hidden" name="purchase_state" id="purchase_state" value="23203">
					<input type="text" name="purchase_state_name" id="purchase_state_name" value="구매전표승인요청" requiered >
				</td>	
			
				<!-- 13 condition_note_payable -->
				<td colspan="2"> 
				<input type="number" id="condition_note_payable" name="condition_note_payable" 
				placeholder="채무 기간" min="1" max="12" > 
				</td>	
			</tr>
			
		</table>
		</c:if>
		
	</form>
	
	<div id="reg_table" >
		<p><h3> 구매 내역을 입력할 수 있는 페이지 입니다. </h3></p>
		<p> 각 드롭메뉴는 데이터베이스에 있는 내용을 불러옵니다. </p>
		<p> 해당란에 없는 칼럼은 시퀀스 또는 기본값으로 입력됩니다. </p>
		<p> 입력이 완료된 내용은 검색페이지에서 확인할 수 있습니다. </p>
	</div>
	
	
</body>
</html>