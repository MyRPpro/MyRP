<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../../setting.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


	<c:if test="${cnt > 0}">
		<script type="text/javascript">
		
			setTimeout(function(){
				
				var product_name = '${dto.product_name}';
				var employee_name = '${dto.employee_name}';
				var reg_date = '${dto.reg_date}';
				var state_name = '${dto.state_name}';
				
				alert("정상적으로 등록되었습니다.");
				window.location="/purchase_management/input_purchase/reg_purchase"
				+"?product_name="+product_name
				+"?employee_name="+employee_name
				+"?reg_date="+reg_date
				+"?state_name="+state_name
				
				/* self.close();  */
			}, 200);
			
		</script>
	</c:if>
	
	<c:if test="${cnt == 0}">
		<script type="text/javascript">
			alert("등록 중 오류가 발생하였습니다.");
			self.close(); 
			
		</script>
	</c:if>
</body>
</html>