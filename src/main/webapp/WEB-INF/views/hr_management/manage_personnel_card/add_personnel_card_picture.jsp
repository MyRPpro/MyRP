<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../../setting.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
function addPictureFormCheck(event) {
	//선택된 파일이 있는지 검증
	if(!document.addPictureForm.file.value) {
		alert(msg_addPicture);
		document.addPictureForm.file.focus();
		return false;
	}
	//선택된 파일이 jpg 파일인지 검증
	var fileName = document.addPictureForm.file.value;
	var check = fileName.split(".");
	var check2 = check[1];
	if(check2 != 'jpg' && check2 != 'JPG') {
		alert("jpg파일만 업로드 가능합니다.");
		document.addPictureForm.file.focus();
		return false;
	}
}
function showPicture(msg) {
	alert(msg);
	document.getElementById("addPictureForm").reset();
}
</script>
<body>
<h2 style="text-align: center;">사진 추가</h2>
<h4 style="text-align: center;">이미지 업로드는 확장자가 .jpg인 파일만 가능합니다.</h4>
 	<form method="POST" 
 	action="/hr_management/manage_personnel_card/add_personnel_card_upload"
 	enctype="multipart/form-data" name="addPictureForm" target="employeeImage"
 	onsubmit="return addPictureFormCheck();">
		<table border="1" style="border-collapse: collapse; width:400px; text-align: center;">
			<tr>
				<th colspan="2">
					<iframe name="employeeImage" style="width:0; height:0;"></iframe>
				</th>
			</tr>
			<tr>
				<th>파일</th>
				<td>
				<input type="file" name="file" required="required">
				<input type="hidden" name="name" value="${employee_id}">
				<input type="hidden" name="pwd" value="1">
				<input type="hidden" name="title" value="1">
				<input type="hidden" name="content" value="1">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="작성">
					<input type="reset" value="취소">
					<input type="button" value="닫기" onclick="self.close();">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>