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
  	#graph{
  		 width: 400px;
	 	 height: 400px;
	     margin: 20px auto 0 auto;
  	}
  	#ratio{
  		 width: 200px;
	 	 height: 200px;
	     margin: 20px auto 0 auto;
  	}
  	
  </style>
  <script type="text/javascript">
//Use Morris.Bar
  Morris.Bar({
    element: 'graph',
    data: [
    	<c:forEach var="dtos" items="${dtos}">
    		<c:if test="${dtos.account_id.equals('500014030000')}">
    			{x: '매출 / 급여 / 매출원가 ',
    			a: ${dtos.sum},
    			<c:set var="SalesSum" value="${SalesSum + dtos.sum}" />
    			<c:set var="firstSales" value="${dtos.sum}" />
    		</c:if>
    		<c:if test="${dtos.account_id.equals('500014010000')}"> /* 급여 */  	
				b: ${-dtos.sum},
			<c:set var="CostSum" value="${CostSum + dtos.sum}" />
			</c:if>	
    		<c:if test="${dtos.account_id.equals('500014020000')}">  /* 매출원가 */
    			c: ${-dtos.sum}},
    			<c:set var="SalesSum" value="${SalesSum - dtos.sum}" />
    	    </c:if>
    	    /* y: 순 이익, a: 판관비 z: 매출원가 */
    	</c:forEach>
    	/* 	{x: '영업이익', y: ${SalesSum}, z: ${CostSum}, a: null}, */
    		<c:set var="SalesProfit" value="${SalesSum-CostSum}" />
    			<fmt:parseNumber  type='number' value='${SalesProfit/10}' var="Tax" integerOnly="true"/>
    		{x: '당기 순 이익 / 법인세비용', a: ${SalesProfit-Tax}, b: ${Tax}, c:null} /* y: 당기순이익, z: 법인세 비용 */
    ],
    xkey: 'x',
    ykeys: ['a', 'b', 'c'],
    labels: [' ',' ',' '
    	/* <c:forEach var="dtos" items="${dtos}">
			<c:if test="${dtos.account_id.equals('500014030000')}">
				'${dtos.account_name}',
			</c:if>
			<c:if test="${dtos.account_id.equals('500014020000')}"> */  /* 매출원가 */
				/* '${dtos.account_name}',
			</c:if>
			<c:if test="${dtos.account_id.equals('500014010000')}">  *//* 급여 */ 
			/* 	'${dtos.account_name}',
			</c:if>	
    	</c:forEach> */
    	/* '당기순이익',
    	'법인세비용' */],
    barColors: ['#4496D2', '#F0A920', '#45C7D4', '#383C4A'],
    stacked: true
  });
  
  Morris.Donut({
	  element: 'ratio',
	  data: [
			<c:if test="${firstSales==(SalesProfit-Tax)}">
						{value: 1, label: '비용이 존재하지 않습니다'},
			</c:if>
			<c:if test="${firstSales!=(SalesProfit-Tax)}">
				<c:forEach var="dtos" items="${dtos}">
					<c:if test="${dtos.account_id.equals('500014010000')}"> /* 급여  */
						{value: ${dtos.sum}, label: '${dtos.account_name}'},
					</c:if>
					<c:if test="${dtos.account_id.equals('500014020000')}">  /* 매출원가 */
						{value: ${dtos.sum}, label: '${dtos.account_name}'},	
					</c:if>
				</c:forEach>
						{value: ${Tax}, label: '법인세비용'}
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
		손익상태 그래프
		</h3>
	</div>
	<div class="panel-body" style="text-align: center;">
		<table class="table">
			<tr>
				<th> 매출 / 비용 비율 </th>
			</tr>
			<tr>
				<td id="graph"></td>
			</tr>
			<tr>
				<th> 비용 비율 </th>
			</tr>
			<tr>
				<td id="ratio"></td>
			</tr>
		</table>
	</div>
</div>
</body>
</html>
