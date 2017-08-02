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

	<c:if test="${cnt == 0}">
		<script type="text/javascript">
			alert("수금가능 내역이 없습니다.");
		</script>
	</c:if>
	
	<c:if test="${cnt > 0}">
	<center>
			<script type="text/javascript">
			setTimeout(function(){
				var cnt = '${cnt}';
				alert(cnt+"건의 상태를 수정하였습니다.");
			}, 200);
		</script>
	
		<div class="input-group col-xs-8">
			<input type="text" id="text_req_receive" name="req_receive" class="form-control" value="" placeholder="남은 기간" disabled="true" >
			<span class="input-group-btn">
				<button id="btn_req_receive" class="btn btn-info" type="button" disabled="true"> 채권회수 하기 </button>
			</span>
		</div>
	</center>
	<br>
	<input type="hidden" name="sales_id" id="sales_id" value="${sales_id}">
	<input type="hidden" id="pay_date" name="pay_date" value="${pay_date}">
	<input type="hidden" id="pay_diff" name="pay_diff" value="${pay_diff}">
	
	<script type="text/javascript">
	
	$("#btn_req_receive").click(function(){
		var sales_id = $('#sales_id').val();
		$('#alert_pro').load("/sales_management/search_sales/req_receive_pro"+"?sales_id="+sales_id);
		return false;
	});
	
	$('#btn_req_receive').ready(function(){
		var pay_date = $('#pay_date').val();
		var diff = $('#pay_diff').val();
		
		if( diff != 0 ){	// 수금기간이 아님
			$('#btn_req_receive').attr('disabled',true); 
			$('#text_req_receive').val( "회수기간까지 앞으로"+diff+"일 남았습니다."); 
		
		} else if ( diff == 0 ){	// 수금기간이 옴
			$('#btn_req_receive').attr('disabled',false); 
			$('#text_req_receive').val("회수기간입니다. 회수 버튼을 눌러주세요."); 
		} else {
			$('#btn_req_receive').attr('disabled',false); 
			$('#text_req_receive').val("회수기간이 지났습니다. 빨리 회수해주세요."); 
		}
		return false;
	});
	</script>
	</c:if>
	
</body>
</html>