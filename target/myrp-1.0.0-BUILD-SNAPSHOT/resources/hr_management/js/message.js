/**
 * 도움말
 * 화면상에 존재하는 input tag를 focus-in할 경우 이 파일에서 정의한 문자열을 help_console에 출력하고
 * focus-out할 경우 출력된 문자열을 다시 삭제합니다.
 * 
 * 사용방법
 * 변수명은 input tag의 name속성 값을 사용합니다.
 * 주로 사용된 속성의 제약조건 정보와 그 속성의 목적을 표시할 예정입니다.
 * 자신이 담당한 모듈명 아래에 도움말 정보를 입력하세요.
 * 예시) var hr_code_id		= "인사코드 번호: 3자리 숫자|중복확인 필요|인사코드의 키값";
 */

/**
 * 공통
 */
var use_state 		= "사용상태 체크 (Y:사용, N:비사용)";

/**
 * 기초 등록
 */
var biz_reg_no				= "사업자 등록번호: 문자12자 | 필수입력사항";
var ceo_name 				= "대표자";
var corp_reg_no				= "법인 등록번호";
var biz_type				= "업태";
var biz_item				= "업종";
var company_type			= "회사 유형";
var purchase_unit_price		= "구매단가";
var sale_unit_price			= "판매단가";
/**
 * 판매 관리
 */

// reg_sales
var storage_out_date	= "출고일 : YYYY-MM-DD 형식";
var count_sales = "판매수량 : 4자리 정수";
var selling_price = "판매가 : 9자리 정수 ";
var condition_note_receivable = "어음기간 0~12개월 이하";
var sales_state = "판매상태";

// reg_sales_table
var reg_sales_statement = "전표등록하기";
var sales_id = "판매번호";
var req_storage_out = "출고 요청하기 ";
var reg_sales_confrim	= "회계전표 입력하기"

//modify_sales
var reg_reg_date = "등록일 : YYYY-MM-DD 형식";
var reg_storage_out_date = "출고일 : YYYY-MM-DD 형식";
var reg_count_sales = "판매수량 : 숫자 | 4자리";
var reg_selling_price = "판매가격 : 숫자 | 9자리";
var btn_modify = "수정버튼";

//sales_list 
var search_str = "판매번호 검색";
var btn_all_list = "전체목록";
var req_confirm = "승인요청";
var req_sales_statement = "전표승인조회";
var search_storage_out = "출고 완료 조회";
var req_sales_statement = "전표승인신청";
var search_sales_statement = "전표승인조회";
var req_storage_out = "상품출고신청";
var search_storage_out = "출고완료조회";
var req_note_receive = "지급대기신청";
var reg_condition_note_receivable = "어음기간";
var search_note_receive = "지급완료조회";

//search_status
var start_date = "시작일 : YYYY-MM-DD 형식";
var end_date = "종료일 : YYYY-MM-DD 형식";
var today ="오늘";
var a_day ="하루전";
var a_week ="한주전";
var a_month ="한달전";
var a_quarter ="한분기전";
var a_year ="일년전";
var btn_search = "검색";




/**
 * 구매 관리
 */
// reg_purchase_table
var reg_state 				= "전표 입력 페이지로 이동";

// reg_purchase
var reg_date				= "등록일 : YYYY-MM-DD 형식";
var storage_in_date 		= "입고일 : YYYY-MM-DD 형식";
var count_purchase 			= "수량 : 숫자 | 4자리";
var supply_price 			= "가격 : 숫자 | 9자리";
var condition_note_payable 	= "어음기간 : 숫자 | 12이하";
var purchase_state 			= "구매상태코드";
var purchase_state_name 	= "구매 상태 이름 ";
var product_id 				= "상품번호 : 1200 + 6자리 숫자 ";
var company_id 				= "거래처번호 : 1100 + 6자리 숫자 ";
var employee_id 			= "담당자 번호: 4자리 숫자 ";
var reg_date 				= "구매 상태 코드 ";
var order_id 				= "주문번호 ";
var btn_submit 				= "전송 버튼 ";
var btn_reset 				= "재설정 버튼 ";
var btn_search_lack 		= "부족재고 조회 ";
var btn_reg_purchase 		= "구매 입력 ";

//purchase_list
var btn_approval_pay		= "상황승인조회";
var btn_complete_pay		= "상황완료조회";


//detail_purchase
var account_name 			= "계정 이름 ";
var order_id 				= "구매 상태 코드 ";
var product_name 			= "상품이름 ";
var company_name 			= "거래처 이름 ";
var employee_name 			= "담당자 이름";
var update_date 			= "최근수정일";
var req_storage_in 			= "입고요청하기";
var req_repay 				= "지급기간까지 남은 일자";
var btn_confirm 			= "확인하고 창을 닫음";
var req_complete_pay 		= "상환완료하기";
var req_purchase_bank 		= "상황완료 후 구매통장 계산"

// modify_purchase
var state_name 				= "상태명";
var btn_modify 				= "수정하기";
var input_search 			= "검색어를 입력";
var btn_list_all 			= "전체목록";
var btn_reg_purchasel 		= "구매등록";
var btn_search_state 		= "전표승인조회";
var btn_search_storage_in 	= "입고완료조회";
var btn_search_repay 		= "지급안료조회";

/**
 * 물류관리
 */

//재고조정
var product_name = "선택한 상품명.";
var warehouse_name = "창고명";
var stock_amount = "선택한 상품과 창고의 현재 재고";
var delete_stock = "조정할 재고 수량 |  +와 - 모두 입력 가능";
var taked_stock = "조정 된 재고수량 | 창고에 있는 재고보다 적을 수 없음.";
var employee_name = "선택한 담당자명";
//창고이동
var movement_amount = "창고이동 재고 수량 | 창고에 있는 재고보다 많을 수 없음.";
var arrive_warehouse = "도착할 창고";
//창고 등록
var warehouse_location = "창고 위치 주소";

