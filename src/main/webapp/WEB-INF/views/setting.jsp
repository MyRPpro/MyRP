<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- <script type="text/javascript" src = "https://code.jquery.com/jquery-3.1.1.min.js"></script> -->
<script type="text/javascript" src = "/resources/assest/jquery-1.11.3.js"></script>
<script type="text/javascript" src="/resources/assest/jquery.flot.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/assest/bootstrap.min.css">
<script type="text/javascript" src = "/resources/assest/bootstrap.js"></script>
<script type="text/javascript" src="/resources/hr_management/js/script.js"></script>
<script type="text/javascript" src="/resources/hr_management/js/message.js"></script>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>



<style>
	table, table.table-condensed{
	margin: 0 auto;
	}
	div.row{
	margin-bottom: 0px;
	}
	tr{
	font-size: small
	text-align: center;
	}
	td,th{
	font-size: small
	text-align: center;
	}
	body > .container-fluid{
	padding-bottom: 60px;
	}
	#help_center{
	font-size: small
	}
	#help_console{
	margin-top: 15px;
	}
	
	/*  판매에서 추가 한 부분 시작 */
	.pagination{
	margin-bottom: 0px;
	}
	center{
	margin-top: 10px;
	}
	form{
	margin-bottom: 0px;
	}
	.pagination{
	margin-top: 0px;
	margin-bottom: 15px;
	}
	.btn-group{
	margin-bottom: 10px;
	}
	a{
	vertical-align: center;
	}
	/*  판매에서 추가 한 부분 종료 */
</style>