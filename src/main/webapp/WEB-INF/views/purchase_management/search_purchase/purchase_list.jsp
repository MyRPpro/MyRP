<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

	<script type="text/javascript">
	function test(){
		alert("된다!!!");
	}
	</script>
</head>

<body>
	<div class="row">
		<div class="col-xs-12">
			<div class="panel panel-primary">
				<div class="panel-heading" >
					<h3 class="panel-title">
						<a id="page3110_div01_toggle"><span class="glyphicon glyphicon-shopping-cart"></span> &nbsp;
							<b>구매 리스트 페이지 </b>
						</a>
					</h3>
				</div>	<!-- // panel-heading -->
				<div class="panel-body" id="page3110_div01">
					<div class="input-group" id="content" style="display: inline;">
						<font class="media-heading" style="margin:0 auto;"> 입력된 구매 내역을 검색 할 수 있는 페이지 입니다.</font><br><br>
							<form class="form-inline-block" action="#" name="purchase_list_form" method="get"  onsubmit="return search_list(1,1);" >
								<div class="input-group">
								
									<div class="btn-group btn-group-justified" role="group" aria-label="...">
										<div class="btn-group" role="group" style="width: 70%;">
											<input type="text" class="form-control" name="input_search" id="search_str" placeholder="구매번호를 입력하세요">
										</div>
										<div class="btn-group" role="group" style="width: 15%;">
											<button class="btn btn-primary" id="list_btn_search" type="submit"> 검색 </button>
										</div>
										<div class="btn-group" role="group" style="width: 15%;">
											<select id="months" class="form-control form-control btn-default" style="height: 33px;" >                                              
												<option value="00" > 옵션 </option>
												<option value="01" > 전표신청 </option>
												<option value="02" > 전표승인 </option>
												<option value="03" > 입고신청 </option>
												<option value="04" > 입고완료 </option>
												<option value="05" > 지급대기 </option>
												<option value="06" > 지급완료 </option>
												<option> ------- </option>
												<option value="07" > 부가세대급금 </option>
												<option value="08" > 상품매입 </option>
												<option value="09" > 매입채무 </option>
											</select>
										</div>
									</div>
					            
					            <div class="btn-group btn-group-justified" role="group" aria-label="...">
						            
						            <div class="btn-group" role="group">
										<input type="button" name="btn_list_all" class="btn btn-primary " value="전체목록"	id="list_btn_all" 	onclick="return search_list(1,0)">
									</div>
									
									<div class="btn-group" role="group">
										<input type="button" name="btn_reg_purchasel" class="btn btn-primary " value="구매등록" 	id="list_btn_reg"	onclick="return reg_purchase();">
									</div>
									
									<div class="btn-group" role="group">
										<input type="button" name="btn_search_state" class="btn btn-default " value="전표승인조회" id="list_btn_state"	onclick="return search_list(1,2)">
									</div>
									
									<div class="btn-group" role="group">
										<input type="button" name="btn_search_storage_in" class="btn btn-default " value="입고완료조회" id="list_btn_in"	onclick="return search_list(1,3)">
									</div>
									
									<div class="btn-group" role="group">
										<input type="button" name="btn_approval_pay" class="btn btn-default " value="상환승인조회" 	id="list_approval_pay">
									</div>
									
									<div class="btn-group" role="group">
										<input type="button" name="btn_complete_pay" class="btn btn-default " value="채무상환" 	id="list_complete_pay">
									</div>
								
								</div>
							</div> <!-- // input-group -->
						</form>	
						
					</div>	<!-- // input-group -->
				</div>	<!-- // panel-body  -->  	
				<div class="panel-body" id="page3110_page" style="padding-bottom: 0px;"></div> 
				<div class="panel-body" id="page3110_table"></div>
			</div> <!-- // panel panel-primary -->
		</div> <!-- // col-xs-12 -->	 
	</div>	<!-- // row -->
		
	
	<script>	
	$('#list_approval_pay').click(function list_approval_pay_table (){
		var pagenum = 1;
		$('#page3110_table').slideDown();
		$('#page3110_page').slideUp();
		$('#page3110_table').load('/purchase_management/search_purchase/list_approval_pay?pageNum='+pagenum);
		return false;
	});
	
	$('#list_complete_pay').click(function list_complete_pay_table(){
		var pagenum = 1;
		$('#page3110_table').slideDown();
		$('#page3110_page').slideUp();
		$('#page3110_table').load('/purchase_management/search_purchase/list_complete_pay?pageNum='+pagenum);
		return false;
	});
	
	$('#page3110_div01_toggle').bind("click",function(){  
		$('#page3110_div01').slideToggle();
		return false;
	})
	
	function reg_purchase(){
		$('#main_screen').load('/purchase_management/input_purchase/reg_purchase');
	}
	
	function search_list(pagenum,check){

		var check = check;
		var pagenum = pagenum;
		var search_str = null;
		/* console.log(" pagenum :" + pagenum ); */
		
		// 전체 검색
		if ( check == 0 ){
			search_str = "all";
			
		// 검색어 검색
		} else if ( check == 1 ){
			search_str = document.getElementById("search_str").value;
			if ( !search_str )
				search_str = "all";
		// 전표승인 검색
		} else if (check == 2 ){
			search_str = "account";
		// 출고완료 검색
		} else if (check == 3 ){
			search_str = "stock";
		// 지급완료
		} else if (check == 4 ){
			search_str = "pay";
			
		}else if (check == 5 ){
			search_str = "check";
		}
		
		/* console.log(" search_str :" + search_str ); */
		$('#page3110_table').slideDown();
		$('#page3110_page').slideDown();
		$('#page3110_page').load('/purchase_management/search_purchase/purchase_list_page?search_str='+search_str+'&pageNum='+pagenum);
		$('#page3110_table').load('/purchase_management/search_purchase/purchase_list_table?search_str='+search_str+'&pageNum='+pagenum);
		return false;
	}
	
	
</script>
	
</body>
</html>