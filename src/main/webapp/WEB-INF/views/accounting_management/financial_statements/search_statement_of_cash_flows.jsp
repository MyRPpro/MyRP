<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../../setting.jsp"%>
<script type="text/javascript">
$(function(){
	$('#date_form_div form').on("submit",function(){
		//start 보다 end 가 앞서지는 않는지 비교
		var obj1 = document.financial_statements_form2.startDate.value;
		 var obj2 = document.financial_statements_form2.endDate.value;
		if(!obj1||!obj2){
			alert("날짜를 입력해주세요!");
			document.financial_statements_form2.startDate.focus();
			return false;
		}
		if(obj1>obj2){
			alert("검색 시작날짜가 끝날짜보다 앞서야합니다!");
			return false;
		}
		
		togo = $('#stage');
	var data = $(this).serialize(); 
		$.ajax({ 		
			data:    data,
			type: 	'post',	 			
			url: 	"/accounting_management/financial_statements/show_statement_of_cash_flows",
			success: function(response) { 	
				togo.html(response);	
			}
		});
		return false;
	});
});
</script>
<div id="date_form_div">	
	<form action="#" name="financial_statements_form2" method="post">
	<table border="1">
	<tr>
		<th>기간 선택 </th>
		<td>
			<input type="hidden" value="999" name="yearValuable">
			<input type="date" id="startDate" name="startDate"> ~ <input type="date" id="endDate" name="endDate"><br>
			<input type="button" value="금일" onclick="SetToday('startDate', 'endDate');">
			<input type="button" value="전일" onclick="SetYesterday('startDate', 'endDate');">
			<input type="button" value="금주" onclick="SetWeek('startDate', 'endDate');">
			<input type="button" value="전주" onclick="SetPrevWeek('startDate', 'endDate')"><br>
			<input type="button" value="금월" onclick="SetCurrentMonthDays('startDate', 'endDate');">
			<input type="button" value="전월" onclick="SetPrevMonthDays('startDate', 'endDate');">
			<input type="button" value="금 분기" onclick="SetCurrentQuarter('startDate', 'endDate');">
			<input type="button" value="전 분기" onclick="SetPrevQuarter('startDate', 'endDate');">
 		</td>
	</tr>
	</table>
	<input type="submit" value="조회 ">
</form>
</div>
<div id="stage">

</div>