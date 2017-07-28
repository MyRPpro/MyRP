<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file = "../setting.jsp" %>
<script type="text/javascript">
	$(function(){
		var role = document.getElementById("role").value;
		var data = {"role" : role}	
		$.ajax({ 					
			data: 	 data,
			type: 	'post',	 			
			url: 	"/state_alarm/state_alarm_pro",
			success: function(response) { 	
				$('#result').html(response);	
			}
		});
		var timer = setInterval(function(){
			$.ajax({ 					
				data: 	 data,
				type: 	'post',	 			
				url: 	"/state_alarm/state_alarm_pro",
				success: function(response) { 	
					$('#result').html(response);	
				}
			}); 
		}, 10000 );
		
	
	});

</script>
</head>
<body >
<input type = "hidden" id = "role" value = "${ROLE.access_role}">
${ROLE.employee_name}님 어서오세요.
<div id = "result"></div>
</body>
</html>