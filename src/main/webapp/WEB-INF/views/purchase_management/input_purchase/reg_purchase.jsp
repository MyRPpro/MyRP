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
	
	<form action="/purchase_management/input_purchase/reg_purchase_pro" 
		name="reg_table_form" method="post">
	
		<input type="submit" value="등록하기">
		<input type="reset" value="재설정">
		<input type="button" value="메인으로 이동" onclick="window.location='/'" >
		
		<hr>
	
		<table border="1">
			
			<tr>
				<!-- <th>purchase_id</th> -->
				<th>account_id</th>
				<!-- <th>order_id</th> -->
				<th>product_id</th>
				<th>company_name</th>
				<th>employee_id</th>
				<th>reg_date</th>
				<!-- <th>update_date</th> -->
				<th>storage_in_date</th>
				<th>count_purchase</th>
				<th>supply_price</th>
				<th>purchase_state</th>
				<th>condition_note_payable</th>
			</tr>
			
			<tr>
				<!-- 1 purchase_id : 시퀀스로 입력 -->
				
				
				<!-- 2 account_id 12자리 -->
				<td> 
					<select name="account_id">
					  <datalist id="account_id">
					    <c:forEach var="account" items="${order_ids}">
					  		<option value="${account.account_id}">${account.account_id} </option>
					  	</c:forEach>
					  </datalist>
					  
					  <!-- 
					  <datalist id="account_id">
					    <option value="500011010000" > 현금통장 </option>
					    <option value="500011020000"> 매출채권 </option>
						<option value="500012010000"> 매입채무 </option>
						<option value="500011030000"> 부가세 대급금 </option>
						<option value="500012020000"> 부가세 예수금 </option>
						<option value="500011050000"> 상품관련 </option>
						<option value="500013010000"> 이익잉여금 </option>
					  </datalist>
					   -->
					  
				</td>
				
				<!-- 3 order_id : 타부서에서 입력함 -->
				<%-- <td> 
					<select name="order_id">
					  <datalist id="order_id">
					    <c:forEach var="order" items="${order_ids}">
					  		<option value="${order.order_id}">${order.order_id} </option>
					  	</c:forEach>
					  </datalist>
				</td> --%>
				
				<!-- 4 product_id -->
				<td> 
					<select name="product_id">
					  <datalist id="product_id" required >
					  	<c:forEach var="product" items="${product_ids}">
					  		<option value="${product.product_id}">${product.product_name} </option>
					  	</c:forEach>
					  </datalist>
				</td>
				
				<!-- 5 company_name -->
				<td> 
					<select name="company_id" required >
					  <datalist id="company_id">
					   <c:forEach var="company" items="${company_ids}">
					  		<option value="${company.company_id}">${company.company_name} </option>
					  	</c:forEach>
					  </datalist>
				</td>
				
				<!-- 6 employee_id -->
				<td>
					<select name="employee_id" required >
					   <datalist id="employee_id">
					   <c:forEach var="employee" items="${employee_ids}">
					  		<option value="${employee.employee_id}">${employee.employee_name} </option>
					  	</c:forEach>
					  </datalist>
				</td>
				
				<!-- 7  reg_date -->
				<td> <input type="date" name="reg_date" required
				placeholder="등록일을 입력하세요." > </td>
				
				<!-- 8 update_date : 자동으로 현재날짜 입력 -->	
				
				
				<!-- 9 storage_in_date -->
				<td> <input type="date" name="storage_in_date" 
				placeholder="입고일"> </td>
				
				<!-- 10 count_purchase -->
				<td> <input type="number" name="count_purchase" min="1" max="9999" 
				placeholder="구매 수량"requiered > </td>
				
				<!-- 11 supply_price -->
				<td> <input type="number" name="supply_price" min="1" max="9999999999" 
				placeholder="구매단가" requiered ></td>
				
				<!-- 12 purchase_state : 입력할 때는 미승인 상태로 -->
					<td> <input type="number" name="purchase_state" min="1" max="99999" 
				placeholder="상태코드" requiered ></td>
				
			
				<!-- 13 condition_note_payable -->
				<td> <input type="number" name="condition_note_payable" 
				placeholder="채무 기간" min="1" max="12"> </td>	
			</tr>
			
		</table>
		
		
	</from>
	
	<div>
		<p><h3> 구매 내역을 입력할 수 있는 페이지 입니다. </h3></p>
		<p> 각 드롭메뉴는 데이터베이스에 있는 내용을 불러옵니다. </p>
		<p> 해당란에 없는 칼럼은 시퀀스 또는 기본값으로 입력됩니다. </p>
		<p> 입력이 완료된 내용은 검색페이지에서 확인할 수 있습니다. </p>
	</div>
	
	
	
	
	<!-- 
	<table border="1">
		
		<tr>
			<th>purchase_id</th>
			<th>account_id</th>
			<th>order_id</th>
			<th>product_id</th>
			<th>company_name</th>
			<th>employee_id</th>
			<th>reg_date</th>
			<th>update_date</th>
			<th>storage_in_date</th>
			<th>count_purchase</th>
			<th>supply_price</th>
			<th>purchase_state</th>
			<th>condition_note_payable</th>
		</tr>
		
		<tr>
			1 purchase_id
			<td> <input type="text" name="purchase_id"  maxlength="10" required > </td>
			
			2 account_id
			<td> <input type="text" name="account_id" maxlength="12" required> </td>
			
			3 order_id
			<td> <input type="text" name="order_id" maxlength="12" required > </td>
			
			4 product_id
			<td> <input type="text" name="product_id" maxlength="10" required > </td>
			
			5 company_name
			<td> <input type="text" name="company_id" maxlength="10" required > </td>
			
			6 employee_id
			<td> <input type="number" name="employee_id" maxlength="2" required > </td>
			
			7  reg_date
			<td> <input type="date" name="reg_date" required > </td>
			
			8 update_date	
			<td> <input type="date" name="update_date" readonly > </td>
			
			9 storage_in_date
			<td> <input type="date" name="storage_in_date" > </td>
			
			10 count_purchase
			<td> <input type="number" name="count_purchase" min="1" max="9999" requiered > </td>
			
			11 supply_price
			<td> <input type="number" name="supply_price" min="1" max="9999999999" requiered ></td>
			
			12 purchase_state
			<td> <input type="number" name="purchase_state" value="25451"> </td>	미승인 상태 
			
			13 condition_note_payable
			<td> <input type="number" name="condition_note_payable" min="1" max="12"> </td>	
		</tr>
		
	</table>
	 -->
	
	
	
	
	
</body>
</html>