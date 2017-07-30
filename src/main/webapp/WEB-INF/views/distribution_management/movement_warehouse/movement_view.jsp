<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file = "../../setting.jsp" %>
</head>
<script type="text/javascript">
if("${doit}" != null && "${doit}" == '1'){
	var data = {
			"warehouse_id" 	: "${warehouse_id}",
			"id" :  "${id}"
			};

		$.ajax({ 					
			data: 	data,
			type: 	'post',	 			
			url: 	"/distribution_management/movement_warehouse/movement_product",
			success: function(response) { 	
				$('#product').html(response);	
			}
		});  
 	
	}else{
		$('.warehouse_id').change(function(){
			var id = document.getElementById("id").value;
			var warehouse_id = $(this).val();
			var warehouse_name = document.getElementById("warehouse_id").options[document.getElementById("warehouse_id").selectedIndex].text;
			var data = {
						"warehouse_id" 	: warehouse_id,
						"warehouse_name" : warehouse_name,
						"id" : id
						};
			
			$.ajax({ 					
				data: 	data,
				type: 	'post',	 			
				url: 	"/distribution_management/movement_warehouse/movement_product",
				success: function(response) { 	
					$('#product').html(response);	
				}
			});  
			
		});
	}
	
	 $('#movement_button').unbind("click").bind("click",function(){
			var togo = $('#main_screen');
			var data = $('#movement_form').serialize();
			$.ajax({ 					
				data: 	data,
				type: 	'post',	 			
				url: 	"/distribution_management/reg_warehouse/warehouse_pro",
				success: function(response) { 	
					togo.html(response);	
				}
			});  
		});

</script>
<body>
<c:if test = "${id == 'new'}">
<input type = "hidden" id = "id" value = "${id}">
	<div class="row">
		<div class="col-xs-12">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title"> 신규등록</h3>
				</div>
			<div class="panel-body">
				<div class="table-responsive">
					<select id = "warehouse_id"  class = "warehouse_id form-control input-sm">
						<option value = "0">창고를 선택하시오.</option>
						<c:forEach var = "ware" items = "${warehouseVos}">
							<option value = "${ware.warehouse_id}">${ware.warehouse_name}</option>
						</c:forEach>
					</select>
					<br>
				<div id = "product"></div>
				</div>
			</div>
		</div>
	</div>
	</div>
</c:if>


<c:if test = "${id != 'new'}">
<input type = "hidden" id = "id" value = "${id}">
	<div class="row">
		<div class="col-xs-12">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title">수정</h3>
				</div>
				<div class="panel-body">
					<div class="table-responsive">
					<div id = "product"></div>
				</div>
			</div>
		</div>
	</div>
	</div>
</c:if>

</body>
</html>