<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../../setting.jsp"%>
<div class="panel panel-default">
<div class="panel-heading" style="text-align: center;">
	 현금흐름표<br>
	 <small><fmt:formatDate pattern = "yyyy/MM/dd" value="${startDate}"/> ~ 
	 <fmt:formatDate pattern = "yyyy/MM/dd" value="${endDate}"/></small>
</div>
<div class="panel-body" style="text-align: center;">
<table class="table table-hover">
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
</div>
</div>