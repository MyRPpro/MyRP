<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="../../setting.jsp" %>
 
 <style>
    table {
        table-layout: fixed;
        
    }
    th{
    	background: LightGrey;
    }
    th tr td {
    	text-align: center;
        text-overflow: ellipsis;
        overflow: hidden;
    }
    table tr:hover {  
        background: #f3f3f3;
    }
</style>
<body>

	<c:if test="${cnt==0}">
		<script type="text/javascript">
			setTimeout(function(){
				alert("검색결과가 없습니다. 전체내역을 표시합니다.");
				search_list(1,0);
			}, 200);
		</script>
	</c:if>
	
	<table border="1" style="text-align: center;">
		
		<tr>
			<th>판매번호</th>
			<th>계정</th>
			<!-- <th>order_id</th> -->
			<th>상품</th>
			<th>거래처</th>
			<th>담당자</th>
			<th>등록일</th>
			<th>최근수정일</th>
			<th>출고일</th>
			<th>수량</th>
			<th>가격</th>
			<th>총합</th>
			<th>어음기간</th>
			<th>판매상태</th>
		</tr>
		
		<c:forEach var="dto" items="${dtos}">
		
		<tr>
		
			<!-- 판매번호를 눌렀을 때 이동 -->
			<td>
				<a href="javascript:detail_page('${dto.sales_id},${dto.sales_state},${dto.account_id}')">
					${dto.sales_id}
				</a>
			</td>
			
			<td>${dto.account_name}</td>
			<%-- <td>${dto.order_id}</td> --%>
			<td>${dto.product_name}</td>
			<td>${dto.company_name}</td>
			
			<%-- 수정 전 버젼 : 회사이름으로 이동하면 곂친다.
			<td>
				<a href="javascript:detail_page('${dto.company_id},${dto.sales_id},${dto.account_id},${dto.sales_state}')">
					${dto.company_name}
				</a>
			</td>
			 --%>
			<td>${dto.employee_name}</td>
			<td>${dto.reg_date}</td>
			<td>${dto.update_date}</td>
			<td>${dto.storage_out_date}</td>
			<td> <fmt:formatNumber value="${dto.count_sales}" type="number"/> </td>
			<td> <fmt:formatNumber value="${dto.selling_price}" type="currency"/> </td>
			<td> <fmt:formatNumber value="${dto.selling_price*dto.count_sales}" type="currency"/> </td>
			<td>${dto.state_name} </td>
			<td>${dto.condition_note_receivable}</td>
			
		</tr>
		</c:forEach>
		
	</table>
	

	<script type="text/javascript">	
	
	function detail_page(param){
		
		console.log(" param :" + param )
		
		param = param.split(',');
		console.log(" sales_id :" + param[0] );
		console.log(" sales_state :" + param[1] ); 
		console.log(" order_id :" + param[2] ); 
		
		var state = param[1];
		
		if( state == "22213" ){
			$('#list_dateil').load('/sales_management/search_sales/modify_sales?sales_id='+param[0]
			+'&sales_state='+param[1]);
			return false;
			
		} else {
			$('#list_dateil').load('/sales_management/search_sales/detail_sales?sales_id='+param[0]
			+'&sales_state='+param[1]
			+'&account_id='+param[2]);
			return false;
			
		}
		
	}
	
	</script>
	<hr>
	<div id="list_dateil"></div>
	
	
	
</body>
</html>