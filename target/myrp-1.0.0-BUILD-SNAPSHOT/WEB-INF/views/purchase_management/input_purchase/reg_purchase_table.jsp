
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
	
	<c:if test="${cnt == 3}">
		<script type="text/javascript">
			setTimeout(function(){
				alert("정상적으로 입력되었습니다.");
				/* window.location="/purchase_management/input_purchase/reg_purchase" */
			}, 500);
		</script>
	</c:if>
	
	<c:if test="${cnt != 3}">
		<script type="text/javascript">
			alert("입력작업중 오류가 발생했습니다.");
			window.history.back();
		</script>
	</c:if>
	
	
	<form action="#" name="reg_purchase_table_form" method="get">
	
	<div class="panel panel-primary">
	<div class="panel-heading">
		<h4 class="panel-title">
		<a id="page3210_div01_toggle"><span class="glyphicon glyphicon-shopping-cart"></span>&nbsp;  
		구매 입력 세부내용 페이지
		</a>
		</h4>
	</div>	<!-- // panel-heading -->
	
	<div class="panel-body" id="page3210_div01">
		<div class="table-responsive">
		<div class="form-group" >
		
		
		<table class="table table-condensed table-striped">
			<tr>
				<th>구매번호</th>	<!-- 1 -->
				<th>계정이름</th>	<!-- 2 -->
				<th>등록일</th>	<!-- 3 -->
				<th>수량</th>		<!-- 4 -->
				<th>가격</th>		<!-- 5 -->
			</tr>
			
			<c:forEach var="dto" items="${dtos}">
			<tr>
									
				<td id="purchase_id">	
				${dto.purchase_id} 
				</td> 	
				
				<td>
				${dto.state_name}
				</td> 
				
				<td>
				${dto.reg_date}
				</td> 	
				
				<td>
				<fmt:formatNumber value="${dto.count_purchase}" type="number" />
				</td>
				
				<td>
				<fmt:formatNumber value="${dto.supply_price}" type="currency" />
				</td>
				
			</tr>
			</c:forEach>
		</table>
		</div>	<!-- // form-group -->
		
		<div class="btn-group" align="center">
			<span class="input-group-btn">
				<input type="button" name="reg_state" value="전표 입력하기" class="btn btn-primary" onclick="sendStatement();">
			</span>
		</div>	<!-- // btn-group -->
		
		
		</div> <!-- // table-responsive -->
	</div>	<!-- // panel-body -->
		
		
		
	</div>	<!-- // panel-body -->
	</div>	<!-- // panel panel-primary -->
	</form>
	
	<script type="text/javascript">
	
	$('#page3210_div01_toggle').click(function(){
		$('#page3210_div01').slideToggle();
		return false;
	});
	
	function sendStatement(){
		var purchase_id = document.getElementById("purchase_id").innerHTML
		$('#main_screen').load("/accounting_management/statement_management/search_statements");
		return false;

	}
	</script>

</body>
</html>