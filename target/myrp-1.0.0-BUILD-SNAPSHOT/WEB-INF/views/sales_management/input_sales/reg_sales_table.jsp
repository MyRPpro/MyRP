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

	<div class="panel panel-primary" id="page22220">
		<div class="panel-heading">
			<h5 class="panel-title">
				<a id="page2220_div01_toggle"> <span class="glyphicon glyphicon-tags"></span> &nbsp; 
				판매 입력 세부 페이지 
				</a>
			</h5>
		</div>
		<div class="panel-body" id="page2220_div01">
			<font class="media-heading"> 
				
			</font> 
			<br><br>
			
			<!-- ----------------------------------------------------- -->
			
			<div class="table-responsive">
				<table class="table table-condensed table-striped table-hover" id="reg_sales_table">
					<tr>
						<th>판매번호</th>
						<th>계정이름</th>
						<th>등록일</th>
						<th>수량</th>
						<th>가격</th>
					</tr>
					<!-- ----------------------------------------------------- -->
					<c:forEach var="dto" items="${dtos}">
					<tr>
						<td id="sales_id">
							${dto.sales_id}
						</td> 
						<td>
							${dto.account_name}
						</td> 	
						<td>
							<fmt:formatDate value="${dto.reg_date}" pattern="MM-dd"/>
						</td> 
						<td>
							<fmt:formatNumber value="${dto.count_sales}" type="number"/>
						</td> 	
						<td>
							<fmt:formatNumber value="${dto.selling_price}" type="currency"/>
						</td> 	
					</tr>
					</c:forEach>
					<!-- ----------------------------------------------------- -->
				</table>
			</div>
			
			<!-- ----------------------------------------------------- -->
			
			<br>
			<div class="btn-group" align="center">
				<span class="input-group-btn"> 
					<button type="button" id="page2220_btn02" class="btn btn-primary"> 회계전표 입력 </button>
					<button type="button" id="page2220_btn03" class="btn btn-default"> 메인으로 이동 </button>
				</span>
			</div>	<!-- // btn-group -->
		</div>	<!-- // panel-body -->
	</div>	<!-- // panel -->
	
	<!-- ----------------------------------------------------- -->
	
	<c:if test="${cnt == 3}">
		<script type="text/javascript">
			setTimeout(function(){
				alert("정상적으로 입력되었습니다.");
			}, 200);
		</script>
	</c:if>
	
	<c:if test="${cnt != 3}">
		<script type="text/javascript">
			alert("입력작업중 오류가 발생했습니다.");
		</script>
	</c:if>
	
	<!-- ----------------------------------------------------- -->
	
	<script type="text/javascript">	
	
	$('#page2220_div01_toggle').click(function(){
		$('#page2220_div01').slideToggle();
		return false;
	});
	
	$('#page2220_btn02').click(function(){
		$('#page2210_div01').slideUp();
		$('#main_screen').load("/accounting_management/statement_management/search_statements");
		return false;
	});
	
	$('#page2220_btn03').click(function(){
		window.location="/";
		return false;
	});
	
	
	</script>
	
	
</body>
</html>