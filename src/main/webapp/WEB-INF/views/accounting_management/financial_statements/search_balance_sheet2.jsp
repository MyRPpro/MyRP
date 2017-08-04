<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../../setting.jsp"%>
<script src="http://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.2/raphael-min.js"></script>

<script type="text/javascript">
$(function(){
	$('#date_form_div form').on("submit",function(){
		var yearValuable = document.financial_statements_form.yearValuable.value;
		if(yearValuable==0){
		   alert("존재하는 거래가 없습니다");
		   return false;
	     }
		togo = $('#stage');
		var data = $(this).serialize(); 
		
		$.ajax({ 
			data:    data,
			type: 	'post',	 			
			url: 	"/accounting_management/financial_statements/show_balance_sheet",
			success: function(response) { 	
				togo.html(response);	
			}
		});
		$.ajax({ 	
			data:    data,
			type: 	'post',	 			
			url: 	"/accounting_management/financial_statements/show_balance_sheet_graph",
			success: function(response) { 	
				$('#show_graph').html(response);	
			}
		});
		return false;
	});
});
</script>
<div id="date_form_div">	
<form action="#" name="financial_statements_form" method="post" class="form-inline" >
	<table class="table">
	<tr>
		<th> <span class="glyphicon glyphicon-calendar" aria-hidden="true"></span> 조회 기간 </th>
	</tr>
	<tr>
		<td> 
			<input type="hidden" value="${yearValuable}" name="yearValuable">
			
			<select name="year" class="form-control">
			<c:forEach var = "yearDto" items = "${yearDto}">
				<c:if test="${yearValuable != 0}">
				<option value="${yearDto.year}"> ${yearDto.year}년 </option>
				</c:if>
			</c:forEach>
			<c:if test="${yearValuable==0}">
			<option> ---- </option>
			</c:if>
			</select>
			<select name="quarter" class="form-control">
				<option value="03"> 1분기 </option>
				<option value="06"> 2분기 </option>
				<option value="09"> 3분기 </option>
				<option value="12"> 4분기 </option>
			</select>
		</td>
	</tr>
	<tr>
		<td colspan="2"> <input type="submit" value="조회 " id="show_statement"  class="btn btn-default"> </td>
	</tr>
</table>
	
</form>
<div id="stage">

</div>

<div id="show_graph">
</div>

</div>
