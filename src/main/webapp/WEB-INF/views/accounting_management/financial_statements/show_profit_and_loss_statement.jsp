<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../../setting.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>손익계산서</h3>
<button onclick="window.location='/'"> 홈으로 </button>
<input type="button" value="뒤로가기" onclick="window.history.back();">

<table border="1">
	<tr>
		<th> account_id</th>
		<th> account_name</th>
		<th> account_value</th>
	</tr>
	<tr>
		<th colspan="3"> 매출액 </th>
	</tr>
	<c:forEach var="dtos" items="${dtos}">
	<c:if test="${dtos.account_id.equals('500014030000')}"> <!-- 매출액 -->
	<tr>	
		<td> ${dtos.account_id}</td>
		<td> ${dtos.account_name} </td>
		<td> ${dtos.sum}
			 <c:set var="SalesSum" value="${SalesSum + dtos.sum}" />
		</td>
	</tr>
	</c:if>
	<c:if test="${dtos.account_id.equals('500014020000')}"> <!-- 매출원가 -->
	<tr>	
		<td> ${dtos.account_id}</td>
		<td> ${dtos.account_name} </td>
		<td> ${dtos.sum}
			 <c:set var="SalesSum" value="${SalesSum + dtos.sum}" />
		</td>
	</tr>
	</c:if>
	</c:forEach>
	<tr>
		<th colspan="3"> 매출 총 이익 : ${SalesSum} </th>
	</tr>
	<tr>
		<th colspan="3"> 판관비 </th>
	</tr>
	<c:forEach var="dtos" items="${dtos}">
	<c:if test="${dtos.account_id.equals('500014010000')}"> <!-- 판관비 (급여) -->
	<tr>	
		<td> ${dtos.account_id}</td>
		<td> ${dtos.account_name} </td>
		<td> ${dtos.sum}
			 <c:set var="CostSum" value="${CostSum + dtos.sum}" />
		</td>
	</tr>
	</c:if>
	</c:forEach>
	<tr>
		<th colspan="3"> 판관비 총 비용 : ${CostSum} </th>
	</tr>
	<tr>
		<th colspan="3"> 영업 이익 : ${SalesSum-CostSum}
			 <c:set var="SalesProfit" value="${SalesSum-CostSum}" />
		</th>
	</tr>
	<tr>
		<th colspan="3"> 법인세 비용 차감 전 순 이익 : ${SalesProfit}</th>
	</tr>
	<tr>	
		<fmt:parseNumber  type='number' value='${SalesProfit/10}' var="Tax" integerOnly="true"/>
		<th colspan="3"> 법인세 비용 : ${Tax} </th>
	</tr>
	<tr>
		<th colspan="3"> 당기 순 이익 : ${SalesProfit - Tax}</th>
	</tr>
</table>
</body>
</html>