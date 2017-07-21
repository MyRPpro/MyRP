<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "../../setting.jsp" %>


<c:if test = "${newmodify == 'new'}">
<h3>신규 등록</h3>
<form action="warehouse_pro" method = "post">
<input type = "hidden" value = "new" name = "opt">
<table border = "1">
	<tr>
		<th>창고종류</th>
		<th>창고명</th>
		<th>창고주소</th>
	</tr>
	<tr>
		<th>
			<select name = "warehouse_id">
				<option value = "${nomal}">일반창고 / ${nomal}</option>
				<option value = "${bad}">불량창고 / ${bad}</option>
				<option value = "${wait}">대기창고 / ${wait}</option>
			</select>
		</th>
		<th><input type = "text" name = "warehouse_name"></th>
		<th><input type = "text" name = "warehouse_location"></th>
	</tr>
	<tr>
		<th><input type = "submit" value = "확인"></th>
	</tr>
</table>
</form>
</c:if>

<c:if test = "${newmodify == 'modify'}">
<form action="warehouse_pro" method = "post">
<input type = "hidden" value = "modify" name = "opt">
<h3>창고 수정</h3>
<table border = "1">
	<tr>
		<th>창고id</th>
		<th>창고명</th>
		<th>창고주소</th>
	</tr>
	<c:forEach var = "vo" items = "${reg_warehouse_listVos}" >	
			<tr>
				<th><input type = "text" value = "${vo.warehouse_id}" name = "warehouse_id" readonly></th>
				<th><input type = "text" value = "${vo.warehouse_name}" name = "warehouse_name"></th>
				<th><input type = "text" value = "${vo.warehouse_location}" name = "warehouse_location"></th>
			</tr>
		</c:forEach>
	<tr>
		<th><input type = "submit" value = "확인"><input type = "reset" value = "취소"></th>
	</tr>
</table>
</form>

</c:if>
