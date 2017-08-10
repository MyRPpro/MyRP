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
				<div class="panel-heading"  id="purchase_list_heading" >
					<h3 class="panel-title">
						<span class="glyphicon glyphicon-gift"></span> &emsp;
						구매 리스트 페이지 Purchase_List
					</h3>
				</div>	<!-- // panel-heading -->
				<div class="panel-body" id="purchase_list_content"  >
					<div class="input-group" id="content" style="display: inline;">
						<font class="media-heading" style="margin:0 auto;"> 입력된 구매 내역을 검색 할 수 있는 페이지 입니다.</font><br><br>
							<form class="form-inline-block" action="#" name="purchase_list_form" method="get">
								<div class="input-group">
									<input type="text" class="form-control" name="input_search" id="search_str" placeholder="구매번호를 입력하세요">
									<span class="input-group-btn">
										<button class="btn btn-primary" id="list_btn_search" type="button" onclick="return search_list(1,1)"> 검색 </button>
										<button class="btn btn-primary dropdown-toggle" data-toggle="dropdown" type="button" aria-expanded="true" > 
											 &nbsp; <span class="caret"></span> 
										</button>
										<ul class = "dropdown-menu" >
						                    <li><a href = "javascript:search_list(1,5)">전표신청</a></li>	<!-- 23202 -->
						                    <li><a href = "javascript:search_list(1,6)">전표승인</a></li>	<!-- 23203 -->
						                    <li><a href = "javascript:search_list(1,7)">입고신청</a></li>	<!-- 23204 -->
						                    <li><a href = "javascript:search_list(1,8)">입고완료</a></li>	<!-- 23205 -->
						                    <li><a href = "javascript:search_list(1,9)">지급대기</a></li>	<!-- 23206 -->
						                    <li><a href = "javascript:search_list(1,10)">지급완료</a></li>	<!-- 23207 -->
						                    <li class="divider" role="separator"></li>	
						                    <li><a href = "javascript:search_list(1,11)">부가세대급금</a></li>	<!-- 500011030000 -->
						                    <li><a href = "javascript:search_list(1,12)">상품매입</a></li>	<!-- 500011050000 -->
						                    <li><a href = "javascript:search_list(1,13)">매입채무</a></li>	<!-- 500012010000 -->
						                </ul>
									</span>
								</div>
					            <center>
					            
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
								
								
								<div id="list_page"></div> 
								</center>
							</form>	
					</div>	<!-- // input-group -->
				</div>	<!-- // panel-body  -->  	
				<div class="panel-body"  >
				<div id="list_table"></div>
				</div>	<!-- // panel-body -->
			</div> <!-- // panel panel-primary -->
		</div> <!-- // col-xs-12 -->	 
	</div>	<!-- // row -->
		
		
	
	<script>	
	
	$('#list_approval_pay').click(function list_approval_pay_table (){
		var pagenum = 1;
		$('#list_table').slideDown(500);
		$('#list_page').slideUp(500);
		$('#list_table').load('/purchase_management/search_purchase/list_approval_pay?pageNum='+pagenum);
		return false;
		
		
	});
	
	$('#list_complete_pay').click(function list_complete_pay_table(){
		var pagenum = 1;
		$('#list_table').slideDown(500);
		$('#list_page').slideUp(500);
		$('#list_table').load('/purchase_management/search_purchase/list_complete_pay?pageNum='+pagenum);
		return false;
	});
	
	$('#purchase_list_heading').bind("click",function(){  
		$('#purchase_list_content').slideToggle();
	})
	
	$('.dropdown-toggle').dropdown()
	
	
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
		$('#list_table').slideDown(500);
		$('#list_page').slideDown(500);
		$('#list_page').load('/purchase_management/search_purchase/purchase_list_page?search_str='+search_str+'&pageNum='+pagenum);
		$('#list_table').load('/purchase_management/search_purchase/purchase_list_table?search_str='+search_str+'&pageNum='+pagenum);
		
		return false;
	}
	
	
	
</script>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	</script>
	
</body>
</html>