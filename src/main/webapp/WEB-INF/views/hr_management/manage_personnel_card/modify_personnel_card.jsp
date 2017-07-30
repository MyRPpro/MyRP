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

	$(document).ready(function(){
		var employee_id = "<c:out value='${employee_id}'/>";
		var select_tab = "<c:out value='${select_tab}'/>";
		if(select_tab != null) {
			select_tab = "#"+select_tab;
			switch(select_tab) {
			case "#info":
				$("#page16330_div03 li:eq(0) a").tab("show");
				$(select_tab).load("/hr_management/manage_personnel_card/personnel_card_info"+
						"?employee_id="+employee_id);
				break;
			case "#appoint": 
				$("#page16330_div03 li:eq(1) a").tab("show");
				$(select_tab).load("/hr_management/manage_hr_appointment/personnel_card_appointment"+
						"?employee_id="+employee_id);
				break;
			case "#retired":
				$("#page16330_div03 li:eq(2) a").tab("show");
				$(select_tab).load("/hr_management/manage_retired_employee/personnel_card_retired"+
						"?employee_id="+employee_id);
				break;
			default: break;	
			}
			$(this).tab("show");
			return false;
		}
	});
	
	$("#page16330_div01_toggle").bind("click", function() {
		$("#page16330_div01").slideToggle();
	});

	$("#page16330_div01 a").bind("click", function(event) {
		var employee_id = "<c:out value='${employee_id}'/>";
		var select_tab = $(this).attr("href");
		switch(select_tab) {
		case "#info":
			$(select_tab).load("/hr_management/manage_personnel_card/personnel_card_info"+
					"?employee_id="+employee_id);
			break;
		case "#appoint":
			$(select_tab).load("/hr_management/manage_hr_appointment/personnel_card_appointment"+
					"?employee_id="+employee_id);
			break;
		case "#retired":
			$(select_tab).load("/hr_management/manage_retired_employee/personnel_card_retired"+
					"?employee_id="+employee_id);
			break;
		default: break;	
		}
		$(this).tab("show");
		return false;
	});
</script>
<body>
<div class="panel panel-default" id="page16330">
	<div class="panel-heading">
		<a id="page16330_div01_toggle">[16330]modify_personnel_card.jsp</a>
	</div>
		<div class="panel-body" id="page16330_div01">		
			<div>
			  <!-- Nav tabs -->
			  <ul class="nav nav-tabs" role="tablist" id="page16330_div03">
			    <li role="presentation" class="active"><a href="#info" aria-controls="info" role="tab" data-toggle="tab">INFO</a></li>
			    <li role="presentation"><a href="#appoint" aria-controls="appoint" role="tab" data-toggle="tab">APPOINT</a></li>
			    <li role="presentation"><a href="#retired" aria-controls="retired" role="tab" data-toggle="tab">RETIRED</a></li>
			  </ul>
			  <!-- Tab panes -->
			  <div class="tab-content" id="page16330_div02">
			    <div role="tabpanel" class="tab-pane active" id="info"></div>
				<div role="tabpanel" class="tab-pane" id="appoint"></div>
				<div role="tabpanel" class="tab-pane" id="retired"></div>
			</div>
		</div>
	</div>
</div>
</body>
</html>