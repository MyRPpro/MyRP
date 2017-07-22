<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file = "../../setting.jsp" %>
<script type="text/javascript">
$(function(){
	$('#storage_out').click(function(){
		var togo = $('#request');
		var stock_order_type = document.getElementById("order_id").value;
		var data = {
					"goes" : "out",
					"stock_order_type" : stock_order_type
					}
		$.ajax({ 					
			data: 	data,
			type: 	'post',	 			
			url: 	"/distribution_management/search_distribution_order/request_in_out_storage",
			success: function(response) { 
				togo.html(response);	
			}
		});
	});	
	
	$('#storage_in').click(function(){
		var togo = $('#request');
		var stock_order_type = document.getElementById("order_id").value;
		var data = {
					"goes" : "in",
					"stock_order_type" : stock_order_type
					}
		$.ajax({ 					
			data: 	data,
			type: 	'post',	 			
			url: 	"/distribution_management/search_distribution_order/request_in_out_storage",
			success: function(response) {
				togo.html(response);	
			}
		});
	});	
});

function storage_go(id, goes,storage_out_date){
	var now = new Date();
	var year= now.getFullYear();
    var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
	var today = year + mon + "-" +  (now.getDate());

	if(storage_out_date.replace("-","") > today){
		alert("출고예정일이 안되었습니다.");
		return false;
	}
	window.location = "/distribution_management/search_distribution_order/request_in_out_storage_pro?id="+id+"&goes="+goes
}
</script>
all_statement_list.jsp
<input type = "text" id = "order_id" placeholder = "id를 입력하시오">
<button id = "storage_out">출고요청</button>
<button id = "storage_in">입고요청</button>
<button onclick = "window.location = '/'">홈으로</button>
<div id = "request"></div>	
<br>
<br>
<br>
<br>

	<table border = "1">
		<tr>
			<th>전표번호</th>
			<th>상태코드</th>
			<th>상태</th>
			<th>출고예정일</th>
			<th>승인버튼</th>
		</tr>
		<c:forEach var = "dto" items = "${order_stateDto}"> 
			<c:if test = "${dto.order_state == 24202}">
			<tr>
				<th><%-- <a href = "/distribution_management/search_distribution_order/?order_id=${dto.order_id}"> --%>${dto.order_id}<!-- </a> --></th>
				<th>${dto.order_state}</th>
				<th>출고 대기</th>
				<th>${dto.storage_out_date}</th>
				<th><button onclick = "storage_go('${dto.order_id}','storage_out_complete','${dto.storage_out_date}')">버튼</button></th>
			</tr>
			</c:if>
		</c:forEach>
	</table>
</body>
</html>