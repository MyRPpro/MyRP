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
				 /* $('#reg_table').load('/purchase_management/input_purchase/reg_purchase_table'); */
			}, 200);
		</script>
	</c:if>
	
	<c:if test="${cnt != 3}">
		<script type="text/javascript">
			alert("입력작업중 오류가 발생했습니다.");
			/* window.history.back(); */
		</script>
	</c:if>
	
	<div class="row" id="row">
		<div class="col-xs-12">
			<div class="panel panel-primary">
				<div class="panel-heading" id="reg_sales_table_heading">
					<h3 class="panel-title">
						<span class="glyphicon glyphicon-euro"></span> &emsp; 
						판매 입력 세부 페이지 Reg_Sales_Table
					</h3>
				</div>	<!--  // panel-heading -->
				<div class="panel-body" id="reg_sales_table_centent">
					<div class="table-responsive">
						<form action="#" method="get" onsubmit="return reg_sales();">
							<div class="form-group">
								<table class="table table-condensed table-striped" id="reg_sales_table">
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
								<br>
								<center>
									<input type="button" name="reg_sales_statement" class="btn btn-primary" value="회계 전표 입력">
								</center>
								<br>
							</div>	<!-- // form-group -->
						</form>
					</div> <!-- // table-responsive -->
				</div>	<!-- // panel-body -->
				<div id="alert_pro"></div>
			</div>	<!-- // panel panel-primary -->
		</div>	<!-- // col-xs-12 -->
	</div>	<!-- // row -->
	
	<script type="text/javascript">	
	$(document).ready(function(){
		$("input[name=reg_sales_statement]").click(function(){
			$('#reg_sales_content').slideUp(500);
			$('#reg_sales_table_centent').slideUp(500);
			$('#main_screen').load("/accounting_management/statement_management/make_statement");
			return false;
		});
		
		$('#reg_sales_table_heading').click(function(){
			$('#reg_sales_table_centent').slideToggle();
		});
	});
	</script>
	
	
</body>
</html>