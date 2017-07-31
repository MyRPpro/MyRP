<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file ="../../setting.jsp"%>
<table class="table table-hover">
		<tr>
			<th> 채권/채무 </th>
			<th> 금액 </th>
			<th> 거래처명 </th>
			<th> 등록일 </th>
		</tr>
		<c:if test="${dtosCnt==0}">
		<tr><td colspan="4">	
			존재하는 채권/채무 내역이 없습니다
		</td></tr>
		</c:if>
		<c:forEach var="dtos" items="${dtos}"> 
		<c:if test="${dtos.account_id==500011020000}">
		<tr class="success">
		</c:if>
		<c:if test="${dtos.account_id==500012010000}">
		<tr class="warning">
		</c:if>
			<td>
				<c:if test="${dtos.account_id==500011020000}">
					채권
				</c:if>
				<c:if test="${dtos.account_id==500012010000}">
					채무
				</c:if>
			</td>
			<td>
				${dtos.account_value}
			</td>
			<td>
				${dtos.company_name}
			</td>
			<td>
				<fmt:formatDate pattern = "yyyy/MM/dd" value="${dtos.reg_date}"/>
			</td>
		</tr>
		</c:forEach>
</table>