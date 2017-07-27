<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../../setting.jsp"%>

<h3>재무상태표</h3>
<h4> ${year}년 ${quarter}</h4>
	<table>
		<tr><td>
		<table border="1">
			<tr>
				<th>과목</th>
				<th>계정명</th>
				<th>금액 </th>
				
			</tr>
			<tr>
				<th colspan="3"> 자산 </th>
			</tr>
			<c:forEach var="dtos" items="${dtos}">
				<c:if test="${dtos.account_class.equals('assets')}">
					<tr>
						<td> ${dtos.account_id}</td>
						<td> ${dtos.account_name} </td>
						<td> ${dtos.sum}
							 <c:set var="totalSum" value="${totalSum + dtos.sum}" />
						</td>
					</tr>
				</c:if>
			</c:forEach>
			<c:if test="${assetsCnt-(liabilitiesCnt+capitalCnt) > 0}">
			<c:forEach begin="1" end="${3-(assetsCnt-(liabilitiesCnt+capitalCnt))}" step="1">
				<tr><td colspan="3">ㅇㅇ<td></tr>
			</c:forEach>
			</c:if>
			<tr>
				<th colspan="3" align="right"> 자산총계 : ${totalSum}
				<c:set var="totalSum" value="0" />
				</th>
			</tr>
		</table>
		</td>
		<td>
		<table border="1">
			<tr>
				<th>과목</th>
				<th>계정명</th>
				<th>금액 </th>
			</tr>
			<tr>
				<th colspan="3"> 부채 </th>
			</tr>
			<c:forEach var="dtos" items="${dtos}">
				<c:if test="${dtos.account_class.equals('liabilities')}">
					<tr>
						<td> ${dtos.account_id}</td>
						<td> ${dtos.account_name} </td>
						<td> ${dtos.sum}
							 <c:set var="totalSum" value="${totalSum + dtos.sum}" />
						</td>
					</tr>
				</c:if>
			</c:forEach>
			<tr>
				<th colspan="3"> 부채총계 : ${totalSum}
					<c:set var="right_totalSum" value="${right_totalSum + totalSum}" />
					 <c:set var="totalSum" value="0" />
				</th>
			</tr>
			<tr>
				<th colspan="3"> 자본 </th>
			</tr>	
			<c:forEach var="dtos" items="${dtos}">
				<c:if test="${dtos.account_class.equals('capital')}">
					<tr>
						<td> ${dtos.account_id}</td>
						<td> ${dtos.account_name} </td>
						<td> ${dtos.sum}
							<c:set var="totalSum" value="${totalSum + dtos.sum}" />
						</td>
					</tr>
				</c:if>
			</c:forEach>
			<tr>
				<th colspan="3"> 자본총계 : ${totalSum}
					<c:set var="right_totalSum" value="${right_totalSum + totalSum}" />
				</th>
			</tr>
			<c:if test="${3 < assetsCnt-(liabilitiesCnt+capitalCnt)}">
			<c:forEach begin="1" end="${-(3-(assetsCnt-(liabilitiesCnt+capitalCnt)))}" step="1">
				<tr><td colspan="3">ㅇㅇ<td></tr>
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