<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../../setting.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
$(function(){
	 $('.menege').unbind("click").bind("click",function(){
		var togo = $('#modify');
		var id = $(this).val();

		var warehouse = document.getElementsByName("ware_id");
		var nomal = 0;
		var bad = 0;
		var wait = 0;
		
		for(var i = 0; i < warehouse.length; i++){
			if(warehouse[i].value.substring(0,1) == 1){
				nomal = nomal > warehouse[i].value ? nomal * 1 + 1 : warehouse[i].value * 1 + 1;
			}else if(warehouse[i].value.substring(0,1) == 2){
				bad = bad > warehouse[i].value ? bad * 1 + 1: warehouse[i].value * 1 + 1;
			}else if(warehouse[i].value.substring(0,1) == 3){
				wait = wait > warehouse[i].value ? wait * 1  + 1: warehouse[i].value * 1 + 1;
			}
		}
		
		var data = {
					"id" 	: id,
					"nomal"	: nomal,
					"bad"	: bad,
					"wait"	: wait
					};
		
		$.ajax({ 					
			data: 	data,
			type: 	'post',	 			
			url: 	"/distribution_management/reg_warehouse/warehouse_view",
			success: function(response) { 	
				togo.html(response);	
			}
		});  
	});
});
</script>
<body>
warehouse_list.jsp
<a href="/">홈으로</a>
	
	<table border = "1">
		<tr>
			<th>창고ID</th>
			<th>창고명</th>
			<th>창고주소</th>
			<th>수정</th>
		</tr>
		<c:forEach var = "vo" items = "${reg_warehouse_listVos}" >	
		<input type = "hidden" value = "${vo.warehouse_id}" name = "ware_id">
			<tr>
				<th>${vo.warehouse_id}</th>
				<th>${vo.warehouse_name}</th>
				<th>${vo.warehouse_location}</th>
				<th><button class = "menege" value = "${vo.warehouse_id}">수정</button></th>
			</tr>
		</c:forEach>
		<tr>
			<th colspan = "4">
				<button class = "menege" value = "new">신규등록</button>
			</th>
		</tr>
	</table>
	
	<br><br><br>
	<div id = "modify"></div>
</body>
</html>