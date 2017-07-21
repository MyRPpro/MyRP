<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h3> 판매내역 수정 페이지 : modify_sales.jsp</h3>
	
	<!-- <form action="/sales_management/search_sales/modify_sales_pro" -->
	
	<form action="/sales_management/search_sales/modify_sales_pro"
		id="modify_sales_form1" method="post">
		
		
		<table id="modify_sales_form2" border="1">
		
			<tr>
				<!-- 1  --> <th>sales</th>
				<!-- 2  --> <th>account</th>
				<!-- 3  --> <th>order</th>
				<!-- 4  --> <th>product</th>
				<!-- 5  --> <th>company</th>
				<!-- 6  --> <th>employee</th>
				<!-- 7  --> <th>reg_date</th>
				<!-- 8  --> <th>update_date</th>
				<!-- 9  --> <th>storage_out_date</th>
				<!-- 10 --> <th>count_sales</th>
				<!-- 11 --> <th>selling_price</th>
				<!-- 12 --> <th>sales_state</th>
				<!-- 13 --> <th>condition_note_receivable</th>
			</tr>
			
			
			<tr>
				<!-- 1  --> <th> </th>
				<!-- 2  --> <th> </th>
				<!-- 3  --> <th> </th>
				<!-- 4  --> <th>
							<select id="reg_product" >
								<option value="0">상품선택</option>
								<c:forEach var="product" items="${dtos_product}">
									<option value="${product.product_id}">${product.product_name}</option>
								</c:forEach>
							</select>
							</th>
				<!-- 5  --> <th>
							<select id="reg_company" >
								<option value="0">거래처선택</option>
								<c:forEach var="company" items="${dtos_company}">
									<option value="${company.company_id}">${company.company_name}</option>
								</c:forEach>
							</select>
							</th>
				<!-- 6  --> <th>
							<select id="reg_employee" >
								<option value="0">담당자선택</option>
								<c:forEach var="employee" items="${dtos_employee}">
									<option value="${employee.employee_id}">${employee.employee_name}</option>
								</c:forEach>
							</select>
							</th>
				<!-- 7  --> <th>
							<c:set var="now" value="<%= new java.util.Date() %>"/>
								<input type="date" id="reg_reg_date" value="<fmt:formatDate value='${now}' pattern='yyyy-MM-dd'/>">
							</th>
				<!-- 8  --> <th>
							<c:set var="now" value="<%= new java.util.Date() %>"/>
								<input type="date" id="reg_update_date" value="<fmt:formatDate value='${now}' pattern='yyyy-MM-dd'/>">
							</th>
				<!-- 9  --> <th>
								<c:set var="now" value="<%= new java.util.Date() %>"/>
								<input type="date" id="reg_storage_out_date" value="<fmt:formatDate value='${now}' pattern='yyyy-MM-dd'/>">
							</th>
				<!-- 10 --> <th>
								<c:set var="reg_dto" value="${dtos[0]}"/>
								<input type="number" id="reg_count_sales" value="${reg_dto.count_sales}" min="1" max="9999" required >
							</th>
				<!-- 11 --> <th>
								<input type="text" id="reg_selling_price" value="${reg_dto.selling_price}" min="1" max="999999999" required>
								<!-- onchange="return this.value = SetComma3(this.value)"  -->
								 
							</th>
				<!-- 12 --> <th> </th>
				<!-- 13 --> <th>
								<input type="number" id="reg_condition_note_receivable" value="${reg_dto.condition_note_receivable}" min="1" max="12" required>
							</th>
			</tr>
			
			
			
			<tr>	
				<td>
					<c:forEach var="dto" items="${dtos}">
						<input type="text" name="sales_id" 	value="${dto.sales_id}" maxlength="10" readonly required >
					</c:forEach>
				</td>
				
				<td>
					<c:forEach var="dto" items="${dtos}">
						<input type="hidden" name="account_id" value="${dto.account_id}" readonly >
						<input type="text" name="account_name" value="${dto.account_name} 계정" readonly required >
					</c:forEach>
				</td>
				
				<td>
					<c:forEach var="dto" items="${dtos}">
						<input type="text" name="order_id" value="${dto.order_id}" readonly >
					</c:forEach>
				</td>
				
				<td>
					<c:forEach var="dto" items="${dtos}">
						<input type="hidden" name="product_id" value="${dto.product_id}"  readonly >
						<input type="text" name="product_name" value="${dto.product_name}"  readonly required >
					</c:forEach>
				</td>
				
				<td>
					<c:forEach var="dto" items="${dtos}">
						<input type="hidden" name="company_id" value="${dto.company_id}" readonly >
						<input type="text" name="company_name" value="${dto.company_name}" readonly required >
					</c:forEach>
				</td>
				
				<td>
					<c:forEach var="dto" items="${dtos}">
						<input type="hidden" name="employee_id" value="${dto.employee_id}"readonly >
						<input type="text" name="employee_name" value="${dto.employee_name}" readonly required >
					</c:forEach>
				</td>
				
				<td>
					<c:forEach var="dto" items="${dtos}">
						<input type="date" name="reg_date" value="${dto.reg_date}" readonly required >
					</c:forEach>
				</td>
				
				<td>
					<c:forEach var="dto" items="${dtos}">
						<input type="date" name="update_date" value="${dto.update_date}" readonly required >
					</c:forEach>
				</td>
				
				<td>
					<c:forEach var="dto" items="${dtos}">
						<input type="date" name="storage_out_date" value="${dto.storage_out_date}" readonly required >
					</c:forEach>
				</td>
				
				<td>
					<c:forEach var="dto" items="${dtos}">
						<input type="number" name="count_sales" value="${dto.count_sales}" readonly required >
					</c:forEach>
				</td>
				
				<td>
					<c:forEach var="dto" items="${dtos}">
						<input type="number" name="selling_price" id="selling_price" 
						value="${dto.selling_price}" readonly required  >
					</c:forEach>
					<%-- <fmt:formatNumber value="${dto.selling_price}" type="currency" currencySymbol="￦" />" --%>
				</td>
				
				<td>
					<c:forEach var="dto" items="${dtos}">
						<input type="hidden" name="sales_state" value="${dto.sales_state}"  readonly required>
						<input type="text" name="state_name" value="${dto.state_name}"  readonly required>
					</c:forEach>
				</td>
				
				<td>
					<c:forEach var="dto" items="${dtos}">
						<input type="number" name="condition_note_receivable" value="${dto.condition_note_receivable}" readonly required >
					</c:forEach>
				</td>
				
			</tr>
			
		</table>
		
		<table>
			<tr>
				<th colspan="2">
					<input type="submit" value="수정하기">
					<input type="reset"	value="재작성">
					(
					<input type="reset"	value="견적승인">
					<input type="reset"	value="승인취소">
					<- 승인권자 메뉴)
				</th>
			</tr>
		</table>
			
	</form>	
			
	<script type="text/javascript">
	
		// 수정한 값 대입
		
		$(function(){
			var reg_value="";
			$('#reg_product').change(function(){
				$('#reg_product option:selected').each(function(){
					$('input[name="product_name"]').val($(this).text());
					$('input[name="product_id"]').val($(this).val());
				})
			})
			$('#reg_company').change(function(){
				$('#reg_company option:selected').each(function(){
					$('input[name="company_name"]').val($(this).text());
					$('input[name="company_id"]').val($(this).val());
				})
			})
			$('#reg_employee').change(function(){
				$('#reg_employee option:selected').each(function(){
					$('input[name="employee_name"]').val($(this).text());
					$('input[name="employee_id"]').val($(this).val());
				})
			})
			$('#reg_reg_date').change(function(){
				$('input[name="reg_date"]').val($(this).val());
			})
			$('#reg_update_date').change(function(){
				$('input[name="update_date"]').val($(this).val());
			})
			$('#reg_storage_out_date').change(function(){
				$('input[name="storage_out_date"]').val($(this).val());
			})
			$('#reg_count_sales').change(function(){
				$('input[name="count_sales"]').val($(this).val());
			})
			var price, tax, sum = 0;
			$('#reg_selling_price').change(function(){
				price = Number($(this).val());
				tax = price/10;
				sum = price + tax;
				$('input[name="selling_price"]').eq(0).val(tax);
				$('input[name="selling_price"]').eq(1).val(price);
				$('input[name="selling_price"]').eq(2).val(sum);
			})
			
			$('#reg_condition_note_receivable').change(function(){
				$('input[name="condition_note_receivable"]').val($(this).val());
			})
		});
		

		
		/* 
		function reg_modify(){
			
			var reg_product = document.getElementById("reg_product").value
			var reg_company = document.getElementById("reg_company").value
			var reg_employee = document.getElementById("reg_employee").value
			var reg_product = document.getElementById("reg_product").value
			var reg_product = document.getElementById("reg_product").value
			
		}
		
		
		$('#btn1').click(function(){
			
			var arr = $('#modify_sales_form2').serializeArray().map(function(item) {
				return item.value
				});
			alerrt(arr);
		});
		
		
		
		$('#btn1').click(function(){
			
			var table = $('#modify_sales_form2').DataTable();
			 
			$('#modify_sales_form2 tbody').on( 'click', 'tr', function () {
				this_row = table.rows(this).data();
				$('#result').innerhtml( "모든 데이터: "+table.row( this ).data()+
						"<br>값:"+this_row[0][0]+"<br>직위:"+this_row[0][1]+"<br>직업:"+this_row[0][2] );
			})
		});
		
		var table = '';
		function c1(rows)
		{
			this_row = table.rows(rows).data();
			$('#rlt2').html( "성명:"+this_row[0][0]+"<br>직위:"+this_row[0][1]+"<br>직업:"+this_row[0][2] );
		}

		$(function(){
			table = $('#modify_sales_form2').DataTable();
		});
		 */

		// 사원번호 자리수 제한 
		function employee_id_check(){
			var employee_id = document.getElementsByName("employee_id")[0];
			console.log( "employee_id.value.length : " + employee_id.value.length);
			if( employee_id.value.length > 4 ){
				alert("4자리 까지만 입력이 가능합니다.");
				employee_id.value = employee_id.value.substring(0,4);
			}
		}

		/* 
		function load_row(){
			var reg_table = document.getElementById("modify_sales_form2");
			
			 var rowLen = reg_table.rows.length;
		     var celLen = reg_table.cells.length;
		     
		     for(var i = 0; i <= rowLen; i++)
		     {
		    	 alert(reg_table.rows[i].cells[0].innerHTML);
		    	 
		       break;
		     }
			return false;
		}
		
		
		function comma(str) {
		    str = Number(str);
		    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
		}
		
		function spot(obj) {
		    obj.value = comma(uncomma(obj.value));
		}
		  */

		
		
	</script>
	
	
	
	<script type="text/javascript">
	
	var rgx1 = /\D/g;  // /[^0-9]/g 와 같은 표현
	var rgx2 = /(\d+)(\d{3})/; 
	
	function getNumber(obj){
	     var num01;
	     var num02;
	     num01 = obj.value;
	     num02 = num01.replace(rgx1,"");
	     num01 = setComma(num02);
	     
	     console.log("num01"+num01)
	     obj.value =  num01;
	}

	function setComma(inNum){
	     var outNum;
	     outNum = inNum; 
	     while (rgx2.test(outNum)) {
	          outNum = outNum.replace(rgx2, '$1' + ',' + '$2');
	      }
	     return outNum;
	}
	
	function thousandSeparatorCommas ( number ){ 

		 var string = number + ""; // 숫자일 경우, 문자로 바꾸기. 
		 string = string.replace( /^\s+|\s+$|,|[^+-\.\d]/g, "" ) // ±기호, 소수점, 숫자가 아닌 부분은 지우기. 
		 var regExp = /([+-]?\d+)(\d{3})(\.\d+)?/; // 필요한 정규식. 
		 while ( regExp.test( string ) ) string = string.replace( regExp, "$1" + "," + "$2" + "$3" ); // 쉼표 삽입. 
		 return string; 
	}
	
	function changeText (){ 

		 var demo1 = document.getElementById( "selling_price" ); 
		 var text = demo1.innerHTML; 
		 var change = thousandSeparatorCommas( text ); 
		 demo1.innerHTML = change; 
	} 
	
	
	
	Number.prototype.format = function(){
	    if(this==0) return 0;
	 
	    var reg = /(^[+-]?\d+)(\d{3})/;
	    var n = (this + '');
	 
	    while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');
	 
	    return n;
	};
	
	// 숫자 타입 test
	var num = 123456.012;
	//console.log(num.format());               // 123,456.012
	 
	num = 13546745;
	//console.log(num.format());               // 13,546,745
	 
	
	
	function setComma2(num) {
 
	   if(num == null || num == ''){
	     return 0;
	    }
	   var reg = /(^[+-]?\d+)(\d{3})/;   
	   num = num.toString();                          
	   while (reg.test(num))
	     num = num.replace(reg, '$1' + ',' + '$2');
	   return Number(num);
	} 


	function SetPriceInput(str)
	{
	str=str.replace(/,/g,'');
	var retValue = "";
	        for(i=1; i<=str.length; i++)
	        {
	if(i > 1 && (i%3)==1) 
	          retValue = str.charAt(str.length - i) + "," + retValue;
	          else 
	          retValue = str.charAt(str.length - i) + retValue;    
	        }
	        return retValue;
	}
	
	// input 텍스트에 숫자만 콤마 찍어가면서 받기
	$('#reg_selling_price').on("keypress", "input[type=text].number", function () {
	    if  ((event.keyCode < 48 || event.keyCode > 57) && (event.keyCode < 96 || event.keyCode > 105) && (event.keyCode != 8) && (event.keyCode != 46))
	        event.returnValue = false;
	});
	 
	$('#reg_selling_price').on("keyup", "input[type=text].number", function () {
	    var $this = $(this);
	    var num = $this.val().replace(/[,]/g, "");
	 
	    var parts = num.toString().split(".");
	    parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	    $this.val(parts.join("."));
	});
	 
	
	/*  
	//천 단위 콤마 찍고 숫자인지 아닌지 검증하는 함수
	function SetComma3(str){
	str=str.replace(/,/g,'');
	var retValue = "";
	
	if(isNaN(str)==false){
	        for(i=1; i<=str.length; i++)
	        {
	if(i > 1 && (i%3)==1) 
	          retValue = str.charAt(str.length - i) + "," + retValue;
	          else 
	          retValue = str.charAt(str.length - i) + retValue;    
	        }
	    }
	    else
	    	 alert("숫자만 입력 가능합니다 숫자만 입력 해주세요"); 
	        return 0;
	}
	 */
	 // 0이면 리턴
	 function checkzero(){
		 var zero = document.getElementById("selling_price").value;
		 if(zero <= 0){
			 alert("양수로 입력해주세요.");
			 return false;
		 }
	 }



	 
	

	</script>
	
