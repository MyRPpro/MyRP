$(function(){
	$('#search_button_warehouse').unbind("click").bind("click",function(){
		var togo = null;

		var condition = null;
		var search = null;
		var where = null;
		
		var warehouse_id = document.getElementById("warehouse_id");
		var warehouse_name = document.getElementById("warehouse_name");
		var warehounse_search = document.getElementById("search_warehouse") == null ? null : warehounse_search = document.getElementById("search_warehouse");
		
		if($(warehouse_id).prop("checked") || $(warehouse_name).prop("checked")){
			condition = $(warehouse_id).prop("checked") ? warehouse_id.value : warehouse_name.value;
			search = warehounse_search.value;
			where = 'warehouse_information';
			togo = $('#warehouse_result');
		}
		
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
	
	$('#search_button_product').unbind("click").bind("click",function(){
		var togo = null;

		var condition = null;
		var search = null;
		var where = null;
		
		var product_id = document.getElementById("product_id");
		var product_name = document.getElementById("product_name");
		var product_search = document.getElementById("product_search") == null ? null : warehounse_search = document.getElementById("product_search");
		
		if($(product_id).prop("checked") || $(product_name).prop("checked")){
			condition = $(product_id).prop("checked") ? product_id.value : product_name.value;
			search = product_search.value;
			where = 'product';
			togo = $('#product_result');
		}
		
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
	
	$('#select_stockpile').unbind("click").bind("click",function(){
		togo = $('#search_result');
		var warehouse = document.getElementsByName("checke_warehouse");
		var product = document.getElementsByName("checke_product");
		var select_stockplie = document.getElementById("select_stockplie").value;
		var start_day = document.getElementById("start_date").value;
		var end_day = document.getElementById("end_date").value;
		var now = new Date();
		
		var year= now.getFullYear();
	    var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
		
		var today = year + "-" + mon + "-" + (now.getDate());
		
		if(select_stockplie == null || select_stockplie == 0){
			alert("분류를 선택하시오.");
			return false;
		}
		
		if(start_day == "" || end_day == ""){
			alert("날짜를 선택하시오.");
			return false;
		}
		
		
		
		if(warehouse[0] != null){
			var house = warehouse[0].value;
			for(var i = 1; i < warehouse.length; i++){
				house += "-" +  warehouse[i].value;
			}
		}
		
		if(product[0] != null){
			var pro = product[0].value;
			for(var i = 1; i < product.length; i++){
				pro += "-" + product[i].value;
			}
		}
		
		var data = {
					"warehouse" : house,
					"product" : pro,
					"select_stockplie" : select_stockplie,
					"start_day" : start_day,
					"end_day" : end_day,
					"today" : today
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

});

function go(goto){
	
	var values = document.getElementsByName("checked");
	var search_value = new Array();
	
	for(var i = 0; i < values.length; i++){
		if(values[i].checked){
			search_value.push(values[i].value);
		}
	}
	if(goto == 'warehouse'){
		$("#warehouse_search_result").html("");
		for(var i = 0; i < search_value.length; i++){
			$("#warehouse_search_result").append("<input type = 'checkbox' name = 'checke_warehouse' value = '" + search_value[i] + "'>" + search_value[i]);
		}
	}
	
	if(goto == 'product'){
		$("#product_search_result").html("");
		for(var i = 0; i < search_value.length; i++){
			$("#product_search_result").append("<input type = 'checkbox' name = 'checke_product' value = '" + search_value[i] + "'>" + search_value[i]);
		}
	}
	$('input[name=checked]').prop('checked', false);
}


function search_stockpile(date){
	togo = $('#search_result');
	var start_day = document.getElementById("start_date");
	var end_day = document.getElementById("end_date");
	var now = new Date();
	
	var year= now.getFullYear();
    var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
    var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();
	
	if(date == 'today'){
		start_day.value = year + "-" + mon + "-" + (now.getDate());
		end_day.value = year + "-" + mon + "-" + (now.getDate()+1);
		return false;
	
	}else if(date == 'week'){
		var i = now.getDay();
		if(i > 0 && i < 7){
			aa = 1 - i;
			start_day.value =  year + "-" + mon + "-" + (now.getDate() + aa);
		}
		end_day.value = year + "-" + mon + "-" + (now.getDate()+1);

		if(start_day.value == end_day.value){
			end_day.value = year + "-" + mon + "-" + (now.getDate()+2);
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
}