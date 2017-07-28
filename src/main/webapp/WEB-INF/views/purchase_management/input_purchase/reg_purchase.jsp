<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../../setting.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">

</style>

</head>

<body>

	<c:if test="${leck_cnt == 0 }">
		<script type="text/javascript">
			setTimeout(function(){
				alert("재고부족 목록이 없습니다.");
				/* window.location="window.location='/purchase_management/input_purchase/reg_purchase"; */
			},200);
		</script>
	</c:if>

	<form action="#" name="reg_table_form" method="get" onsubmit="return reg_purchase();">
	
	<!-- 테이블 추가  -->
	<div class="row">
	<div class="col-xs-12">
	
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title"> 
			<span class="glyphicon glyphicon-gift"></span> 
			&nbsp; &nbsp; 구매 입력 페이지 reg_purchase
			</h3>
		</div>
			
		<div class="panel-body">
		<font class="media-heading" style="margin:0 auto;"> 구매 내역을 입력할 수 있는 페이지 입니다. </font><br><br>
			
		<div class="table-responsive">

		<!-- 불러온 값이 없을 경우 , 기본값  -->
		<c:if test="${leck_cnt == null}">	
		<table class="table table-condensed table-striped">
			<tr>				
				<th>상품</th>
				<th>거래처</th>
				<th>담당자</th>
				<th>등록일</th>
				<th>입고일</th>
			</tr>
			
			<tr>
				<td>
					<div class="form-group">
						<select name="product_id" id="product_id" class="form-control input-sm">
							<option value="0" selected>상품선택</option>
							<c:forEach var="product" items="${product_ids}">
								<option value="${product.product_id}">${product.product_name}</option>
							</c:forEach>
						</select>
					</div>
				</td>

				<td>
					<div class="form-group">
						<select name="company_id" id="company_id" class="form-control input-sm"
							required>
							<option value="0" selected>거래처선택</option>
							<c:forEach var="company" items="${company_ids}">
								<option value="${company.company_id}">${company.company_name}
								</option>
							</c:forEach>
						</select>
					</div>
				</td>

				<td>
					<div class="form-group">
						<select name="employee_id" id="employee_id"
							class="form-control input-sm" required>
							<option value="0" selected>담당자선택</option>
							<c:forEach var="employee" items="${employee_ids}">
								<option value="${employee.employee_id}">${employee.employee_name}
								</option>
							</c:forEach>
						</select>
					</div>
				</td>

				<td>
					<div class="form-group">
						<c:set var="now" value="<%=new java.util.Date()%>" />
						<input type="date" name="reg_date" id="reg_date"
							class="form-control input-sm" required onchange="return check_date()"
							placeholder="등록일을 입력하세요."
							value="<fmt:formatDate value='${now}' pattern='yyy-MM-dd'/>">
					</div>
				</td>

				<td>
					<div class="form-group">
						<input type="date" id="storage_in_date" name="storage_in_date"
							class="form-control input-sm" onchange="return check_date()"
							placeholder="입고일"
							value="<fmt:formatDate value='${now}' pattern='yyy-MM-dd'/>">
					</div>
				</td>

			</tr>
			
			<tr>
				<th>구매수량</th>
				<th>구매단가</th>
				<th>지급기간</th>
				<th colspan="2">구매상태</th>
			</tr>
			
			<tr>
				<td>
					<div class="form-group">
						<input type="number" id="count_purchase" name="count_purchase"
							class="form-control input-sm" min="1" max="9999" placeholder="구매 수량"
							requiered>
					</div>
				</td>

				<td>
					<div class="form-group">
						<input type="number" id="supply_price" name="supply_price"
							class="form-control input-sm" min="1" max="999999999"
							placeholder="구매단가" requiered>
					</div>
				</td>

				<td>
					<div class="form-group">
						<input type="number" id="condition_note_payable"
							name="condition_note_payable" class="form-control input-sm"
							placeholder="채무 기간" min="1" max="12">
					</div>
				</td>

				<td colspan="2">
					<div class="form-group">
						<input type="hidden" name="purchase_state" id="purchase_state"
							value="23202"> <input type="text"
							name="purchase_state_name" id="purchase_state_name"
							class="form-control input-sm" value="구매전표승인요청" readonly>
					</div>
				</td>
			</tr>

		</table>
		</c:if>
		
		<!-- 불러온 값이 있을 경우   -->
		<c:if test="${leck_cnt != null}">
		
		<table class="table table-condensed table-striped">

			<tr>
				<th>상품</th>
				<th>거래처</th>
				<th>담당자</th>
				<th>등록일</th>
				<th>입고일</th>
			</tr>

			<tr>
				<td>
					<div class="form-group"> 
						<input type="hidden" name="product_id" id="product_id" value="${dto.product_id}">
						<input type="text" name="product_name" id="product_name" value="${dto.product_name}"
						class="form-control input-sm" readonly>
					</div>
				</td>

				<td>
					<div class="form-group"> 
						<input type="hidden" name="company_id" id="company_id" value="${dto.company_id}">
						<input type="text" name="company_name" id="company_name" value="${dto.company_name}"
						class="form-control input-sm" readonly>
					</div>
				</td>

				<td>
					<div class="form-group"> 
						<input type="hidden" name="employee_id" id="employee_id" value="${dto.employee_id}">
						<input type="text" name="employee_name" id="employee_name" value="${dto.employee_name}"
						class="form-control input-sm" readonly>
					</div>
				</td>

				<!-- 7  reg_date -->
				<td>
					<div class="form-group">
						<input type="date" name="reg_date" id="reg_date" required
						onchange="return check_date()" 
						value="<fmt:formatDate value='${dto.reg_date}' pattern='yyyy-MM-dd'/>">
					</div>
				</td>

				<td>
					<div class="form-group">
						<c:set var="now" value="<%=new java.util.Date()%>" />
						<input type="date" id="storage_in_date" name="storage_in_date" required
						onchange="return check_date()"
							value="<fmt:formatDate value='${now}' pattern='yyyy-MM-dd'/>">
					</div>
				</td>

			</tr>

			<tr>
				<th>구매수량</th>
				<th>구매단가</th>
				<th>지급기간</th>
				<th colspan="2">구매상태</th>
			</tr>


			<tr>

				<td>
					<div class="form-group"> 
						<input type="hidden" name="count_purchase" id="count_purchase" value="${dto.lack_stock}">
						<input type="text" value="<fmt:formatNumber value="${dto.lack_stock}" type="number"/>" 
						class="form-control input-sm" requiered readonly>
						
					</div>
				</td>

				<td>
					<div class="form-group">
						<input type="hidden" name="supply_price" id="supply_price" value="${dto.purchase_unit_price}">
						<input type="text"  class="form-control input-sm"min="1" max="999999999" requiered readonly
						value="$<fmt:formatNumber value="${dto.purchase_unit_price}" type="currency" currencySymbol="￦"/>" >
					</div>
				</td>

				<td>
					<div class="form-group">
						<input type="number" id="condition_note_payable"
							name="condition_note_payable" placeholder="채무 기간" 
							value="${dto.condition_note_payable}"
							min="1" max="12">
					</div>
				</td>

				<td colspan="2">
				<div class="form-group">
					<input type="hidden" name="purchase_state" id="purchase_state" value="23202"> 
					<input type="text" name="purchase_state_name" id="purchase_state_name"
					value="구매전표승인요청" readonly>
				</div>
				</td>
			</tr>

		</table>
		<input type="hidden" id="order_id" value="${dto.stock_order_id}">
		
		</c:if>
		
		<input type="submit" value="등록하기" class="btn btn-primary" >
		<input type="reset" value="재설정" class="btn btn-default ">
		&emsp;
		<input type="button" value="부족재고조회" class="btn btn-info" onclick="return search_lack_stock(1)" >
		<input type="button" value="새로입력하기" class="btn btn-info" onclick="return reg_purchase_new()" >  
		</div>	<!-- // table-responsive -->	
		
		<br>
		
		<div id="reg_table"></div>
		<div id="reg_page"></div> 
		</div>	<!-- // panel-body  -->
			
	</div> <!-- // panel panel-primary  -->
	</div> <!-- // col-xs-12 -->
	</div> <!-- // row -->
	
	</form>
	
	
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
	 var order_id = document.getElementById("order_id");
	 
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
							+'&order_id='+order_id.value
						 );	 
	 	return false;
	 }
	
	
	function search_lack_stock(pagenum){
		
		/* this.pagenum = pagenum; */
		var pagenum = pagenum;
		console.log(" 선택한 pagenum :" + pagenum);
		$('#reg_table').load("/purchase_management/input_purchase/search_reg_purchase_table"
			+"?pageNum="+pagenum );
		$('#reg_page').load("/purchase_management/input_purchase/search_reg_purchase_page"
				+"?pageNum="+pagenum );
		/* 
		$.ajax({
			data	: pagenum,
			type	: 'get',
			url		: "/purchase_management/input_purchase/search_reg_purchase_table",
			success : function(table){
				$('#reg_table').html(table);
			}
		});
		 */
		return false;
		 
	}
	
	function reg_purchase_new(){
		 $('#main_screen').load("/purchase_management/input_purchase/reg_purchase");
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
		now.setDate(now.getDate()-1);
		var in_date = new Date(document.getElementById("storage_in_date").value);
		var reg_date = new Date(document.getElementById("reg_date").value);
		
		if( in_date < now ){
			alert("입고일은 오늘부터 선택 가능합니다.");
			now.setDate(now.getDate()+1);
			document.getElementById("storage_in_date").value = date_format(now);
		}
		
		if( reg_date > in_date ){
			alert("등록일은 입고일 이전으로 선택해주세요.");
			in_date = new Date(document.getElementById("storage_in_date").value);
			reg_date.setDate(in_date.getDate()-1);
			document.getElementById("reg_date").value = date_format( reg_date );
		}
		
	}
	</script>
	
</body>
</html>