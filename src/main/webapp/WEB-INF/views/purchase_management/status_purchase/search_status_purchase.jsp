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
	
	<div class="row">
		<div class="col-xs-12">
			<div class="panel panel-primary">
				<div class="panel-heading">
			  		 <h4 class="panel-title">
			  		 	<a id="page3310_div01_toggle"><span class="glyphicon glyphicon-shopping-cart"></span> &nbsp;
			  			<b> 구매 현황 검색 페이지  </b>
			  			</a>
			  		</h4>
				</div>
				<div class="panel-body" id="page3310_div01">
					<font class="media-heading">
						<span>구매내역을 원하는 기간 및 옵션별로 검색할 수 있습니다. 전체 내역을 확인하고 싶으면 전체내역 버튼을 눌러주세요.</span>
					</font>
					<br><br>
					<!-- ----------------------------------------------------- -->
					
					<div class="form-group" style="margin-bottom: 0px; padding-bottom: 0px;">
						<form action="#" name="list_status_sales" method="GET" onsubmit="return list_table(1,1)">
						
						<div class="btn-group" align="center" style="margin-bottom: 0px;">
							<span class="input-group-btn">
								<input type="button" name="btn_all_list" value="전체내역 검색" class="btn btn-primary"  onclick="return list_table(1,0);">
								<input type="reset" class="btn btn-default" value="재작성">
							</span>
						</div>	<!-- // btn-group -->
						<hr>
						
						<!-- ----------------------------------------------------- -->
						
						<c:set var="today" value="<%= new java.util.Date() %>"/>
							<div class="btn-group btn-group-justified" role="group" aria-label="...">
								<div class="btn-group" role="group" style="width: 35%;" >
									<input type="date" id="start_date" name="start_date" class="btn btn-default"
										value="<fmt:formatDate value='${today}' pattern='yyyy-MM-dd'/>">
								</div>
								<div class="btn-group" role="group" style="width: 35%;"  >
									<input type="date" id="end_date" name="end_date" class="btn btn-default"
										value="<fmt:formatDate value='${today}' pattern='yyyy-MM-dd'/>">
								</div>
								<div class="btn-group" role="group" style="width: 15%;">
									<input type="submit" name="btn_submit"class="btn btn-primary"  value="검색" >
								</div>
								<div class="btn-group" role="group" style="width: 15%;">
									<input type="reset" name="btn_reset" class="btn btn-default" value="재설정">  
								</div>
							</div>
							
							<!-- ----------------------------------------------------- -->
		
							<div class="btn-group btn-group-justified" role="group" aria-label="...">
		
								<div class="btn-group" role="group">
									<input type="button" id="today" name="today" value="오늘"
										class="btn btn-default">
								</div>
		
								<div class="btn-group" role="group">
									<input type="button" id="a_day" name="a_day" value="하루"
										class="btn btn-default">
								</div>
								<div class="btn-group" role="group">
									<input type="button" id="a_week" name="a_week" value="한주"
										class="btn btn-default">
								</div>
								<div class="btn-group" role="group">
									<input type="button" id="a_month" name="a_month" value="한달"
										class="btn btn-default">
								</div>
								<div class="btn-group" role="group">
									<input type="button" id="a_quarter" name="a_quarter" value="한분기"
										class="btn btn-default">
								</div>
								<div class="btn-group" role="group">
									<input type="button" id="a_year" name="a_year" value="일년"
										class="btn btn-default">
								</div>
								
								<div class="btn-group" role="group">
									<select id="months" class="form-control" >                                              
										<option value="0" selected> 월별 </option>
										<option value="01" > 1월 </option>
										<option value="02" > 2월 </option>
										<option value="03" > 3월 </option>
										<option value="04" > 4월 </option>
										<option value="05" > 5월 </option>
										<option value="06" > 6월 </option>
										<option value="07" > 7월 </option>
										<option value="08" > 8월 </option>
										<option value="09" > 9월 </option>
										<option value="10" > 10월 </option>
										<option value="11" > 11월 </option>
										<option value="12" > 12월 </option>
									</select>
								</div>
							</div>
							
							<!-- ----------------------------------------------------- -->
							
							<div class="btn-group btn-group-justified" align="center" role="group" aria-label="...">
								
								<div class="btn-group" role="group" style="width: 20%">
									<select name="account_ids" id="account_ids"  class="form-control" >
									   <option value="0" selected> 계정선택 </option>
											<option value="500011030000">부가세대수금</option>
											<option value="500011050000">상품매입</option>
											<option value="500012010000">매입채무</option>
									</select>  
								</div>
								
								<div class="btn-group" role="group"style="width: 20%">
								  	<select name="product_ids" id="product_ids"  class="form-control" >
									   <option value="0" selected> 제품선택 </option>
									   <c:forEach var="product" items="${product_ids}">
									  		<option value="${product.product_id}">${product.product_name} </option>
									  	</c:forEach>
								  	</select>
							  	</div>
							  	
							  	<div class="btn-group" role="group"style="width: 20%">
								  	<select name="company_ids" id="company_ids"  class="form-control" >
									   <option value="0" selected> 거래처선택 </option>
									   <c:forEach var="company" items="${company_ids}">
									  		<option value="${company.company_id}">${company.company_name} </option>
									  	</c:forEach>
								  	</select>
							  	</div>
							  	
							  	<div class="btn-group" role="group"style="width: 20%">
								  	<select name="employee_ids" id="employee_ids" class="form-control"  >
									   <option value="0" selected> 담당자선택 </option>
									   <c:forEach var="employee" items="${employee_ids}">
									  		<option value="${employee.employee_id}">${employee.employee_name} </option>
									  	</c:forEach>
								  	</select>
								</div>
							
								<div class="btn-group" role="group" style="width: 10%">
									<input type="button" name="btn_submit"class="btn btn-primary"  value="검색" onclick="list_table(1,2);" > 
								</div>
								<div class="btn-group" role="group" style="width: 10%">
									<input type="reset" name="btn_reset" class="btn btn-default" value="재설정"> 
								</div>
							</div>
		
						<!-- ----------------------------------------------------- -->
						
						</form>
					</div>
			
					<!-- ----------------------------------------------------- -->
					
				</div>	<!-- // panel-body -->
				<div class="panel-body" id="page3310_div02"></div>
			</div>	<!-- // panel -->
		</div>	
	</div>
	
	<!-- ------------------------------------------------------------------------------------- -->
	
	<script type="text/javascript">
	
	$('#page3310_div01_toggle').click(function(){
		$('#page3310_div01').slideToggle();
		return false;
	});
	
	function list_table(param,check){
	
		var pageNum = param;
		var check = check;
		var account	= null;
		var product = null;
		var company = null;
		var employee = null;
		
		if(check==1){
			var start_date = document.getElementById("start_date").value 
			var end_date = document.getElementById("end_date").value 
		
		}
		
		if(check==0){
			var start_date = "all";
			var end_date = "all";
		
		}
		
		if(check==2){
			
			var vals = new Array();
			
			account = document.getElementById("account_ids").value;
			product = document.getElementById("product_ids").value;
			company = document.getElementById("company_ids").value;
			employee = document.getElementById("employee_ids").value;
		
		}
		
		
		$('#page3310_div02').load('/purchase_management/status_purchase/search_status_purchase_table?start_date='+start_date
				+'&end_date='+end_date
				+'&pageNum='+pageNum
				+'&account='+account
				+'&product='+product
				+'&company='+company
				+'&employee='+employee
				);
		 
		return false;
	}
	
	
	
	var start_date	= null;
	var end_date 	= null;
	var start_date_temp = null;
	var end_date_temp 	= null;
	
	function date_load(){
		
		end_date 	= document.getElementById("end_date");
		end_date.vlaue 	 = date_format(new Date(end_date.value));
		end_date_temp 	 = new Date(end_date.value);
		
		
		start_date	= document.getElementById("start_date");
		start_date.value = date_format(new Date(end_date.value));
		start_date_temp  = new Date(start_date.value);
	 }
	
	 
	function date_format(date){
		var year = date.getFullYear();                //yyyy
		var month = (1 + date.getMonth());            //M
		month = month >= 10 ? month : '0' + month;    // month 두자리로 저장
		var day = date.getDate();                     //d
		day = day >= 10 ? day : '0' + day;            //day 두자리로 저장
		return  year + '-' + month + '-' + day;
	}

	document.getElementById("today").onclick = function(){
		date_load();
		end_date_temp 	 = new Date();
		end_date.value = date_format(end_date_temp);
		start_date.value = date_format(end_date_temp);
	}
	document.getElementById("a_day").onclick = function(){
		date_load();
		start_date_temp.setDate(end_date_temp.getDate()-1);
		start_date.value = date_format(start_date_temp);
	}
	document.getElementById("a_week").onclick = function(){
		date_load();
		start_date_temp.setDate(start_date_temp.getDate()-7);
		start_date.value = date_format(start_date_temp);
	}
	document.getElementById("a_month").onclick = function(){
		date_load();
		start_date_temp.setMonth(end_date_temp.getMonth()-1);
		start_date.value = date_format(start_date_temp);
	}
	document.getElementById("a_quarter").onclick = function(){
		date_load();
		start_date_temp.setMonth(end_date_temp.getMonth()-3);
		start_date.value = date_format(start_date_temp);
	}
	document.getElementById("a_year").onclick = function(){
		date_load();
		start_date_temp.setFullYear(end_date_temp.getFullYear()-1);
		start_date.value = date_format(start_date_temp);
	}
	document.getElementById("months").onchange = function(){
		
		date_load();
		var month = this.value;
		var year = end_date_temp.getFullYear();
		
		if(month==01){
			start_date.value = date_format(new Date(year,0,1));
			end_date.value 	 = date_format(new Date(year,1,0));
		} else if(month==02){
			start_date.value = date_format(new Date(year,1,1));
			end_date.value 	 = date_format(new Date(year,2,0));
		} else if(month==03){
			start_date.value = date_format(new Date(year,2,1));
			end_date.value 	 = date_format(new Date(year,3,0));
		} else if(month==04){
			start_date.value = date_format(new Date(year,3,1));
			end_date.value 	 = date_format(new Date(year,4,0));
		} else if(month==05){
			start_date.value = date_format(new Date(year,4,1));
			end_date.value 	 = date_format(new Date(year,5,0));
		} else if(month==06){
			start_date.value = date_format(new Date(year,5,1));
			end_date.value 	 = date_format(new Date(year,6,0));
		} else if(month==07){
			start_date.value = date_format(new Date(year,6,1));
			end_date.value 	 = date_format(new Date(year,7,0));
		} else if(month==08){
			start_date.value = date_format(new Date(year,7,1));
			end_date.value 	 = date_format(new Date(year,8,0));
		} else if(month==09){
			start_date.value = date_format(new Date(year,8,1));
			end_date.value 	 = date_format(new Date(year,9,0));
		} else if(month==10){
			start_date.value = date_format(new Date(year,9,1));
			end_date.value 	 = date_format(new Date(year,10,0));
		} else if(month==11){
			start_date.value = date_format(new Date(year,10,1));
			end_date.value 	 = date_format(new Date(year,11,0));
		} else if(month==12){
			start_date.value = date_format(new Date(year,11,1));
			end_date.value 	 = date_format(new Date(year,12,0));
		} else {
			alert("입력값 오류");
		}
		
	}
	

	
	</script>
	
	
</body>
</html>