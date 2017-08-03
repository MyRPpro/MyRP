<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../../setting.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript">
$(function(){
	$('#select_stockpile').unbind("click").bind("click",function(){
		togo = $('#search_result');
		var product = document.getElementsByName("checke_product");
		var start_day = document.getElementById("start_date").value;
		var end_day = document.getElementById("end_date").value;
		var now = new Date();
		var sales_state= null;
		var year= now.getFullYear();
	    var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
		
		var today = year + "-" + mon + "-" + (now.getDate()>9? now.getDate() : '0' + (now.getDate()+1)*1);
		
		if(start_day == "" || end_day == ""){
			alert("날짜를 선택하시오.");
			return false;
		}

		if(product[0] != null){
			var pro = product[0].value;
			for(var i = 1; i < product.length; i++){
				pro += "-" + product[i].value;
			}
		}
		var data = {
					"product" : pro,
					"start_day" : start_day,
					"end_day" : end_day,
					"today" : today,
					"sales_state" : sales_state
					}
		$.ajax({ 					
			data: 	data,
			type: 	'post',	 			
			url: 	"/distribution_management/stockpile/select_stockpile_search",
			success: function(response) {
				togo.html(response);	
			}
		});
	});

	$('#search_button_product').unbind("click").bind("click",function(){
		var togo = $('#product_search_select');

		var product_id = document.getElementById("product_id");
		var product_name = document.getElementById("product_name");
		var product_search = document.getElementById("product_search") == null ? null : warehounse_search = document.getElementById("product_search");

		var condition = $(product_id).prop("checked") ? product_id.value : product_name.value;
		var search = product_search.value;
		var where = 'product';

		var data = {
					"condition" 	: condition,
					"search" 	: search,
					"where"		: where,
					};
		$.ajax({ 					
			data: 	data,
			type: 	'post',	 			
			url: 	"/distribution_management/stockpile/search_stockpile_search",
			success: function(response) { 	
				togo.html(response);	
			}
		});
	});
	
	$('#search_stockpile_date').change(function(){	
		
		var date = document.getElementById("search_stockpile_date").value;
		var start_day = document.getElementById("start_date");
		var end_day = document.getElementById("end_date");
		var now = new Date();
		
		var year= now.getFullYear();
		var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
		var day = now.getDate()>9? now.getDate() : '0' + now.getDate()>9 ? ''+now.getDate()>9? now.getDate() : '0' + now.getDate() : '0'+now.getDate()>9? now.getDate() : '0' + now.getDate();
		
		if(date == 'today'){
			start_day.value = year + "-" + mon + "-" + (now.getDate()>9? now.getDate() : '0' + now.getDate());
			if((now.getDate()>9? now.getDate() : '0' + now.getDate()+1) >= 31){
				end_day.value = year + "-" + ((now.getMonth()+2)>9 ? ''+(now.getMonth()+2) : '0'+(now.getMonth()+2)) + "-" + '01';		
			}else{
				end_day.value = year + "-" + mon + "-" + (now.getDate()>9? now.getDate() : '0' + (now.getDate()+1));
			}
			return false;
		
		}else if(date == 'week'){
			var i = now.getDay();
			if(i > 0 && i < 7){
				aa = 1 - i;
				if(now.getDate() + aa == 0){
					start_day.value =  year + "-" + ((now.getMonth())>9 ? ''+(now.getMonth()) : '0'+(now.getMonth())) + "-" + '31';
				}else{
					start_day.value =  year + "-" + mon + "-" + (now.getDate()>9? now.getDate() : '0' + (now.getDate() + aa));
				}
			}
			
			if((now.getDate()>9? now.getDate() : '0' + now.getDate()+1) >= 31){
				end_day.value = year + "-" + ((now.getMonth()+2)>9 ? ''+(now.getMonth()+2) : '0'+(now.getMonth()+2)) + "-" + '01';		
			}else{
				end_day.value = year + "-" + mon + "-" + (now.getDate()>9? now.getDate() : '0' + (now.getDate()+1));
			}
		
			if(start_day.value == end_day.value){
				end_day.value = year + "-" + mon + "-" + (now.getDate()>9? now.getDate() : '0' + now.getDate()+2);
			}
			return false;
		
		}else if(date == 'month'){
			if(now.getMonth()+1 >= 10 && now.getMonth()+2 >= 8 && now.getMonth()+2 <= 10){
				start_day.value = year + "-" + (now.getMonth()+1) + "-01";
				end_day.value = year + "-" + (now.getMonth()+2) + "-01";
			}else{
				start_day.value = year + "-0" + (now.getMonth()+1) + "-01";
				end_day.value = year + "-0" + (now.getMonth()+2) + "-01";
			}
			return false;
		
		}else if(date == 'year'){
			start_day.value = year + "-01-01";
			end_day.value = (now.getFullYear() + 1) + "-01-01";
			return false;
		
		}else if(date == '1_quarter'){
				start_day.value = year + "-01-01";
				end_day.value = year + "-04-01";
				return false;
		
		}else if(date == '2_quarter'){
				start_day.value = year + "-04-01";
				end_day.value = year + "-07-01";
				return false;
		
		}else if(date == '3_quarter'){
				start_day.value = year + "-07-01";
				end_day.value = year + "-10-01";
				return false;
		
		}else if(date == '4_quarter'){
				start_day.value = year + "-10-01";
				end_day.value = (now.getFullYear()+1) + "-01-01";
				return false;
		
		}else if(date == 'first_half'){
			start_day.value = year + "-01-01";
			end_day.value = year + "-07-01";
			return false;
		
		}else if(date == 'second_half'){
			start_day.value = year + "-07-01";
			end_day.value = (now.getFullYear()+1) + "-01-01";
			return false;
		}
	});
});