</body>
</html>















	<%--  예전코드	
	<form action="/sales_management/search_sales/modify_sales_pro"
		name="modify_sales_form" method="post">
				
			
		<table border="1">
			<tr>
				<th>sales_id</th>
				<td>
					<input type="text" name="sales_id" 	value="${dto.sales_id}" maxlength="10" readonly >
				</td>
			</tr>
			<tr>
				<th>account_id</th>
				<td>
					<input type="hidden" name="account_id" id="account_id" value="${dto.account_id}" readonly >
					<input type="text" name="account_name" id="account_name" value="${dto.account_name} 계정" readonly >
					
					<select id="reg_account_id" >
						<option value="${dto.account_id}" selected > 초기값 </option>
						<option value="500011060000">상품매출</option>
						<option value="500012020000">부가세예수금</option>
						<option value="500011020000">매출채권</option>
					</select>	
					
				</td>
			</tr>
			<tr>
				<th>order_id</th>
				<td>
					<input type="text" name="order_id" value="${dto.order_id}" maxlength="12" readonly >
				</td>
			</tr>
			<tr>
				<th>product_id</th>
				<td>
					
					<input type="text" name="product_id" id="product_id" value="${dto.product_id}" maxlength="20" readonly >
					<select id="reg_product_id" >
						<option value="0" selected > 상품 선택</option>
						<c:forEach var="product" items="${dtos_product}">
							<option value="${product.product_id}">${product.product_name}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th>company_name</th>
				<td>
					<input type="hidden" name="company_id" id="company_id" value="${dto.company_id}">
					<input type="text" name="company_name" id="company_name" value="${dto.company_name}" readonly  >
					<select id="reg_company_id" >
						<option value="0" selected > 거래처 선택 </option>
						<c:forEach var="company" items="${dtos_company}">
							<option value="${company.company_id}">${company.company_name}</option>
						</c:forEach>
					</select>
					
				</td>
			</tr>
			<tr>
				<th>employee_id</th>
				<td>
					<input type="text" name="employee_id" id="employee_id" value="${dto.employee_id}" 
					maxlength="5" required readonly >
					<select id="reg_employee_id" >
						<option value="0" selected > 담당자 선택 </option>
						<c:forEach var="employee" items="${dtos_employee}">
							<option value="${employee.employee_id}">${employee.employee_name}</option>
						</c:forEach>
					</select>
					
				</td>
			</tr>
			<tr>
				<th>reg_date</th>
				<td>
					<input type="date" name="reg_date" value="${dto.reg_date}"  >
				</td>
			</tr>
			
			<tr>
				<th>update_date</th>
				<td>
					<input type="date" name="update_date" value="${dto.update_date}" >
				</td>
			</tr>
			<tr>
				<th>storage_out_date</th>
				<td>
					<input type="date" name="storage_out_date" value="${dto.storage_out_date}" >
				</td>
			</tr>
			<tr>
				<th>count_sales</th>
				<td>
					<input type="number" name="count_sales" value="${dto.count_sales}" 
					min="1" max="9999" required>
				</td>
			</tr>
			<tr>
				<th>selling_price</th>
				<td>
					<input type="number" name="selling_price" value="${dto.selling_price}" 
					min="1" max="9999999999" required>
				</td>
			</tr>
			<tr>
				<th>sales_state</th>
				<td>
					<input type="number" name="sales_state" value="${dto.sales_state}" 
					min="1" max="29999" readonly>
				</td>
			</tr>
			<tr>
				<th>condition_note_receivable</th>
				<td>
					<input type="number" name="condition_note_receivable" value="${dto.condition_note_receivable}" 
					min="1" max="12" required>
				</td>
			</tr>

			
			<tr>
			<th colspan="2">
				<input type="submit" value="수정하기">
				<input type="reset"	value="재작성">
				(
				<input type="reset"	value="견적승인">
				<input type="reset"	value="승인취소">
				<- 승인권자 메뉴)
			</th>
		</tr>
			
		</table>
	</form>
	
		
	<script type="text/javascript">
	
		// 수정한 값 대입
		
		$(function(){
			$('#reg_product_id').change(function(){
				$('#reg_product_id option:selected').each(function(){
					$('#product_id').val($(this).val());
				})
			})
			$('#reg_company_id').change(function(){
				$('#reg_company_id option:selected').each(function(){
					$('#company_name').val($(this).text());
					$('#company_id').val($(this).val());
				})
			})
			$('#reg_employee_id').change(function(){
				$('#reg_employee_id option:selected').each(function(){
					$('#employee_id').val($(this).val());
				})
			})
		});
	
		// 사원번호 자리수 제한 
		function employee_id_check(){
			var employee_id = document.getElementsByName("employee_id")[0];
			console.log( "employee_id.value.length : " + employee_id.value.length);
			if( employee_id.value.length > 4 ){
				alert("4자리 까지만 입력이 가능합니다.");
				employee_id.value = employee_id.value.substring(0,4);
			}
		}
	</script>
	
		
 --%>	