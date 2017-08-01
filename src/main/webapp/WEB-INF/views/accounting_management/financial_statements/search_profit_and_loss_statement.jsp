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
			url: 	"/accounting_management/financial_statements/show_profit_and_loss_statement",
			success: function(response) { 	
				togo.html(response);	
			}
		});
		return false;
	});
});

function formatDate(date) {
    var mymonth = date.getMonth() + 1;
    var myweekday = date.getDate();
    return (date.getFullYear() + "-" + ((mymonth < 10) ? "0" : "") + mymonth + "-" + ((myweekday < 10) ? "0" : "") + myweekday);
}
// 오늘
function SetToday(begin, end) {
    var obj1 = document.getElementById(begin);
    var obj2 = document.getElementById(end);
    var mydate = new Date();
    mydate.setDate(mydate.getDate());
    obj1.value = formatDate(mydate);
    if (obj2 != null) {
        obj2.value = obj1.value;
    }
}

// 어제
function SetYesterday(begin, end) {
    var obj1 = document.getElementById(begin);
    var obj2 = document.getElementById(end);
    var mydate = new Date();
    mydate.setDate(mydate.getDate() - 1);
    obj1.value = formatDate(mydate);
    if (obj2 != null) {
        obj2.value = obj1.value;
    }
}
// 이번주
function SetWeek(begin, end) {
	var obj1 = document.getElementById(begin);
    var obj2 = document.getElementById(end);
    var now = new Date();
    var nowDayOfWeek = now.getDay();
    var nowDay = now.getDate();
    var nowMonth = now.getMonth();
    var nowYear = now.getYear();
    nowYear += (nowYear < 2000) ? 1900 : 0;
    var weekStartDate = new Date(nowYear, nowMonth, nowDay - nowDayOfWeek);
    var weekEndDate = new Date(nowYear, nowMonth, nowDay + (6 - nowDayOfWeek));
    obj1.value = formatDate(weekStartDate);
    obj2.value = formatDate(weekEndDate);
}
//전 주
function SetPrevWeek(begin, end) {
	var obj1 = document.getElementById(begin);
    var obj2 = document.getElementById(end);
    var now = new Date();
    var nowDayOfWeek = now.getDay();
    var nowDay = now.getDate();
    var nowMonth = now.getMonth();
    var nowYear = now.getYear();
    nowYear += (nowYear < 2000) ? 1900 : 0;
    var weekStartDate = new Date(nowYear, nowMonth, nowDay - nowDayOfWeek);
    var weekEndDate = new Date(nowYear, nowMonth, nowDay - nowDayOfWeek-1);
    weekStartDate.setDate(weekStartDate.getDate() - 7);
    obj1.value = formatDate(weekStartDate);
    obj2.value = formatDate(weekEndDate);
}
// 이번달
function SetCurrentMonthDays(begin, end) {
    var obj1 = document.getElementById(begin);
    var obj2 = document.getElementById(end);
    var d2, d22;
    d2 = new Date();
    d22 = new Date(d2.getFullYear(), d2.getMonth());
    var d3, d33;
    d3 = new Date();
    d33 = new Date(d3.getFullYear(), d3.getMonth() + 1, "");
    obj1.value = formatDate(d22);
    obj1.focus();
    obj2.value = formatDate(d33);
    obj2.focus();
}
// 이전달
function SetPrevMonthDays(begin, end) {
    var obj1 = document.getElementById(begin);
    var obj2 = document.getElementById(end);
    var d2, d22;
    d2 = new Date();
    d22 = new Date(d2.getFullYear(), d2.getMonth() -1);
    var d3, d33;
    d3 = new Date();
    d33 = new Date(d3.getFullYear(), d3.getMonth(), "");
    obj1.value = formatDate(d22);
    obj1.focus();
    obj2.value = formatDate(d33);
    obj2.focus();
}
//금 분기 
function SetCurrentQuarter(begin, end) {
	 var obj1 = document.getElementById(begin);
	 var obj2 = document.getElementById(end);
	 var quarter;
	 var d2, d22;
	    d2 = new Date();
	    switch(d2.getMonth()){
	    	case 1 : case 2 : case 3 : 
	    		quarter = 3; break;
	    	case 4 : case 5 : case 6 : 
	    		quarter = 6; break;
	    	case 7 : case 8 : case 9 : 
	    		quarter = 9; break;
	    	case 10 : case 11 : case 12 : 
	    		quarter = 12; break;
	    }
	    d22 = new Date(d2.getFullYear(), quarter);
	    var d3, d33;
	    d3 = new Date();
	    d33 = new Date(d3.getFullYear(), quarter+3, "");
	    obj1.value = formatDate(d22);
	    obj1.focus();
	    obj2.value = formatDate(d33);
	    obj2.focus();
}

