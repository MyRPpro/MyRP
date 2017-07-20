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
	
	<h2> 판매 입력 페이지 : reg_sales.jsp</h2>
	
	
	<script src="//code.jquery.com/jquery.min.js"></script>
	<script>	
	function reg_sales(){
	 var sales_id = document.getElementById("sales_id");
	 var company_id = document.getElementById("company_id");
	 var employee_id = document.getElementById("employee_id");
	 var reg_date = document.getElementById("reg_date");
	 var storage_out_date = document.getElementById("storage_out_date");
	 var count_sales = document.getElementById("count_sales");
	 var selling_price = document.getElementById("selling_price");
	 var sales_state = document.getElementById("sales_state");
	 var condition_note_receivable = document.getElementById("condition_note_receivable");
	 
	 if( product_id.value == 0 ){
		 alert("상품이 선택되지 않았습니다. 원하는 상품을 선택해주세요.");		product_id.focus();		return false;
	 } else if ( company_id.value == 0 ){
		 alert("거래처가 선택되지 않았습니다. 원하는 거래처을 선택해주세요.");		company_id.focus();		return false;
	 } else if ( employee_id.value == 0 ){
		 alert("담당자가 선택되지 않았습니다. 해당 담당자을 선택해주세요.");		employee_id.focus();		return false;
	 } else if ( count_sales.value == 0 ){
		 alert("수량이 입력되지 않았습니다. 원하는 상품을 선택해주세요.");		count_sales.focus();		return false;
	 } else if ( selling_price.value == 0 ){
		 alert("가격이 선택되지 않았습니다. 원하는 가격을 선택해주세요.");		selling_price.focus();		return false;
	 } else if ( sales_state.value == 0 ){
		 alert("거래상태가 선택되지 않았습니다. 원하는 상태을 선택해주세요.");		sales_state.focus();		return false;
	 } else if ( condition_note_receivable.value == "" ){
		 alert("어음기간이 입력되지 않았습니다. 일자를 입력해주세요.");		condition_note_receivable.focus();		return false;
	 }
	 
	 
	 $('#reg_table').load('/sales_management/input_sales/reg_sales_table?product_id='+product_id.value
							+'&company_id='+company_id.value
							+'&employee_id='+employee_id.value 
							+'&reg_date='+reg_date.value
							+'&storage_out_date='+storage_out_date.value
							+'&count_sales='+count_sales.value
							+'&selling_price='+selling_price.value
							+'&sales_state='+sales_state.value
							+'&condition_note_receivable='+condition_note_receivable.value
						 );	 
	 return false;
	 
	 
	 }
	 
		 
	</script>
	
	<form action="#" name="reg_table_form" method="get" 
		onsubmit="return reg_sales();">
	
		<input type="submit" value="등록하기" >
		<input type="reset" value="재설정">
		<input type="button" value="메인으로 이동" onclick="window.location='/'" >
		
		<hr>
	
		<table border="1" >
			
			<tr>
				<!-- <th>sales_id</th> -->
				<!-- <th>account_id</th> -->
				<!-- <th>order_id</th> -->
				<th>product_id</th>
				<th>company_name</th>
				<th>employee_id</th>
				<th>reg_date</th>
				<!-- <th>update_date</th> -->
				<th>storage_out_date</th>
			</tr>
			
			<tr>
				<!-- 1 purchase_id : 시퀀스로 입력 -->
				
				
				<!-- 2 account_id 12자리 : 반복되므로 계산해서 입력 -->
				
				<!-- 3 order_id : 타부서에서 입력함 -->
				
				<!-- 4 product_id -->
				<td> 
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
				
				
				<!-- 9 storage_out_date -->
				<td> <input type="date" id="storage_out_date" name="storage_out_date" 
					placeholder="입고일" value="<fmt:formatDate value='${now}' pattern='yyy-MM-dd'/>" > 
				</td>
				
			</tr>
			
			<tr>
				<th>count_sales</th>
				<th>selling_price</th>
				<th>sales_state</th>
				<th>condition_note_receivable</th>
			</tr>
			
			
			<tr>
				<!-- 10 count_sales -->
				<td> <input type="number" id="count_sales" name="count_sales" min="1" max="9999" 
				placeholder="판매 수량" requiered > </td>
				
				<!-- 11 selling_price -->
				<td> <input type="number"  id="selling_price" name="selling_price" min="1" max="999999999" 
				placeholder="판매단가" requiered  ></td>
				
				<!-- 12 sales_state : 입력할 때는 미승인 상태로 -->
					<td> <input type="number" name="sales_state" id="sales_state"  min="1" max="99999" 
				placeholder="상태코드" requiered value=22212></td>	<!-- 판매전표승인요청 -->
				
			
				<!-- 13 condition_note_receivable -->
				<td colsapn="2"> 
				<input type="number" id="condition_note_receivable" name="condition_note_receivable" 
				placeholder="채무 기간" min="1" max="12" > 
				</td>	
			</tr>
			
		</table>
	</form>
	
	<div id="reg_table" >
		<p><h3> 판매 내역을 입력할 수 있는 페이지 입니다. </h3></p>
		<p> 각 드롭메뉴는 데이터베이스에 있는 내용을 불러옵니다. </p>
		<p> 해당란에 없는 칼럼은 시퀀스 또는 기본값으로 입력됩니다. </p>
		<p> 입력이 완료된 내용은 검색페이지에서 확인할 수 있습니다. </p>
	</div>
	
	
	
	
	
</body>
</html>