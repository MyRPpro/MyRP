/**
 * 
 */

$(document).ready(function() {
		$("input").focus(function() {
			var msgId = $(this).attr("name");
			console(msgId);
		});
		$("input").focusout(function() {
			$("#help_console").html("도움말 센터");
		});
	});
	
	function comma(str) { //숫자에 콤마찍기
	    str = String(str);
	    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	}
	
	function uncomma(str) { //숫자에 콤마풀기
	    str = String(str);
	    return str.replace(/[^\d]+/g, '');
	}
	
	function console(msg) { //콘솔창에 메시지 표시
		$("#help_console").html(eval(msg));
	}