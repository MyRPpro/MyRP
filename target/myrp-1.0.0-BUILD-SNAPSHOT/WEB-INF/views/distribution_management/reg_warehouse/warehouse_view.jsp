<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "../../setting.jsp" %>
<script type="text/javascript">
/* function chk(){
	var name = document.getElementById("name");
	var loc = document.getElementById("location");
	if(name.value == null || name.value == " " || name.value == ""){
		alert("창고명을 입력하시오.");
		name.focus();
		return false;
	}else if(loc.value == null || loc.value == " " || loc.value ==""){
		alert("창고 주소를 입력하시오.");
		location.focus();
		return;
	}
}
 */</script>

<c:if test = "${newmodify == 'new'}">
<h3>신규 등록</h3>
<form action="warehouse_pro" method = "post" onsubmit = "chk() return false;">
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
		<th><input type = "text" id = "name" name = "warehouse_name" required></th>
		<th><input type = "text" id = "location" name = "warehouse_location" required></th>
	</tr>
	<tr>
		<th><input type = "submit" value = "확인"></th>
	</tr>
</table>
</form>
</c:if>

<c:if test = "${newmodify == 'modify'}">
<form action="warehouse_pro" method = "post" onsubmit = "return chk();">
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
				<th><input type = "text" id = "name" value = "${vo.warehouse_name}" name = "warehouse_name" required></th>
				<th><input type = "text" id = "location" value = "${vo.warehouse_location}" name = "warehouse_location" required></th>
			</tr>
		</c:forEach>
	<tr>
		<th><input type = "submit" value = "확인"><input type = "reset" value = "취소"></th>
	</tr>
</table>
</form>

</c:if>
