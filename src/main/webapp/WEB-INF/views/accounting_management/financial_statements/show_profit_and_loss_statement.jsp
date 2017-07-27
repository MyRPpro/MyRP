<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../../setting.jsp"%>

<h3>손익계산서</h3>
<h4> <fmt:formatDate pattern = "yyyy/MM/dd" value="${startDate}"/> ~ 
	 <fmt:formatDate pattern = "yyyy/MM/dd" value="${endDate}"/>
</h4>
<table border="1">
	<tr>
		<th colspan="2"> 매출액 </th>
	</tr>
	<c:forEach var="dtos" items="${dtos}">
	<c:if test="${dtos.account_id.equals('500014030000')}"> <!-- 매출액 -->
	<tr>	
		<td> ${dtos.account_name} </td>
		<td> ${dtos.sum}
			 <c:set var="SalesSum" value="${SalesSum + dtos.sum}" />
		</td>
	</tr>
	</c:if>
	<c:if test="${dtos.account_id.equals('500014020000')}"> <!-- 매출원가 -->
	<tr>	
		<td> ${dtos.account_name} </td>
		<td> ${dtos.sum}
			 <c:set var="SalesSum" value="${SalesSum + dtos.sum}" />
		</td>
	</tr>
	</c:if>
	</c:forEach>
	<tr>
		<th colspan="2"> 매출 총 이익 : ${SalesSum} </th>
	</tr>
	<tr>
		<th colspan="2"> 판관비 </th>
	</tr>
	<c:forEach var="dtos" items="${dtos}">
	<c:if test="${dtos.account_id.equals('500014010000')}"> <!-- 판관비 (급여) -->
	<tr>	
		<td> ${dtos.account_name} </td>
		<td> ${dtos.sum}
			 <c:set var="CostSum" value="${CostSum + dtos.sum}" />
		</td>
	</tr>
	</c:if>
	</c:forEach>
	<tr>
		<th colspan="2"> 판관비 총 비용 : ${CostSum} </th>
	</tr>
	<tr>
		<th colspan="2"> 영업 이익 : ${SalesSum-CostSum}
			 <c:set var="SalesProfit" value="${SalesSum-CostSum}" />
		</th>
	</tr>
	<tr>
		<th colspan="2"> 법인세 비용 차감 전 순 이익 : ${SalesProfit}</th>
	</tr>
	<tr>	
		<fmt:parseNumber  type='number' value='${SalesProfit/10}' var="Tax" integerOnly="true"/>
		<th colspan="2"> 법인세 비용 : ${Tax} </th>
	</tr>
	<tr>
		<th colspan="2"> 당기 순 이익 : ${SalesProfit - Tax}</th>
	</tr>
</table>