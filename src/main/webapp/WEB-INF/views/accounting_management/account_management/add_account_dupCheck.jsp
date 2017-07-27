<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../../setting.jsp"%>
<script type="text/javascript">
function set_account_id(account_id){
	document.getElementById("account_id").value = "5000" + account_id + "0000";
	document.getElementById("dupCheck").value = 1;
	$('#id_check_msg').slideUp();
	$('#id_check_msg').html("");
}
</script>
<c:if test="${cnt == 0}">
	선택하신 [${account_id}]는 사용가능합니다.
	<input type="button" value="확인" onclick="set_account_id('${account_id}');">
</c:if>
<c:if test="${cnt == 1}">
	선택하신 [${account_id}]는<br>
	[${account_name}]에 사용중입니다.<br>
	다른 account_id를 입력하세요.
</c:if>
</body>
</html>