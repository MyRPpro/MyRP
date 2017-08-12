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
  	#total_balance{
  		 width: 400px;
	 	 height: 300px;
	     margin: 20px auto 0 auto;
  	}
  	#assets{
	     width: 200px;
	 	 height: 200px;
	     margin: 20px auto 0 auto;
  	}
  	#liabilities{
  		 width: 200px;
	 	 height: 200px;
	     margin: 20px auto 0 auto;
  	}
  	#capital{
  		 width: 200px;
	 	 height: 200px;
	     margin: 20px auto 0 auto;
  	}
  	
  </style>
  <script type="text/javascript">
  	<c:forEach var="dtos" items="${dtos}">
		<c:if test="${dtos.account_class.equals('assets')}">
			<c:set var="assets_totalSum" value="${assets_totalSum + dtos.sum}" />
		</c:if>
	</c:forEach>
	<c:forEach var="dtos" items="${dtos}">
		<c:if test="${dtos.account_class.equals('liabilities')}">
			 <c:set var="liabilities_totalSum" value="${liabilities_totalSum + dtos.sum}" />
		</c:if>
	</c:forEach>
	<c:forEach var="dtos" items="${dtos}">
		<c:if test="${dtos.account_class.equals('capital')}"> 
	 		<c:set var="capital_totalSum" value="${capital_totalSum + dtos.sum}" />
	 	</c:if>
	</c:forEach>
	
	Morris.Donut({
		  element: 'total_balance',
		  data: [
			<c:if test="${assets_totalSum+liabilities_totalSum+capital_totalSum==0}">
				{value: 1, label: '데이터가 존재하지 않습니다'},
			</c:if>
			<c:if test="${assets_totalSum+liabilities_totalSum+capital_totalSum!=0}">
				{value: ${assets_totalSum}, label: '자산'},
				{value: ${liabilities_totalSum}, label: '부채'},
				{value: ${capital_totalSum}, label: '자본'}
			</c:if>
		  ],
		 /*  backgroundColor: '#ccc',
		  labelColor: '#060', */
		  colors: [
		    '#50CDFF',
		    '#F5726F',
		    '#FFF666'
		  ],
		  formatter: function (x) { return x}
		});	
	Morris.Donut({
	  element: 'assets',
	  data: [
		<c:if test="${assets_totalSum==0}">
			{value: 1, label: '데이터가 존재하지 않습니다'},
		</c:if>
		<c:if test="${assets_totalSum!=0}">
		<c:forEach var="dtos" items="${dtos}">
			<c:if test="${dtos.sum!=0}">
			<c:if test="${dtos.account_class.equals('assets')}">
				{value: ${dtos.sum}, label: '${dtos.account_name}'},
			</c:if>
			</c:if>
		</c:forEach>
		</c:if>
	  ],
	 /*  backgroundColor: '#ccc',
	  labelColor: '#060', */
	  colors: [
	    '#3191A4',
	    '#34498E',
	    '#93E2F1',
	    '#27AEBD',
	    '#82D6D1'
	  ],
	  formatter: function (x) { return x}
	});
  Morris.Donut({
	  element: 'liabilities',
	  data: [
			<c:if test="${liabilities_totalSum==0}">
				{value: 1, label: '데이터가 존재하지 않습니다'},
			</c:if>
			<c:if test="${liabilities_totalSum!=0}">
			<c:forEach var="dtos" items="${dtos}">
				<c:if test="${dtos.sum!=0}">
				<c:if test="${dtos.account_class.equals('liabilities')}">
					{value: ${dtos.sum}, label: '${dtos.account_name}'},
				</c:if>
				</c:if>
			</c:forEach>
			</c:if>
		  ],
	 /*  backgroundColor: '#ccc',
	  labelColor: '#060', */
	  colors: [
	    '#3191A4',
	    '#34498E',
	    '#93E2F1',
	    '#27AEBD',
	    '#82D6D1'
	  ],
	  formatter: function (x) { return x}
	});
  Morris.Donut({
	  element: 'capital',
	  data: [
			<c:if test="${capital_totalSum==0}">
				{value: 1, label: '데이터가 존재하지 않습니다'},
			</c:if>
			<c:if test="${capital_totalSum!=0}">
			<c:forEach var="dtos" items="${dtos}">
				<c:if test="${dtos.sum!=0}">
				<c:if test="${dtos.account_class.equals('capital')}">
					{value: ${dtos.sum}, label: '${dtos.account_name}'},
				</c:if>
				</c:if>
			</c:forEach>
			</c:if>
		  ],
	 /*  backgroundColor: '#ccc',
	  labelColor: '#060', */
	  colors: [
	    '#3191A4',
	    '#34498E',
	    '#93E2F1',
	    '#27AEBD',
	    '#82D6D1'
	  ],
	  formatter: function (x) { return x}
	});
  </script>
</head>
<body>
<div class="panel panel-primary">
	<div class="panel-heading" style="text-align: center;">
		<h3 class="panel-title">
		재무상태 그래프
		</h3>
	</div>
	<div class="panel-body" style="text-align: center;">
	<table>
		<tr>
			<th colspan="3"> 자산/부채/자본 비율</th>
		</tr>
		<tr> 
			<td colspan="3" id="total_balance"></td>
		</tr>
		<tr>
			<th> 자산 </th>
			<th> 부채 </th>
			<th> 자본 </th>
		</tr>
		<tr>
			<td id="assets"></td>
			<td id="liabilities"></td>
			<td id="capital"></td>
		</tr>
	</table>
	</div>
</div>
</body>
</html>
