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

	console.log("${id}");
	
	//document.getElementById("warehouse_id").value = ${warehouse_id};
	
	if("${doit}" != null && "${doit}" == '1'){
		var data = {
				"warehouse_id" 	: "${warehouse_id}",
				"id" :  "${id}"
				};
	
		$.ajax({ 					
			data: 	data,
			type: 	'post',	 			
			url: 	"movement_product",
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
				url: 	"movement_product",
				success: function(response) { 	
					$('#product').html(response);	
				}
			});  
			
		});
	}

</script>
<body>
<c:if test = "${id == 'new'}">
<form name = "" action = "movement_pro">
<input type = "hidden" id = "id" value = "${id}">
<h3>신규등록</h3>
	<select id = "warehouse_id"  class = "warehouse_id">
		<option value = "0">창고를 선택하시오.</option>
		<c:forEach var = "ware" items = "${warehouseVos}">
			<option value = "${ware.warehouse_id}">${ware.warehouse_name}</option>
		</c:forEach>
	</select>
	<br><br>
	<div id = "product"></div>
</form>
</c:if>


<c:if test = "${id != 'new'}">
<form name = "" action = "movement_pro">
<input type = "hidden" id = "id" value = "${id}">
<h3>수정</h3>
	<br><br>
	<div id = "product"></div>
</form>


</c:if>

</body>
</html>