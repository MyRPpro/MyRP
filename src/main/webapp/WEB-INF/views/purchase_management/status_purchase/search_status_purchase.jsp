<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../../setting.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h3> 구매 현황 검색 페이지 : search_status_purchase.jsp</h3>
	
	<input type="button" name="btn_status_all" value="전체내역검색" onclick="return list_table(1,2);">
	<input type="reset" name="btn_status_reset" value="메인으로 이동" onclick="window.location='/';">
	
	<form action="#" name="list_status_purchase" method="GET" onsubmit="return list_table(1,1)">
		
		<hr>
		기간별 입력 
		<input type="submit" value="검색" > 
		<input type="reset" value="재설정">  
		<br>
		
		<c:set var="today" value="<%= new java.util.Date() %>"/>
		<input type="date" id="start_date" name="start_date" value="<fmt:formatDate value='${today}' pattern='yyyy-MM-dd'/>">
		~
		<input type="date" id="end_date" name="end_date" value="<fmt:formatDate value='${today}' pattern='yyyy-MM-dd'/>">
			
		<input type="button" id="today"	name="btn_today" value="오늘" >
		<input type="button" id="a_day" name="btn_a_day"value="하루" >
		<input type="button" id="a_week" name="btn_a_week" value="한주">
		<input type="button" id="a_month" name="btn_a_month" value="한달">
		<input type="button" id="a_quarter" name="btn_a_quarter" value="한분기">
		<input type="button" id="a_year" name="btn_a_year" value="일년">
		                                      
		<select id="months">
			<option value="0" selected> 월별검색 </option>
			<option value="01" > 1월 </option>
			<option value="02" > 2월 </option>
			<option value="03" > 3월 </option>
			<option value="04" > 4월 </option>
			<option value="05" > 5월 </option>
			<option value="06" > 6월 </option>
			<option value="07" > 7월 </option>
			<option value="08" > 8월 </option>
			<option value="09" > 9월 </option>
			<option value="10" > 10월 </option>
			<option value="11" > 11월 </option>
			<option value="12" > 12월 </option>
		</select>
		<hr>

		
		옵션별 선택 
		<input type="button" value="검색" onclick="list_table(1,3)" >
		<input type="reset" value="재설정">  
		<br>
		
		<select name="account_ids" id="account_ids"  >
		   <option value="0" selected> 계정선택 </option>
				<option value="500011030000">부가세대급금</option>
				<option value="500011050000">상품매입</option>
				<option value="500012010000">매입채무</option>
		</select>  
	  	
		<select name="product_ids" id="product_ids"  >
		   <option value="0" selected> 제품선택 </option>
		   <c:forEach var="product" items="${product_ids}">
		  		<option value="${product.product_id}">${product.product_name} </option>
		  	</c:forEach>
	  	</select>
	  	
	  	<select name="company_ids" id="company_ids" >
		   <option value="0" selected> 거래처선택 </option>
		   <c:forEach var="company" items="${company_ids}">
		  		<option value="${company.company_id}">${company.company_name} </option>
		  	</c:forEach>
	  	</select>
	  	
	  	<select name="employee_ids" id="employee_ids"  >
		   <option value="0" selected> 담당자선택 </option>
		   <c:forEach var="employee" items="${employee_ids}">
		  		<option value="${employee.employee_id}">${employee.employee_name} </option>
		  	</c:forEach>
	  	</select>
		 
	</form>		
	
	<hr>
	<div id="list_page"></div>
	
	<div id="list_table">
		<h3>구매 현황를 볼 수 있는 페이지 입니다. </h3>
		<p> 검색을 원하는 기간을 선택하면 해당 기간에 거래된  내역을 볼 수 있습니다. </p>
		<p> 전체 내역을 확인하고 싶으면 전체내역 버튼을 눌러주세요. </p>
	</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<!-- ----------------------------------------------- -->
	
	<script type="text/javascript"> 	
	
	function list_table(param,check){
		
		var pageNum = param;
		var check = check;
		var account	= null;
		var product = null;
		var company = null;
		var employee = null;
		
		// 기간 검색
		if(check==1){
			var start_date = document.getElementById("start_date").value 
			var end_date = document.getElementById("end_date").value 
		}
		
		// 전체 검색
		if(check==2){
			var start_date = "all";
			var end_date = "all";
		}
		
		// 옵션 검색		
		if(check==3){
			var vals = new Array();
			account = document.getElementById("account_ids").value;
			product = document.getElementById("product_ids").value;
			company = document.getElementById("company_ids").value;
			employee = document.getElementById("employee_ids").value;
			
		}
		
		$('#list_table').load('/purchase_management/status_purchase/search_status_purchase_table?start_date='+start_date
				+'&end_date='+end_date
				+'&pageNum='+pageNum
				+'&account='+account
				+'&product='+product
				+'&company='+company
				+'&employee='+employee
				);
		
		setTimeout(function(){
			$('#list_page').load('/purchase_management/status_purchase/search_status_purchase_page?start_date='+start_date
					+'&end_date='+end_date
					+'&pageNum='+pageNum
					+'&account='+account
					+'&product='+product
					+'&company='+company
					+'&employee='+employee
					);	
		}, 100);
		
		return false;
	};
	

	
	
	var start_date	= null;
	var end_date 	= null;
	var start_date_temp = null;
	var end_date_temp 	= null;
	
	function date_load(){
		
		end_date 	= document.getElementById("end_date");
		end_date.vlaue 	 = date_format(new Date(end_date.value));
		end_date_temp 	 = new Date(end_date.value);
		
		
		start_date	= document.getElementById("start_date");
		start_date.value = date_format(new Date(end_date.value));
		start_date_temp  = new Date(start_date.value);
	 }
	
	 
	function date_format(date){
		var year = date.getFullYear();                //yyyy
		var month = (1 + date.getMonth());            //M
		month = month >= 10 ? month : '0' + month;    // month 두자리로 저장
		var day = date.getDate();                     //d
		day = day >= 10 ? day : '0' + day;            //day 두자리로 저장
		return  year + '-' + month + '-' + day;
	}

	document.getElementById("today").onclick = function(){
		date_load();
		end_date_temp 	 = new Date();
		end_date.value = date_format(end_date_temp);
		start_date.value = date_format(end_date_temp);
	}
	document.getElementById("a_day").onclick = function(){
		date_load();
		start_date_temp.setDate(end_date_temp.getDate()-1);
		start_date.value = date_format(start_date_temp);
	}
	document.getElementById("a_week").onclick = function(){
		date_load();
		start_date_temp.setDate(start_date_temp.getDate()-7);
		start_date.value = date_format(start_date_temp);
	}
	document.getElementById("a_month").onclick = function(){
		date_load();
		start_date_temp.setMonth(end_date_temp.getMonth()-1);
		start_date.value = date_format(start_date_temp);
	}
	document.getElementById("a_quarter").onclick = function(){
		date_load();
		start_date_temp.setMonth(end_date_temp.getMonth()-3);
		start_date.value = date_format(start_date_temp);
	}
	document.getElementById("a_year").onclick = function(){
		date_load();
		start_date_temp.setFullYear(end_date_temp.getFullYear()-1);
		start_date.value = date_format(start_date_temp);
	}
	document.getElementById("months").onchange = function(){
		
		date_load();
		var month = this.value;
		var year = end_date_temp.getFullYear();
		
		if(month==01){
			start_date.value = date_format(new Date(year,0,1));
			end_date.value 	 = date_format(new Date(year,1,0));
		} else if(month==02){
			start_date.value = date_format(new Date(year,1,1));
			end_date.value 	 = date_format(new Date(year,2,0));
		} else if(month==03){
			start_date.value = date_format(new Date(year,2,1));
			end_date.value 	 = date_format(new Date(year,3,0));
		} else if(month==04){
			start_date.value = date_format(new Date(year,3,1));
			end_date.value 	 = date_format(new Date(year,4,0));
		} else if(month==05){
			start_date.value = date_format(new Date(year,4,1));
			end_date.value 	 = date_format(new Date(year,5,0));
		} else if(month==06){
			start_date.value = date_format(new Date(year,5,1));
			end_date.value 	 = date_format(new Date(year,6,0));
		} else if(month==07){
			start_date.value = date_format(new Date(year,6,1));
			end_date.value 	 = date_format(new Date(year,7,0));
		} else if(month==08){
			start_date.value = date_format(new Date(year,7,1));
			end_date.value 	 = date_format(new Date(year,8,0));
		} else if(month==09){
			start_date.value = date_format(new Date(year,8,1));
			end_date.value 	 = date_format(new Date(year,9,0));
		} else if(month==10){
			start_date.value = date_format(new Date(year,9,1));
			end_date.value 	 = date_format(new Date(year,10,0));
		} else if(month==11){
			start_date.value = date_format(new Date(year,10,1));
			end_date.value 	 = date_format(new Date(year,11,0));
		} else if(month==12){
			start_date.value = date_format(new Date(year,11,1));
			end_date.value 	 = date_format(new Date(year,12,0));
		} else {
			alert("입력값 오류");
		}
		
	}
	</script>
	
	
	
	
</body>
</html>