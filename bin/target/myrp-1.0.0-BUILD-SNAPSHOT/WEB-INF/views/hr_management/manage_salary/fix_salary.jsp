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

	$("#page16550_div01_toggle").bind("click", function(event) {
		$("#page16550_div01").slideToggle();
		return false;
	});
	
	$("#page16550_btn01").bind("click", function(event) {
		$("form[name='page16522_form01'] input[name='total_pay']").val("<c:out value='${salary_registerVo.total_pay}'/>");
		$("form[name='page16522_form01'] input[name='total_employee']").val("<c:out value='${salary_registerVo.total_employee}'/>");
		$("#page16540").slideUp();
		$("#page16550").slideUp();
		$("#page16522_div01").slideDown();
		
		return false;
	});

	$('#print').click(function(){ //'#print' 는 출력버튼 id
		
		var $table = $("#page16550_div01"); //출력div 설정
		$table.find('a').attr('href',null);
		$table.find('.btn').attr('type','hidden');
		
		var printView = window.open();
		
		printView.document.write( "<head>"); 
		printView.document.write( $('head').html() );
		printView.document.write( '</head>' );
		
		printView.document.write( '<body>' );
		printView.document.write( '<div id = "printSet">' );
		printView.document.write( $table.html() );
		printView.document.write( '</div>' );
		printView.document.write( '</body>' );

		printView.document.write( '<script type="text/javascript">' );
		printView.document.write( 'setTimeout(function(){');
		printView.document.write( 'window.print();');
		printView.document.write( '},10);');
		printView.document.write( 'setTimeout(function(){');
		printView.document.write( 'window.close();');
		printView.document.write( '},20);');
		printView.document.write('</scr');
		printView.document.write('ipt>');
	});
	
</script>
<body>
	<div class="panel panel-primary" id="page16550">
		<div class="panel-heading">
			<!-- <a id="page16550_div01_toggle">[16550]fix_salary.jsp</a> -->
			<h3 class="panel-title">
				<span class="glyphicon glyphicon-user"></span>
				<a id="page16550_div01_toggle">급여 확정</a>
				<button class="btn btn-default btn-sm" id="print">출력</button>
			</h3>
		</div>
		<div class="panel-body" id="page16550_div01">
			<table class="table">
				<tr>
					<th>급여대장 번호</th>
					<th>급여대장명</th>
					<th>등록일</th>
					<th>지급일</th>
					<th>총 지급액</th>
					<th>총 지급인원</th>
					<th>급여상태</th>
					<th>확정여부</th>
				</tr>
				<tr>
					<td>${salary_registerVo.salary_register_id}</td>
					<td>${salary_registerVo.salary_register_name}</td>
					<td>${salary_registerVo.reg_date}</td>
					<td>${salary_registerVo.pay_date}</td>
					<td><fmt:formatNumber value="${salary_registerVo.total_pay}" type="number"/></td>
					<td>${salary_registerVo.total_employee}</td>
					<td>${salary_registerVo.salary_state_name}</td>
					<td>
						<c:if test="${salary_registerVo.salary_state == 26450}">
							<input class="form-control btn-info input-sm" type="button" value="미확정" id="page16550_btn01">						
						</c:if>
						<c:if test="${salary_registerVo.salary_state != 26450}">
							<input class="form-control input-sm btn-success" type="button" value="확정">
						</c:if>
					</td>
				</tr>
			</table>
			<table class="table">
				<tr>
					<th>부서명</th>
					<th>사원번호</th>
					<th>사원명</th>
					<th>기본급</th>
					<th>상여금</th>
					<th>수당</th>
					<th>경비</th>
					<th>지급액</th>
					<th>공제금액</th>
					<th>수령액</th>
				</tr>
				<c:forEach var="dto" items="${salaryDtos}">
				<tr>
					<th>${dto.dept_name}</th>
					<th>${dto.employee_id}</th>
					<th>${dto.employee_name}</th>
					<th><fmt:formatNumber value="${dto.base_pay}" type="number"/></th>
					<th><fmt:formatNumber value="${dto.bonus}" type="number"/></th>
					<th><fmt:formatNumber value="${dto.benefit}" type="number"/></th>
					<th><fmt:formatNumber value="${dto.cost}" type="number"/></th>
					<th><fmt:formatNumber value="${dto.pay}" type="number"/></th>
					<th><fmt:formatNumber value="${dto.deduction_cost}" type="number"/></th>
					<th><fmt:formatNumber value="${dto.takehome_pay}" type="number"/></th>
				</tr>
				</c:forEach>
			</table>
		</div>
		<div class="page16550_div02"></div>
	</div>
</body>
</html>