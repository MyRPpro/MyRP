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
}

function onoff(){
	if(document.getElementById("alarmonoff").value == "on"){
		document.getElementById("alarmonoff").value = "off";
	}else{
		document.getElementById("alarmonoff").value = "on";
	}
}

function back_hide(){
	return false;
	
}

$("#main_screen").attr("href").change(function(){
	$("#background_img").css("display","none");
	return false;
});

</script>
<body>


<input type = "hidden" id = "alarmonoff" value = "on">


<div class="container-fluid" style="padding: 0px; ">
	<form class="form-inline">
		<div class="row " style="height: 100px; vertical-align: center; " >
			<div class="page-header " style="height: 80px; margin: 0; margin-top: 10px; margin-bottom:10px; vertical-align: center; " >
				<div class="col-md-12" style="padding:0;" >
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
						</small>
					</h1>	
				</div>	
			</div>	<!-- // page-header -->
		</div>	<!-- // row -->
	</form>

   <div class="row" id="background_img"  >
      <div class="col-md-12">
         <div class="row" >
            <div class="col-md-2" id="menu_nav" >
            	<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true" >
            	
            		<!-- 사이드 메뉴 시작 ----------------------------------------------------- -->
            		
	               	
		                 <div class="panel panel-primary" style="border-radius: 0px; box-shadow: 2px 2px 4px DarkGray; "> 
		                     <div class="panel-heading" role="tab" id="headingOne">
		                     
		                        <h4 class="panel-title">
	                        		<span class="glyphicon glyphicon-ok-circle"></span> &nbsp;
		                       			<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne" ><b>
		                            기초등록
		                         			<span class="caret"></span>
		                         			</b>
		                          		</a>
		                        </h4>
		                     </div>
		                     
		                     <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
		                        <div class="panel-body" style="line-height: 1.5em; padding: 0px;">
		                        	<div class="list-group" style="margin-bottom: 0px;">
			                         <a href="/base_registration/reg_company/company_list" class="list-group-item"> 거래처등록</a>
			                         <a href="/base_registration/reg_product/product_list" class="list-group-item"> 상품등록</a>
			                        </div>
		                        </div>
		                     </div>
		                  </div>
	                  
	                  <!-- ----------------------------------------------------- -->
	                  
		                  <div class="panel panel-primary" style="border-radius: 0px; box-shadow: 2px 2px 4px DarkGray; ">
		                     <div class="panel-heading" role="tab" id="headingTow">
		                        <h4 class="panel-title">
		                        	<span class="glyphicon glyphicon-ok-circle"></span> &nbsp;
		                           		<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo"><b>
		                              판매관리				
		                              	<span class="caret"></span>
		                           		</b>
		                           </a>
		                        </h4>
		                     </div>
		                     
		                     <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
		                     	<div class="panel-body" style="line-height: 1.5em; padding: 0px;">
			                        <div class="list-group" style="margin-bottom: 0px;">
			                           <a href="/sales_management/search_sales/sales_list" class="list-group-item">판매검색</a>
			                           <a href="/sales_management/input_sales/reg_sales" class="list-group-item">판매입력</a>
			                           <a href="/sales_management/status_sales/search_status_sales"class="list-group-item">판매현황</a>
			                        </div>
			                     </div>
			                  </div>
		                  </div>
	                   <!-- ----------------------------------------------------- -->
	                   
		                  <div class="panel panel-primary" style="border-radius: 0px; box-shadow: 2px 2px 4px DarkGray; ">
		                     <div class="panel-heading" role="tab" id="headingThree">
		                        <h4 class="panel-title">
		                        	<span class="glyphicon glyphicon-ok-circle"></span> &nbsp;
		                           <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree"><b>
		                              구매관리
		                              	<span class="caret"></span>
		                           		</b>
		                           </a>
		                        </h4>
		                     </div>
		                     <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
		                     	<div class="panel-body" style="line-height: 1.5em; padding: 0px;">
		                        <div class="list-group" style="margin-bottom: 0px;">
		                           <a href="/purchase_management/search_purchase/purchase_list" class="list-group-item"> 구매검색</a>
		                           <a href="/purchase_management/input_purchase/reg_purchase" class="list-group-item"> 구매입력</a>
		                           <a href="/purchase_management/staus_purchase/search_status_purchase" class="list-group-item"> 구매현황</a>
		                        </div>
		                     </div>
		                  	</div>
		                  </div>
	                   <!-- ----------------------------------------------------- -->
	                   
		                  <div class="panel panel-primary" style="border-radius: 0px; box-shadow: 2px 2px 4px DarkGray; ">
		                     <div class="panel-heading" role="tab" id="headingFour">
		                        <h4 class="panel-title">
		                        	<span class="glyphicon glyphicon-ok-circle"></span> &nbsp;
		                           <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour"><b>
		                              물류관리
		                              	<span class="caret"></span>
		                           		</b>
		                           </a>
		                        </h4>
		                     </div>
		                     
		                     <div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour">
			                     <div class="panel-body" style="line-height: 1.5em; padding: 0px;">
			                        <div class="list-group" style="margin-bottom: 0px;">
			                           <a href="/distribution_management/stock_condition/search_stock_condition" class="list-group-item"> 재고현황</a>
			                           <a href="/distribution_management/search_distribution_order/statement_list" class="list-group-item"> 전표 리스트</a>
			                           <a href="/distribution_management/stockpile/search_stockpile" class="list-group-item"> 재고수불부</a>
			                           <a href="/distribution_management/reg_warehouse/warehouse_list" class="list-group-item"> 창고 리스트</a>
			                           <a href="/distribution_management/movement_warehouse/movement_list" class="list-group-item">창고 이동</a>
			                           <a href="/distribution_management/adjustment_inventory/adjustment_inventory_list" class="list-group-item"> 재고 조정</a>
			                           
			                        </div>
			                     </div>
		                  	</div>
                  		</div>
	                  <!-- ----------------------------------------------------- -->
	               
		                  <div class="panel panel-primary" style="border-radius: 0px; box-shadow: 2px 2px 4px DarkGray; ">
		                     <div class="panel-heading" role="tab" id="headingFive">
		                        <h4 class="panel-title">
		                        	<span class="glyphicon glyphicon-ok-circle"></span> &nbsp;
		                           <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFive" aria-expanded="false" aria-controls="collapseFive"><b>
		                              회계관리
		                              	<span class="caret"></span>
		                           		</b>
		                           </a>
		                        </h4>
		                     </div>
		                     
		                     <div id="collapseFive" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFive">
		                     <div class="panel-body" style="line-height: 1.5em; padding: 0px;">
		                        <div class="list-group" style="margin-bottom: 0px;">
		                           <a href="/accounting_management/financial_statements/search_balance_sheet" class="list-group-item"> 회계보고서</a>
		                           <a href="/accounting_management/bank_account_registration/bank_account_list" class="list-group-item"> 계좌 관리</a>
		                           <a href="/accounting_management/account_management/account_management" class="list-group-item"> 계정 관리</a>
		                           <a href="/accounting_management/statement_management/search_statements" class="list-group-item"> 전표 관리</a>
		                           <a href="/accounting_management/bond_debt_status/search_bond_debt" class="list-group-item"> 채권/채무 조회</a>
		                        </div>
		                     </div>
		                  </div>
	                  </div>
	                  <!-- ----------------------------------------------------- -->
	                 
	                  <div class="panel panel-primary" style="border-radius: 0px; box-shadow: 2px 2px 4px DarkGray; ">
	                     <div class="panel-heading" role="tab" id="headingSix">
	                        <h4 class="panel-title">
	                        	<span class="glyphicon glyphicon-ok-circle"></span> &nbsp;
	                           <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseSix" aria-expanded="false" aria-controls="collapseSix"><b>
	                              인사관리
	                              	<span class="caret"></span>
	                           		</b>
	                           </a>
	                        </h4>
	                     </div>
	                     
	                     <div id="collapseSix" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingSix">
	                     <div class="panel-body" style="line-height: 1.5em; padding: 0px;">
	                        <div class="list-group" style="margin-bottom: 0px;">
	                           <a href="/hr_management/manage_hr_code/base_code_group_list" class="list-group-item"> 인사코드 관리</a>
	                           <a href="/hr_management/manage_dept/dept_list" class="list-group-item"> 부서 관리</a>
	                           <a href="/hr_management/manage_personnel_card/personnel_card_search" class="list-group-item"> 인사카드 관리</a>
	                           <a href="/hr_management/manage_hr_appointment/hr_appointment_search" class="list-group-item"> 인사발령 관리</a>
	                           <a href="/hr_management/manage_retired_employee/retired_employee_search" class="list-group-item"> 퇴사자 관리</a>
	                           <a href="/hr_management/manage_salary/salary_register_search" class="list-group-item"> 급여 관리</a>
	                        </div>
	                     </div>
	                  </div>
	                  </div>
	                  <!-- ----------------------------------------------------- -->
	                  
	                  <div class="panel panel-primary" style="border-radius: 0px; box-shadow: 2px 2px 4px DarkGray; ">
	                     <div class="panel-heading" role="tab" id="headingSeven">
	                        <h4 class="panel-title">
	                        	<span class="glyphicon glyphicon-ok-circle"></span> &nbsp;
	                           <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseSeven" aria-expanded="false" aria-controls="collapseSeven"><b>
	                              근태관리
	                              	<span class="caret"></span>
	                           		</b>
	                           </a>
	                        </h4>
	                     </div>
	                     
	                     <div id="collapseSeven" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingSeven">
		                     <div class="panel-body" style="line-height: 1.5em; padding: 0px;">
		                        <div class="list-group" style="margin-bottom: 0px;">
		                           <a href="/attitude_management/search_attitude/search_attitude_search" class="list-group-item"> 근태 조회</a>   
		                        </div>
		                     </div>
		                  </div>
	                  </div>
	                  <!-- ----------------------------------------------------- -->
	                  
	               </div> <!-- panel-group -->
	            </div>
            
	            <!-- 메인 이미지 시작 ----------------------------------------------------- -->
	            
	            <div class="col-md-8" id="main_screen">
	               <div class="img-responsive" align="center" >   
	                	<img class="img-reponsive " src="/resources/images/design/back_03.png" 
                 		style="max-width: 100%; margin-top: 3% "  > 
	               </div>
	            </div>
	            
            
	            <!-- 메인 이미지 종료 ----------------------------------------------------- -->
	            
	            <!-- style="width:100%; margin:0 auto;" -->
	            
	            <div class="col-md-2" id="alrim_center" >
	               <div class="panel panel-warning" style="border-radius: 0px; box-shadow: 2px 2px 4px DarkGray;" >
	                  <div class="panel-heading text-center">
		                  <span class="glyphicon glyphicon-bell" ></span>&nbsp;
		                  <sapn class="font-weight-bold"><b>알림센터</b></span>
	                  </div>
	                  
	                  <div class="font-weight-bold text-right">
	                  		<div class="panel-body" style="line-height: 1.5em; padding: 0px;">
								<ul class="list-group borderless" style="margin:0px;">

									<c:if test="${ROLE != null}">
										<input type="hidden" id="role" value="${ROLE.access_role}">
										<li class="list-group-item borderless" style="padding: 0px 5px 0px 0px">
											<h3>
												<small><span class="label label-primary">${ROLE.access_role}</span>&nbsp;</small>
												<em><b><u>${ROLE.employee_name}</u></b></em> <small>&nbsp;님</small>
											</h3>
											<p class="text-center">&emsp; 반갑습니다.</p>
										</li>
									</c:if>

									<c:if test="${ROLE == null}">
										<li class="list-group-item borderless">
											<span class="text-center">로그인이 필요합니다.</span>
										</li>
									</c:if>
								
								<li class="list-group-item" style="padding:0px;">
									<div id = "result" ></div>
								</li>
								
								</ul>
        					</div>
	                  </div>
	                  
	               </div>
	            </div>
	            
	            <!-- 알림센터 종료 ----------------------------------------------------- -->
	            
	            <div>
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
