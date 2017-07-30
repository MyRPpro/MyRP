<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../../setting.jsp"%>
<script type="text/javascript">
function set_connected_id(connected_id, account_id, account_name, account_value, typeCnt){
	document.getElementById("connected_id").value = connected_id;
	document.getElementById("account_id").value = account_id;
	document.getElementById("account_name").value = account_name;
	document.getElementById("account_value").value = account_value;
	document.getElementById("typeCnt").value = typeCnt;
}

function set_statement_account_id(account_id, account_name, account_value, typeCnt){
	document.getElementById("account_id").value = account_id;
	document.getElementById("account_name").value = account_name;
	document.getElementById("account_value").value = account_value;
	document.getElementById("typeCnt").value = typeCnt;
	if(typeCnt==4){ // tax 선택
		if(account_id == "500012020000"){//부가세예수금 =>출금전표
			document.getElementById("statement_type").value = "54105";
		}else{ //부가세대급금 => 입금전표
			document.getElementById("statement_type").value = "54104";
		}
	}
	if(typeCnt==3){ // salary 선택
		document.getElementById("statement_type").value = "54103";
	}
}
</script>
	<h5> 연결 ID </h5>
	<table border="1">
		<c:if test="${access_role.equals('SA') || access_role.equals('PU') || access_role.equals('HR')}">
		<tr>
				<th> 연결ID </th>
				<th> 계정명 </th>
				<th> 계정금액 </th>
				<th> 등록일 </th>
		</tr>
		</c:if>

		<c:if test="${access_role.equals('FI')}">
		<tr>
			<th> 계정명 </th>
			<th> 계정금액 </th>
		</tr>
		</c:if>
		<c:if test="${access_role.equals('SA')}"> <!-- sales -->
		<c:if test="${sales_Cnt==0}">
		<tr>
			<td colspan="4"> 존재하는 판매주문이 없습니다 </td>
		</tr>
		</c:if>
		<c:forEach var="dto" items="${sales_dtos}">
		<tr>
			<td> 
			${dto.sales_id} </td>
			<td><a href="javascript:void(0);" onclick="set_connected_id(${dto.sales_id},${dto.account_id},'${dto.account_name}', ${dto.account_value},1);">
			${dto.account_name} </a></td>
			<td> ${dto.account_value}</td>
			<td> ${dto.reg_date}</td>
		</tr>
		</c:forEach>	
	</c:if>
	<c:if test="${access_role.equals('PU')}">
		<c:if test="${purchase_Cnt==0}">
		<tr>
			<td colspan="4"> 존재하는 구매주문이 없습니다 </td>
		</tr>
		</c:if>
		<c:forEach var="dto" items="${purchase_dtos}">
		<tr>
			<td> ${dto.purchase_id} </td>
			<td><a href="javascript:void(0);" onclick="set_connected_id(${dto.purchase_id},${dto.account_id},'${dto.account_name}', ${dto.account_value},2)">
			${dto.account_name}</a></td>
			<td> ${dto.account_value}</td>
			<td> ${dto.reg_date}</td>
		</tr>
		</c:forEach>
	</c:if>

	<c:if test="${access_role.equals('HR')}"> <!-- salary -->
		<c:if test="${salary_Cnt==0}">
		<tr>
			<td colspan="4"> 존재하는 급여주문이 없습니다 </td>
		</tr>
		</c:if>
		<c:forEach var="dto" items="${salary_dtos}">
		<tr>
			<td> ${dto.salary_register_id} </td>
			<td><a href="javascript:void(0);" onclick="set_connected_id(${dto.salary_register_id},${dto.account_id},'${dto.account_name}', ${dto.account_value},3)">
			${dto.account_name}
			 </a> 
			</td>
			<td> ${dto.account_value}</td>
			<td> ${dto.reg_date}</td>
		</tr>
		</c:forEach>
	</c:if>
	<c:if test="${access_role.equals('FI')}"> <!-- tax -->
		<c:if test="${tax_Cnt==0}">
		<tr>
			<td colspan="2"> 존재하는 세금내역이 없습니다 </td>
		</tr>
		</c:if>
		<c:forEach var="dto" items="${tax_dtos}">
		<tr>
			<td><a href="javascript:void(0);" onclick="set_statement_account_id(${dto.account_id},'${dto.account_name}', ${dto.account_value},4)">
				${dto.account_name}</a>
			</td>
			<td>
				${dto.account_value}
			</td>
		</tr>
		</c:forEach>
	</c:if>
	
	</table>
</body>
</html>