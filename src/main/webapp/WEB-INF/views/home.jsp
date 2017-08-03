<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<html>
<head>
	<title>MyRP</title>
</head>
<script type="text/javascript">
function fn_login_form() {
	$("#main_screen").load("/user/login");
	return false;
}

function onoff(){
	if(document.getElementById("alarmonoff").value == "on"){		
		document.getElementById("alarmonoff").value = "off";
	}else{
		document.getElementById("alarmonoff").value = "on";
	}
	return false;
}
 

</script>
<body>
<input type = "hidden" id = "alarmonoff" value = "on">

<div class="container-fluid">
	<form class="form-inline">
		<div class="row " style="height: 100px; vertical-align: center; " >
			<div class="page-header " style="height: 80px; margin: 0; margin-top: 10px; margin-bottom:10px; vertical-align: center; " >
				<div class="col-md-12">
					<h1 style="margin:0 auto; padding:0;">
						<a href="/">
						<img 
						style="height: 50px; margin: 0; margin-top: 10px;"
						src="/resources/images/design/logo_v4.png" 
						onmouseover="this.src='/resources/images/design/logo_v5.png'" 
						onmouseout="this.src='/resources/images/design/logo_v4.png'" border="0"></a>
						
						<small class="text-right" style="vertical-align: center;">

							<%
								request.getSession().setAttribute("dest", null);
							%>
							&emsp;
							<c:if test="${ROLE != null}">
								${ROLE.employee_name}
								<input class="btn btn-primary" type="button" value="로그아웃" 
								onclick="window.location='/user/logout';" >
							</c:if>
							<c:if test="${ROLE == null}">
								<input class="btn btn-success" type="button" value="로그인"
								onclick="fn_login_form();">
							</c:if>
							<input class="btn btn-default" type="button" id="menu_nav_btn" value="메뉴">
							
							<button class="btn btn-default" id="alrim_center_btn" onclick = "onoff();">알림&nbsp;<span id = "size"></span></button>
							<!-- <input class="btn btn-default" data-toggle="button" aria-pressed="true" autocomplete="off" type="button" id="alrim_center_btn" value="알림" onclick = "onoff();"> -->
						</small>
					</h1>	
				</div>	
			</div>	<!-- // page-header -->
		</div>	<!-- // row -->
	</form>

   <div class="row">
      <div class="col-md-12">
         <div class="row">
            <div class="col-md-2" id="menu_nav">
               <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                  <div class="panel panel-default">
                     <div class="panel-heading" role="tab" id="headingOne">
                        <h4 class="panel-title">
                           <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne" >
                              기초등록
                           </a>
                        </h4>
                     </div>
                     <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
                        <div class="panel-body">
                           <a href="/base_registration/reg_company/company_list">거래처등록</a><br>
                           <a href="/base_registration/reg_product/product_list">상품등록</a><br>
                        </div>
                     </div>
                  </div>
                  <div class="panel panel-default">
                     <div class="panel-heading" role="tab" id="headingTow">
                        <h4 class="panel-title">
                           <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                              판매관리
                           </a>
                        </h4>
                     </div>
                     <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                        <div class="panel-body">
                           <a href="/sales_management/search_sales/sales_list">판매검색</a><br>
                           <a href="/sales_management/input_sales/reg_sales">판매입력</a><br>
                           <a href="/sales_management/status_sales/search_status_sales">판매현황</a><br>
                        </div>
                     </div>
                  </div>
                  <div class="panel panel-default">
                     <div class="panel-heading" role="tab" id="headingThree">
                        <h4 class="panel-title">
                           <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                              구매관리
                           </a>
                        </h4>
                     </div>
                     <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                        <div class="panel-body">
                           <a href="/purchase_management/search_purchase/purchase_list">구매검색</a><br>
                           <a href="/purchase_management/input_purchase/reg_purchase">구매입력</a><br>
                           <a href="/purchase_management/staus_purchase/search_status_purchase">구매현황</a><br>
                        </div>
                     </div>
                  </div>
                  <div class="panel panel-default">
                     <div class="panel-heading" role="tab" id="headingFour">
                        <h4 class="panel-title">
                           <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                              물류관리
                           </a>
                        </h4>
                     </div>
                     <div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour">
                        <div class="panel-body">
                           <a href="/distribution_management/stock_condition/search_stock_condition">재고현황</a><br>
                           <a href="/distribution_management/stockpile/search_stockpile">재고수불부 검색</a><br>
                           <a href="/distribution_management/reg_warehouse/warehouse_list">창고 리스트</a><br>
                           <a href="/distribution_management/movement_warehouse/movement_list">창고 이동 전체 리스트</a><br>
                           <a href="/distribution_management/adjustment_inventory/adjustment_inventory_list">재고 조정 조회</a><br>
                           <a href="/distribution_management/search_distribution_order/statement_list">전체 전표 리스트</a>
                        </div>
                     </div>
                  </div>
                  <div class="panel panel-default">
                     <div class="panel-heading" role="tab" id="headingFive">
                        <h4 class="panel-title">
                           <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
                              회계관리
                           </a>
                        </h4>
                     </div>
                     <div id="collapseFive" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFive">
                        <div class="panel-body">
                           <a href="/accounting_management/financial_statements/search_balance_sheet">회계보고서</a><br>
                           <a href="/accounting_management/bank_account_registration/bank_account_list">계좌 관리</a><br>
                           <a href="/accounting_management/account_management/account_management">계정 관리</a><br>
                           <a href="/accounting_management/statement_management/search_statements">전표 관리</a><br>
                           <a href="/accounting_management/bond_debt_status/search_bond_debt">채권/채무 조회</a><br>
                        </div>
                     </div>
                  </div>
                  <div class="panel panel-default">
                     <div class="panel-heading" role="tab" id="headingSix">
                        <h4 class="panel-title">
                           <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseSix" aria-expanded="false" aria-controls="collapseSix">
                              인사관리
                           </a>
                        </h4>
                     </div>
                     <div id="collapseSix" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingSix">
                        <div class="panel-body">
                           <a href="/hr_management/manage_hr_code/base_code_group_list">인사코드 관리</a><br>
                           <a href="/hr_management/manage_dept/dept_list">부서 관리</a><br>
                           <a href="/hr_management/manage_personnel_card/personnel_card_search">인사카드 관리</a><br>
                           <a href="/hr_management/manage_hr_appointment/hr_appointment_search">인사발령 관리</a><br>
                           <a href="/hr_management/manage_retired_employee/retired_employee_search">퇴사자 관리</a><br>
                           <a href="/hr_management/manage_salary/salary_register_search">급여 관리</a><br>
                        </div>
                     </div>
                  </div>
                  <div class="panel panel-default">
                     <div class="panel-heading" role="tab" id="headingSeven">
                        <h4 class="panel-title">
                           <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseSeven" aria-expanded="false" aria-controls="collapseSeven">
                              근태관리
                           </a>
                        </h4>
                     </div>
                     <div id="collapseSeven" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingSeven">
                        <div class="panel-body">
                           <a href="/attitude_management/search_attitude/search_attitude_search">근태 조회</a>   
                        </div>
                     </div>
                  </div>
               </div> <!-- panel-group -->
            </div>
            
            <div class="col-md-8" id="main_screen">
               <div class="img-responsive" align="center" >   
                  <img class="img-reponsive " src="/resources/images/design/back_03.png" 
                  style="max-width: 100%; margin-top: 3% "  > 
               </div>
            </div>
            
            <!-- style="width:100%; margin:0 auto;" -->
            
            <div class="col-md-2" id="alrim_center">
               <div class="panel panel-warning">
                  <div class="panel-heading"><span class="text-center">알림센터</span></div>
                  <div class="panel-body">
                     <c:if test="${ROLE != null}">
                     	<input type = "hidden" id = "role" value = "${ROLE.access_role}">
                        <span class="text-center">${ROLE.employee_name}님 어서오세요.</span>
                     </c:if>
                     <c:if test="${ROLE == null}">
                        <span class="text-center">로그인이 필요합니다.</span>
                     </c:if>
                  </div>
                  <div id = "result"> </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>
