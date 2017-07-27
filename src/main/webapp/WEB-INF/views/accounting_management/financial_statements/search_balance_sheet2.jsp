<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../../setting.jsp"%>
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
		return false;
	});
});

</script>
<div id="date_form_div">	
<form action="#" name="financial_statements_form" method="post" >
	<table border="1">
	<tr>
		<th>기간 선택 </th>
		<td> 
			<input type="hidden" value="${yearValuable}" name="yearValuable">
			
			<select name="year">
			<c:forEach var = "yearDto" items = "${yearDto}">
				
				<c:if test="${yearValuable != 0}">
				<option value="${yearDto.year}"> ${yearDto.year}년 </option>
				</c:if>
			</c:forEach>
			</select>
			<select name="quarter">
				<option value="03"> 1분기 </option>
				<option value="06"> 2분기 </option>
				<option value="09"> 3분기 </option>
				<option value="12"> 4분기 </option>
			</select>
		</td>
	</tr>
</table>
	<input type="submit" value="조회 " id="show_statement">
</form>
</div>
<div id="stage">

</div>