// 전 분기
function SetPrevQuarter(begin, end) {
	 var obj1 = document.getElementById(begin);
	 var obj2 = document.getElementById(end);
	 var quarter;
	 var d2, d22;
	    d2 = new Date();
	    switch(d2.getMonth()){
	    	case 1 : case 2 : case 3 : 
	    		quarter = 0; break;
	    	case 4 : case 5 : case 6 : 
	    		quarter = 3; break;
	    	case 7 : case 8 : case 9 : 
	    		quarter = 6; break;
	    	case 10 : case 11 : case 12 : 
	    		quarter = 9; break;
	    }
	    d22 = new Date(d2.getFullYear(), quarter);
	    var d3, d33;
	    d3 = new Date();
	    d33 = new Date(d3.getFullYear(), quarter+3, "");
	    obj1.value = formatDate(d22);
	    obj1.focus();
	    obj2.value = formatDate(d33);
	    obj2.focus();
}

// 올해
function SetCurrentYearDays(begin, end) {
    var obj1 = document.getElementById(begin);
    var obj2 = document.getElementById(end);
    var d2, d22;
    d2 = new Date(); 
    d22 = new Date(d2.getFullYear() ,"0","1");
    var d3, d33;
    d3 = new Date();
    d33 = new Date(d3.getFullYear() + 1,"", "");
    obj1.value = formatDate(d22);
    obj1.focus();
    obj2.value = formatDate(d33);
    obj2.focus();
}
// 전년
function SetPrevYearDays(begin, end) {
    var obj1 = document.getElementById(begin);
    var obj2 = document.getElementById(end);
    var d2, d22;
    d2 = new Date();
    d22 = new Date(d2.getFullYear() - 1 ,"0","1");
    var d3, d33;
    d3 = new Date();
    d33 = new Date(d3.getFullYear(),"", "");
    obj1.value = formatDate(d22);
    obj1.focus();
    obj2.value = formatDate(d33);
    obj2.focus();
}


</script>
<div id="date_form_div">	
	<form action="#" name="financial_statements_form2" method="post" class="form-inline" >
	<table class="table">
	<tr>
		<th> <span class="glyphicon glyphicon-calendar" aria-hidden="true"></span> 조회 기간 </th>
	</tr>
	<tr>	
		<td>
			<input type="hidden" value="999" name="yearValuable">
			<div>
			<input type="date" id="startDate" name="startDate" class="form-control" > 
			~ 
			<input type="date" id="endDate" name="endDate" class="form-control" >
			</div>
			<br>
			<div class="form-group form-group-sm">
				<div class="btn-toolbar" role="toolbar">
				  <div class="btn-group" role="group">
				  	  <button type="button" class="btn btn-default" onclick="SetToday('startDate', 'endDate');">금일</button>
					  <button type="button" class="btn btn-default" onclick="SetYesterday('startDate', 'endDate');">전일</button>
				  </div>
				  <div class="btn-group" role="group">
				  	  <button type="button" class="btn btn-default" onclick="SetWeek('startDate', 'endDate');">금주</button>
				  	  <button type="button" class="btn btn-default" onclick="SetPrevWeek('startDate', 'endDate')">전주</button>
				  </div>
				  <div class="btn-group" role="group">
				  	  <button type="button" class="btn btn-default" onclick="SetCurrentMonthDays('startDate', 'endDate');">금월</button>
				  	  <button type="button" class="btn btn-default" onclick="SetPrevMonthDays('startDate', 'endDate');">전월</button>
				  </div>
				  <div class="btn-group" role="group">
				  	  <button type="button" class="btn btn-default" onclick="SetCurrentQuarter('startDate', 'endDate');">금 분기</button>
				  	  <button type="button" class="btn btn-default" onclick="SetPrevQuarter('startDate', 'endDate');">전 분기</button>
				  </div>
				</div>
			</div>
 		</td>
	</tr>
	<tr>
		<td colspan="2"> <input type="submit" value="조회 " id="show_statement"  class="btn btn-default"></td>
	</tr>
	</table>
	
</form>
</div>
<div id="stage">

</div>