<nav class="navbar navbar-default navbar-fixed-bottom">
	<div class="col-md-12" id="help_center">
		<p class="text-center" id="help_console">도움말 센터</p>
	</div>
</nav>
	<div class="footer navbar-fixed-bottom">
      
   </div>
</body>
<script type="text/javascript">
	
	 $(function(){
		if(document.getElementById('role') != null) {
			var role = document.getElementById("role").value;
			var data = {"role" : role}
			data["goes"] = "1";
			$.ajax({ 					
				data: 	 data,
				type: 	'post',	 			
				url: 	"/state_alarm/state_alarm_pro",
				success: function(response) { 	
					$('#result').html(response);
					
				}
			});
			data["goes"] = "2";
			$.ajax({ 					
				data: 	 data,
				type: 	'post',	 			
				url: 	"/state_alarm/state_alarm_pro",
				success: function(response) { 	
					$('#size').html(response);
					
				}
			});
			var timer = setInterval(function(){
				if(document.getElementById("alarmonoff").value == "on"){
					data["goes"] = "1";
				$.ajax({ 					
					data: 	 data,
					type: 	'post',	 			
					url: 	"/state_alarm/state_alarm_pro",
					success: function(response) { 	
						$('#result').html(response);
					}

				});
				data["goes"] = "2";
				$.ajax({ 					
					data: 	 data,
					type: 	'post',	 			
					url: 	"/state_alarm/state_alarm_pro",
					success: function(response) { 	
						$('#size').html(response);
						
					}
				});
				}
			}, 10000);
		}
	}); 
	
	//메뉴의 a 태그 클릭시 메인페이지 화면에 해당 화면을 출력한다.
	$(".panel-body a").bind("click", function(event) {
		$("#main_screen").load($(this).attr("href"));
		return false;
	});

</script>
</html>
