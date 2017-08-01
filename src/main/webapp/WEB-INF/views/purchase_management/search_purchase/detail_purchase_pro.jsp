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
	
	
	<c:if test="${update_cnt > 0}">
		<script type="text/javascript">
			setTimeout(function(){
				var cnt = '${update_cnt}';
				alert( cnt+"건의 상태코드가 정상적으로 변경되었습니다.");
			}, 200);
		</script>
	</c:if>
	
	<c:if test="${update_cnt == 0}">
		<script type="text/javascript">
			alert("상태코드 변경 오류가 발생했습니다.");
		</script>
	</c:if>
	
	<c:if test="${insert_cnt > 0}">
		<script type="text/javascript">
			setTimeout(function(){
				var cnt = '${insert_cnt}';
				alert(cnt+"건의 전표를 정상적으로 생성하였습니다. ");
			}, 200);
		</script>
		
		<form action="#" name="reg_purchase_table_form" method="get">
			<div class="panel panel-primary">
				<div class="panel-body">
					<div class="table-responsive">
						<div class="form-group">
	
	
							<table class="table table-condensed table-striped">
								<tr>
									<th>구매번호</th>
									<!-- 1 -->
									<th>계정이름</th>
									<!-- 2 -->
									<th>등록일</th>
									<!-- 3 -->
									<th>수량</th>
									<!-- 4 -->
									<th>가격</th>
									<!-- 5 -->
								</tr>
	
								<c:forEach var="dto" items="${dtos}">
									<tr>
	
										<td id="purchase_id">${dto.purchase_id}</td>
	
										<td>${dto.state_name}</td>
	
										<td>${dto.reg_date}</td>
	
										<td><fmt:formatNumber value="${dto.count_purchase}"
												type="number" /></td>
	
										<td><fmt:formatNumber value="${dto.supply_price}"
												type="currency" /></td>
	
									</tr>
								</c:forEach>
							</table>
						</div>
						<!-- // form-group -->
	
						<input type="button" name="reg_state" value="전표입력하기" class="btn btn-primary"
							onclick="sendStatement();">
					</div>
					<!-- // table-responsive -->
				</div>
				<!-- // panel-body -->
	
			</div>
			<!-- // panel-body -->
			</div>
			<!-- // panel panel-primary -->
		</form>
		
	</c:if>
	
	<c:if test="${insert_cnt == 0}">
		<script type="text/javascript">
			alert("전표생성 도중 오류가 발생하였습니다.");
		</script>
	</c:if>


	<input type="hidden" id="pay_date" name="pay_date" value="${pay_date}">
	<input type="hidden" id="pay_diff" name="pay_diff" value="${pay_diff}">
	
	<script type="text/javascript">
	$('#btn_req_repay').ready(function(){
		var pay_date = $('#pay_date').val();
		var diff = $('#pay_diff').val();
		
		if( diff != 0 ){	// 수금기간이 아님
			$('#btn_req_repay').attr('disabled',true); 
			$('#text_req_repay').val( "수금기간까지 앞으로"+diff+"일 남았습니다."); 
		
		} else if ( diff == 0 ){	// 수금기간이 옴
			$('#btn_req_repay').attr('disabled',false); 
			$('#text_req_repay').val("수금기간입니다. 수금하기 버튼을 눌러주세요."); 
		} else {
			$('#btn_req_repay').attr('disabled',false); 
			$('#text_req_repay').val("수금기간이 지났습니다. 빨리 수금해주세요."); 
		}
	});
		
	</script>

</body>
</html>