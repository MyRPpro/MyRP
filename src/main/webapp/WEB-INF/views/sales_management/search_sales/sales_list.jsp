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
	
	<div class="row">
		<div class="col-xs-12">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title" id="sales_list_panel_title">
						<span class="glyphicon glyphicon-euro"></span> &emsp;
						판매 리스트 페이지 Sales_List
					</h3>
				</div>	<!-- // panel-heading -->
				<div class="panel-body" id="sales_list_panel_body" >
					<div class="input-group" id="sales_list_input-group" style="width: 100%;">
						<font class="media-heading" style="margin:0 auto;"> 입력된 판매 내역을 검색 할 수 있는 페이지 입니다.</font><br><br>
							<form class="form-inline-block" id="sales_list_form" action="#" name="purchase_list_form" method="get" onsubmit="return search_list(1,1);">
								<div class="input-group" >
									<div class="btn-group btn-group-justified" role="group" aria-label="...">
										<div class="btn-group" role="group" style="width: 70%;">
											<input type="text" class="form-control" name="input_search" id="search_str" placeholder="판매번호를 입력하세요">
										</div>
										<div class="btn-group" role="group" style="width: 15%;">
											<button class="btn btn-primary" id="list_btn_search" type="submit"> 검색 </button>
										</div>
										<div class="btn-group" role="group" style="width: 15%;">
											<select id="months" class="form-control form-control btn-primary" style="height: 33px;" >                                              
												<option value="01" > 옵션 </option>
												<option value="01" > 전표신청 </option>
												<option value="02" > 전표승인 </option>
												<option value="03" > 입고신청 </option>
												<option value="04" > 입고완료 </option>
												<option value="05" > 지급대기 </option>
												<option value="06" > 지급완료 </option>
												<option> ------- </option>
												<option value="07" > 부가세예수금 </option>
												<option value="08" > 상품매출 </option>
												<option value="09" > 매출채권 </option>
											</select>
										</div>
									</div>
									<div class="btn-group btn-group-justified" role="group" aria-label="...">
										<div class="btn-group" role="group">
											<button type="button" class="btn btn-primary" onclick="return search_list(1,0)">전체검색</button>
										</div>
										<div class="btn-group" role="group">
											<button type="button" class="btn btn-primary" id="list_btn_reg">판매등록</button>
										</div>
										<div class="btn-group" role="group">
											<button type="button" class="btn btn-default" onclick="return search_list(1,2)">전표신청</button>
										</div>
										<div class="btn-group" role="group">
											<button type="button" class="btn btn-default" onclick="return search_list(1,3)">전표승인</button>
										</div>
										<div class="btn-group" role="group">
											<button type="button" class="btn btn-default" onclick="return search_list(1,5)">출고조회</button>
										</div>
										<div class="btn-group" role="group">
											<button type="button" class="btn btn-default" onclick="return search_list(1,7)">수금완료</button>
										</div>
									</div>
								</div>	<!-- // btn-group-justified -->
							</form>	
							<div id="list_page"></div>
						</div>	<!-- // input-group -->
					<div id="list_table"></div>
				</div>	<!-- // panel-body  -->  	
			</div> <!-- // panel panel-primary -->
		</div> <!-- // col-xs-12 -->	 
	</div>	<!-- // row -->
		
	<script type="text/javascript"> 	
	
	
	
	$(document).ready(function(){
		$('#sales_list_panel_title').click(function(){
			$('#sales_list_panel_body').slideToggle();
			return false;
		});
		
		$('#list_btn_reg').click(function(){	// 판매 등록
			$('#list_page').slideUp(500);
			$('#list_table').slideDown(500);
			$('#list_table').load("/sales_management/input_sales/reg_sales");
			return false;
		});
	});
	
	function search_list(pageNum,check){
		
		var check = check;
		var pageNum = pageNum;
		var search_str = null;
		
		 if ( check == 1 ){		
				/* search_str = document.sales_list.input_search.value;	// 0.판매번호 검색 */
				search_str = $('#search_str').val();
				if ( !search_str )	search_str = "all";	
				} 	
		else if (check == 0 )		search_str = "all";			// 1.전체 검색
		else if (check == 2 )		search_str = "account";		// 2.전표승인신청
		else if (check == 3 )		search_str = "account_c";	// 3.전표승인조회
		else if (check == 5 )		search_str = "out_c";		// 5.출고완료조회
		else if (check == 7 )		search_str = "receive_c";	// 7.지급완료조회

		$('#list_page').slideDown(500);
		$('#list_table').slideDown(500);
		$('#list_page').load('/sales_management/search_sales/sales_list_page?search_str='+search_str+'&pageNum='+pageNum);
		$('#list_table').load('/sales_management/search_sales/sales_list_table?search_str='+search_str+'&pageNum='+pageNum);
		return false;
	}

	</script>

</body>
</html>