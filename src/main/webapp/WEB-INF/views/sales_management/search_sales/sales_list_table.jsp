<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<body>
	<c:if test="${cnt==0}">
		<script type="text/javascript">
			setTimeout(function(){
				alert("검색결과가 없습니다. 전체내역을 표시합니다.");
				search_list(1,0);
			}, 200);
		</script>
	</c:if>
	
	<c:if test="${cnt==-1}">
		<script type="text/javascript">
			setTimeout(function(){
				alert("등록된 내역이 없습니다. 판매등록을 해주세요.");
			}, 200);
		</script>
	</c:if>
		
	<div class="row" id="row">
		<div class="col-xs-12">
			<div class="panel panel-primary">
				<div class="panel-heading" id="sales_list_table_heading">
					<h3 class="panel-title">
						<span class="glyphicon glyphicon-euro"></span> 
						&emsp;
						<c:choose>
							<c:when test="${check==0}">
								전체 
							</c:when>
							<c:when test="${check==1}">
								판매번호
							</c:when>
							<c:when test="${check==2}">
								전표승인신청
							</c:when>
							<c:when test="${check==3}">
								전표승인조회
							</c:when>
							<c:when test="${check==4}">
								상품출고신청
							</c:when>
							<c:when test="${check==5}">
								출고완료조회
							</c:when>
							<c:when test="${check==6}">
								지급대기신청
							</c:when>
							<c:when test="${check==7}">
								지급완료조회
							</c:when>
							<c:otherwise>
								입력값 오류
							</c:otherwise>
						</c:choose>
						검색 목록 Sales_List_Table &emsp; 검색개수 : 총 ${cnt} 개
					</h3>
				</div>	<!--  // panel-heading -->
				<div class="panel-body" id="sales_list_table_content">
					<div class="table-responsive">
						<form action="#" method="get" onsubmit="return reg_sales();">
							<div class="form-group">
								<table class="table table-condensed table-striped" id="reg_sales_table">
									<tr>
										<th>순서</th>
										<th>판매번호</th>
										<th>계정이름</th>
										<th>상품</th>
										<th>거래처</th>
										<th>금액</th>
										<th>판매상태</th>
									</tr>
									<!-- ----------------------------------------------------- -->
									<c:forEach var="dto" items="${dtos}">
										<tr>
											<td> 
												${dto.rnum}
											</td>
											<td> 
												<a href="javascript:detail_page('${dto.sales_id},${dto.sales_state},${dto.account_id}')">
													${dto.sales_id}
												</a>
											</td>
											<td>
												${dto.account_name}
											</td>
											<td>
												${dto.product_name}
											</td>
											<td>
												${dto.company_name}
											</td>
											<td> 
												<fmt:formatNumber value="${dto.selling_price}" type="currency"/> 
											</td>
											<td>
												${dto.state_name} 
											</td>
										</tr>
									</c:forEach>
									<!-- ----------------------------------------------------- -->
								</table>
							</div>	<!-- // form-group -->
						</form>
					</div> <!-- // table-responsive -->
				</div>	<!-- // panel-body -->
				<div id="list_dateil"></div>
			</div>	<!-- // panel panel-primary -->
		</div>	<!-- // col-xs-12 -->
	</div>	<!-- // row -->
	
	<script type="text/javascript">	
	$(document).ready(function(){
		$('#sales_list_table_heading').click(function(){
			$('#sales_list_table_content').slideToggle();
			return false;
		});
		$('#list_dateil').slideUp(); return false;
		
	});
	function detail_page(param){
		param = param.split(',');
		var state = param[1];
		$('#list_page').slideUp();
		$('#sales_list_content').slideUp();
		$('#sales_list_table_content').slideUp();
		if( state == "22213" ){
			$('#list_dateil').slideDown();
			$('#list_dateil').load("/sales_management/search_sales/modify_sales?sales_id="+param[0]
				+ '&sales_state=' + param[1]);
			return false;
		} else {
			$('#list_dateil').slideDown();
			$('#list_dateil').load("/sales_management/search_sales/detail_sales?sales_id="+param[0]
			+'&sales_state='+param[1]
			+'&account_id='+param[2]);
			return false;
		}
	};
	</script>
	
	
</body>
</html>