<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../../setting.jsp"%>
<script type="text/javascript">
	function slideUpFunction(){
		$('#make_statements_list').slideUp();
	}
	// 연결id 조회
	function call_connected_id(access_role){
		$('#show_connected_id').slideDown();
		togo = $('#show_connected_id');
		$.ajax({ 		
			type: 	'get',	 			
			url: 	"/accounting_management/statement_management/call_connected_id?access_role="+access_role,
			success: function(response) { 	
				togo.html(response);	
			}
		});
	}
	$(function(){
		$("form[name='make_statement_form1']").on("submit",function(){
			
			if(!document.make_statement_form1.account_id.value){
				alert("'조회' 버튼을 통해 계정코드를 입력해주세요!");
				document.make_statement_form1.calling_button.focus();
				return false;
			}else if(!document.make_statement_form1.account_name.value){
				alert("조회 버튼을 통해 계정이름를 입력해주세요!");
				document.make_statement_form1.calling_button.focus();
				return false;
			}else if(!document.make_statement_form1.account_value.value){
				alert("조회 버튼을 통해 계정코드를 입력해주세요!");
				document.make_statement_form1.calling_button.focus();
				return false;
			}
			
			togo = $('#search_statements_overall');
			var data = $(this).serialize(); 
			$.ajax({ 	
				data:    data,
				type: 	'post',
				url: 	"/accounting_management/statement_management/make_statement_pro",
				success: function(response) { 	
					togo.html(response);	
				}
			});
			$("#make_statements_list").slideUp();
			return false;
		});
	});

</script>
<div id="make_statement_overall" class="panel panel-default">
	<div class="panel-heading">
			전표 생성 
	</div>
<div id="show_connected_id">
</div>
<form action="#" name="make_statement_form1" method="post">
	<input type="hidden" name="typeCnt" id="typeCnt">
<table class="table table-hover">
	<tr>	
		<th> 전표 종류 </th>
		<td>
			<select name="statement_type" onchange="" id="statement_type"> 
				<c:if test="${ROLE.access_role.equals('SA')}">
				<option value="54101">매출전표</option>
				</c:if>
				<c:if test="${ROLE.access_role.equals('PU')}">
				<option value="54102">매입전표</option>
				</c:if>
				<c:if test="${ROLE.access_role.equals('HR')}">
				<option value="54103">급여전표</option>
				</c:if>
				<option value="54104">입금전표</option>
				<option value="54105">출금전표</option>
			</select>
		</td>
	</tr>
	<tr>
		<th> 연결 ID </th>
		<td>
			
			<input type="text" name="connected_id" id="connected_id">  
			<input type="button" value="조회" onclick="call_connected_id('${ROLE.access_role}')" name="calling_button" class="btn btn-primary btn-xs">
		</td>
	</tr>
	<tr class="active">
		<th colspan="2"> 계정등록 </th>
	</tr>
	<tr>
		<th> 계정 ID </th>
		<td>
			<input type="text" name="account_id"  readonly="true" id="account_id">
		</td>
	</tr>
	<tr>
		<th> 계정 이름 </th>
		<td>
			<input type="text" name="account_name" readonly="true" id="account_name">
		</td>
	</tr>
	<tr>
		<th> 계정 금액 </th>
		<td>
			<input type="number" name="account_value"  readonly="true" id="account_value">
		</td>
	</tr>
</table>
<input type="submit" value="등록하기" class="btn btn-default">
<input type="reset" value="재작성" class="btn btn-default">
<input type="button" value="돌아가기" onclick="slideUpFunction();" class="btn btn-default">			
</form>
</div>