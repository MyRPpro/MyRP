<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../../setting.jsp"%>
<html>
<head>
  <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
  <script src="http://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.2/raphael-min.js"></script>
  <script src="/resources/accounting_management/morris.js"></script>
  <script src="http://cdnjs.cloudflare.com/ajax/libs/prettify/r224/prettify.min.js"></script>
  <!-- <script src="/resources/accounting_management/example.js"></script> -->
  <link rel="stylesheet" href="/resources/accounting_management/example.css">
  <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/prettify/r224/prettify.min.css">
 <!--  <link rel="stylesheet" href="/resources/accounting_management/morris.css"> -->
  <style type="text/css">
  	
  </style>
  <script type="text/javascript">
  var data = [
	  
	 /*  <c:if test="${cnt==0}">
		 등록된 현금거래가 없습니다 
	  </c:if> */
		<c:forEach var="dtos" items="${dtos}">
		<c:set var="cashFlow" value="${cashFlow+dtos.account_value}" />
			<c:if test="${dtos.account_value < 0}">
				<c:set var="minusCash" value="${dtos.account_value}" />
				<c:set var="plusCash" value="null" />
			</c:if>
			<c:if test="${dtos.account_value > 0}">
				<c:set var="plusCash" value="${dtos.account_value}" />
				<c:set var="minusCash" value="null" />
			</c:if>
			
		  {"date":<fmt:formatDate pattern = "yyyyMMddhhmm" value="${dtos.reg_date}"/>, "all_Cash": ${cashFlow} },
		</c:forEach>
	];
	Morris.Line({
	  element: 'graph',
	  data: data,
	  xkey: 'date',
	  ykeys: ['all_Cash'],
	  labels: ['all Cash'],
	  lineColors: ['#132266', '#76B6C4', '#7FCDFF']
	  
	});
  </script>
</head>
<body>
<div class="panel panel-default">
	<div class="panel-body" style="text-align: center;">
		<div id="graph">
		</div>
	</div>
</div>
</body>
</html>
