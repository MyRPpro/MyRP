<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../../setting.jsp"%>
<html>
<head></head>

<body>
<div class="panel panel-default">
<div class="panel-heading" style="text-align: center;">
	 재무상태표<br>
	 <small>${year}년 ${quarter}</small>
</div>
<div class="panel-body" style="text-align: center;">
	<table class="table">
		<tr><td>
		<table class="table table-hover">
			<tr>
				<th colspan="3"> 자산 </th>
			</tr>
			<c:forEach var="dtos" items="${dtos}">
				<c:if test="${dtos.account_class.equals('assets')}">
					<tr>
						<td colspan="2"> ${dtos.account_name} </td>
						<td> ${dtos.sum}
							 <c:set var="assets_totalSum" value="${assets_totalSum + dtos.sum}" />
						</td>
					</tr>
				</c:if>
			</c:forEach>
			<c:if test="${assetsCnt-(liabilitiesCnt+capitalCnt) > 0}">
			<c:forEach begin="1" end="${3-(assetsCnt-(liabilitiesCnt+capitalCnt))}" step="1">
				<tr><td colspan="3"> &nbsp; <td></tr>
			</c:forEach>
			</c:if>
			<tr>
				<th colspan="3" align="right"> 자산총계 : ${assets_totalSum}
				<%-- <c:set var="totalSum" value="0" /> --%>
				</th>
			</tr>
		</table>
		</td>
		<td>
		<table class="table table-hover">
			<tr>
				<th colspan="3"> 부채 </th>
			</tr>
			<c:forEach var="dtos" items="${dtos}">
				<c:if test="${dtos.account_class.equals('liabilities')}">
					<tr>
						<td colspan="2"> ${dtos.account_name} </td>
						<td> ${dtos.sum}
							 <c:set var="liabilities_totalSum" value="${liabilities_totalSum + dtos.sum}" />
						</td>
					</tr>
				</c:if>
			</c:forEach>
			<tr>
				<th colspan="3"> 부채총계 : ${liabilities_totalSum}
					<c:set var="right_totalSum" value="${right_totalSum + liabilities_totalSum}" />
					<%--  <c:set var="totalSum" value="0" /> --%>
				</th>
			</tr>
			<tr>
				<th colspan="3"> 자본 </th>
			</tr>	
			<c:forEach var="dtos" items="${dtos}">
				<c:if test="${dtos.account_class.equals('capital')}">
					<tr>
						<td colspan="2"> ${dtos.account_name} </td>
						<td> ${dtos.sum}
							<c:set var="capital_totalSum" value="${capital_totalSum + dtos.sum}" />
						</td>
					</tr>
				</c:if>
			</c:forEach>
			<tr>
				<th colspan="3"> 자본총계 : ${capital_totalSum}
					<c:set var="right_totalSum" value="${right_totalSum + capital_totalSum}" />
				</th>
			</tr>
			<c:if test="${3 < assetsCnt-(liabilitiesCnt+capitalCnt)}">
			<c:forEach begin="1" end="${-(3-(assetsCnt-(liabilitiesCnt+capitalCnt)))}" step="1">
				<tr><td colspan="3"> &nbsp; 
				<td></tr>
			</c:forEach>
			</c:if>
			<tr>
				<th colspan="3"> 부채 및 자본 총계 : ${right_totalSum}
				</th>
			</tr>
		</table>
		</td>
		</tr>
	</table>
	</div>
	<%-- <div class="panel-body" style="text-align: center; height: 200px;" id="show_graph2">
		<jsp:include page="show_balance_sheet_graph2.jsp"  flush="true">
			  <jsp:param name="assets_totalSum" value="${assets_totalSum}"/>
			  <jsp:param name="liabilities_totalSum" value="${liabilities_totalSum}"/>
			  <jsp:param name="capital_totalSum" value="${capital_totalSum}"/>
		</jsp:include>
	</div> --%>
</div>
</body>
</html>