/**
 * 회계관리
 */

// 회계보고서
 var fi_statements = "조회할 회계보고서 종류 선택";
 //재무상태표 
 var quarter = "조회할 분기";
 //손익계산서
 var startDate = "조회할 기간 : 시작일";
 var endDate = "조회할 기간 : 끝일";
 
//계좌등록
 var bank_account_id = "계좌 ID";
 var bank_account_name = "계좌 이름 : 255자리 이하의 문자";
 var bank_account_number = "계좌번호 : 20자리 이하의 문자"
 var bank_account_balance = "계좌 잔액 : 18자리 이하의 숫자"
 var bank_name = "은행명 : 255자리 이하의 문자";
 var bank_account_type = "계좌 유형";
//계정등록
 var account_id = "계정번호 : 4자리 숫자 | 중복확인 필요(조회-확인:나머지 8자리 자동입력)";
 var dupCheckButton = "중복확인 버튼";
 var account_name = "계정 이름 : 255자리 이하의 문자";
 var account_balance = "계정 금액 : 18자리 이하의 숫자";
//전표 등록
 var connected_id = "연결 ID : 직접 입력하지 마시고, 조회 버튼을 통해 불러오세요";
 var calling_button = "연결주문 조회";
 var account_value = "계정 금액";	

/**
 * 인사 관리
 */

var hr_code_group_id 	= "인사코드 그룹번호 | 1자리 숫자 | 중복확인 필요";
var hr_code_group_name  = "인사코드 그룹명 | 225자리 이하의 문자 | 필수입력";
var hr_code_id			= "인사코드 번호 | 3자리 숫자 | 중복확인 필요 | 인사코드의 키값";
var hr_code_name 		= "인사코드 명 | 255자리 이하의 문자 | 필수입력";

var dept_id				= "부서번호 | 4자리 숫자 | 중복확인 필요 | 부서의 키값";
var dept_name			= "부서명 | 255자리 이하의 문자 | 필수입력";
var access_role			= "접근권한 | 모듈에 접속할 수 있는 ROLE을 부여";

var searchStr			= "사번 (4자리 숫자) 또는 이름 (50자리 이하의 문자) 검색";
var employee_id			= "사원번호 | 4자리 숫자";
var employee_name		= "사원명 | 50자리 이하의 문자";
var residence_reg_no1	= "주민등록번호 | 생년월일 6자리 숫자";
var residence_reg_no2	= "주민등록번호 | 고유번호 7자리 숫자";
var join_date			= "입사일 | DATE";
var rank_name			= "직급 | 직급을 선택하세요.";
var tel					= "전화번호 | 30자 이하의 문자";
var mobile_tel			= "휴대전화 | 30자 이하의 문자";
var passport_no			= "여권번호 | 9자리 문자";
var email1				= "이메일(아이디) | 20자리 이하의 문자";
var email2				= "이메일(도메인) | 20자리 이하의 문자";
var address				= "주소 | 255자 이하의 문자";
var hourly_wage			= "시급 | 6자리 숫자 | 필수입력";
var salary_account		= "급여계좌 | 20자리 이하의 문자 | 기본값 0";
var file				= "증명사진(인사카드용 jpg사진)";

var appointment_date	= "발령일 | DATE | 기본값 오늘";
var pre_rank_name		= "이전직급명 | 발령전 직급명입니다.";
var post_rank_name		= "발령직급명 | 발령할 직급명입니다.";
var pre_dept_name		= "이전부서명 | 발령전 부서명입니다.";
var post_dept_name		= "발령부서명 | 발령할 부서명입니다.";

var retired_date		= "퇴직일 | DATE | 기본값 오늘";
var retired_reason		= "퇴직사유 | 255자 이하의 문자";

var search_start 		= "검색시작일 | 미선택시 검색종료일 이전으로 모두 선택됩니다.";
var search_end			= "검색종료일 | 미선택시 검색시작일 이후로 모두 선택됩니다.";

var salary_register_id	= "급여대장 번호 | 12자리 문자";
var account_id			= "계정 | 12자리 문자";
var reg_date			= "등록일 | DATE | 기본값 오늘";
var salary_register_name= "급여대장명 | 255자 이하의 문자";
var pay_date			= "지급일 | DATE";
var total_pay			= "총 지급액 | 12자리 숫자";
var total_employee		= "총 지급인원 | 4자리 숫자";
var salary_state		= "급여상태 | 5자리 숫자 | 기본값 0";

var bonus_ratio			= "상여금 비율 | 0.0 ~ 1.0 사이의 값을 입력하세요.";
var night_overtime_ratio= "야근수당 비율 | 1.0 ~ 2.0 사이의 값을 입력하세요.";
var weekend_overtime_ratio= "주말근무수당 비율 | 1.0 ~ 2.0 사이의 값을 입력하세요.";
var base_worktime		= "기본 시간 | 기본근무시간을 입력해 주세요.";
var night_overtime		= "야근 시간 | 야근시간을 입력해 주세요.";
var weekend_overtime	= "주말 시간 | 주말근무시간을 입력해 주세요.";
/**
 * 근태관리
 */
var attitude_date1 		= "휴가시작 일자 | 휴가 시작 일자를 선택해 주세요.";
var attitude_date2 		= "휴가종료 일자 | 휴가 종료 일자를 선택해 주세요.";
