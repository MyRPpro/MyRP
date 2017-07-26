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

	<h3> 구매 내역 상세 페이지 : detail_purchase.jsp</h3>
	
	
	<c:if test="${cnt > 0}">
		<script type="text/javascript">
			setTimeout(function(){
				alert("상태코드가 정상적으로 변경되었습니다.");
				window.location="/sales_management/search_sales/sales_list"
			}, 200);
		</script>
	</c:if>
	
	<c:if test="${cnt == 0}">
		<script type="text/javascript">
			alert("상태코드 변경 오류가 발생했습니다.");
			window.history.back();
		</script>
	</c:if>
	
	
	<form action="/purchase_management/search_purchase/modify_purchase"
	name="modify_purchase_form" method="get">
	
	<!-- 수정불가 -->
		<table border="1" width="1500px" >
		
			<tr>
				<!-- 1  --> <th>purchase</th>
				<!-- 2  --> <th>account</th>
				<!-- 3  --> <th>order</th>
				<!-- 4  --> <th>product</th>
				<!-- 5  --> <th>company</th>
				<!-- 6  --> <th>employee</th>
				<!-- 7  --> <th>reg_date</th>
				<!-- 8  --> <th>update_date</th>
				<!-- 9  --> <th>storage_in_date</th>
				<!-- 10 --> <th>count_purchase</th>
				<!-- 11 --> <th>supply_price</th>
				<!-- 12 --> <th>purchase_state</th>
				<!-- 13 --> <th>condition_note_payable</th>
			</tr>
				
			<tr>	
				<td>
					<c:forEach var="dto" items="${dtos}">
						<input type="text" name="purchase_id" id="purchase_id" value="${dto.purchase_id}" maxlength="10" readonly >
					</c:forEach>
				</td>
				
				<td>
					<c:forEach var="dto" items="${dtos}">
						<input type="hidden" name="account_id" id="account_id" value="${dto.account_id}" readonly >
						<input type="text" name="account_name" value="${dto.account_name} 계정" readonly >
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
						<input type="text" name="product_name" value="${dto.product_name}"  readonly >
					</c:forEach>
				</td>
				
				<td>
					<c:forEach var="dto" items="${dtos}">
						<input type="hidden" name="company_id" value="${dto.company_id}" readonly >
						<input type="text" name="company_name" value="${dto.company_name}" readonly  >
					</c:forEach>
				</td>
				
				<td>
					<c:forEach var="dto" items="${dtos}">
						<input type="hidden" name="employee_id" value="${dto.employee_id}"readonly >
						<input type="text" name="employee_name" value="${dto.employee_name}" readonly >
					</c:forEach>
				</td>
				
				<td>
					<c:forEach var="dto" items="${dtos}">
						<input type="date" name="reg_date" value="${dto.reg_date}"  readonly>
					</c:forEach>
				</td>
				
				<td>
					<c:forEach var="dto" items="${dtos}">
						<input type="date" name="update_date" value="${dto.update_date}" readonly>
					</c:forEach>
				</td>
				
				<td>
					<c:forEach var="dto" items="${dtos}">
						<input type="date" name="storage_in_date" value="${dto.storage_in_date}" readonly>
					</c:forEach>
				</td>
				
				<td>
					<c:forEach var="dto" items="${dtos}">
						<input type="number" name="count_purchase" value="${dto.count_purchase}" max="9999" readonly>
					</c:forEach>
				</td>
				
				<td>
					<c:forEach var="dto" items="${dtos}">
						<input type="number" name="supply_price" value="${dto.supply_price}" max="9999999999" readonly>
					</c:forEach>
				</td>
				
				<td>
					<c:forEach var="dto" items="${dtos}">
						<input type="text" name="purchase_state" value="${dto.purchase_state}"   readonly>
					</c:forEach>
				</td>
				
				<td>
					<c:forEach var="dto" items="${dtos}">
						<input type="number" name=condition_note_payable value="${dto.condition_note_payable}" max="12" required>
					</c:forEach>
				</td>
				
			</tr>
		</table>
		<c:if test="${purchase_state == 22213 }">
			<input type="button" value="회계전표 입력하기 " 
			onclick="window.location='/accounting_management/statement_management/search_all_statements'" >
		</c:if>
		<c:if test="${purchase_state == 22214 and account_id == '500011050000'}">
			<input type="button" value="입고요청하기" onclick="req_storage_in();">
		</c:if>

	</form>
	
	
	<script type="text/javascript">
	function req_storage_in(){
		var purchase_id = document.getElementById("purchase_id").value;
		console.log( " sned purchase_id : " + purchase_id );

		window.location="/purchase_management/search_purchase/detail_purchase_pro"
						+"?req_kind=storage_in&purchase_id="+purchase_id;
						
	}
	</script>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
		<table border="1">
			<tr>
				<th>purchase_id</th>
				<td>
					<input type="text" name="purchase_id" 	value="${purchaseVO.purchase_id}" maxlength="10" readonly >
				</td>
			</tr>
			<tr>
				<th>account_id</th>
				<td>
					<input type="text" name="account_id" value="${purchaseVO.account_id}" readonly >
					
				</td>
			</tr>
			<tr>
				<th>order_id</th>
				<td>
					<input type="text" name="order_id" value="${purchaseVO.order_id}" maxlength="12" readonly >
				</td>
			</tr>
			<tr>
				<th>product_id</th>
				<td>
					<input type="text" name="product_id" value="${purchaseVO.product_id}" maxlength="20" readonly >
				</td>
			</tr>
			<tr>
				<th>company_name</th>
				<td>
					<input type="hidden" name="company_id" value="${purchaseVO.company_id}">
					<input type="text" name="company_name" value="${purchaseVO.company_name}" readonly  >
				</td>
			</tr>
			<tr>
				<th>employee_id</th>
				<td>
					<input type="number" name="employee_id" value="${purchaseVO.employee_id}" 
					max="9999" onKeyup="employee_id_check();" required >
					
				</td>
			</tr>
			<tr>
				<th>reg_date</th>
				<td>
					<input type="date" name="reg_date" value="${purchaseVO.reg_date}"  >
				</td>
			</tr>
			
			<tr>
				<th>update_date</th>
				<td>
					<input type="date" name="update_date" value="${purchaseVO.update_date}" >
				</td>
			</tr>
			<tr>
				<th>storage_in_date</th>
				<td>
					<input type="date" name="storage_in_date" value="${purchaseVO.storage_in_date}" >
				</td>
			</tr>
			<tr>
				<th>count_purchase</th>
				<td>
					<input type="number" name="count_purchase" value="${purchaseVO.count_purchase}" 
					min="1" max="9999" required>
				</td>
			</tr>
			<tr>
				<th>supply_price</th>
				<td>
					<input type="number" name="supply_price" value="${purchaseVO.supply_price}" 
					min="1" max="9999999999" required>
				</td>
			</tr>
			<tr>
				<th>purchase_state</th>
				<td>
					<input type="number" name="purchase_state" value="${purchaseVO.purchase_state}" 
					min="1" max="29999" readonly>
				</td>
			</tr>
			<tr>
				<th>condition_note_payable</th>
				<td>
					<input type="number" name="condition_note_payable" value="${purchaseVO.condition_note_payable}" 
					min="1" max="12" required>
				</td>
			</tr>

			
			<tr>
			<th colspan="2">
				<input type="submit" value="수정하기">
				<input type="reset"	value="재작성">
				<!-- 
				<input type="button" value="돌아가기"
				onclick="window.history.back();">
				 -->
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
	
	
	
	/*  
	onchange("date_check('reg_date','update_date','storage_in_date')")
	function date_check(){

		// 오늘 날짜 구하기
		var today = new Date();
		var year = today.getYear();
		var month = today.getMonth()+1;
		var date = today.getDate();
		
		if( (month+"").length < 2 ) month="0"+month;
		if( (date+"").length <2 ) date="0"+date;
		
		today = year+"-"+month+"-"+date;
		consol.log(today);
		
		
		var reg_date = document.getElementsByName("reg_date")[0];
		var update_date = document.getElementsByName("update_date")[0];
		var storage_in_date = document.getElementsByName("storage_in_date")[0];
		
		
		if( reg_date != null ){
			
			
			console.log("today : " + today);
			console.log( "reg_date : " + reg_date.value);
			
			
			
		} else {
			
			
			console.log( "update_date : " + reg_date.update_date.value);
			console.log( "storage_in_date : " + storage_in_date.value);
			
		}
		
	}
	 */
	

	</script>

	
	
	
	<!-- 
	// 숫사에 단위점 찍어주는 기능 
	// 별로 추천하는 기능이 아니니 하지 말자
	<script type="text/javascript">
	
	function numberWithCommas(num) {
	    return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	
	document.getElementsByName("company_name")[0].value = ""
	purchase_id = Number(purchase_id).toLocaleString('en');
	
	
	var company_name = document.getElementsByName("company_name")[0].value;
	
	console.log("company_name :" , company_name );
	
	company_name.innerTEXT="0000";

	var purchase_id = document.getElementsByName("purchase_id")[0].value();
	
	console.log(Number(purchase_id).toLocaleString('en'));	
	purchase_id = Number(purchase_id).toLocaleString('en');
 	return Number(data_value).toLocaleString('en');

	
	</script>
	 -->
	


</body>
</html>