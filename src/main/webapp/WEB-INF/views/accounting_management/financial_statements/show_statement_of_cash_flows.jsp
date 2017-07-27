<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../../setting.jsp"%>

<h3>현금흐름표</h3>
<h4> <fmt:formatDate pattern = "yyyy/MM/dd" value="${startDate}"/> ~ 
	 <fmt:formatDate pattern = "yyyy/MM/dd" value="${endDate}"/>
</h4>

<table border="1">
	<tr>
		<th>
			계정
		</th>
		<th>
			금액
		</th>
		<th>
			일시
		</th>
	</tr>
	<c:if test="${cnt==0}">
	<tr>
		<td colspan="3"> 등록된 현금거래가 없습니다 </td>
	</tr>
	</c:if>
	<c:forEach var="dtos" items="${dtos}">
	<tr>
		<td> ${dtos.account_name}</td>
		<td> ${dtos.account_value}</td>
		<td> 
			<fmt:formatDate pattern = "yyyy-MM-dd" value="${dtos.reg_date}"/>
		</td>
	</tr>
	</c:forEach>
</table>
