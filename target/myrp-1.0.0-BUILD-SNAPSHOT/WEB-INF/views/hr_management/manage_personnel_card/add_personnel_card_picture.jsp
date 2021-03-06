<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../../setting.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
iframe{
	width: 0px;
	height: 0px;
	border: 0px;
}
</style>
<script type="text/javascript">
	$("#page16321_div01_toggle").bind("click", function(event) {
		$("#page16321_div01").slideToggle();
		return false;
	});
</script>
<body>
	<div class="panel panel-primary" id="page16321">
		<div class="panel-heading">
			<!-- [16321]add_personnel_card_picture.jsp -->
			<h3 class="panel-title">
			<span class="glyphicon glyphicon-user"></span>
				<a id="page16321_div01_toggle">사진 등록</a>
			</h3>
		</div>
		<div class="pnale-body" id="page16321_div01">
			<h2 style="text-align: center;">사진 추가</h2>
			<h4 style="text-align: center;">이미지 업로드는 확장자가 .jpg인 파일만 가능합니다.</h4>
		 	<form method="POST" 
		 	action="/hr_management/manage_personnel_card/add_personnel_card_upload"
		 	enctype="multipart/form-data" name="addPictureForm" id="addPictureForm" target="employeeImage"
		 	onsubmit="return addPictureFormCheck();">
				<table class="table">
					<tr>
						<th colspan="2">
							<iframe name="employeeImage"></iframe>
						</th>
					</tr>
					<tr>
						<th>파일</th>
						<td>
						<input class="form-control input-sm" type="file" name="file" required="required">
						<input type="hidden" name="name" value="${employee_id}">
						<input type="hidden" name="pwd" value="1">
						<input type="hidden" name="title" value="1">
						<input type="hidden" name="content" value="1">
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="btn-group btn-group-default">
								<input class="btn btn-primary btn-sm" type="submit" value="작성">
								<input class="btn btn-default btn-sm"  type="reset" value="취소">
								<input class="btn btn-default btn-sm"  type="button" value="닫기" id="page16321_btn01">
							</div>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
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
		
		function addFilePath(msg) {
			alert(msg);
			document.getElementById("addPictureForm").reset();
		}
		
		$("#page16321_btn01").bind("click", function() {
			$("#page16321").slideUp();
			$("#page16320_div01").slideDown();
			$("#page16332_div01").slideDown();
			return false;
		});
	
	</script>
</body>
</html>