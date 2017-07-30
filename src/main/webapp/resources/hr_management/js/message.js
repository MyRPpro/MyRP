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


/**
 * 판매 관리
 */


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
var req_dead_line 			= "마감 조회 하기";
var btn_form_reset			= "폼 리로드";
// modify_purchase
var state_name 				= "상태명";
var btn_modify 				= "수정하기";
var input_search 			= "검색어를 입력";
var btn_list_all 			= "전체목록";
var btn_reg_purchasel 		= "구매등록";
var btn_search_state 		= "전표승인조회";
var btn_search_storage_in 	= "입고완료조회";
var btn_req_payed 			= "지급완료조회";

// purchase_list
var btn_payable				= "채무상환 가능 내역 조회";



/**
 * 물류관리
 */


/**
 * 회계관리
 */


/**
 * 인사 관리
 */
//16100
var hr_code_group_id 	= "인사코드 그룹번호: 1자리 숫자 | 중복확인 필요";
var hr_code_id			= "인사코드 번호: 3자리 숫자 | 중복확인 필요 | 인사코드의 키값";
//16200
var dept_id				= "부서번호: 4자리 숫자 | 중복확인 필요 | 부서의 키값";
var dept_name			= "부서명";
var access_role			= "접근권한 | 모듈에 접속할 수 있는 ROLE을 부여";
//16300
var searchStr			= "사번,이름 검색";
var employee_id			= "사원번호(4자리 숫자)";
var employee_name		= "사원명";
var residence_reg_no1	= "주민등록번호(생년월일 6자리 숫자)";
var residence_reg_no2	= "주민등록번호(고유번호 7자리 숫자)";
var join_date			= "입사일";
var rank_name			= "직급";
var tel					= "전화번호";
var mobile_tel			= "휴대전화";
var passport_no			= "여권번호";
var email1				= "이메일(아이디)";
var email2				= "이메일(도메인)";
var address				= "주소";
var hourly_wage			= "시급";
var salary_account		= "급여계좌";
var file				= "증명사진(인사카드용 jpg사진)";
//16600
var appointment_date	= "발령일";
var pre_rank_name		= "이전직급명";
var post_rank_name		= "발령직급명";
var pre_dept_name		= "이전부서명";
var post_dept_name		= "발령부서명";
//16700	
var retired_date		= "퇴직일";
var retired_reason		= "퇴직사유";

var search_start 		= "검색시작일";
var search_end			= "검색종료일";
/**
 * 근태관리
 */

