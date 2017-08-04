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

	<div class="panel panel-primary" id="page2110">
		<div class="panel-heading">
	  		 <h4 class="panel-title">
	  		 	<a id="page2110_div01_toggle"><span class="glyphicon glyphicon-triangle-right"></span> &nbsp;
	  			<b> 판매 입력 페이지 Reg_Sales </b>
	  			</a>
	  		</h4>
		</div>
		<div class="panel-body" id="page2110_div01">
			<font class="media-heading">
				새로운 판매 내역을 입력할 수 있는 페이지 입니다. *표시된 부분 필수 입력사항입니다. 
			</font>
			<br><br>
			<!-- ----------------------------------------------------- -->
			
			<div class="table-responsive">
				<table class="table table-condensed table-striped table-hover" id="reg_sales_table">
					<tr>
						<th> 상품＊ </th>
						<th> 거래처＊ </th>
						<th> 담당자＊ </th>
						
					</tr>
					<!-- ----------------------------------------------------- -->
					<tr>
						<td> 
							<select name="product_id" id="product_id" class="form-control input-sm" required >
							  	<option value="0" selected> 상품선택 </option>
							  	<c:forEach var="product" items="${product_ids}">
							  		<option value="${product.product_id}">${product.product_name}</option>
							  	</c:forEach>
							  </select>
						</td>
						<td> 
							<select name="company_id" id="company_id" class="form-control input-sm" required >
							  <option value="0" selected> 거래처선택 </option>
							   <c:forEach var="company" items="${company_ids}">
							  		<option value="${company.company_id}">${company.company_name} </option>
							  	</c:forEach>
							  </select>
						</td>
						<td>
							<select name="employee_id" id="employee_id" class="form-control input-sm" required >
							   <option value="0" selected> 담당자선택 </option>
							   <c:forEach var="employee" items="${employee_ids}">
							  		<option value="${employee.employee_id}">${employee.employee_name} </option>
							  	</c:forEach>
							  </select>
						</td>
						
					</tr>
					<!-- ----------------------------------------------------- -->
					<tr>
						<th> 등록일＊ </th>
						<th> 출고일 </th>
						<th> 판매상태 </th>
					</tr>
					<!-- ----------------------------------------------------- -->
					<tr>
						<td> 
							<c:set var="now" value="<%= new java.util.Date() %>"/>
							<input type="date" id="reg_date" name="reg_date" class="form-control input-sm" 
							placeholder="등록일을 입력하세요." value="<fmt:formatDate value='${now}' pattern='yyy-MM-dd'/>" onchange="return check_date();" required > 
						</td>
						<td> 
							<input type="date" id="storage_out_date" name="storage_out_date" class="form-control input-sm" 
							placeholder="출고일" value="<fmt:formatDate value='${now}' pattern='yyy-MM-dd'/>" onchange="return check_date();" > 
						</td>
						
						<td>
							<input type="hidden" value="22213" name="sales_state" id="sales_state">
							<input type="text" name="sales_state" value="판매전표승인요청" class="form-control input-sm" readonly>
						</td>	
					</tr>
					<!-- ----------------------------------------------------- -->
					<tr>
						<th> 판매수량＊ </th>
						<th> 판매가＊ </th>
						<th> 어음기간  </th>
					</tr>
					<!-- ----------------------------------------------------- -->
					<tr>
						<td>
							<input type="number" id="count_sales" name="count_sales" class="form-control input-sm" min="1" max="9999" placeholder="판매 수량" requiered > 
						</td>
						<td> 
							<input type="number"  id="selling_price" name="selling_price" class="form-control input-sm" min="1" max="999999999" placeholder="판매단가" requiered >
						</td>
						<td > 
							<input type="number" id="condition_note_receivable" name="condition_note_receivable" class="form-control input-sm" min="0" max="12" placeholder="기간" > 
						</td>
					</tr>
					<!-- ----------------------------------------------------- -->
					
					
				</table>
			</div>
				
			<!-- ----------------------------------------------------- -->
					
			<br>		
		<div class="btn-group" align="center">
			<span class="input-group-btn">
				<input type="submit" class="btn btn-primary" name="btn_submit" id="page2110_submit" value="등록하기" >
				<input type="reset" class="btn btn-default" value="재작성">
			</span>
		</div>	<!-- // btn-group -->
		</div>	<!-- // panel-body -->
		<div class="panel-body" id="page2110_div02"></div>
	</div>	<!-- // panel -->

	
	<!-- ------------------------------------------------------------------------------------- -->
	
	<script>

	$('#page2110_div01_toggle').click(function(){
		$('#page2110_div01').slideToggle();
		return false;
	});
	
	$('#page2110_submit').click(function reg_sales_confrim(){
		
		 var product_id = document.getElementById("product_id");
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
			 alert("상품이 선택되지 않았습니다. 원하는 상품을 선택해주세요.");		
			 product_id.focus();		
			 return false;
		 } else if ( company_id.value == 0 ){
			 alert("거래처가 선택되지 않았습니다. 원하는 거래처을 선택해주세요.");		
			 company_id.focus();		
			 return false;
		 } else if ( employee_id.value == 0 ){
			 alert("담당자가 선택되지 않았습니다. 해당 담당자을 선택해주세요.");		
			 employee_id.focus();		
			 return false;
		 } else if ( count_sales.value == 0 ){
			 alert("수량이 입력되지 않았습니다. 원하는 상품을 선택해주세요.");		
			 count_sales.focus();		
			 return false;
		 } else if ( selling_price.value == 0 ){
			 alert("가격이 선택되지 않았습니다. 원하는 가격을 선택해주세요.");		
			 selling_price.focus();		
			 return false;
		 } else if ( sales_state.value == 0 ){
			 alert("거래상태가 선택되지 않았습니다. 원하는 상태을 선택해주세요.");		
			 sales_state.focus();		
			 return false;
		 } else if ( condition_note_receivable.value == "" ){
			 alert("어음기간이 입력되지 않았습니다. 일자를 입력해주세요.");		
			 condition_note_receivable.focus();		
			 return false;
		 } 
		 
		 $('#page2110_div02').load('/sales_management/input_sales/reg_sales_table?product_id='+product_id.value
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
	});
	
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
		var out_date = new Date(document.getElementById("storage_out_date").value);
		var reg_date = new Date(document.getElementById("reg_date").value);
		
		if( out_date < now ){
			alert("출고일은 오늘부터 선택 가능합니다.");
			now.setDate(now.getDate()+1);
			document.getElementById("storage_out_date").value = date_format(now);
		}
		
		if( reg_date > out_date ){
			alert("등록일은 출고일 이전으로 선택가능합니다.");
			out_date = new Date(document.getElementById("storage_out_date").value);
			reg_date.setDate(now.getDay()-1);
			document.getElementById("reg_date").value = date_format( reg_date );
		}
	}
	
	</script>
	
	
	
	
</body>
</html>