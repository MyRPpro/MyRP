<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "../../setting.jsp" %>
<script type="text/javascript">
$(function(){
	 $('#new_sub').unbind("click").bind("click",function(){
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
	});
});

$(function(){
	 $('#modify_sub').unbind("click").bind("click",function(){
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
	});
});
 </script>

<c:if test = "${newmodify == 'new'}">
<div class="row">
	<div class="col-xs-12">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title"> 신규 등록</h3>
			</div>
			<div class="panel-body">
				<div class="table-responsive">
					<form action="warehouse_pro" id = "new_form" method = "post">
					<input type = "hidden" value = "new" name = "opt">
					<table class="table table-condensed">
						<tr>
							<th>창고종류</th>
							<th>창고명</th>
							<th>창고주소</th>
						</tr>
						<tr>
							<th>
								<select class="form-control input-sm" name = "warehouse_id">
									<option value = "${nomal}">일반창고 / ${nomal}</option>
									<option value = "${bad}">불량창고 / ${bad}</option>
									<option value = "${wait}">대기창고 / ${wait}</option>
								</select>
							</th>
							<th><input class="form-control" type = "text" id = "name" name = "warehouse_name" required></th>
							<th><input class="form-control" type = "text" id = "location" name = "warehouse_location" required></th>
						</tr>
						<tr>
							<th colspan = "3"><input type = "button" class="btn btn-primary" value = "확인" id = "new_sub">&nbsp;<input type = "reset" class="btn btn-info" value = "취소"></th>
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
		<div class="panel-heading">
			<h3 class="panel-title">창고 수정</h3>
		</div>
		<div class="panel-body">
			<div class="table-responsive">
				<form action="warehouse_pro" id = "modify_form" method = "post">
				<input type = "hidden" value = "modify" name = "opt">
				<table class="table table-condensed">
					<tr>
						<th>창고id</th>
						<th>창고명</th>
						<th>창고주소</th>
					</tr>
					<c:forEach var = "vo" items = "${reg_warehouse_listVos}" >	
							<tr>
								<th><input class="form-control" type = "text" value = "${vo.warehouse_id}" name = "warehouse_id" readonly></th>
								<th><input class="form-control" type = "text" id = "name" value = "${vo.warehouse_name}" name = "warehouse_name" required></th>
								<th><input class="form-control" type = "text" id = "location" value = "${vo.warehouse_location}" name = "warehouse_location" required></th>
							</tr>
						</c:forEach>
					<tr>
						<th colspan = "3"><input type = "button" class="btn btn-primary" value = "확인" id = "modify_sub">&nbsp;<input type = "reset" class="btn btn-info" value = "취소"></th>
					</tr>
				</table>
				</form>
			</div>
		</div>
	</div>
</div>
</div>
</c:if>