function go(goes){

	var values = document.getElementsByName("checked");
	var search_value = new Array();
	
	for(var i = 0; i < values.length; i++){
		if(values[i].checked){
			search_value.push(values[i].value);
		}
	}
	
	$("#product_search_result").html("");
	for(var i = 0; i < search_value.length; i++){
			$("#product_search_result").append("<span class='glyphicon glyphicon-gift' aria-hidden='true'></span>" + search_value[i]+"<input type = 'hidden' name = 'checke_product' value = '" + search_value[i] + "'>");
	}
	$('input[name=checked]').prop('checked', false);
}

$('.distribution_list_heading').bind("click",function(){  
	$('.distribution_list_content').slideToggle();
});
</script>	
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="row">
<div class="col-xs-12">
	<div class="panel panel-primary">
		<div class="panel-heading distribution_list_heading">
			<h3 class="panel-title"> 재고수불부 검색</h3>
		</div>
		<div class="panel-body distribution_list_content">
			<div class="table-responsive">
				<table class="table table-condensed">
					
					<tr>
						<th>기준일자</th>
						<th>
						<div class="form-inline">
							<input class="form-control input-sm" type = "date" name = "" id = "start_date">
							~
							<input class="form-control input-sm" type = "date" name = "" id = "end_date">
							<select class="form-control input-sm" id = "search_stockpile_date">
								<option value = "0">조회 기간 선택</option>
								<option value = "today">금일</option>
								<option value = "week">금주</option>
								<option value = "month">금월</option>
								<option value = "year">금년</option>
								<option value = "1_quarter">1분기</option>
								<option value = "2_quarter">2분기</option>
								<option value = "3_quarter">3분기</option>
								<option value = "4_quarter">4분기</option>
								<option value = "first_half">전반기</option>
								<option value = "second_half">후반기</option>
							</select>
						</div>
						</th>
					</tr>
					
					
					<tr>
						<th>상품
							<a class = "btn btn-default" data-target = "#product_modal" data-toggle="modal"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></a> 
						</th>
						<th>
							<div id = "product_search_result"></div> 		
						</th>
					</tr>
					<tr>
						<th colspan = "2">
							<button class="btn btn-primary" id = "select_stockpile">확인</button>
						</th>
					</tr>
				</table>
			</div>
		<div id = "search_result"></div>
		<!-- <div id = "product_result"></div> -->
		</div>
	</div>
</div>
</div>
	


<div class = "modal" id = "product_modal" tabindex = "-1">	
	<div class = "modal-dialog">
		<div class = "modal-content">
			<div class = "modal-body">
			<button type = "button" class = "close" data-dismiss = "modal">&times;</button>
				<h4>상품 검색하기</h4>
				<table class="table-responsive">
					<tr>
						<th>
						<div class="form-inline">
						<div class="radio">
								<label>
							<input type = "radio" name = "selected" id = "product_id" value = "product_id" checked>상품코드</label>&nbsp;&nbsp;
							<label><input type = "radio" name = "selected" id = "product_name" value = "product_name">상품이름</label>
						</div>
							<input class="form-control" type = "text" id = "product_search" placeholder = "검색어를 입력하시오.">
							<button id = "search_button_product" class="btn btn-primary"">확인</button>
						</div>
						</th>
					</tr>
					<tr>
						<td>
							<div id = "product_search_select"></div>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</div> 
	

	
</body>
</html>