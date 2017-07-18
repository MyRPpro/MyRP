<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../../setting.jsp" %>
<%@ include file = "../../distribution_management_setting.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
search_stockpile.jsp
<a href="/distribution_management/stockpile/search_adjust_information">조정 정보 조회</a>
	<a href="/distribution_management/stockpile/search_selling_information">판매 정보 조회</a>
	<a href="/distribution_management/stockpile/search_self_information">자가 정보 조회</a>
	<a href="/distribution_management/stockpile/search_defective_information">불량 정보 조회</a>
	<a href="/distribution_management/stockpile/search_and_modification_movement_information">이동 정보 조회 및 수정</a>
	
	<!-- 구현 -->
	
<h3>재고수불부 검색</h3>
<table border = "1" >
	<tr>
		<th colspan = "2">
			<select id = "select_stockplie">
				<option value = "0">분류를 선택하시오.</option>
				<option value = "purchase_order">구매</option>
				<option value = "sales_order">판매</option>
				<option value = "adjustment_inventory">재고조정</option>
				<option value = "defective_warehouse">불량</option>
			</select>
		</th>
	</tr>
	<tr>
		<th>기준일자</th>
		<th>
			<input type = "date" name = "" id = "start_date">
			~
			<input type = "date" name = "" id = "end_date">
		</th>
	</tr>

	<tr>
		<th>창고<a class = "btn btn-default" data-target = "#warehouse_modal" data-toggle="modal"> <span class="glyphicon glyphicon-search" aria-hidden="true"></span></a></th>
		<th>
			<div id = "warehouse_search_result"></div> 	
		</th>
	</tr>
	<tr>
		<th>상품
			<!-- <a class = "btn btn-default" data-target = "#product_modal" data-toggle="modal"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></a> -->
		</th>
		<th>
			<div id = "product_search_result"></div> 		
		</th>
	</tr>
	<tr>
		<th colspan = "2">
			<!-- <input type = "checkbox" name = "date" value = "today">금일&nbsp;
			<input type = "checkbox" value = "week">금주&nbsp;
			<input type = "checkbox" value = "month">금월&nbsp;
			<input type = "checkbox" value = "year">금년<br>
			<input type = "checkbox" value = "1_quarter">1분기&nbsp;
			<input type = "checkbox" value = "2_quarter">2분기&nbsp;
			<input type = "checkbox" value = "3_quarter">3분기&nbsp;
			<input type = "checkbox" value = "4_quarter">4분기<br>
			<input type = "checkbox" value = "first_half">전반기&nbsp;
			<input type = "checkbox" value = "second_half">후반기 -->
			<button onclick = "search_stockpile('today')">금일</button>
			<button onclick = "search_stockpile('week')">금주</button>
			<button onclick = "search_stockpile('month')">금월</button>
			<button onclick = "search_stockpile('year')">금년</button><br>
			<button onclick = "search_stockpile('1_quarter')">1분기</button>
			<button onclick = "search_stockpile('2_quarter')">2분기</button>
			<button onclick = "search_stockpile('3_quarter')">3분기</button>
			<button onclick = "search_stockpile('4_quarter')">4분기</button><br>
			<button onclick = "search_stockpile('first_half')">전반기</button>
			<button onclick = "search_stockpile('second_half')">후반기</button>
		</th>
	</tr>
		<tr>
		<th colspan = "2">
			<button id = "select_stockpile">확인</button>
		</th>
	</tr>
</table>
	


	
<h4>상품 검색하기</h4>
<table>
	<tr>
		<th>
			<input type = "radio" name = "selected" id = "product_id" value = "product_id" checked>상품코드&nbsp;
			<input type = "radio" name = "selected" id = "product_name" value = "product_name">상품이름&nbsp;
			<input type = "text" id = "product_search">&nbsp;
			<button id = "search_button_product" class = "button">확인</button>
		</th>
	</tr>
	<tr>
		<td>
			<div id = "product_result"></div>
		</td>
	</tr>
</table>
	
<div id = "search_result"></div>
	
	<!-- modal -->
	<div class = "modal" id = "warehouse_modal" tabindex = "-1">	<!-- 위에서 #modal로 해서 id modal 지정 -->
			<div class = "modal-dialog">
				<div class = "modal-content">
					<div class = "modal-body">
					<button type = "button" class = "close" data-dismiss = "modal">&times;</button>
						<h4>창고 검색하기</h4>
						<table>
							<tr>
								<th>
									<input type = "radio" name = "select" id = "warehouse_id" value = "warehouse_id" checked>창고코드&nbsp;
									<input type = "radio" name = "select" id = "warehouse_name" value = "warehouse_name">창고이름&nbsp;
									<input type = "text" id = "search_warehouse">&nbsp;
									<button id = "search_button_warehouse" class = "button">확인</button>
								</th>
							</tr>
							<tr>
								<td>
									<div id = "warehouse_result"></div>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
	</div>
	<!-- <div class = "modal" id = "product_modal" tabindex = "-1">	위에서 #modal로 해서 id modal 지정
			<div class = "modal-dialog">
				<div class = "modal-content">
					<div class = "modal-body">
					<button type = "button" class = "close" data-dismiss = "modal">&times;</button>
						<h4>상품 검색하기</h4>
						<table>
							<tr>
								<th>
									<input type = "radio" name = "selected" id = "product_id" value = "product_id" checked>상품코드&nbsp;
									<input type = "radio" name = "selected" id = "product_name" value = "product_name">상품이름&nbsp;
									<input type = "text" id = "product_search">&nbsp;
									<button id = "search_button_product" class = "button">확인</button>
								</th>
							</tr>
							<tr>
								<td>
									<div id = "product_result"></div>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
	</div> -->
</body>
</html>