<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "../../setting.jsp" %>
<script type="text/javascript">
$(function(){
	 $('#new_sub').unbind("click").bind("click",function(){
		
		var warehouse_name =  document.getElementById("warehouse_name");
		var warehouse_location =  document.getElementById("warehouse_location");
		
		if(warehouse_name.value == null || warehouse_name.value == ""){
			alert("창고 이름을 작성하지 않았습니다.");
			warehouse_name.focus();
			return false;
		}else if(warehouse_location.value == null || warehouse_location.value == ""){
			alert("창고 주소를 작성하지 않았습니다.");
			warehouse_location.focus();
			return false;
		}
		
		var con = confirm("등록하시겠습니까?");
		
		if(con){
			var togo = $('#main_screen');
			var data = $('#new_form').serialize();
			$.ajax({ 					
				data: 	data,
				type: 	'post',	 			
				url: 	"/distribution_management/reg_warehouse/warehouse_pro",
				success: function(response) { 	
					togo.html(response);	
				}
			});  
		}
	});

	$('#modify_sub').unbind("click").bind("click",function(){
		var warehouse_name =  document.getElementById("warehouse_name");
		var warehouse_location =  document.getElementById("warehouse_location");
		
		if(warehouse_name.value == null || warehouse_name.value == ""){
			alert("창고 이름을 작성하지 않았습니다.");
			warehouse_name.focus();
			return false;
		}else if(warehouse_location.value == null || warehouse_location.value == ""){
			alert("창고 주소를 작성하지 않았습니다.");
			warehouse_location.focus();
			return false;
		}
		
		var con = confirm("수정하시겠습니까?");
		
		if(con){
			var togo = $('#main_screen');
			var data = $('#modify_form').serialize();
			$.ajax({ 					
				data: 	data,
				type: 	'post',	 			
				url: 	"/distribution_management/reg_warehouse/warehouse_pro",
				success: function(response) { 	
					togo.html(response);	
				}
			});  
		}
	});

	$('.distribution_view_heading').bind("click",function(){  
		$('.distribution_view_content').slideToggle();
	});
});
</script>

<c:if test = "${newmodify == 'new'}">
<div class="row">
	<div class="col-xs-12">
		<div class="panel panel-primary">
			<div class="panel-heading distribution_view_heading">
				<h3 class="panel-title"><a><span class="glyphicon glyphicon glyphicon-road" aria-hidden="true"></span>&nbsp;신규 등록</a></h3>
			</div>
			<div class="panel-body distribution_view_content">
				<div class="table-responsive">
					<form action="warehouse_pro" id = "new_form" method = "post">
					<input type = "hidden" value = "new" name = "opt">
					<table class="table table-condensed">
						<tr>
							<th>창고종류＊</th>
							<th>
								<select class="form-control input-sm" name = "warehouse_id" id = "warehouse_id">
									<option value = "${nomal}">일반창고 / ${nomal}</option>
									<option value = "${bad}">불량창고 / ${bad}</option>
									<option value = "${wait}">대기창고 / ${wait}</option>
								</select>
							</th>
						</tr>
						<tr>
							<th>창고명＊</th>
							<th><input class="form-control" type = "text" id = "warehouse_name" name = "warehouse_name" required></th>
						</tr>
						<tr>
							<th>창고주소＊</th>
							<th><input class="form-control" type = "text" id = "warehouse_location" name = "warehouse_location" required></th>
						</tr>
						<tr>
							<th colspan = "3"><div class = "btn-group btn-group-default"><input type = "button" class="btn btn-sm  btn-primary" value = "확인" id = "new_sub"><input type = "reset" class="btn btn-sm btn-default" value = "취소"></div></th>
						</tr>
					</table>
					</form>
				</div>
			</div>
		</div>
</div></div>
</c:if>

<c:if test = "${newmodify == 'modify'}">
<div class="row">
	<div class="col-xs-12">
	<div class="panel panel-primary">
		<div class="panel-heading distribution_view_heading">
			<h3 class="panel-title"><a><span class="glyphicon glyphicon glyphicon-road" aria-hidden="true"></span>&nbsp;창고 수정</a></h3>
		</div>
		<div class="panel-body distribution_view_content">
			<div class="table-responsive">
				<form action="warehouse_pro" id = "modify_form" method = "post">
				<input type = "hidden" value = "modify" name = "opt">
				<table class="table table-condensed">
					<c:forEach var = "vo" items = "${reg_warehouse_listVos}" >	
						<tr>
							<th>창고id</th>
							<th><input class="form-control" type = "text" value = "${vo.warehouse_id}" name = "warehouse_id" readonly></th>
						</tr>
							<th>창고명＊</th>
							<th><input class="form-control" type = "text" id = "warehouse_name" value = "${vo.warehouse_name}" name = "warehouse_name" required></th>
						</tr>
						<tr>
							<th>창고주소＊</th>
							<th><input class="form-control" type = "text" id = "warehouse_location" value = "${vo.warehouse_location}" name = "warehouse_location" required></th>
						</tr>
					</c:forEach>
					<tr>
						<th colspan = "3"><div class = "btn-group btn-group-default"><input type = "button" class="btn btn-sm btn-primary" value = "확인" id = "modify_sub"><input type = "reset" class="btn btn-sm btn-default" value = "취소"></div></th>
					</tr>
				</table>
				</form>
			</div>
		</div>
	</div>
</div>
</div>
</c:if>
